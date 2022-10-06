import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:viacep/util/componentes.dart';

class PaginaPrincipal extends StatefulWidget {
  const PaginaPrincipal({Key? key}) : super(key: key);

  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  TextEditingController cepController = TextEditingController();
  GlobalKey<FormState> formController = GlobalKey<FormState>();

  String rua = "Rua:";
  String complemento = "Complemento:";
  String bairro = "Bairro:";
  String cidade = "Cidade:";
  String estado = "Estado:";

  limparTela() {
    setState(() {
      rua = "Rua:";
      complemento = "Complemento:";
      bairro = "Bairro:";
      cidade = "Cidade:";
      estado = "Estado:";
      cepController.text = "";
      formController = GlobalKey<FormState>();
    });
  }

  buscarEndereco() async {
    //async = método assíncrono
    String url = 'https://viacep.com.br/ws/${cepController.text}/json/';
    Response resposta = await get(Uri.parse(url));
    Map endereco = json.decode(resposta.body);
    setState(() {
      rua = "Rua: ${endereco['logradouro']}";
      complemento = "Complemento: ${endereco['complemento']}";
      bairro = "Bairro: ${endereco['bairro']}";
      cidade = "Cidade: ${endereco['localidade']}";
      estado = "Estado: ${endereco['uf']}";
    });
    print(endereco);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Componentes().criaAppBar('Viacep', limparTela),
      body: Form(
        key: formController,
        child: Column(children: [
          const SizedBox(height: 20),
          Componentes().iconeGrande(),
          Componentes().criaInputTexto(
              TextInputType.number, 'CEP', cepController, 'Informe um CEP'),
          Componentes()
              .criaBotao(formController, buscarEndereco, 'Buscar endereço'),
          Componentes()
              .criarContainerDados(rua, complemento, bairro, cidade, estado),
        ]),
      ),
    );
  }
}
