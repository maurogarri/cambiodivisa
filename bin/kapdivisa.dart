import 'kapdatabase.dart';
import 'App.dart';

main() async {
  await Database().instalacion();
  App().menuInicial();
}