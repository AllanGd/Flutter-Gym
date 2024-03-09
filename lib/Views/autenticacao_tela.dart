import 'package:flutter/material.dart';
import 'package:myapp/_common/minhas_cores.dart';
import 'package:myapp/componentes/decoracao_campo_autenticacao.dart';

class AutenticacaoTela extends StatefulWidget {
  const AutenticacaoTela({super.key});

  @override
  State<AutenticacaoTela> createState() => _AutenticacaoTelaState();
}

class _AutenticacaoTelaState extends State<AutenticacaoTela> {
  bool queroEntrar = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    MinhasCores.azulTopoGradiente,
                    MinhasCores.azulBaixoGradiente,
                  ])),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 64, 16, 0),
              child: Form(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.asset(
                        "assets/logo FitForge.webp",
                        height: 128,
                      ),
                      const Text(
                        "FitForge",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      TextFormField(
                        decoration: getAuthenticationInputDecoration("E-mail"),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        decoration: getAuthenticationInputDecoration("Senha"),
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Visibility(
                          visible: !queroEntrar,
                          child: Column(
                            children: [
                              TextFormField(
                                decoration: getAuthenticationInputDecoration(
                                    "Confirme senha"),
                                obscureText: true,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextFormField(
                                decoration:
                                    getAuthenticationInputDecoration("Nome"),
                              ),
                            ],
                          )),
                      const SizedBox(
                        height: 16,
                      ),
                      ElevatedButton(
                          onPressed: () {},
                          child: Text((queroEntrar) ? "Entrar" : "Cadastrar")),
                      const SizedBox(
                        height: 16,
                      ),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              queroEntrar = !queroEntrar;
                            });
                          },
                          child: Text((queroEntrar)
                              ? "Não tem cota? Cadastre-se"
                              : "Já tem uma conta? Entre!")),
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
