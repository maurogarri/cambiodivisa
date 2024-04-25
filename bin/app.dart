import 'usuario.dart';
import 'dart:io';
import 'cuenta.dart';

class App{
  double saldo = 0;
  double  ingreso =0;
  double? saldototal;
  double ? cuentaBancaria;
    
 menuInicial(){
    int? opcion;
    do{
      stdout.writeln('''BIENVENIDO A KAPDIVISA''');
      stdout.writeln('''ESTAS REGISTRADO?
      1 - Crear usuario
      2 - Iniciar sesión''');
      String respuesta = stdin.readLineSync() ?? 'e';
      opcion = int.tryParse(respuesta);
    } while(opcion == null || opcion != 1 && opcion !=2);
    switch(opcion){
      case 1:
        crearUsuario();
        break;
      case 2:
        login();
        break;
      default:
        print('Opción no válida');
    }
  }

  menuLogueado(Usuario usuario) async {             
    int? opcion;
    String? nombre = usuario.nombre;
    do{
      stdout.writeln('''Hola, $nombre, elige una opción
      1 - Cambiar de una Divisa a Otra 
      2 - Añadir saldo a tu cuenta
      3 - Consultar Saldo en cuenta
      4 - Buscar Valores en tiempo real
      5 - Salir''');
      String respuesta = stdin.readLineSync() ?? 'e';
      opcion = int.tryParse(respuesta);
    } while(opcion == null || opcion != 1 && opcion !=2 && opcion !=3 && opcion !=4);
    switch(opcion){
      case 1:
        cambioDivisa();
        break;
      case 2:
          depositarSaldo();
        break;
      case 3:
          consultarSaldo();
        break;

      case 4:
      consultarValores();
        break;
      case 5:
        print('Adiós, Gracias por usar KAPDIVISA');
        break;
      default:
        print('Opción no válida');
    }
  }

  login() async {
    Usuario usuario = new Usuario();
    stdout.writeln('Introduce tu nombre de usuario');
    usuario.nombre = stdin.readLineSync();
    stdout.writeln('Introduce tu constraseña');
    usuario.password = stdin.readLineSync();
    var resultado = await usuario.loginUsuario();
    if(resultado == false){
      stdout.writeln('Tu nombre de usuario o contraseña son incorrectos');
      menuInicial();
    } else {
      menuLogueado(resultado);
    }
  }

  crearUsuario() async {
    Usuario usuario = new Usuario();
    stdout.writeln('Introduce tu nombre de usuario');
    usuario.nombre = stdin.readLineSync();
    stdout.writeln('Introduce una constraseña');
    usuario.password = stdin.readLineSync();
    usuario.password = usuario.password;
    await usuario.insertarUsuario();
    menuInicial();
  }



  depositarSaldo(){
    
    stdout.writeln('Introduce el saldo que vas añadir');
    String respuesta = stdin.readLineSync() ?? 'e';
      ingreso = double.tryParse(respuesta) ?? 0.0;
      
      saldototal=  saldo + ingreso;
     
    print('tu ingreso ha sido realizaado correctamente, tu saldo es de $saldototal');
  }

  consultarSaldo(){

    saldototal=cuentaBancaria;
    cuentaBancaria == null;
    print('tu saldo actual es de $cuentaBancaria');
  }




//METODOS CON LA API

  cambioDivisa(){

  }

  consultarValores(){

  }
  }
