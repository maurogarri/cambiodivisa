import 'package:mysql1/mysql1.dart';
import 'database.dart';





class Divisa{
  // PROPIEDADES GETTERS Y SETTERS
  int ? iddivisa;
  int  valor =0;
  String ? nombre;
  

  //CONSTRUCTORES

  Divisa();
  
  Divisa.fromMap(ResultRow map){
    this.valor = map ['valor'];
     this.nombre = map['nombre'];
    
  }


  //METODOS
   all() async {
    var conn = await Database().conexion();

    try {
      var resultado = await conn.query('SELECT * FROM divisas');
      List<Divisa> divisas =
          resultado.map((row) => Divisa.fromMap(row)).toList();
      return divisas;
    } catch (e) {
      print(e);
    } finally {
      await conn.close();
    }
   }


   get(String nombre) async {                                   // DEVOLVER EL REGISTRO DEL ID QUE SEA
    var conn = await Database().conexion();
    
    try{
      var resultado = await conn.query('SELECT * FROM divisas WHERE nombre  = ?',[nombre]);
      return Divisa.fromMap(resultado.first);
      
    } catch(e) {
      print(e);
    } finally{
      await conn.close();
    }
  }
 
}


 
 
  