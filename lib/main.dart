import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Oculta la etiqueta de 'DEBUG'
      title: 'Catálogo de Widgets',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MenuPrincipalScreen(),
    );
  }
}

class MenuPrincipalScreen extends StatelessWidget {
  const MenuPrincipalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold provee la estructura visual básica (AppBar, Body, FAB, etc.)
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio - Catálogo de Widgets'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      // Center se encarga de posicionar a su hijo exactamente en el medio
      body: const Center(
        child: Text(
          'Bienvenido al Explorador de Widgets',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
