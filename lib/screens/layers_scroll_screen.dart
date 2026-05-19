import 'package:flutter/material.dart';

class LayersScrollScreen extends StatefulWidget {
  const LayersScrollScreen({super.key});

  @override
  State<LayersScrollScreen> createState() => _LayersScrollScreenState();
}

class _LayersScrollScreenState extends State<LayersScrollScreen> {
  // VARIABLES DE ESTADO
  String _vistaActual = 'Stack'; // Puede ser: 'Stack', 'GridView' o 'ScrollView'
  bool _mostrarBadge = true; // Controla la capa superior del Stack
  double _posicionTop = -10.0; // Controla la posición 'Y' del badge
  double _posicionRight = -10.0; // Controla la posición 'X' del badge

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Capas y Desplazamiento'),
        backgroundColor: Colors.amber.shade700,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // MITAD SUPERIOR: Área de previsualización
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child: Center(
                // Mostramos el widget correspondiente según la selección
                child: _obtenerVistaActual(),
              ),
            ),
          ),

          // MITAD INFERIOR: Panel de controles envuelto en un SingleChildScrollView
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
                    // --- SELECTOR: Alternar entre vistas ---
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Vista actual:', style: TextStyle(fontWeight: FontWeight.bold)),
                        DropdownButton<String>(
                          value: _vistaActual,
                          items: const [
                            DropdownMenuItem(value: 'Stack', child: Text('1. Stack')),
                            DropdownMenuItem(value: 'GridView', child: Text('2. GridView')),
                            DropdownMenuItem(value: 'ScrollView', child: Text('3. SingleChildScrollView')),
                          ],
                          onChanged: (nuevoValor) {
                            if (nuevoValor != null) {
                              setState(() {
                                _vistaActual = nuevoValor;
                              });
                            }
                          },
                        ),
                      ],
                    ),
                    const Divider(),

                    // Mostrar controles específicos del Stack solo si está seleccionado
                    if (_vistaActual == 'Stack') ...[
                      // --- SWITCH: Capa del Badge ---
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Mostrar Badge (Capa Superior):', style: TextStyle(fontWeight: FontWeight.bold)),
                          Switch(
                            value: _mostrarBadge,
                            activeColor: Colors.amber.shade700,
                            onChanged: (valor) {
                              setState(() {
                                _mostrarBadge = valor;
                              });
                            },
                          ),
                        ],
                      ),
                      
                      // --- SLIDERS: Widget Positioned ---
                      const SizedBox(height: 10),
                      const Text('Mover Badge (Vertical - Top):', style: TextStyle(fontWeight: FontWeight.bold)),
                      Slider(
                        value: _posicionTop,
                        min: -30.0,
                        max: 50.0,
                        activeColor: Colors.amber.shade700,
                        onChanged: _mostrarBadge ? (valor) => setState(() => _posicionTop = valor) : null,
                      ),
                      const Text('Mover Badge (Horizontal - Right):', style: TextStyle(fontWeight: FontWeight.bold)),
                      Slider(
                        value: _posicionRight,
                        min: -30.0,
                        max: 50.0,
                        activeColor: Colors.amber.shade700,
                        onChanged: _mostrarBadge ? (valor) => setState(() => _posicionRight = valor) : null,
                      ),
                    ] else if (_vistaActual == 'GridView') ...[
                      const Center(
                        child: Text(
                          'El GridView organiza sus elementos en columnas y genera scroll automáticamente si exceden el tamaño.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      )
                    ] else ...[
                      const Center(
                        child: Text(
                          'El SingleChildScrollView permite deslizar una Column que de otro modo causaría un error de desbordamiento (Overflow).',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      )
                    ]
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // MÉTODO AUXILIAR: Retorna el widget según la selección del usuario
  Widget _obtenerVistaActual() {
    switch (_vistaActual) {
      case 'Stack':
        return _construirStack();
      case 'GridView':
        return _construirGridView();
      case 'ScrollView':
        return _construirScrollView();
      default:
        return _construirStack();
    }
  }

  // MÉTODO AUXILIAR: Construye el Stack
  Widget _construirStack() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          width: 200,
          height: 250,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Colors.amber, Colors.deepOrangeAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(radius: 40, backgroundColor: Colors.white, child: Icon(Icons.person, size: 50, color: Colors.grey)),
            SizedBox(height: 10),
            Text('Desarrollador', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
        if (_mostrarBadge)
          Positioned(
            top: _posicionTop,
            right: _posicionRight,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(color: Colors.green, shape: BoxShape.circle),
              child: const Icon(Icons.verified, color: Colors.white, size: 30),
            ),
          ),
      ],
    );
  }

  // MÉTODO AUXILIAR: Construye el GridView
  Widget _construirGridView() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: List.generate(6, (index) {
          List<Color> colores = [Colors.red, Colors.blue, Colors.green, Colors.orange, Colors.purple, Colors.teal];
          return Container(
            color: colores[index % colores.length],
            child: Center(child: Text('Ítem ${index + 1}', style: const TextStyle(color: Colors.white, fontSize: 20))),
          );
        }),
      ),
    );
  }

  // MÉTODO AUXILIAR: Construye el SingleChildScrollView
  Widget _construirScrollView() {
    // Aquí forzamos un contenido muy largo (20 cajas) para que requiera scroll
    return SingleChildScrollView(
      child: Column(
        children: List.generate(20, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.amber.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text('Elemento ${index + 1}', style: const TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          );
        }),
      ),
    );
  }
}