import 'package:flutter/material.dart';
import 'package:prueba2/screens/crearCuenta.dart';
import 'package:prueba2/screens/pelis.dart';

class Login extends StatefulWidget{
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login>{
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    if(_emailController.text.isEmpty || _passwordController.text.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Por favor ingrese su correo o contraseña."),),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Pelis()),
    );
  }

  void _goToCrearCuenta(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Crearcuenta()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network("https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fimages2.alphacoders.com%2F569%2F569648.jpg&f=1&nofb=1&ipt=8d22ebb99af304d83a2cf05768730bef236fb968cd31d207e1e918743d4cec29&ipo=images",
            fit: BoxFit.cover,
          ),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          Padding(
            padding:const EdgeInsets.symmetric(horizontal: 20.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    const Text("Iniciar sesión",
                    style: TextStyle(
                  fontSize: 30,
                  color: Color.fromARGB(255, 253, 254, 255),
              ),
            ),
            const SizedBox(height: 40,),

            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
              labelText: "Correo electrónico",
              hintText: "Ingrese su correo",
              prefixIcon: const Icon(Icons.email),
              border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: const Color.fromARGB(255, 0, 0, 0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Color.fromARGB(255, 13, 13, 13)),
            )
            ),
            ),
            const SizedBox(height: 20,),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
              labelText: "Contraseña",
              hintText: "Ingrese su contraseña",
              prefixIcon: const Icon(Icons.lock),
              border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: const Color.fromARGB(255, 0, 0, 0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
            )
            ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(onPressed: _login,
              style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 247, 3, 3),
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
              child: const Text(
                "Iniciar sesión",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),

            const Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Text(
                "¿No tienes cuenta?",
                style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
            const SizedBox(height: 10),

            TextButton(
              onPressed: _goToCrearCuenta,
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(0),
              ),
              child: const Text(
                "Crea una cuenta",
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 250, 0, 0),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
                  ],

                ),
              ),
            ),
          )
        ],
      ),
    );
  }

}
