import 'package:flutter/material.dart';
void main() {
  runApp(Formulario2App());
}
class Formulario2App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Formulario de registro de vehiculo')),
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
  String marca = '';
  String modelo = '';
  String anio = '';
  String placa = '';
  String fecha_registro = '';
  String estado = 'Activo';



  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Marca:'),
        TextField(
          onChanged: (valor) => marca = valor,
        ),
        SizedBox(height: 10),
        Text('Modelo:'),
        TextField(
          onChanged: (valor) => modelo = valor,
        ),
        SizedBox(height: 10),
        Text('Año del vehiculo:'),
        TextField(
          onChanged: (valor) => anio = valor,

        ),
        SizedBox(height: 10),
        Text('placa:'),
        TextField(
          keyboardType: TextInputType.text,
          onChanged: (valor) => placa = valor,
        ),
        SizedBox(height: 10),
        Text('Fecha de registro:'),
        TextField(
          keyboardType: TextInputType.datetime,
          onChanged: (valor) => fecha_registro = valor,
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
              builder: (context) =>
                  AlertDialog(
                    title: Text('Información ingresada'),
                    content: Text(
                        'Marca: $marca \nModelo: $modelo\nAño: $anio \n¨laca: $placa \nFecha de regisro: $fecha_registro \nEstado: $estado'),
                  ),
            );
          },
          child: Text('Enviar'),
        ),
      ],
    );
  }