import 'package:get/get.dart';
import 'package:practica_getx/models/listaplatillos.dart';
import 'package:practica_getx/models/platillo.dart';

class PlatillosController extends GetxController {
  var existenPlatillos = false.obs;
  var listaPlatillos = new ListaPlatillos().obs;

  void agregarPlatillo(Platillo platillo) {
    this.existenPlatillos.value = true;
    this.listaPlatillos.update((val) {
      val!.platillos = [...val.platillos, platillo];
    });
  }

  void editarPlatillo(Platillo platillo) {
    this.listaPlatillos.update((val) {
      val!.platillos[platillo.index] = platillo;
    });
  }
}
