import 'package:flutter/material.dart';
void main() {
  runApp(FormularioApp());
}
class FormularioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Formulario de registro de usuario')),
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
  String nombre_usuario = '';
  String correo = '';
  String contrasenia = '';
  String fecha_registro = '';
  String estado = 'Activo';

  final TextEditingController _fechaController = TextEditingController();

  Future<void> _seleccorreoonarFecha(BuildContext context) async {
    final DateTime? fechaSeleccorreoonada = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (fechaSeleccorreoonada != null) {
      setState(() {
        fecha_registro =
        "${fechaSeleccorreoonada.year}-${fechaSeleccorreoonada.month.toString().padLeft(2, '0')}-${fechaSeleccorreoonada.day.toString().padLeft(2, '0')}";
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
        Text('nombre_usuarios:'),
        TextField(

          onChanged: (valor) => nombre_usuario = valor,
        ),
        SizedBox(height: 10),
        Text('corro:'),
        TextField(
          keyboardType: TextInputType.emailAddress,
          onChanged: (valor) => correo = valor,

        ),
        SizedBox(height: 10),
        Text('contraseña:'),
        TextField(
          keyboardType: TextInputType.phone,
          onChanged: (valor) => contrasenia = valor,
        ),
        SizedBox(height: 10),
        Text('Fecha de registro:'),
        TextField(
          controller: _fechaController,
          readOnly: true,
          onTap: () => _seleccorreoonarFecha(context),
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
                title: Text('Informaccion ingresada'),
                content: Text('Nombre: $nombre \nnombre de usuario: $nombre_usuario\nCorreo: $correo \nContraseña: $contrasenia \nFecha de regisro: $fecha_registro \nEstado: $estado'),
              ),
            );
          },
          child: Text('Enviar'),
        ),
      ],
    );
  }

}