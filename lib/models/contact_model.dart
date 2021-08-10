class ContactModel {
  final String nome;
  final int valor;

  const ContactModel(
    this.nome,
    this.valor,
  );

  @override
  String toString() {
    return "Contato de nome $nome e com o valor $valor";
  }
}
