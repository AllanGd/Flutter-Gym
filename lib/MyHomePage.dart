import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Puxada de peito com pega estreita'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Floating Action Button clicado");
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            ElevatedButton(onPressed: () {
              print("Elevated Button clicado");
            }, child: const Text("Enviar foto")),
          ],
        ),
      ),
    );
  }
}
