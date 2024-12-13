import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:prueba2/navigators/drawer.dart';


class Movie {

  final String id;

  final String title;


  Movie({required this.id, required this.title});


  factory Movie.fromJson(Map<String, dynamic> json) {

    return Movie(

      id: json['id'], // Adjust according to your JSON structure

      title: json['title'], // Adjust according to your JSON structure

    );

  }

}


class RatingScreen extends StatefulWidget {

  @override

  _RatingScreenState createState() => _RatingScreenState();

}


class _RatingScreenState extends State<RatingScreen> {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  double _rating = 0.0;

  String? _selectedMovieId;


  Future<List<Movie>> _fetchMovies() async {

    try {

      final response = await http.get(Uri.parse('https://jritsqmet.github.io/web-api/peliculas2.json'));



      if (response.statusCode == 200) {

        final List<dynamic> jsonData = json.decode(response.body);

        return jsonData.map((json) => Movie.fromJson(json)).toList();

      } else {

        throw Exception('Failed to load movies');

      }

    } catch (e) {

      print('Error fetching movies: $e');

      return []; // Return an empty list in case of an error

    }

  }


  Future<void> _saveRating() async {

    if (_selectedMovieId != null) {

      final userId = _auth.currentUser ?.uid;

      final movieRating = MovieRating(movieId: _selectedMovieId!, userId: userId!, rating: _rating);

      await _firestore.collection('ratings').add(movieRating.toMap());

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Rating saved!')));

    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rate a Movie')),
      drawer: MyDrawer(),
      body: FutureBuilder<List<Movie>>(
        future: _fetchMovies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final movies = snapshot.data!;
          return Column(
            children: [
              DropdownButton<String>(
                hint: Text('Select a movie'),
                value: _selectedMovieId,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedMovieId = newValue;
                  });
                },
                items: movies.map<DropdownMenuItem<String>>((Movie movie) {
                  return DropdownMenuItem<String>(
                    value: movie.title,
                    child: Text(movie.title),
                  );
                }).toList(),
              ),
              Slider(
                value: _rating,
                min: 0,
                max: 5,
                divisions: 5,
                label: _rating.toString(),
                onChanged: (double value) {
                  setState(() {
                    _rating = value;
                  });
                },
              ),
              ElevatedButton(
                onPressed: _saveRating,
                child: Text('Submit Rating'),
              ),
            ],
          );
        },
      ),
    );
  }
}

class MovieRating {

  final String movieId;

  final String userId;

  final double rating;


  MovieRating({required this.movieId, required this.userId, required this.rating});


  Map<String, dynamic> toMap() {

    return {

      'movieId': movieId,

      'userId': userId,

      'rating': rating,

    };

  }

}
