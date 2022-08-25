// import 'package:api_task/controler/app_cubit/api2_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../controler/api2_controler.dart';
//
// class NextApiScreen extends StatefulWidget {
//   const NextApiScreen({Key? key}) : super(key: key);
//
//   @override
//   State<NextApiScreen> createState() => _NextApiScreenState();
// }
//
// class _NextApiScreenState extends State<NextApiScreen> {
//   @override
//   void initState() {
//     context.read<Api2Cubit>().getapi2();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView.builder(
//           physics: const BouncingScrollPhysics(),
//           itemCount: Api2Controler.controler.data.length,
//           itemBuilder: (context, int index) {
//             return Card(
//               child: ListTile(
//                 title: Text(Api2Controler.controler.data[index].name),
//                 subtitle: Text(Api2Controler.controler.data[index].color),
//                 leading:
//                     Text(Api2Controler.controler.data[index].id.toString()),
//                 trailing:
//                     Text(Api2Controler.controler.data[index].year.toString()),
//               ),
//             );
//           }),
//     );
//   }
// }
