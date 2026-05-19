import 'package:flutter/material.dart';

class ContainerScreen extends StatefulWidget {
  const ContainerScreen({super.key});

  @override
  State<ContainerScreen> createState() => _ContainerScreenState();
}

class _ContainerScreenState extends State<ContainerScreen> {
  // VARIABLES DE ESTADO: Estos valores cambiarán cuando movamos los Sliders
  double _tamano = 150.0;
  double _borderRadius = 10.0;
  double _padding = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Container, Padding y SizedBox'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      // Usamos Column para dividir la pantalla en dos mitades (Arriba/Abajo)
      body: Column(
        children: [
          // MITAD SUPERIOR: Área de previsualización (Playground)
          Expanded(
            flex: 1, // Toma la mitad de la pantalla
            child: Center(
              // 1. PADDING: Aplica espacio interno
              child: Padding(
                padding: EdgeInsets.all(_padding),
                // 2. SIZEDBOX: Fuerza el tamaño del widget hijo
                child: SizedBox(
                  width: _tamano,
                  height: _tamano,
                  // 3. CONTAINER: Damos estilo, color y bordes
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(_borderRadius),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        )
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        'Container',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // MITAD INFERIOR: Panel de controles
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(20.0),
              color: Colors.grey.shade100, // Un fondo gris claro para el panel
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // --- CONTROL DE TAMAÑO (SizedBox) ---
                    Text('Tamaño (SizedBox): ${_tamano.toInt()}'),
                    Slider(
                      value: _tamano,
                      min: 50.0,
                      max: 300.0,
                      activeColor: Colors.teal,
                      onChanged: (nuevoValor) {
                        setState(() {
                          _tamano = nuevoValor;
                        });
                      },
                    ),

                    // --- CONTROL DE BORDES (Container) ---
                    Text('BorderRadius (Container): ${_borderRadius.toInt()}'),
                    Slider(
                      value: _borderRadius,
                      min: 0.0,
                      max: 150.0,
                      activeColor: Colors.teal,
                      onChanged: (nuevoValor) {
                        setState(() {
                          _borderRadius = nuevoValor;
                        });
                      },
                    ),

                    // --- CONTROL DE PADDING ---
                    Text('Padding interno: ${_padding.toInt()}'),
                    Slider(
                      value: _padding,
                      min: 0.0,
                      max: 100.0,
                      activeColor: Colors.teal,
                      onChanged: (nuevoValor) {
                        setState(() {
                          _padding = nuevoValor;
                        });
                      },
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
}
