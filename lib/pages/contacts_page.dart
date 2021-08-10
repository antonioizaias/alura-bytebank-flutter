import 'package:alura_bytebank_flutter/configs/colors_config.dart';
import 'package:alura_bytebank_flutter/pages/add_contact_page.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatefulWidget {
  @override
  _ContactsListState createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contatos"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          tooltip: "Voltar",
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Card(
              elevation: 12,
              color: ColorsConfig.primary,
              child: ListTile(
                title: Text(
                  "Nome",
                  style: TextStyle(
                    color: ColorsConfig.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "Valor",
                  style: TextStyle(
                    color: ColorsConfig.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Adicionar",
        onPressed: () {
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) => AddContactPage(),
                ),
              )
              .then(
                (contato) => debugPrint(contato.toString()),
              );
        },
        child: Icon(Icons.add),
        backgroundColor: ColorsConfig.primary,
      ),
    );
  }
}
