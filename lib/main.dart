import 'package:catalogo_widgets_app/screens/container_screen.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de Widgets'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      // Reemplazamos Center por ListView
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(
              Icons.check_box_outline_blank,
              color: Colors.teal,
            ),
            title: const Text('1. Container, Padding y SizedBox'),
            subtitle: const Text('Cajas, márgenes y espacios'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // Usamos Navigator para ir a la nueva pantalla
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ContainerScreen(),
                ),
              );
            },
          ),
          const Divider(), // Agrega una línea separadora

          ListTile(
            leading: const Icon(Icons.view_column, color: Colors.blue),
            title: const Text('2. Column y Row'),
            subtitle: const Text('Alineación vertical y horizontal'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // Futura navegación
            },
          ),
          const Divider(),

          // Iremos agregando más ListTiles a medida que avancemos...
        ],
      ),
    );
  }
}
