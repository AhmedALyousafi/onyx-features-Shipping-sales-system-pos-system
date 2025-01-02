import 'package:dio/dio.dart';
import 'package:onyx/core/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onyx/core/model/sign_in_model.dart';
import 'package:onyx/core/repositories/user_repository.dart';
import 'package:onyx/features/Pos-System/features/pos/presentation/widgets/payment/pyment_widget.dart';
import 'package:onyx/features/login/screnn/device.dart';
import 'package:onyx/features/login/screnn/model.dart';
import 'package:onyx/features/sales_system/features/all_customer_order/widgets/get_all_model.dart';

class InvoiceCubit extends Cubit<InvoiceState> {
  InvoiceCubit(this.userRepository) : super(InvoiceState());
  final UserRepository userRepository;
  GlobalKey<FormState> signInFormKey = GlobalKey();
  //Sign in email
  TextEditingController signInEmail = TextEditingController();
  //Sign in password
  TextEditingController signInPassword = TextEditingController();
  TextEditingController signInId = TextEditingController();
  //Sign Up Form key
  GlobalKey<FormState> signUpFormKey = GlobalKey();

  SignInModel? user;

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
    DeviceInfoService deviceInfoService = DeviceInfoService();
    Map info = await deviceInfoService.getDeviceInfo();
    try {
      emit(SignInLoading());
      final response = await Dio().post(
          'https://learnonyx.com:8097/ultimate-onyxix/api/v5.1.5/erpweb/main/adm/user/login',
          data: {
            "lngNo": 1,
            "lngDflt": 1,
            "dbsUsr": 1,
            "lgnByUsrCodeFlg": 0,
            "usrNo": 1,
            "usrCode": 'test',
            "usrPswrd": signInPassword.text,
            "yrNo": 2024,
            "yearNo": 2024,
            "untNo": 2,
            "sysNo": 1,
            "sysTyp": 1,
            "email": signInEmail.text,
            "mobileNo": '0000',
            'dvcInfo': DeviceInfoModel(
              dvcTyp: info['deviceType'],
              dvcNm: info['deviceName'],
              dvcSrl: info['deviceSerial'],
              dvcVrsn: info['deviceVersion'],
              dvcMacAddrs: info['deviceMacAddress'],
              dvcImei: info['deviceImei'],
              osNm: info['osName'],
              osVrsn: info['osVersion'],
              brwsrNm: info['browserName'],
              brwsrVrsn: "16",
              // brwsrVrsn: info['browserVersion'],
            ),
          });
      emit(SignInSuccess());
      print(response);
    } catch (e) {
      emit(SignInFailure(errMessage: e.toString()));
      print(e.toString());
    }
    // emit(SignInLoading());
    // final response = await userRepository.signIn(
    //   email: signInEmail.text,
    //   password: signInPassword.text,
    //   id: signInId.text,
    // );
    // response.fold(
    //   (errMessage) => emit(SignInFailure(errMessage: errMessage)),
    //   (signInModel) => emit(SignInSuccess()),
    // );
  }

  // getUserProfile() async {
  //   emit(GetUserLoading());
  //   final response = await userRepository.getUserProfile();
  //   response.fold(
  //     (errMessage) => emit(GetUserFailure(errMessage: errMessage)),
  //     (user) => emit(GetUserSuccess(user: user)),
  //   );
  // }
}
