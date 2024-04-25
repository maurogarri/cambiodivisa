import 'package:mysql1/mysql1.dart';




class Divisa{
  // PROPIEDADES GETTERS Y SETTERS
  double ? _cantidad;
  String ? _nombre;
  
  String? get nombre => this._nombre;
  set nombre (String? nombre) => _nombre = nombre;
  
  double? get cantidad => this._cantidad;
  set cantidad (double ? cantidad) => _cantidad = cantidad;

  //CONSTRUCTORES

  Divisa();
  
  Divisa.fromMap(ResultRow map){
    this._cantidad = map ['cantidad'];
     this._nombre = map['nombre'];
    
  }

  //METODOS
  
}