import 'package:flutter/material.dart';
void main() {
  runApp(FormularioApp());
}
class FormularioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Formulario de registro de cliente')),
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
  String apellido = '';
  String CI = '';
  String celular = '';
  String fecha_registro = '';
  String estado = 'Activo';

  final TextEditingController _fechaController = TextEditingController();

  Future<void> _seleccionarFecha(BuildContext context) async {
    final DateTime? fechaSeleccionada = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (fechaSeleccionada != null) {
      setState(() {
        fecha_registro =
        "${fechaSeleccionada.year}-${fechaSeleccionada.month.toString().padLeft(2, '0')}-${fechaSeleccionada.day.toString().padLeft(2, '0')}";
        _fechaController.text = fecha_registro;
      });
    }
  }


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
        Text('Apellidos:'),
        TextField(
          keyboardType: TextInputType.phone,
          onChanged: (valor) => apellido = valor,
        ),
        SizedBox(height: 10),
        Text('Carnet:'),
        TextField(
          onChanged: (valor) => CI = valor,

        ),
        SizedBox(height: 10),
        Text('celular:'),
        TextField(
          keyboardType: TextInputType.phone,
          onChanged: (valor) => celular = valor,
        ),
        SizedBox(height: 10),
        Text('Fecha de registro:'),
        TextField(
          controller: _fechaController,
          readOnly: true,
          onTap: () => _seleccionarFecha(context),
          decoration: InputDecoration(
            hintText: 'Seleccione una fecha',
            suffixIcon: Icon(Icons.calendar_today),
          ),
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
                content: Text('Nombre: $nombre \nApellido: $apellido\nCarnet: $CI \nCelular: $celular \nFecha de regisro: $fecha_registro \nEstado: $estado'),
              ),
            );
          },
          child: Text('Enviar'),
        ),
      ],
    );
  }