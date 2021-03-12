import 'package:flutter/material.dart';

void main() => runApp(Bytebank());

class Bytebank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListaTranferencia(),
      ),
    );
  }
}

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controllerCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controllerCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Criando Transferência")),
      body: Column(
        children: [
          Editor(
            rotulo: 'Número da Conta',
            dica: '0000',
            controller: _controllerCampoNumeroConta,
          ),
          Editor(
              rotulo: 'Valor',
              dica: '0.00',
              controller: _controllerCampoValor,
              icon: Icons.monetization_on),
          ElevatedButton(
              child: Text("Confimar"),
              onPressed: () => _criaTransferencia(context))
        ],
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int numeroConta = int.tryParse(_controllerCampoNumeroConta.text);
    final double valor = double.tryParse(_controllerCampoValor.text);
    if (numeroConta != null && valor != null) {
      final transferencia = Transferencia(valor, numeroConta);
      debugPrint('Criado: $transferencia');
      Navigator.pop(context, transferencia);
    }
  }
}

class ListaTranferencia extends StatelessWidget {

  final List<Transferencia> _transferencias = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transferência"),
      ),
      body: ListView.builder(
        itemCount: _transferencias.length,
        itemBuilder: (context,indice) {
          final transferencia = ItemTransferencia(_transferencias[indice]);
          return transferencia;
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final Future<Transferencia> future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          }));
          future.then((transferencia) {
            debugPrint('Retornado: $transferencia');
            _transferencias.add(transferencia);
          });
        },
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.contaNumro.toString()),
        subtitle: Text(_transferencia.valor.toString()),
      ),
    );
  }
}

class Transferencia {
  final double valor;
  final int contaNumro;

  Transferencia(this.valor, this.contaNumro);

  @override
  String toString() {
    return 'Transferencia{valor = $valor, contaNumero = $contaNumro}';
  }
}

class Editor extends StatelessWidget {
  final String rotulo;
  final String dica;
  final TextEditingController controller;
  final IconData icon;
  Editor({this.rotulo, this.dica, this.controller, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        style: TextStyle(
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
            labelText: rotulo,
            hintText: dica,
            icon: icon != null ? Icon(icon) : null),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
