import 'package:flutter/material.dart';
//Firebase
import 'package:firebase_core/firebase_core.dart';
import 'package:prueba2/screens/crearCuenta.dart';
import 'package:prueba2/screens/login.dart';
import 'firebase_options.dart';

void main() async {
WidgetsFlutterBinding.ensureInitialized();

await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);

runApp(const MainApp());
}


class MainApp extends StatelessWidget {
  const MainApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Cuerpo(),
      ),
    );
  }

}

class Cuerpo extends StatelessWidget {
  const Cuerpo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(32),
        decoration: const BoxDecoration(
        image: DecorationImage(image: NetworkImage(
        "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fimages.wallpapersden.com%2Fimage%2Fdownload%2Finvoker-in-dota-2_a2ppZWWUmZqaraWkpJRmbmdlrWZlbWU.jpg&f=1&nofb=1&ipt=ee73d2a89c1964d1a89fda631d7d65a7322efa1cd93c7660405d36b4d216f1f8&ipo=images"
    ),
    fit: BoxFit.cover,
  )
      ),
      child: Column(
        children: [
          Text("Nombre: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
          Text("Hernán Calvopiña Duque", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
          Text("Usuario de Github: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
          Text("Alernanoh", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
          buttonLogin(context),
          SizedBox(height: 20),
          buttonCreate(context),
        ],
      ),
      )
    );
  }

}

Widget buttonLogin(context) {
  return ElevatedButton.icon(
    onPressed: ()=>_login(context),
    label: Text("Login"),
    icon: Icon(Icons.login),
  );
}

Widget buttonCreate(context) {
  return ElevatedButton.icon(
    onPressed: ()=>_crearCuenta(context),
    label: Text("Crear Cuenta"),
    icon: Icon(Icons.create),
  );
}

void _login(context) {
  Navigator.push(context, MaterialPageRoute(builder: (context)=> const Login()),);
}

void _crearCuenta(context) {
  Navigator.push(context, MaterialPageRoute(builder: (context)=> const Crearcuenta()),);
}
