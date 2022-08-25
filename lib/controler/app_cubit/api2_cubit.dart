import 'package:api_task/controler/app_cubit/app_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../model/utils/const_class.dart';
import '../app_repo/api2_reposit.dart';

part 'api2_state.dart';

class Api2Cubit extends Cubit<Api2State> {
  Api2Cubit() : super(Api2Initial()) {
    getapi2();
  }

  Future getapi2() async {
    emit(Api2Loading());
    print('Loadingapi2 Emit');
    try {
      var data = await Api2Rrepo.getApi2data();
      print(data);
      if (data == AppConstValues.responseOk) {
        print(data);
        emit(Api2Loaded());
        print('Loadedapi2 Emit');
      } else if (data == AppConstValues.dataNotFoundStatusCode) {
        emit(Api2Error(error: 'Data Not Found'));
      } else if (data == AppConstValues.serverEssueStatusCode) {
        emit(Api2Error(error: 'Server Error'));
      } else if (data == AppConstValues.networkErroStatusCode) {
        emit(Api2Error(error: 'Network Error'));
      } else {
        emit(Api2Error(error: 'Some thing went wrong'));
      }
    } catch (e) {
      print(e);
      emit(Api2Error(error: e.toString()));
    }
  }
}
