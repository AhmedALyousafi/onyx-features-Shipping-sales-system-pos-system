import 'package:dio/dio.dart';
import 'package:onyx/core/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onyx/features/Pos-System/features/pos/presentation/widgets/payment/pyment_widget.dart';

class InvoiceCubit extends Cubit<InvoiceState> {
  InvoiceCubit() : super(InvoiceState());

  GlobalKey<FormState> signInFormKey = GlobalKey();
  //Sign in email
  TextEditingController signInEmail = TextEditingController();
  //Sign in password
  TextEditingController signInPassword = TextEditingController();
  TextEditingController signInId = TextEditingController();
  //Sign Up Form key
  GlobalKey<FormState> signUpFormKey = GlobalKey();

  changeCalculator(bool? val) {
    emit(state.copyWith(calculator: val));
  }

  changehaedproductgrid(bool? val) {
    emit(state.copyWith(haedproductgrid: val));
  }

  changesettingMultiablePayment() {
    emit(state.copyWith(
        settingMultiablePayment: !state.settingMultiablePayment));
  }

  changesettingplutogridwidget() {
    emit(state.copyWith(plutogridwidget: !state.plutogridwidget));
  }

  void navigateToPaymentWidget(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Paymentwidget(),
      ),
    );
  }

  void selectcash(bool value) {
    return emit(state.copyWith(cash: value));
  }

  void selectbank(bool value) {
    return emit(state.copyWith(bank: value));
  }

  void selectcredit(bool value) {
    return emit(state.copyWith(credit: value));
  }

  void selectaccount(bool value) {
    return emit(state.copyWith(account: value));
  }

  void selectBankvisible(bool value) {
    return emit(state.copyWith(isBankFieldVisible: value));
  }

  void selectadditional(bool value) {
    return emit(state.copyWith(additional: value));
  }

  void selectcheek(String value) {
    if (value == 'شيك') {
      return emit(state.copyWith(
        cheek: true,
        trans: false,
        creditcard: false,
      ));
    }
  }

  void selectcreditCard(String value) {
    if (value == 'بطاقة الائتمان') {
      return emit(state.copyWith(
        creditcard: true,
        trans: false,
        cheek: false,
      ));
    }
  }

  void selecttrans(String value) {
    if (value == 'تحويل') {
      return emit(state.copyWith(
        trans: true,
        creditcard: false,
        cheek: false,
      ));
    }
  }

  void selectmonth(String value) {
    if (value == 'طريقة التوزيع*') {
      return emit(state.copyWith(
        month: true,
        day: false,
      ));
    }
  }

  void selectday(String value) {
    if (value == 'طريقة التوزيع*') {
      return emit(state.copyWith(
        month: false,
        day: true,
      ));
    }
  }

  signIn() async {
    try {
      emit(SignInLoading());
      final response = await Dio(BaseOptions(headers: {
        'Calender': 'higrah',
        'CharSet': 'AL32UTF8',
        'IASConfig': 'OnyxIx',
        'DateFormat': 'DD/MM/RRRR',
        'TimeFormat': 'HH24:MI:SSA',
        'ReportPrefix': 'IX',
        'ReportPort': '8080',
        'NetService': 'test',
        'Territory': 'Egyptian',
        'CID': 'A2024',
        'APPID': '12o',
      })).post(
          'https://learnonyx.com:8097/ultimate-onyxix/api/v5.1.5/erpweb/main/adm/user/login',
          data: {
            "lngNo": 1,
            "lngDflt": 1,
            "dbsUsr": 1,
            "lgnByUsrCodeFlg": 0,
            "usrNo": 1,
            "usrCode": "test",
            "usrPswrd": signInPassword.text,
            "yrNo": 2024,
            "yearNo": 2024,
            "untNo": 2,
            "sysNo": 1,
            "sysTyp": 1,
            "email": signInEmail.text,
            "mobileNo": "0000",
            "dvcInfo": {
              "browserName": "Safari",
              "browserVersion": "16.0",
              "deviceImei": "test00",
              "deviceMacAddress": "test12",
              "deviceName": "iPhone 12",
              "deviceSerial": "edfss54fdrejf",
              "deviceType": 1,
              "deviceVersion": 12,
              "osName": "iOS",
              "osVersion": "16.4"
            }
          });
      emit(SignInSuccess());
      print(response);
    } catch (e) {
      emit(SignInFailure(errMessage: e.toString()));
      print(e.toString());
    }
  }

  signUp() async {
    try {
      emit(SignUpLoading());
      final response = await Dio(BaseOptions(headers: {
        'DbsUsr': 9,
        'YrNo': 2024,
        'UntNoLgn': 2,
        'UsrNo': 1,
        'LngNo': 1,
        'LngDflt': 1,
        'Territory': 'Test',
        'Token': 'xyz1234',
        'CID': 'A1234',
        'APPID': '',
      })).post(
          'https://88.80.145.121:8097/ultimate-onyxix/api/v5.1.5/erpweb/main/tmplt/qry/grdLst',
          data: {
            "doctyp": 1306,
            "scrNo": 7363,
            "untNo": 2,
            "sysNo": 1,
            "sysTyp": 1,
            "srchVal": "123",
            "crtnYr": "0",
            "cntaFlag": "0",
            "inactivFlag": "0",
            "pgNo": "null",
            "pgSz": "null"
          });
      emit(SignUpSuccess());
      print(response);
    } catch (e) {
      emit(SignUpFailure(errMessage: e.toString()));
      print(e.toString());
    }
  }
}
