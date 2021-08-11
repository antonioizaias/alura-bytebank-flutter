import 'package:alura_bytebank_flutter/models/contact_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() {
  return getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'bytebank.db');
    return openDatabase(
      path,
      onCreate: (db, version) {
        db.execute(
            'CREATE TABLE contatos(id INTEGER PRIMARY KEY, nome TEXT, valor INTEGER)');
      },
      version: 1,
      // Diminuindo a versão do banco, irá limpar todos os dados
      // onDowngrade: onDatabaseDowngradeDelete,
    );
  });
}

Future<int> write(ContactModel contato) {
  return createDatabase().then((db) {
    final Map<String, dynamic> mapaContato = Map();
    // mapaContato['id'] = contato.id; – Passando a responsabilidade de incrementar pro SQLite
    mapaContato['nome'] = contato.nome;
    mapaContato['valor'] = contato.valor;
    return db.insert('contatos', mapaContato);
  });
}

Future<List<ContactModel>> read() {
  return createDatabase().then((db) {
    return db.query('contatos').then((mapas) {
      final List<ContactModel> contatos = [];
      for (Map<String, dynamic> mapa in mapas) {
        final ContactModel contato = ContactModel(
          mapa['id'],
          mapa['nome'],
          mapa['valor'],
        );
        contatos.add(contato);
      }
      return contatos;
    });
  });
}
