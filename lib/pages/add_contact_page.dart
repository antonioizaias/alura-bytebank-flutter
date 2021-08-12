import 'package:alura_bytebank_flutter/data/dao/contact_dao.dart';
import 'package:flutter/material.dart';
import 'package:alura_bytebank_flutter/models/contact_model.dart';

class AddContactPage extends StatefulWidget {
  @override
  _AddContactPageState createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController accountNumberCtrl = TextEditingController();

  final ContactDao dao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          tooltip: "Back",
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
                  controller: nameCtrl,
                  decoration: InputDecoration(
                    labelText: 'Full name',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextField(
                  controller: accountNumberCtrl,
                  decoration: InputDecoration(
                    labelText: 'Account number',
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
                      final String name = nameCtrl.text;
                      final int accountNumber =
                          int.tryParse(accountNumberCtrl.text);
                      // Esse ID não é levado em consideração, é auto incrementado pelo banco
                      final ContactModel contact =
                          ContactModel(0, name, accountNumber);
                      dao.write(contact).then((id) => Navigator.pop(context));
                    },
                    child: Text("Add"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
