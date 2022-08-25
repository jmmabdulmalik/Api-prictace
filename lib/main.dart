import 'package:api_task/controler/app_cubit/api2_cubit.dart';
import 'package:api_task/controler/app_cubit/app_cubit.dart';
import 'package:api_task/controler/app_cubit/index_cubit.dart';
import 'package:api_task/views/next_api_screen.dart';
import 'package:api_task/views/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Flutter Demo',
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => AppCubit(),
      ),
      BlocProvider(
        create: (context) => IndexCubit(1),
      ),
      // BlocProvider(
      //   create: (context) => Api2Cubit(),
      // ),
    ], child: const ViewsScreen());
  }
}
