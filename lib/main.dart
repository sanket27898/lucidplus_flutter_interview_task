import 'package:flutter/material.dart';
import 'package:lucidplus_interview_task/Provider/Providerclass.dart';
import 'package:provider/provider.dart';
import './JsonParse/jsonParseDemo.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ProviderClass>.value(
      value: ProviderClass(),
    ),
  ], child: HomeApp()));
}

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: JsonParseDemo(),
    );
  }
}
