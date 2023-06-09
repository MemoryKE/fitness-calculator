import 'package:fitness_calculator/core/widget/loading_overlay/loading_overlay.dart';
import 'package:fitness_calculator/view/home/home_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        title: 'Fitness calculator',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        builder: LoadingScreen.init(),
        initialRoute: HomeView.routeName,
        onGenerateRoute: (RouteSettings settings) {
          if (settings.name == HomeView.routeName) {
            return MaterialPageRoute(
              builder: (context) {
                return HomeView();
              },
            );
          }
          return null;
        },
    );
  }
}