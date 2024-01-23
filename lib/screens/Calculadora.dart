import 'package:flutter/material.dart';

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  String resultado = '0';
  String entrada = '';
  double numero1 = 0;
  double numero2 = 0;
  double resultadoCalculo = 0;
  String operador = '';

  void numeroPulsado(String numero) {
    setState(() {
      entrada += numero;
      resultado = entrada;
    });
  }

  void operacionPulsada(String operador) {
    setState(() {
      this.operador = operador;
      if (numero1 == 0) {
        if (entrada.isNotEmpty && double.tryParse(entrada) != null) {
          numero1 = double.parse(entrada);
        }
      } else {
        if (entrada.isNotEmpty && double.tryParse(entrada) != null) {
          numero2 = double.parse(entrada);
          switch (operador) {
            case '+':
              numero1 += numero2;
              numero2 = 0;
              break;
            case '-':
              numero1 -= numero2;
              numero2 = 0;
              break;
            case '*':
              numero1 *= numero2;
              numero2 = 0;
              break;
            case '/':
              if (numero2 != 0) {
                numero1 /= numero2;
              } else {
                numero1 = 0;
              }
              numero2 = 0;
              break;
          }
        }
      }
      entrada = '';
      resultadoCalculo = numero1;
      resultado = resultadoCalculo.toString();
    });
  }

  void calcular() {
    setState(() {
      numero2 = double.parse(entrada);

      switch (operador) {
        case '+':
          resultadoCalculo = numero1 + numero2;
          break;
        case '-':
          resultadoCalculo = numero1 - numero2;
          break;
        case '*':
          resultadoCalculo = numero1 * numero2;
          break;
        case '/':
          if (numero2 != 0) {
            resultadoCalculo = numero1 / numero2;
          } else {
            resultadoCalculo = 0;
          }
          break;
      }

      resultado = resultadoCalculo.toString();
      entrada = '';
      numero1 = resultadoCalculo;
    });
  }

  void borrar() {
    setState(() {
      entrada = '';
      resultado = '0';
      numero1 = 0;
      numero2 = 0;
      resultadoCalculo = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    const tamano30 = TextStyle(fontSize: 30);

    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        title: const Text('Calculadora'),
        elevation: 10,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            child: Text(
              resultado,
              style: tamano30,
              textAlign: TextAlign.right,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (int i = 7; i <= 9; i++)
                MaterialButton(
                  onPressed: () {
                    numeroPulsado(i.toString());
                  },
                  child: Text(
                    i.toString(),
                    style: tamano30,
                  ),
                ),
              MaterialButton(
                onPressed: () {
                  operacionPulsada('/');
                },
                child: const Text(
                  '/',
                  style: tamano30,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (int i = 4; i <= 6; i++)
                MaterialButton(
                  onPressed: () {
                    numeroPulsado(i.toString());
                  },
                  child: Text(
                    i.toString(),
                    style: tamano30,
                  ),
                ),
              MaterialButton(
                onPressed: () {
                  operacionPulsada('*');
                },
                child: const Text(
                  '*',
                  style: tamano30,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (int i = 1; i <= 3; i++)
                MaterialButton(
                  onPressed: () {
                    numeroPulsado(i.toString());
                  },
                  child: Text(
                    i.toString(),
                    style: tamano30,
                  ),
                ),
              MaterialButton(
                onPressed: () {
                  operacionPulsada('-');
                },
                child: const Text(
                  '-',
                  style: tamano30,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                onPressed: () {
                  numeroPulsado('0');
                },
                child: const Text(
                  '0',
                  style: tamano30,
                ),
              ),
              MaterialButton(
                onPressed: () {
                  calcular();
                },
                child: const Text(
                  '=',
                  style: tamano30,
                ),
              ),
              MaterialButton(
                onPressed: () {
                  borrar();
                },
                child: const Text(
                  'C',
                  style: tamano30,
                ),
              ),
              MaterialButton(
                onPressed: () {
                  operacionPulsada('+');
                },
                child: const Text(
                  '+',
                  style: tamano30,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
