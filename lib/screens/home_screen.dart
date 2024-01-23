import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const tamano30 = TextStyle(fontSize: 30);

    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        title: const Text('HomeScreen'),
        elevation: 10,
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Expanded quita el Center, hay que poner los Center dentro de cada Expanded
            Expanded(
                child: Text(
              'Numero de clicks',
              style: tamano30,
              textAlign: TextAlign.center,
            )),
            Expanded(
              child: Text(
                'Programación con flutter A',
                style: tamano30,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        //child: const Text('Añadir'),
        onPressed: () {
          print('Acabo de pulsar el boton');
        },
      ),
    );
  }
}
