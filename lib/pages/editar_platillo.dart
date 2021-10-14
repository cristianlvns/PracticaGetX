import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practica_getx/controllers/platillo_controller.dart';
import 'package:practica_getx/models/platillo.dart';

class EditarPlatillo extends StatelessWidget {
  const EditarPlatillo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final platilloCtrl = Get.find<PlatillosController>();
    int indice = Get.arguments['index'];
    String txtFieldNombre = '',
        txtFieldDescr = '',
        txtFieldRestaurante = '',
        txtFieldPrecio = '';
    var nombre = TextEditingController();
    nombre.text = Get.arguments['nombre'];
    txtFieldNombre = nombre.text;
    var descripcion = TextEditingController();
    descripcion.text = Get.arguments['descripcion'];
    txtFieldDescr = descripcion.text;
    var restaurante = TextEditingController();
    restaurante.text = Get.arguments['restaurante'];
    txtFieldRestaurante = restaurante.text;
    var precio = TextEditingController();
    precio.text = Get.arguments['precio'].toString();
    txtFieldPrecio = precio.text;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Platillo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              autofocus: true,
              controller: nombre,
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
              controller: descripcion,
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
              controller: restaurante,
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
              controller: precio,
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
              child: const Text('EDITAR PLATILLO'),
              onPressed: () {
                platilloCtrl.editarPlatillo(Platillo(
                  index: indice,
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
