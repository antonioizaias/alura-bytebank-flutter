import 'package:alura_bytebank_flutter/data/dao/contact_dao.dart';
import 'package:alura_bytebank_flutter/models/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:alura_bytebank_flutter/configs/colors_config.dart';
import 'package:alura_bytebank_flutter/pages/add_contact_page.dart';

class ContactsList extends StatefulWidget {
  @override
  _ContactsListState createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  final ContactDao dao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          tooltip: "Back",
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<List<ContactModel>>(
          initialData: [],
          future: dao.read(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              // Ainda não foi executado
              case ConnectionState.none:
                break;
              // Carregando
              case ConnectionState.waiting:
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        backgroundColor: Colors.transparent,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          ColorsConfig.primary,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          "Loading",
                          style: TextStyle(
                            color: ColorsConfig.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
                break;
              // Já possue um ou vários dados disponíveis, mas ainda não foi finalizado
              // Stream
              case ConnectionState.active:
                break;
              // Finalizado
              case ConnectionState.done:
                final List<ContactModel> contacts = snapshot.data;
                if (contacts.length == 0) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 12.0,
                      child: Container(
                        height: 35.0,
                        width: double.infinity,
                        child: Center(
                          child: Text("There is no registered data."),
                        ),
                      ),
                    ),
                  );
                } else {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      final ContactModel contact = contacts[index];
                      return ContactItem(contact: contact);
                    },
                    itemCount: contacts.length,
                  );
                }
                break;
            }
            return Center(
              child: Text(
                "Unknown error.",
                style: TextStyle(
                  color: ColorsConfig.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Add",
        onPressed: () {
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) => AddContactPage(),
                ),
              )
              .then((result) => {setState(() {})});
        },
        child: Icon(Icons.add),
        backgroundColor: ColorsConfig.primary,
      ),
    );
  }
}

class ContactItem extends StatelessWidget {
  final ContactModel contact;

  ContactItem({
    @required this.contact,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12,
      color: ColorsConfig.primary,
      child: ListTile(
        title: Text(
          contact.name,
          style: TextStyle(
            color: ColorsConfig.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          contact.accountNumber.toString(),
          style: TextStyle(
            color: ColorsConfig.white,
          ),
        ),
      ),
    );
  }
}
