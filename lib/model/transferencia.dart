class Transferencia {
  final double valor;
  final int contaNumro;

  Transferencia(this.valor, this.contaNumro);

  @override
  String toString() {
    return 'Transferencia{valor = $valor, contaNumero = $contaNumro}';
  }
}