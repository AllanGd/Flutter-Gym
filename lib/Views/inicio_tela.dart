import 'package:flutter/material.dart';
import 'package:myapp/Models/exercicio_modelo.dart';
import 'package:myapp/servicos/autenticacao_servico.dart';

class InicioTela extends StatelessWidget {
  InicioTela({super.key});

  final List<ExercicioModelo> listaExercicios = [
    ExercicioModelo(
      id: "ex01",
      nome: "Puxada Alta Pronada",
      treino: "Treino A",
      comoFazer: "Puxa a barra com as palmas das mãos viradas para cima.",
    ),
    ExercicioModelo(
      id: "ex02",
      nome: "Remada Curvada com Barra",
      treino: "Treino A",
      comoFazer:
          "Pegue a barra com as palmas das mãos viradas para cima, incline o tronco para frente e puxe a barra até o peito.",
    ),
    ExercicioModelo(
      id: "ex03",
      nome: "Rosca Direta com Barra",
      treino: "Treino A",
      comoFazer:
          "Pegue a barra com as palmas das mãos viradas para cima e flexione os cotovelos.",
    ),
    ExercicioModelo(
      id: "ex04",
      nome: "Supino Reto",
      treino: "Treino B",
      comoFazer:
          "Deite-se no banco com os pés no chão, pegue a barra com as palmas das mãos viradas para cima e empurre a barra para cima.",
    ),
    ExercicioModelo(
      id: "ex05",
      nome: "Crucifixo com Halteres",
      treino: "Treino B",
      comoFazer:
          "Deite-se no banco com os pés no chão, pegue os halteres com as palmas das mãos viradas para cima e abra os braços.",
    ),
    ExercicioModelo(
      id: "ex06",
      nome: "Tríceps Testa",
      treino: "Treino B",
      comoFazer:
          "Sente-se no banco com os pés no chão, pegue a barra com as palmas das mãos viradas para frente e estenda os braços acima da cabeça.",
    ),
    ExercicioModelo(
      id: "ex07",
      nome: "Agachamento",
      treino: "Treino C",
      comoFazer:
          "Com os pés na largura dos ombros, flexione os joelhos e quadris como se fosse sentar em uma cadeira.",
    ),
    ExercicioModelo(
      id: "ex08",
      nome: "Afundo",
      treino: "Treino C",
      comoFazer:
          "Dê um passo à frente com uma perna e flexione os joelhos até que o joelho da frente fique a 90 graus.",
    ),
    ExercicioModelo(
      id: "ex09",
      nome: "Levantamento Terra",
      treino: "Treino C",
      comoFazer:
          "Com os pés na largura dos ombros, flexione os joelhos e quadris para pegar a barra com as palmas das mãos viradas para baixo. Levante a barra até a altura dos quadris.",
    ),
    ExercicioModelo(
      id: "ex10",
      nome: "Abdominal",
      treino: "Treino D",
      comoFazer:
          "Deite-se de costas com os joelhos flexionados e os pés no chão. Levante a cabeça e o tronco até que os cotovelos toquem os joelhos.",
    ),
    ExercicioModelo(
      id: "ex11",
      nome: "Prancha",
      treino: "Treino D",
      comoFazer:
          "Coloque-se em posição de flexão de braço com os antebraços no chão. Mantenha o corpo alinhado da cabeça aos calcanhares.",
    ),
    ExercicioModelo(
      id: "ex12",
      nome: "Elevação Lateral de Perna",
      treino: "Treino D",
      comoFazer:
          "Deite-se de lado com o corpo apoiado no antebraço e na perna inferior. Levante a perna superior até a altura do quadril.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tela inicial")),
      drawer: Drawer(
        child: ListView(children: [
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Deslogar"),
            onTap: () {
              AutenticacaoServico().deslogar();
            },
          )
        ]),
      ),
    );
  }
}
