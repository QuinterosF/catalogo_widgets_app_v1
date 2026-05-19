import 'package:flutter/material.dart';

class ContainerScreen extends StatelessWidget {
  const ContainerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explorador de Container'),
        backgroundColor: Colors.teal, // Un color distinto para diferenciar
      ),
      body: const Center(
        child: Text('Aquí construiremos el interactivo del Container'),
      ),
    );
  }
}
