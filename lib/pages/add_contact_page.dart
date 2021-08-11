import 'package:alura_bytebank_flutter/data/application_data.dart';
import 'package:flutter/material.dart';
import 'package:alura_bytebank_flutter/models/contact_model.dart';

class AddContactPage extends StatefulWidget {
  @override
  _AddContactPageState createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  final TextEditingController nomeCtrl = TextEditingController();
  final TextEditingController valorCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adicionar"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          tooltip: "Voltar",
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextField(
                controller: nomeCtrl,
                decoration: InputDecoration(
                  labelText: 'Nome completo',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextField(
                controller: valorCtrl,
                decoration: InputDecoration(
                  labelText: 'Número da conta',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () {
                    final String nome = nomeCtrl.text;
                    final int valor = int.tryParse(valorCtrl.text);
                    final ContactModel contato = ContactModel(0, nome, valor);
                    write(contato).then((id) => Navigator.pop(context));
                  },
                  child: Text("Enviar"),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
