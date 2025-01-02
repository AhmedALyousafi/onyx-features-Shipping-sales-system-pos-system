import 'package:dio/dio.dart';

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      failure = _handleError(error);
    } else {
      failure = Failure.defaultError;
    }
  }
}

///* *******************************************

Failure _handleError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return Failure.connectTimeout;
    case DioExceptionType.sendTimeout:
      return Failure.sendTimeout;
    case DioExceptionType.receiveTimeout:
      return Failure.receiveTimeout;
    case DioExceptionType.cancel:
      return Failure.cancel;
    case DioExceptionType.connectionError:
      return Failure.connectionError;
    case DioExceptionType.badResponse:
      return _handleBadResponse(error);
    default:
      return _handleDefaultError(error);
  }
}

Failure _handleBadResponse(DioException error) {
  try {
    final int code =
        error.response?.statusCode ?? Failure.defaultError.statusCode;

    if (code == Failure.unauthorised.statusCode) {
      return Failure.unauthorised;
    } else if (code == Failure.forbidden.statusCode) {
      return Failure.forbidden;
    } else if (code == Failure.notFound.statusCode) {
      return Failure.notFound;
    } else {
      return Failure.defaultError;
    }
  } catch (e) {
    return Failure.defaultError;
  }
}

Failure _handleDefaultError(DioException error) {
  if (error.response?.statusCode == Failure.noInternetConnection.statusCode) {
    return Failure.noInternetConnection;
  } else {
    return Failure.defaultError;
  }
}

enum Failure {
  success(
      statusCode: 200,
      errMsgEn: 'Request was successful.',
      errMsgAr: 'تمت معالجة الطلب بنجاح.'),
  noContent(
      statusCode: 204,
      errMsgEn: 'No content available.',
      errMsgAr: 'لا توجد محتويات متاحة.'),
  badRequest(
      statusCode: 400,
      errMsgEn: 'Bad request. Please check the input.',
      errMsgAr: 'طلب غير صالح. يرجى التحقق من المدخلات.'),
  forbidden(
      statusCode: 403,
      errMsgEn: 'Access is forbidden.',
      errMsgAr: 'الدخول محظور.'),
  unauthorised(
      statusCode: 401,
      errMsgEn: 'User is not authenticated.',
      errMsgAr: 'المستخدم غير مصادق عليه.'),
  notFound(
      statusCode: 404,
      errMsgEn: 'Requested resource was not found.',
      errMsgAr: 'المورد المطلوب غير موجود.'),
  invalidData(
      statusCode: 422,
      errMsgEn: 'Invalid Data.',
      errMsgAr: 'بيانات غير صالحة.'),
  internetServerError(
      statusCode: 500,
      errMsgEn: 'Internal server error. Please try again later.',
      errMsgAr: 'خطأ داخلي في الخادم. يرجى المحاولة لاحقًا.'),
  cancel(
      statusCode: 499,
      errMsgEn: 'Request was cancelled.',
      errMsgAr: 'تم إلغاء الطلب.'),
  connectTimeout(
      statusCode: 408,
      errMsgEn: 'Connection timeout. Please try again.',
      errMsgAr: 'انتهت مهلة الاتصال. يرجى المحاولة مرة أخرى.'),
  sendTimeout(
      statusCode: 408,
      errMsgEn: 'Send timeout. Please try again.',
      errMsgAr: 'انتهت مهلة الإرسال. يرجى المحاولة مرة أخرى.'),
  receiveTimeout(
      statusCode: 408,
      errMsgEn: 'Receive timeout. Please try again.',
      errMsgAr: 'انتهت مهلة الاستقبال. يرجى المحاولة مرة أخرى.'),
  cacheError(
      statusCode: 500,
      errMsgEn: 'Cache error occurred.',
      errMsgAr: 'حدث خطأ في التخزين المؤقت.'),
  connectionError(
      statusCode: 0,
      errMsgEn: 'No connection. Please check your internet.',
      errMsgAr: 'لا توجد اتصال. يرجى التحقق من الإنترنت.'),
  noInternetConnection(
      statusCode: 0,
      errMsgEn: 'No internet connection.',
      errMsgAr: 'لا توجد اتصال بالإنترنت.'),
  defaultError(
      statusCode: 500,
      errMsgEn: 'An unexpected error occurred.',
      errMsgAr: 'حدث خطأ غير متوقع.');

  final int statusCode;
  final String errMsgEn;
  final String errMsgAr;

  const Failure(
      {required this.statusCode,
      required this.errMsgEn,
      required this.errMsgAr});
}
