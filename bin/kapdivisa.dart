import 'database.dart';
import 'App.dart';

main() async {
  await Database().instalacion();
  App().menuInicial();
}