import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqlite_flutter_learn/provider/test_provider.dart';
import 'package:sqlite_flutter_learn/provider/user_provider.dart';
import 'package:sqlite_flutter_learn/route.dart';
import 'package:sqlite_flutter_learn/screen/home_screen.dart';
import 'package:sqlite_flutter_learn/screen/login_screen.dart';
import 'package:sqlite_flutter_learn/screen/test/testing_dynamic_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> userProvider()),
        ChangeNotifierProvider(create: (_)=> testProvider() )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
    
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const DynamicTexfield(),
        routes: Routes.route,
      ),
    );
  }
}

