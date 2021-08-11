import 'package:alura_bytebank_flutter/data/dao/contato_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  // final String dbPath = await getDatabasesPath();
  final String path = join(await getDatabasesPath(), 'bytebank.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(ContatoDao.tableSql);
    },
    version: 1,
  );
  // return getDatabasesPath().then((dbPath) {
  //   final String path = join(dbPath, 'bytebank.db');
  //   return openDatabase(
  //     path,
  //     onCreate: (db, version) {
  //       db.execute(
  //           'CREATE TABLE contatos(id INTEGER PRIMARY KEY, nome TEXT, valor INTEGER)');
  //     },
  //     version: 1,
  //     // ! Diminuindo a versão do banco, irá limpar todos os dados
  //     onDowngrade: onDatabaseDowngradeDelete,
  //   );
  // });
}
