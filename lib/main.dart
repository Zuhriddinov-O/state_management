import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/home_page_v2.dart';
import 'package:state_management/observer_exp_v2.dart';

import 'homeless_page.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ObserverV2(),
        child: const MaterialApp(home: HomePage(), debugShowCheckedModeBanner: false));
  }
}
