import 'package:practica_getx/models/platillo.dart';

class ListaPlatillos {
  List<Platillo> platillos;
  bool editable;

  ListaPlatillos({this.platillos = const [], this.editable = true});
}
