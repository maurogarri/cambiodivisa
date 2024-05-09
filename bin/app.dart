import 'cuenta.dart';
import 'database.dart';
import 'divisa.dart';
import 'usuario.dart';
import 'dart:io';





class App{
  double saldo = 0;
  double  ingreso =0;
  double? saldototal=0;
  double? valor;
  String ? monedaDestino;
  double ? valoronedadestino;
  String ? monedainicio;
  double ? valormonedainicio;

  

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
      1 - Cambiar de una Moneda a Otra 
      2 - Añadir saldo a tu cuenta
      3 - Consultar Saldo en cuenta
      4 - Listar todas las Monedas
      5 - Salir''');
      String respuesta = stdin.readLineSync() ?? 'e';
      opcion = int.tryParse(respuesta);
    } while(opcion == null|| opcion != 1 && opcion !=2 && opcion !=3 && opcion!=4 && opcion!=5);
    switch(opcion){
      case 1:
        await cambioDivisa();
        menuLogueado(usuario);
        break;
      case 2:
          depositarSaldo();
          menuLogueado(usuario);
        break;
      case 3:
          consultarSaldo();
          menuLogueado(usuario);
        break;
      case 4:
          await listarDivisas();
          menuLogueado(usuario);
        break;
      case 5:
      print('Adiós, Gracias por usar KAPDIVISA');
         break;
      default:
      print('error');
    }
  }

  login() async {
    Usuario usuario = new Usuario();
    stdout.writeln('Introduce tu nombre de usuario');
    usuario.nombre = stdin.readLineSync();
    stdout.writeln('Introduce tu contraseña');
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


  listarDivisas()async{
    List<Divisa> listadoDivisa = await Divisa().all();
    for(var elemento in listadoDivisa){
      stdout.writeln('${elemento.nombre}, ${elemento.valor}');
    }
  
  }

  depositarSaldo()async{
    Cuenta cuenta = new Cuenta();
    stdout.writeln('Introduce el saldo que vas añadir');
    String respuesta = stdin.readLineSync() ?? 'e';
      ingreso = double.tryParse(respuesta) ?? 0.0;
      
      saldototal=  saldo + ingreso;
      
     
    print('tu ingreso de $respuesta€ sido realizaado correctamente,');
    await cuenta.insertarCuentas();
  }
  
  consultarSaldo()async {
      await Database().conexion;
    print('tu saldo actual es de $saldototal');
    
  }


  cambioDivisa() async {
  await listarDivisas();
   
 stdout.writeln('Introduce la moneda a la que deseas cambiar:');
  String monedaDestino = stdin.readLineSync() ?? 'e';
  Divisa divisadestino=await Divisa().get(monedaDestino);
  
  double?cantidad;
  
    stdout.writeln('Introduce la cantidad que deseas cambiar:');
    String respuesta = stdin.readLineSync() ??'e';
    cantidad = double.tryParse(respuesta)??0.0;
  double?valorFinal;
  valorFinal = divisadestino.valor * cantidad;
  print('CONVERSION REALIZADA CORRECTAMENTE, EL VALOR ES DE $valorFinal');

  
}
 


   


  }

  

 
