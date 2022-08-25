import 'package:api_task/controler/app_cubit/index_cubit.dart';
import 'package:api_task/controler/cont.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controler/app_cubit/app_cubit.dart';
import '../controler/app_repo/repo.dart';
import 'next_api_screen.dart';

class ViewsScreen extends StatefulWidget {
  const ViewsScreen({Key? key}) : super(key: key);

  @override
  State<ViewsScreen> createState() => _ViewsScreenState();
}

class _ViewsScreenState extends State<ViewsScreen> {
  int index = AppRepo.pages;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IndexCubit, int>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const NextApiScreen();
                  }));
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Column(
                    children: const [
                      Expanded(
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.black,
                        ),
                      ),
                      Expanded(
                        child: Center(
                            child: Text(
                          'Next Api Screen',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        )),
                      )
                    ],
                  ),
                ),
              ),
            ],
            backgroundColor: Colors.blue.shade50,
            title: Text(
              state == 1 ? 'Page 2' : 'Page 1',
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
            centerTitle: true,
          ),
          floatingActionButton: Align(
            alignment: Alignment.bottomCenter,
            child: FloatingActionButton(
              onPressed: () {
                if (AppRepo.pages == 1) {
                  AppRepo.pages++;
                  context.read<AppCubit>().getData();
                  context.read<IndexCubit>().getindex(index: 1);
                } else if (AppRepo.pages == 2) {
                  AppRepo.pages--;
                  context.read<AppCubit>().getData();
                  context.read<IndexCubit>().getindex(index: 2);
                } else {}
              },
              child: Icon(
                state == 2 ? Icons.arrow_forward : Icons.arrow_back,
                color: Colors.black,
              ),
            ),
          ),
          body: BlocConsumer<AppCubit, AppState>(
            listener: (context, state) {
              if (state is AppErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.green.shade500,
                    elevation: 2,
                    duration: const Duration(seconds: 3),
                    content: Text(state.error)));
              } else if (state is AppLoadingState) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.green.shade500,
                    duration: const Duration(seconds: 1),
                    content: const Text('Data Loading')));
              } else if (state is AppLoadedState) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.green.shade500,
                    duration: const Duration(seconds: 3),
                    content: const Text('Data Loaded Successes Full')));
              }
            },
            builder: (context, state) {
              if (state is AppLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is AppLoadedState) {
                return Center(
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: Controller.appModel.data.length,
                        itemBuilder: (context, int index) {
                          return Card(
                            child: ListTile(
                              title: Text(Controller.appModel.data[index].id
                                  .toString()),
                              subtitle: Text(
                                  Controller.appModel.data[index].firstName),
                              leading: Image.network(
                                Controller.appModel.data[index].avatar,
                              ),
                              trailing:
                                  Text(Controller.appModel.data[index].email),
                            ),
                          );
                        }));
              } else if (state is AppErrorState) {
                return RefreshIndicator(
                  color: Colors.grey,
                  onRefresh: () => context.read<AppCubit>().getData(),
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
          ),
        );
      },
    );
  }
}
