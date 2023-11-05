import 'package:cloud_storage_ui/pages/home/home_page.dart';
import 'package:cloud_storage_ui/pages/storage/storage.dart';
import 'package:flutter/material.dart';

// class GenerateRoute {
//   static Route<dynamic> route(RouteSettings settings) {
//     switch (settings.name) {
//       case '/':
//         return MaterialPageRoute(builder: (context) => const HomePage());
//       case '/storage':
//         final args = settings.arguments as StorageArguments;
//         return MaterialPageRoute(
//           builder: (context) => Storage(
//             storageArguments: args,
//           ),
//         );

//       default:
//         return routeError();
//     }
//   }

//   static Route<dynamic> routeError() {
//     return MaterialPageRoute(
//       builder: (context) {
//         return const Scaffold(
//           body: Center(
//             child: Text("Something went wrong."),
//           ),
//         );
//       },
//     );
//   }
// }

class AppPage {
  static Map<String, Widget> pages = {
    '/': const HomePage(),
    '/storage': const Storage(),
  };
}
