
import 'package:mysql1/mysql1.dart';

import 'kapdatabase.dart';



class Usuario{
  // PROPIEDADES USUARIO
  int ? _idusuario;
  String ? _nombre;
  String ? _password;

  // Getters y setters
  String? get nombre {
    return this._nombre;
  }

  int? get idusuario {
    return this._idusuario;
  }

  set nombre(String? texto) {
    this._nombre = texto;
  }

  String? get password {
    return _password;
  }

  set password(String? texto) {
    this._password = texto;
  }

  // Constructores
  Usuario();

  Usuario.fromMap(ResultRow map){
    this._idusuario = map['idusuario'];
    this._nombre = map['nombre'];
    this._password = map['password'];
  }

  // Métodos
  loginUsuario() async {
    var conn = await Database().conexion();
    try {
      var resultado = await conn
          .query('SELECT * FROM usuarios WHERE nombre = ?', [this._nombre]);
      Usuario usuario = Usuario.fromMap(resultado.first);
      if (this._password == usuario.password) {
        return usuario;
      } else
        return false;
    } catch (e) {
      print(e);
      return false;
    } finally {
      await conn.close();
    }
  }

    insertarUsuario() async {
    var conn = await Database().conexion();
    try {
      await conn.query('INSERT INTO usuarios (nombre, password) VALUES (?,?)',
          [_nombre, _password]);
      print('$nombre te has registrado correctamente');
    } catch (e) {
      print(e);
    } finally {
      await conn.close();
    }
  }

  
}
