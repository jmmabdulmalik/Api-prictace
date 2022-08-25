import 'package:api_task/model/api2_model.dart';

class Api2Controler {
  static Api2Model controler = Api2Model(
      page: 0,
      perPage: 0,
      total: 0,
      totalPages: 0,
      data: [],
      support: Support(text: '', url: ''));
}
