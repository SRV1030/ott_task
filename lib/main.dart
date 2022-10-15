import 'package:flutter/material.dart';
import 'package:stageott/routes/router.dart';
import 'package:stageott/routes/routes.dart';
import '../constants/colors.dart' as schemes;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: Routes.homeScreen,
    );
  }
}
