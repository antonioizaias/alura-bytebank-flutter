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
    return "Contato de ID: $id, nome $nome e valor $valor";
  }
}
