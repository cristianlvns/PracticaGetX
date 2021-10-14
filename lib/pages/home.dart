import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practica_getx/controllers/platillo_controller.dart';
import 'package:practica_getx/models/listaplatillos.dart';
import 'package:practica_getx/models/platillo.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listaplatillosCtrl = Get.put(PlatillosController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Platillos'),
      ),
      body: Obx(() => listaplatillosCtrl.existenPlatillos.value
          ? conPlatillos(listaplatillosCtrl.listaPlatillos.value.platillos)
          : sinPlatillos()),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Get.toNamed('nuevoplatillo');
        },
      ),
    );
  }

  Widget sinPlatillos() {
    return Container(
      alignment: Alignment.center,
      child: const Text(
        'Sin Platillos',
        style: TextStyle(fontSize: 36),
      ),
    );
  }

  Widget conPlatillos(List<Platillo> listaplatillos) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        ...listaplatillos.map(
          (e) => Card(
            child: Column(
              children: [
                ListTile(
                  title: Text(e.nombre),
                  subtitle: Text(e.descripcion),
                ),
                Text(e.restaurante + ' • \$' + e.precio.toString()),
                TextButton(
                  child: const Text('EDITAR'),
                  onPressed: () {
                    Get.toNamed('editarplatillo', arguments: {
                      'index': e.index,
                      'nombre': e.nombre,
                      'descripcion': e.descripcion,
                      'restaurante': e.restaurante,
                      'precio': e.precio,
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
