import 'package:flutter/material.dart';

class InputsScreen extends StatefulWidget {
  const InputsScreen({super.key});

  @override
  State<InputsScreen> createState() => _InputsScreenState();
}

class _InputsScreenState extends State<InputsScreen> {
  // VARIABLES DE ESTADO
  String _nombreUsuario = "Usuario Anónimo";
  String _correoValidado = "Sin correo registrado";
  
  // LLAVE GLOBAL PARA EL FORMULARIO
  // Esto nos permite identificar el Form y ejecutar sus validaciones desde un botón
  final _formKey = GlobalKey<FormState>(); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entrada de Datos'),
        backgroundColor: Colors.orange.shade800,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // MITAD SUPERIOR: Área de previsualización (Tarjeta en vivo)
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child: Center(
                child: Card(
                  elevation: 5,
                  color: Colors.orange.shade50,
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.account_circle, size: 80, color: Colors.orange),
                        const SizedBox(height: 10),
                        Text(
                          _nombreUsuario,
                          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          _correoValidado,
                          style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // MITAD INFERIOR: Panel de controles (Inputs y Formulario)
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20.0),
              color: Colors.grey.shade100,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('1. TextField (Actualización en tiempo real)', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    // TEXTFIELD SIMPLE
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Escribe tu nombre",
                        border: const OutlineInputBorder(), // Borde alrededor del campo
                        prefixIcon: const Icon(Icons.person),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange.shade800, width: 2),
                        ),
                      ),
                      onChanged: (valor) {
                        // El evento onChanged captura cada letra que el usuario escribe
                        setState(() {
                          // Si el campo está vacío, volvemos al valor por defecto
                          _nombreUsuario = valor.isEmpty ? "Usuario Anónimo" : valor;
                        });
                      },
                    ),
                    const Divider(height: 40),

                    const Text('2. TextFormField (Validación por Formulario)', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    
                    // FORMULARIO Y TEXTFORMFIELD
                    Form(
                      key: _formKey, // Asignamos la llave al formulario
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: "Correo electrónico",
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.email),
                            ),
                            // La función validator revisa el texto antes de guardarlo
                            validator: (valor) {
                              if (valor == null || valor.isEmpty) {
                                return 'El correo es obligatorio';
                              } else if (!valor.contains('@')) {
                                return 'Debe ser un correo válido (necesita @)';
                              }
                              return null; // Null significa que pasó la validación
                            },
                            // onSaved se ejecuta solo cuando le decimos al formulario que guarde
                            onSaved: (valor) {
                              setState(() {
                                _correoValidado = valor!;
                              });
                            },
                          ),
                          const SizedBox(height: 20),
                          
                          // BOTÓN PARA VALIDAR EL FORMULARIO
                          SizedBox(
                            width: double.infinity,
                            child: FilledButton.icon(
                              style: FilledButton.styleFrom(backgroundColor: Colors.orange.shade800),
                              icon: const Icon(Icons.save),
                              label: const Text('Validar y Guardar Correo'),
                              onPressed: () {
                                // Ejecutamos la validación a través de la GlobalKey
                                if (_formKey.currentState!.validate()) {
                                  // Si todo es válido (retornó null), guardamos los datos
                                  _formKey.currentState!.save();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Correo guardado con éxito', style: TextStyle(color: Colors.white)), backgroundColor: Colors.green),
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
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
