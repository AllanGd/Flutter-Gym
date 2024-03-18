import 'package:flutter/material.dart';
import 'package:myapp/servicos/autenticacao_servico.dart';

class InicioTela extends StatelessWidget {
  const InicioTela({super.key});

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
