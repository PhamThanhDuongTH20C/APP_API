import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Page/Home_screen.dart';
import 'bloc/Bloc.dart';

void main() => runApp(TestApp());

/////////
class TestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: BlocProvider(
          create: (context) => DetailNativeBloc()..add(GetAllPostsEvent()),
          child: const Home1(),
        ));
  }
}
