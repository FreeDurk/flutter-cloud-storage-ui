import 'package:cloud_storage_ui/constants/theme_dart.dart';
import 'package:cloud_storage_ui/pages/home/home_page.dart';
import 'package:cloud_storage_ui/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeData,
        home: const HomePage(),
        initialRoute: '/',
        onGenerateRoute: (settings) {
          return PageTransition(
            settings: settings,
            child: AppPage.pages[settings.name]!,
            type: PageTransitionType.leftToRight,
            duration: const Duration(milliseconds: 500),
            reverseDuration: const Duration(milliseconds: 500),
          );
        });
  }
}
