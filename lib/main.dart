import 'package:flutter/material.dart';
import 'package:lucidplus_interview_task/provider/provider.dart';

import 'package:lucidplus_interview_task/widget/userFiltterdemo.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ProviderClass>.value(
      value: ProviderClass(),
    ),
  ], child: MaterialApp(home: HomeApp())));
}

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return UserFilterDemo();
  }
}
