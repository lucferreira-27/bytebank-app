import 'package:bytebank_app/components/editor.dart';
import 'package:bytebank_app/model/Transferencia.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = "Criando Transferencia";
const _rotuloCampoValor = "Valor";
const _rotuloCampoNumeroConta = "Número da Conta";
const _dicaCampoValor = "0.00";
const _dicaCampoNumeroConta = "0000";
const _btnConfimar = "Confimar";

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
 
  final TextEditingController _controllerCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controllerCampoValor = TextEditingController();

  void _criaTransferencia(BuildContext context) {
    final int numeroConta = int.tryParse(_controllerCampoNumeroConta.text);
    final double valor = double.tryParse(_controllerCampoValor.text);
    if (numeroConta != null && valor != null) {
      final transferencia = Transferencia(valor, numeroConta);
      debugPrint('Criado: $transferencia');
      Navigator.pop(context, transferencia);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_tituloAppBar)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
              rotulo: _rotuloCampoNumeroConta,
              dica: _dicaCampoNumeroConta,
              controller: _controllerCampoNumeroConta,
            ),
            Editor(
                rotulo: _rotuloCampoValor,
                dica: _dicaCampoValor,
                controller: _controllerCampoValor,
                icon: Icons.monetization_on),
            ElevatedButton(
                child: Text(_btnConfimar),
                onPressed: () => _criaTransferencia(context))
          ],
        ),
      ),
    );
  }
}