import 'package:catalogo_widgets_app/screens/container_screen.dart';
import 'package:catalogo_widgets_app/screens/column_row_screen.dart';
import 'package:catalogo_widgets_app/screens/ui_elements_screen.dart';
import 'package:catalogo_widgets_app/screens/inputs_screen.dart';
import 'package:catalogo_widgets_app/screens/layers_scroll_screen.dart';

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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ColumnRowScreen(),
                ),
              );
            },
          ),
          const Divider(),

          ListTile(
            leading: const Icon(Icons.smart_button, color: Colors.deepPurple),
            title: const Text('3. Elementos UI'),
            subtitle: const Text('Text, Image, Icon y Botones'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const UIElementsScreen(),
                ),
              );
            },
          ),
          const Divider(),

          ListTile(
            leading: const Icon(Icons.keyboard, color: Colors.orange),
            title: const Text('4. Formularios y Entradas'),
            subtitle: const Text('TextField y TextFormField'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const InputsScreen()),
              );
            },
          ),
          const Divider(),

          ListTile(
            leading: const Icon(Icons.layers, color: Colors.amber),
            title: const Text('5. Capas y Cuadrículas'),
            subtitle: const Text('Stack, Positioned y GridView'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LayersScrollScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
