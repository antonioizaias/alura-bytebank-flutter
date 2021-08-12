class ContactModel {
  final int id;
  final String name;
  final int accountNumber;

  const ContactModel(
    this.id,
    this.name,
    this.accountNumber,
  );

  @override
  String toString() {
    return "ID: $id";
  }
}
