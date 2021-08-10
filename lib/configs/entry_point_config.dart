import 'package:alura_bytebank_flutter/pages/add_contact_page.dart';
import 'package:alura_bytebank_flutter/pages/contacts_page.dart';
import 'package:flutter/material.dart';
import 'package:alura_bytebank_flutter/pages/home_page.dart';
import 'package:alura_bytebank_flutter/configs/colors_config.dart';

class EntryPointConfig extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bytebank',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: ColorsConfig.primary,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => HomePage(),
        '/contacts': (BuildContext context) => ContactsList(),
        '/add': (BuildContext context) => AddContactPage(),
      },
    );
  }
}
