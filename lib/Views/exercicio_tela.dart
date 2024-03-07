import 'package:flutter/material.dart';
import 'package:myapp/Models/exercicio_modelo.dart';
import 'package:myapp/Models/sentimento_modelo.dart';
import 'package:myapp/_common/minhas_cores.dart';

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
      backgroundColor: MinhasCores.azulPrimario,
      appBar: AppBar(
        title: Text("${exercicioModelo.nome} - ${exercicioModelo.treino}"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint("Floating Action Button clicado");
        },
        child: const Icon(Icons.add),
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(16)),
        child: ListView(
          children: [
            SizedBox(
              height: 250,
              child: Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        debugPrint("Elevated Button clicado");
                      },
                      child: const Text("Enviar foto"),),
                      ElevatedButton(onPressed: (){}, child: const Text("Apagar foto"))
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "Como Fazer?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(exercicioModelo.comoFazer),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(
                color: Colors.black,
              ),
            ),
            const Text(
              "Como estou me sentindo",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(listaSentimentos.length, (index) {
                SentimentoModelo sentimentoAgora = listaSentimentos[index];
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.double_arrow),
                  trailing: IconButton(
                      onPressed: () {
                        debugPrint("Deletar ${sentimentoAgora.sentindo}");
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      )),
                  title: Text(sentimentoAgora.sentindo),
                  subtitle: Text(sentimentoAgora.data),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
