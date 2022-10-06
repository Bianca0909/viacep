import 'package:flutter/material.dart';

class Componentes {
  criaAppBar(texto, acao) {
    return AppBar(
      title: criaTexto(texto),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: acao,
        )
      ],
    );
  }

  criaTexto(texto, [cor]) {
    if (cor != null) {
      return Text(
        texto,
        style: TextStyle(color: cor),
      );
    }
    return Text(texto);
  }

  iconeGrande() {
    return const Icon(
      Icons.maps_home_work_outlined,
      size: 180.0,
    );
  }

  criaInputTexto(tipoTeclado, textoEtiqueta, controlador, mensagemValidacao) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        keyboardType: tipoTeclado,
        decoration: InputDecoration(
            labelText: textoEtiqueta,
            labelStyle: const TextStyle(
              fontSize: 20,
            )),
        textAlign: TextAlign.left,
        style: const TextStyle(fontSize: 30),
        controller: controlador,
        validator: (value) {
          if (value!.isEmpty) {
            return mensagemValidacao;
          }
          return null;
        },
      ),
    );
  }

  criaBotao(controladorFormulario, funcao, titulo) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
              height: 100,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
                onPressed: () {
                  if (controladorFormulario.currentState!.validate()) {
                    funcao();
                  }
                },
                child: Text(
                  titulo,
                  style: const TextStyle(color: Colors.white, fontSize: 30.0),
                ),
              ),
            ))
      ],
    );
  }

  criarContainerDados(rua, complemento, bairro, cidade, estado) {
    return Container(
      padding: const EdgeInsets.all(30),
      height: 250,
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 1, child: criaTexto(rua, Colors.black)),
            Expanded(flex: 1, child: criaTexto(complemento, Colors.black)),
            Expanded(flex: 1, child: criaTexto(bairro, Colors.black)),
            Expanded(flex: 1, child: criaTexto(cidade, Colors.black)),
            Expanded(flex: 1, child: criaTexto(estado, Colors.black)),
          ],
        ),
      ),
    );
  }
}
