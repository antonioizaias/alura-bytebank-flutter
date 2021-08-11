import 'package:alura_bytebank_flutter/data/application_data.dart';
import 'package:alura_bytebank_flutter/models/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:alura_bytebank_flutter/configs/colors_config.dart';
import 'package:alura_bytebank_flutter/pages/add_contact_page.dart';

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
        child: FutureBuilder<List<ContactModel>>(
          initialData: [],
          future: read(),
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
                      Text(
                        "Carregando",
                        style: TextStyle(
                          color: ColorsConfig.primary,
                          fontWeight: FontWeight.bold,
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
                final List<ContactModel> contatos = snapshot.data;
                if (contatos.length == 0) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 12.0,
                      child: Container(
                        height: 35.0,
                        width: double.infinity,
                        child: Center(
                          child: Text("Não há dados cadastrados."),
                        ),
                      ),
                    ),
                  );
                }
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final ContactModel contato = contatos[index];
                    return ContatoItem(contato: contato);
                  },
                  itemCount: contatos.length,
                );
                break;
            }
            return Center(
              child: Text(
                "Erro desconhecido",
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
        tooltip: "Adicionar",
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddContactPage(),
            ),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: ColorsConfig.primary,
      ),
    );
  }
}

class ContatoItem extends StatelessWidget {
  final ContactModel contato;

  ContatoItem({
    @required this.contato,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12,
      color: ColorsConfig.primary,
      child: ListTile(
        title: Text(
          contato.nome,
          style: TextStyle(
            color: ColorsConfig.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          contato.valor.toString(),
          style: TextStyle(
            color: ColorsConfig.white,
          ),
        ),
      ),
    );
  }
}
