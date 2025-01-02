class AuthBodyModel {
  final int lngNo;
  final int lngDflt;
  final int dbsUsr;
  final int lgnByUsrCodeFlg;
  final int usrNo;
  final String usrCode;
  final String usrPswrd;
  // final String usrId;
  final int yrNo;
  final int untNo;
  final int sysNo;
  final int sysTyp;
  final String email;
  final String mobileNo;
  final DeviceInfoModel dvcInfo;

  AuthBodyModel({
    required this.lngNo,
    required this.lngDflt,
    required this.dbsUsr,
    required this.lgnByUsrCodeFlg,
    required this.usrNo,
    required this.usrCode,
    required this.usrPswrd,
    // required this.usrId,
    required this.yrNo,
    required this.untNo,
    required this.sysNo,
    required this.sysTyp,
    required this.email,
    required this.mobileNo,
    required this.dvcInfo,
  });

  Map<String, dynamic> toJson() {
    return {
      'lngNo': lngNo,
      'lngDflt': lngDflt,
      'dbsUsr': dbsUsr,
      'lgnByUsrCodeFlg': lgnByUsrCodeFlg,
      'usrNo': usrNo,
      'usrCode': usrCode,
      'usrPswrd': usrPswrd,
      'yrNo': yrNo,
      'untNo': untNo,
      'sysNo': sysNo,
      'sysTyp': sysTyp,
      'email': email,
      'mobileNo': mobileNo,
      'dvcInfo': dvcInfo.toJson(),
    };
  }

  AuthBodyModel copyWith({
    int? lngNo,
    int? lngDflt,
    int? dbsUsr,
    int? lgnByUsrCodeFlg,
    int? usrNo,
    String? usrCode,
    String? usrPswrd,
    String? usrId,
    int? yrNo,
    int? untNo,
    int? sysNo,
    int? sysTyp,
    String? email,
    String? mobileNo,
    DeviceInfoModel? dvcInfo,
  }) {
    return AuthBodyModel(
      lngNo: lngNo ?? this.lngNo,
      lngDflt: lngDflt ?? this.lngDflt,
      dbsUsr: dbsUsr ?? this.dbsUsr,
      lgnByUsrCodeFlg: lgnByUsrCodeFlg ?? this.lgnByUsrCodeFlg,
      usrNo: usrNo ?? this.usrNo,
      usrCode: usrCode ?? this.usrCode,
      usrPswrd: usrPswrd ?? this.usrPswrd,
      // usrId: usrId ?? this.usrId,
      yrNo: yrNo ?? this.yrNo,
      untNo: untNo ?? this.untNo,
      sysNo: sysNo ?? this.sysNo,
      sysTyp: sysTyp ?? this.sysTyp,
      email: email ?? this.email,
      mobileNo: mobileNo ?? this.mobileNo,
      dvcInfo: dvcInfo ?? this.dvcInfo,
    );
  }
}

class DeviceInfoModel {
  final int? dvcTyp;
  final String? dvcNm;
  final String? dvcSrl;
  final int? dvcVrsn;
  final String? dvcMacAddrs;
  final String? dvcImei;
  final String? osNm;
  final String? osVrsn;
  final String? brwsrNm;
  final String? brwsrVrsn;

  DeviceInfoModel({
    required this.dvcTyp,
    required this.dvcNm,
    required this.dvcSrl,
    required this.dvcVrsn,
    required this.dvcMacAddrs,
    required this.dvcImei,
    required this.osNm,
    required this.osVrsn,
    required this.brwsrNm,
    required this.brwsrVrsn,
  });

  Map<String, dynamic> toJson() {
    return {
      'dvcTyp': dvcTyp,
      'dvcNm': dvcNm,
      'dvcSrl': dvcSrl,
      'dvcVrsn': dvcVrsn,
      'dvcMacAddrs': dvcMacAddrs,
      'dvcImei': dvcImei,
      'osNm': osNm,
      'osVrsn': osVrsn,
      'brwsrNm': brwsrNm,
      // 'brwsrVrsn': brwsrVrsn,
      'brwsrVrsn': 1
    };
  }

  DeviceInfoModel copyWith({
    int? dvcTyp,
    String? dvcNm,
    String? dvcSrl,
    int? dvcVrsn,
    String? dvcMacAddrs,
    String? dvcImei,
    String? osNm,
    String? osVrsn,
    String? brwsrNm,
    String? brwsrVrsn,
  }) {
    return DeviceInfoModel(
      dvcTyp: dvcTyp ?? this.dvcTyp,
      dvcNm: dvcNm ?? this.dvcNm,
      dvcSrl: dvcSrl ?? this.dvcSrl,
      dvcVrsn: dvcVrsn ?? this.dvcVrsn,
      dvcMacAddrs: dvcMacAddrs ?? this.dvcMacAddrs,
      dvcImei: dvcImei ?? this.dvcImei,
      osNm: osNm ?? this.osNm,
      osVrsn: osVrsn ?? this.osVrsn,
      brwsrNm: brwsrNm ?? this.brwsrNm,
      brwsrVrsn: brwsrVrsn ?? this.brwsrVrsn,
    );
  }
}
