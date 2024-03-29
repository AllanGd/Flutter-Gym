import 'package:flutter/material.dart';
import 'package:myapp/_common/meu_snackBar.dart';
import 'package:myapp/_common/minhas_cores.dart';
import 'package:myapp/componentes/decoracao_campo_autenticacao.dart';
import 'package:myapp/servicos/autenticacao_servico.dart';

class AutenticacaoTela extends StatefulWidget {
  const AutenticacaoTela({super.key});

  @override
  State<AutenticacaoTela> createState() => _AutenticacaoTelaState();
}

class _AutenticacaoTelaState extends State<AutenticacaoTela> {
  bool queroEntrar = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _nomeController = TextEditingController();

  AutenticacaoServico _autenticacaoServico = AutenticacaoServico();

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
                key: _formKey,
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
                        controller: _emailController,
                        decoration: getAuthenticationInputDecoration("E-mail"),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "O email não pode ser vazio";
                          }
                          if (!value.contains("@")) {
                            return "O email não é válido";
                          }
                          if (value.length < 5) {
                            return "O email deve conter pelo menos 5 caracteres";
                          }
                        },
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: _senhaController,
                        decoration: getAuthenticationInputDecoration("Senha"),
                        obscureText: true,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "A senha não pode ser vazia";
                          }
                          if (value.length < 5) {
                            return "A senha deve ter mais de 5 caracteres";
                          }
                        },
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
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return "A senha não pode ser vazia";
                                  }
                                  if (value.length < 5) {
                                    return "A senha deve ter mais de 5 caracteres";
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextFormField(
                                controller: _nomeController,
                                decoration:
                                    getAuthenticationInputDecoration("Nome"),
                              ),
                            ],
                          )),
                      const SizedBox(
                        height: 16,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            botaoPrincipalClicado();
                          },
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

  botaoPrincipalClicado() {
    String nome = _nomeController.text;
    String email = _emailController.text;
    String senha = _senhaController.text;

    if (_formKey.currentState!.validate()) {
      if (queroEntrar) {
        debugPrint("Entrada validada");
        _autenticacaoServico
            .logarUsuarios(email: email, senha: senha)
            .then((String? erro) {
          if (erro != null) {
            mostrarSnackBar(context: context, texto: erro);
          }
        });
      } else {
        debugPrint("cadastro validado");
        debugPrint(
            "${_emailController.text}, ${_senhaController.text}, ${_nomeController.text}");
        _autenticacaoServico
            .cadastrarUsuario(nome: nome, senha: senha, email: email)
            .then((String? erro) {
          if (erro != null) {
            // Voltou com erro
            mostrarSnackBar(context: context, texto: erro);
          }
        });
      }
    }
  }
}
