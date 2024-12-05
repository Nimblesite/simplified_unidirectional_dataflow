import 'package:flutter/material.dart';
import 'package:simplified_unidirectional_dataflow/home_page.dart';
import 'package:simplified_unidirectional_dataflow/main.dart';
import 'package:simplified_unidirectional_dataflow/ui/constants.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: appTitle,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 147, 8, 73),
            brightness: Theme.of(context).brightness,
          ),
          useMaterial3: true,
        ),
        navigatorKey: container<GlobalKey<NavigatorState>>(),
        home: const HomePage(),
      );
}
