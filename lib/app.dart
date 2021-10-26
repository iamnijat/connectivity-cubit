import 'package:connect_cubit/presentation/screens/home_screen.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logic/cubit/internet_cubit.dart';

class MyApp extends StatelessWidget {
  final Connectivity connectivity;

  const MyApp({
    Key key,
    @required this.connectivity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(connectivity: connectivity),
        ),
      
      ],
    child: MaterialApp(
      title: 'Connectivity Cubit',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    ),
     );
  }
}
