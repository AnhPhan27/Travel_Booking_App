import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_simple_travel_app/cubit/app_cubit_logic.dart';
import 'package:practice_simple_travel_app/cubit/cubit.dart';
import 'package:practice_simple_travel_app/cons/theme.dart';
import 'package:practice_simple_travel_app/screens/routes/routes.dart';
import 'package:practice_simple_travel_app/services/data_services.dart';

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
      title: 'Flutter Demo',
      theme: theme(),
      routes: routes,
      // initialRoute: '/welcome_screen',

      home: BlocProvider(
        create: (context) => AppCubits(data: DataServices()),
        child: AppCubitLogics(),
      ),
    );
  }
}
