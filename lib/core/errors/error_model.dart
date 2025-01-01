import 'package:onyx/core/api/end_ponits.dart';

class ErrorModel {
  final int status;
  final String errorMessage;

  ErrorModel({required this.status, required this.errorMessage, required id});
  factory ErrorModel.fromJson(Map<String, dynamic > jsonData) {
    return ErrorModel(
      status: jsonData[ApiKey.status],
      errorMessage: jsonData[ApiKey.errorMessage],
      id: jsonData[ApiKey.id]
    );
  }
}

