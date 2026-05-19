import 'package:flutter/material.dart';

class UIElementsScreen extends StatefulWidget {
  const UIElementsScreen({super.key});

  @override
  State<UIElementsScreen> createState() => _UIElementsScreenState();
}

class _UIElementsScreenState extends State<UIElementsScreen> {
  // VARIABLES DE ESTADO
  double _tamanioTexto = 25.0;
  bool _esNegrita = false;
  Color _colorIcono = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text, Image, Icon y Botones'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // MITAD SUPERIOR: Área de previsualización (Playground)
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // 1. TEXT
                  Text(
                    '¡Hola, Flutter!',
                    style: TextStyle(
                      fontSize: _tamanioTexto,
                      fontWeight: _esNegrita ? FontWeight.bold : FontWeight.normal,
                      color: Colors.deepPurple,
                    ),
                  ),
                  
                  // 2. ICON
                  Icon(
                    Icons.favorite,
                    size: 60,
                    color: _colorIcono,
                  ),
                  
                  // 3. IMAGE
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      'https://picsum.photos/300/150', // Imagen aleatoria
                      width: 300,
                      height: 150,
                      fit: BoxFit.cover, // Ajusta la imagen a la caja
                    ),
                  ),
                  
                  // 4. BOTONES
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Mostrar un mensaje emergente
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('ElevatedButton presionado')),
                          );
                        },
                        child: const Text('Elevated'),
                      ),
                      FilledButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('FilledButton presionado')),
                          );
                        },
                        child: const Text('Filled'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // MITAD INFERIOR: Panel de controles
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20.0),
              color: Colors.grey.shade100,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // --- CONTROL: Tamaño de Texto ---
                    Text('Tamaño de Texto: ${_tamanioTexto.toInt()}', style: const TextStyle(fontWeight: FontWeight.bold)),
                    Slider(
                      value: _tamanioTexto,
                      min: 15.0,
                      max: 50.0,
                      activeColor: Colors.deepPurple,
                      onChanged: (nuevoValor) {
                        setState(() {
                          _tamanioTexto = nuevoValor;
                        });
                      },
                    ),

                    // --- CONTROL: Texto en Negrita ---
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Texto en Negrita:', style: TextStyle(fontWeight: FontWeight.bold)),
                        Switch(
                          value: _esNegrita,
                          activeColor: Colors.deepPurple,
                          onChanged: (valor) {
                            setState(() {
                              _esNegrita = valor;
                            });
                          },
                        ),
                      ],
                    ),
                    const Divider(),

                    // --- CONTROL: Color del Ícono ---
                    const Text('Color del Ícono:', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _botonColor(Colors.red, 'Rojo'),
                        _botonColor(Colors.green, 'Verde'),
                        _botonColor(Colors.blue, 'Azul'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Función auxiliar para generar los botones de colores sin repetir código
  Widget _botonColor(Color color, String nombre) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
      ),
      onPressed: () {
        setState(() {
          _colorIcono = color;
        });
      },
      child: Text(nombre),
    );
  }
}
