import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          body: ListaTranferencia(),
          appBar: AppBar(
            title: Text("Transferência"),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: null,
          ),
        ),
      ),
    );

class ListaTranferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ItemTransferencia(Transferencia(200, 213)),
        ItemTransferencia(Transferencia(300, 243)),
        ItemTransferencia(Transferencia(400, 293))
      ],
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
}
