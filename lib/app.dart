
import 'package:bloc_state_management/src/presentation/bloc/home/home_bloc.dart';
import 'package:flutter/material.dart';
import 'src/presentation/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => HomeBloc(),
        child: HomeScreen(),
      ),
    );
  }
}