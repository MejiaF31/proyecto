import 'package:flutter/material.dart';

void main() {
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Básico',
      home: Scaffold(
        appBar: AppBar(title: Text('Iniciar sesión')),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: LoginWidget(),
        ),
      ),
    );
  }
}

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  String usuario = '';
  String contrasena = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Nombre de usuario:'),
        TextField(
          onChanged: (valor) => usuario = valor,
        ),
        SizedBox(height: 10),
        Text('Contraseña:'),
        TextField(
          obscureText: true,
          onChanged: (valor) => contrasena = valor,
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Bienvenido '),
                content: Text('Usuario: $usuario\nContraseña: $contrasena'),
              ),
            );
          },
          child: Text('Iniciar'),
        ),
      ],
    );
  }
}
