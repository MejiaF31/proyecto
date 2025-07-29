import 'package:flutter/material.dart';
void main() {
  runApp(FormularioApp());
}
class FormularioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Formulario de registro de diagnostico')),
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
  String nombre_cliente = '';
  String vehiculo = '';
  String detalles = '';
  String precio_total = '';
  String fecha_registro = '';
  String estado = 'Activo';

  final TextEditingController _fechaController = TextEditingController();

  Future<void> _selecdetallesonarFecha(BuildContext context) async {
    final DateTime? fechaSelecdetallesonada = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (fechaSelecdetallesonada != null) {
      setState(() {
        fecha_registro =
        "${fechaSelecdetallesonada.year}-${fechaSelecdetallesonada.month.toString().padLeft(2, '0')}-${fechaSelecdetallesonada.day.toString().padLeft(2, '0')}";
        _fechaController.text = fecha_registro;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('nombre_cliente:'),
        TextField(
          onChanged: (valor) => nombre_cliente = valor,
        ),
        SizedBox(height: 10),
        Text('vehiculos:'),
        TextField(

          onChanged: (valor) => vehiculo = valor,
        ),
        SizedBox(height: 10),
        Text('Detalles:'),
        TextField(
          onChanged: (valor) => detalles = valor,

        ),
        SizedBox(height: 10),
        Text('precio_total:'),
        TextField(

          onChanged: (valor) => precio_total = valor,
        ),
        SizedBox(height: 10),
        Text('Fecha de registro:'),
        TextField(
          controller: _fechaController,
          readOnly: true,
          onTap: () => _selecdetallesonarFecha(context),
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
                title: Text('Informadetallesón ingresada'),
                content: Text('nombre_cliente: $nombre_cliente \nvehiculo: $vehiculo\nDetalles: $detalles \nprecio_total: $precio_total \nFecha de regisro: $fecha_registro \nEstado: $estado'),
              ),
            );
          },
          child: Text('Enviar'),
        ),
      ],
    );
  }

}