part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

class AppLoadingState extends AppState{}

class AppLoadedState extends AppState{}

class AppErrorState extends AppState{
  String error;

  AppErrorState({required this.error});
}
class NetworkConnectionState extends AppState{}
