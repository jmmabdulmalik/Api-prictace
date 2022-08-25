part of 'api2_cubit.dart';

@immutable
abstract class Api2State {}

class Api2Initial extends Api2State {}

class Api2Loading extends Api2State {}

class Api2Loaded extends Api2State {}

class Api2Error extends Api2State {
  String error;
  Api2Error({required this.error});
}
