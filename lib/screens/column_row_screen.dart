import 'package:flutter/material.dart';

class ColumnRowScreen extends StatefulWidget {
  const ColumnRowScreen({super.key});

  @override
  State<ColumnRowScreen> createState() => _ColumnRowScreenState();
}

class _ColumnRowScreenState extends State<ColumnRowScreen> {
  // VARIABLES DE ESTADO
  bool _esFila = false; // false = Column, true = Row
  MainAxisAlignment _mainAlign = MainAxisAlignment.center;
  CrossAxisAlignment _crossAlign = CrossAxisAlignment.center;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Column y Row'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // MITAD SUPERIOR: Área de previsualización (Playground)
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity, // Ocupa todo el ancho posible
              color: Colors.white,
              // Dependiendo del estado '_esFila', mostramos un Row o un Column
              child: _esFila
                  ? Row(
                      mainAxisAlignment: _mainAlign,
                      crossAxisAlignment: _crossAlign,
                      children: _generarCajas(),
                    )
                  : Column(
                      mainAxisAlignment: _mainAlign,
                      crossAxisAlignment: _crossAlign,
                      children: _generarCajas(),
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
                    // --- SWITCH: Alternar entre Column y Row ---
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Modo:', style: TextStyle(fontWeight: FontWeight.bold)),
                        Row(
                          children: [
                            const Text('Column'),
                            Switch(
                              value: _esFila,
                              activeColor: Colors.indigo,
                              onChanged: (valor) {
                                setState(() {
                                  _esFila = valor;
                                });
                              },
                            ),
                            const Text('Row'),
                          ],
                        ),
                      ],
                    ),
                    const Divider(),

                    // --- DROPDOWN: mainAxisAlignment ---
                    const Text('mainAxisAlignment:', style: TextStyle(fontWeight: FontWeight.bold)),
                    DropdownButton<MainAxisAlignment>(
                      isExpanded: true,
                      value: _mainAlign,
                      items: MainAxisAlignment.values.map((align) {
                        return DropdownMenuItem(
                          value: align,
                          child: Text(align.name),
                        );
                      }).toList(),
                      onChanged: (nuevoValor) {
                        if (nuevoValor != null) {
                          setState(() {
                            _mainAlign = nuevoValor;
                          });
                        }
                      },
                    ),
                    const SizedBox(height: 10),

                    // --- DROPDOWN: crossAxisAlignment ---
                    const Text('crossAxisAlignment:', style: TextStyle(fontWeight: FontWeight.bold)),
                    DropdownButton<CrossAxisAlignment>(
                      isExpanded: true,
                      value: _crossAlign,
                      items: CrossAxisAlignment.values.map((align) {
                        return DropdownMenuItem(
                          value: align,
                          child: Text(align.name),
                        );
                      }).toList(),
                      onChanged: (nuevoValor) {
                        if (nuevoValor != null) {
                          setState(() {
                            _crossAlign = nuevoValor;
                          });
                        }
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

  // Función auxiliar para no repetir código, genera 3 cajas de colores
  List<Widget> _generarCajas() {
    return [
      Container(
        width: 60, height: 60, color: Colors.pinkAccent,
        child: const Center(child: Text('A', style: TextStyle(color: Colors.white, fontSize: 20))),
      ),
      Container(
        width: 80, height: 80, color: Colors.blueAccent,
        child: const Center(child: Text('B', style: TextStyle(color: Colors.white, fontSize: 20))),
      ),
      Container(
        width: 60, height: 60, color: Colors.amber,
        child: const Center(child: Text('C', style: TextStyle(color: Colors.white, fontSize: 20))),
      ),
    ];
  }
}
