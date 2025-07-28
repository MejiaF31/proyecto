import 'package:flutter/material.dart';
void main() {
  runApp(FormularioApp());
}
class FormularioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Formulario de registro de detalle')),
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
  String nombre_parte = '';
  String tipo_danio = '';
  String causa_danio = '';
  String recomendacion = '';
  String tiemp_estimado = '';
  String precio_estimado = '';
  String estado = 'Activo';
  

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('nombre de la parte:'),
        TextField(
          onChanged: (valor) => nombre_parte = valor,
        ),
        SizedBox(height: 10),
        Text('tipo de daños:'),
        TextField(

          onChanged: (valor) => tipo_danio = valor,
        ),
        SizedBox(height: 10),
        Text('Causa del daño:'),
        TextField(
          onChanged: (valor) => causa_danio = valor,

        ),
        SizedBox(height: 10),
        Text('recomendacion:'),
        TextField(
          onChanged: (valor) => recomendacion = valor,
        ),
        SizedBox(height: 10),
        Text('Tiempo estimado de reparacion:'),
        TextField(onChanged: (valor) => tiemp_estimado = valor,
        ),
        SizedBox(height: 10),
        Text('Precio estimado:'),
        TextField(onChanged: (valor) => precio_estimado = valor,
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
                title: Text('Informacausa_danioón ingresada'),
                content: Text('nombr de la parte: $nombre_parte \ntipo de daño: $tipo_danio\nCausa del daño: $causa_danio \nrecomendacion: $recomendacion \nTiempo estimado de reparacion: $tiemp_estimado \nPrecio estimado: $precio_estimado \nEstado: $estado'),
              ),
            );
          },
          child: Text('Enviar'),
        ),
      ],
    );
  }

}