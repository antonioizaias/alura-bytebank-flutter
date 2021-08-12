import 'package:alura_bytebank_flutter/data/application_data.dart';
import 'package:alura_bytebank_flutter/models/contact_model.dart';
import 'package:sqflite/sqflite.dart';

// DAO: Data Access Object
class ContactDao {
  static const String tableSql =
      'CREATE TABLE contacts(id INTEGER PRIMARY KEY, name TEXT, account_number INTEGER)';

  Future<int> write(ContactModel contact) async {
    final Database db = await getDatabase();
    final Map<String, dynamic> mapContact = Map();
    // mapaContato['id'] = contact.id; – Passando a responsabilidade de incrementar pro SQLite
    mapContact['name'] = contact.name;
    mapContact['account_number'] = contact.accountNumber;
    return db.insert('contacts', mapContact);
    // return getDatabase().then((db) {
    //   final Map<String, dynamic> mapContact = Map();
    //   mapaContato['name'] = contact.nome;
    //   mapaContato['account_number'] = contact.valor;
    //   return db.insert('contacts', mapContact);
    // });
  }

  Future<List<ContactModel>> read() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query('contacts');
    final List<ContactModel> contacts = [];
    for (Map<String, dynamic> row in result) {
      final ContactModel contact = ContactModel(
        row['id'],
        row['name'],
        row['account_number'],
      );
      contacts.add(contact);
    }
    return contacts;
    // return getDatabase().then((db) {
    //   return db.query('contacts').then((maps) {
    //     final List<ContactModel> contacts = [];
    //     for (Map<String, dynamic> map in maps) {
    //       final ContactModel contact = ContactModel(
    //         mapa['id'],
    //         mapa['name'],
    //         mapa['account_number'],
    //       );
    //       contatos.add(contact);
    //     }
    //     return contacts;
    //   });
    // });
  }
}
