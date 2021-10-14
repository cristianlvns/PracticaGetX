import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practica_getx/controllers/platillo_controller.dart';
import 'package:practica_getx/models/platillo.dart';

class NuevoPlatillo extends StatelessWidget {
  const NuevoPlatillo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final platilloCtrl = Get.find<PlatillosController>();
    String txtFieldNombre = '',
        txtFieldDescr = '',
        txtFieldRestaurante = '',
        txtFieldPrecio = '';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo Platillo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              autofocus: true,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
                labelText: 'Nombre',
              ),
              onChanged: (value) {
                txtFieldNombre = value;
              },
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
                labelText: 'Descripcion',
              ),
              onChanged: (value) {
                txtFieldDescr = value;
              },
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
                labelText: 'Restaurante',
              ),
              onChanged: (value) {
                txtFieldRestaurante = value;
              },
            ),
            const SizedBox(height: 16),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
                labelText: 'Precio',
              ),
              onChanged: (value) {
                txtFieldPrecio = value;
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              child: const Text('GUARDAR PLATILLO'),
              onPressed: () {
                platilloCtrl.agregarPlatillo(Platillo(
                  index: platilloCtrl.listaPlatillos.value.platillos.length,
                  nombre: txtFieldNombre,
                  descripcion: txtFieldDescr,
                  restaurante: txtFieldRestaurante,
                  precio: int.parse(txtFieldPrecio),
                ));
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
