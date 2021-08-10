import 'package:alura_bytebank_flutter/data/application_data.dart';
import 'package:alura_bytebank_flutter/models/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:alura_bytebank_flutter/configs/entry_point_config.dart';

void main() {
  runApp(EntryPointConfig());
  write(ContactModel(0, "Tonho", 50)).then((value) {
    read().then((contatos) => debugPrint(contatos.toString()));
  });
}
