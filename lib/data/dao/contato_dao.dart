import 'package:alura_bytebank_flutter/data/application_data.dart';
import 'package:alura_bytebank_flutter/models/contact_model.dart';
import 'package:sqflite/sqflite.dart';

// DAO: Data Access Object
class ContatoDao {
  static const String tableSql =
      'CREATE TABLE contatos(id INTEGER PRIMARY KEY, nome TEXT, valor INTEGER)';

  Future<int> write(ContactModel contato) async {
    final Database db = await getDatabase();
    final Map<String, dynamic> mapaContato = Map();
    // mapaContato['id'] = contato.id; – Passando a responsabilidade de incrementar pro SQLite
    mapaContato['nome'] = contato.nome;
    mapaContato['valor'] = contato.valor;
    return db.insert('contatos', mapaContato);
    // return getDatabase().then((db) {
    //   final Map<String, dynamic> mapaContato = Map();
    //   mapaContato['nome'] = contato.nome;
    //   mapaContato['valor'] = contato.valor;
    //   return db.insert('contatos', mapaContato);
    // });
  }

  Future<List<ContactModel>> read() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query('contatos');
    final List<ContactModel> contatos = [];
    for (Map<String, dynamic> row in result) {
      final ContactModel contato = ContactModel(
        row['id'],
        row['nome'],
        row['valor'],
      );
      contatos.add(contato);
    }
    return contatos;
    // return getDatabase().then((db) {
    //   return db.query('contatos').then((mapas) {
    //     final List<ContactModel> contatos = [];
    //     for (Map<String, dynamic> mapa in mapas) {
    //       final ContactModel contato = ContactModel(
    //         mapa['id'],
    //         mapa['nome'],
    //         mapa['valor'],
    //       );
    //       contatos.add(contato);
    //     }
    //     return contatos;
    //   });
    // });
  }
}
