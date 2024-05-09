import 'database.dart';
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

  insertarCuentas() async {
    var conn = await Database().conexion();
    try {
      await conn.query('INSERT INTO cuentas (saldo) VALUES (?)',
          [saldo]);
      print('$saldo actual en cuenta');
    } catch (e) {
      print(e);
    } finally {
      await conn.close();
    }
  }
}