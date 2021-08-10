class ContactModel {
  final int id;
  final String nome;
  final int valor;

  const ContactModel(
    this.id,
    this.nome,
    this.valor,
  );

  @override
  String toString() {
    return "ID: $id – Nome $nome – Valor $valor";
  }
}
