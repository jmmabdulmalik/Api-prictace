import 'package:bloc/bloc.dart';


class IndexCubit extends Cubit<int> {
  IndexCubit(super.initialState);
  getindex({required int index}){
    emit(index);
  }
}
