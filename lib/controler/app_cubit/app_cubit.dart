import 'package:api_task/controler/app_repo/repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../model/utils/const_class.dart';
part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial()) {
    getData();
  }

  Future<void> getData() async {
    try {
      emit(AppLoadingState());
      final data = await AppRepo.fetchData();
      if (data == AppConstValues.responseOk) {
        emit(AppLoadedState());
      } else if (data == AppConstValues.dataNotFoundStatusCode) {
        emit(AppErrorState(error: 'Data Not Found'));
      } else if (data == AppConstValues.serverEssueStatusCode) {
        emit(AppErrorState(error: 'Server Essie'));
      } else if (data == AppConstValues.networkErroStatusCode) {
        emit(AppErrorState(error: 'Network Error '));
      } else {}
    } catch (e) {
      print(e);
    }
  }
}
