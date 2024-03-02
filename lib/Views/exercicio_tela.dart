import 'package:flutter/material.dart';
import 'package:myapp/Models/exercicio_modelo.dart';
import 'package:myapp/Models/sentimento_modelo.dart';

class ExercicioTela extends StatelessWidget {
  ExercicioTela({super.key});

  final ExercicioModelo exercicioModelo = ExercicioModelo(
      id: "ex01",
      nome: "Remada Baixa Supinada",
      treino: "Treino A",
      comoFazer: "Segura a barra e puxa");

  final List<SentimentoModelo> listaSentimentos = [
    SentimentoModelo(
        id: "ex01", sentindo: "Pouco ativação hoje", data: "2022-02-17"),
    SentimentoModelo(
        id: "ex01", sentindo: "Senti a ativação hoje", data: "2022-02-19"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Puxada de peito com pega estreita - Treino A'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint("Floating Action Button clicado");
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
                onPressed: () {
                  debugPrint("Elevated Button clicado");
                },
                child: const Text("Enviar foto")),
            const Text(
              "Como Fazer?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const Text("Segura as duas mão na barra e puxa."),
            const Divider(),
            const Text(
              "Como estou me sentindo",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const Text("Estou bem."),
          ],
        ),
      ),
    );
  }
}
