import 'package:flutter/material.dart';
void main() {
  runApp(FormularioApp());
}
class FormularioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Formulario de registro de las partes afectadas')),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: FormularioWidget(),

        ),
      ),
    );
  }
}
class FormularioWidget extends StatefulWidget {
  @override
  _FormularioWidgetState createState() =>
      _FormularioWidgetState();
}
class _FormularioWidgetState extends
State<FormularioWidget> {
  String nombre = '';
  String estado = 'Activo';


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Nombre:'),
        TextField(
          onChanged: (valor) => nombre = valor,
        ),

        SizedBox(height: 10),
        Text('Estado:'),
        DropdownButton<String>(
          value: estado,
          items: ['Activo', 'Inactivo'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (valor) {
            setState(() {
              estado = valor!;
            });
          },
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Información ingresada'),
                content: Text('Nombre: $nombre \nEstado: $estado'),
              ),
            );
          },
          child: Text('Enviar'),
        ),
      ],
    );
  }

}