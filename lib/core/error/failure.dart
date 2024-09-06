import 'package:softnet_school_portal/core/utils/app_string.dart';

class Failure {
  final String message;

  Failure({this.message = AppString.internalServerErrorMessage});

  @override
  String toString() => message;
}
