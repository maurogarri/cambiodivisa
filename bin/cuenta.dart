import 'app.dart';
import 'dart:io';

class Cuenta{
  double saldo = 0;
  double  ingreso =0;
  double? saldototal;

  depositar(){
    stdout.writeln('Introduce el saldo que vas añadir');
    String respuesta = stdin.readLineSync() ?? 'e';
      ingreso = double.tryParse(respuesta) ?? 0.0;
      
      saldototal=  saldo + ingreso;

     print('tu saldo ha sido actualizado a $saldototal');
  }


}