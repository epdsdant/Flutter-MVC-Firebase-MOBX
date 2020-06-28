import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todos/stores/app.store.dart';
import 'package:todos/theme/app.theme.dart';
import 'package:todos/views/login.view.dart';

//Sobrecarga do http para aceitar certificados de SSL invalidas.
//Deixar isso apenas para ambientes de Desenvolvimento
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    HttpClient client = super.createHttpClient(context);
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    return client;
  }
}

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Instancia unico de um Store (Singlenton)
    return MultiProvider(
      providers: [
        Provider<AppStore>.value(
          value: AppStore(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Todo App MVC-MOBX',
        theme: appTheme(),
        home: LoginView(),
      ),
    );
  }
}
