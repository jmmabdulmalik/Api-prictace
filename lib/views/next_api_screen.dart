import 'package:api_task/controler/app_cubit/api2_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../controler/api2_controler.dart';

class NextApiScreen extends StatefulWidget {
  const NextApiScreen({Key? key}) : super(key: key);

  @override
  State<NextApiScreen> createState() => _NextApiScreenState();
}

class _NextApiScreenState extends State<NextApiScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Api2Cubit(),
      child: Scaffold(
          body: BlocConsumer<Api2Cubit, Api2State>(
        listener: (context, state) {
          if (state is Api2Loading) {
            Fluttertoast.showToast(msg: 'Data Loading');
            return;
          } else if (state is Api2Loaded) {
            Fluttertoast.showToast(msg: 'Data Loaded Successful ');
            return;
          } else if (state is Api2Error) {
            Fluttertoast.showToast(msg: state.error);
          } else {}
        },
        builder: (context, state) {
          if (state is Api2Loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is Api2Loaded) {
            return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: Api2Controler.controler.data.length,
                itemBuilder: (context, int index) {
                  return Card(
                    child: ListTile(
                      title: Text(Api2Controler.controler.data[index].name),
                      subtitle: Text(Api2Controler.controler.data[index].color),
                      leading: Text(
                          Api2Controler.controler.data[index].id.toString()),
                      trailing: Text(
                          Api2Controler.controler.data[index].year.toString()),
                    ),
                  );
                });
          } else if (state is Api2Error) {
            return RefreshIndicator(
              onRefresh: () => context.read<Api2Cubit>().getapi2(),
              child: ListView(
                children: [
                  Center(child: Text(state.error)),
                ],
              ),
            );
          } else {
            return Container();
          }
        },
      )),
    );
  }
}
