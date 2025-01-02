// class ResultDataModel {
//   final ResultModel result;

//   ResultDataModel({
//     required this.result,
//   });

//   factory ResultDataModel.fromJson(Map<String, dynamic> json) =>
//       ResultDataModel(
//         result: ResultModel.fromJson(json["Result"]),
//       );

//   // ResultEnt toEntity() {
//   //   return ResultEnt(
//   //     errMsg: result.errMsg,
//   //     errNo: result.errNo,
//   //   );
//   // }
// }

// class ResultModel {
//   final int? errNo;
//   final String? errMsg;

//   ResultModel({
//     required this.errNo,
//     required this.errMsg,
//   });

//   factory ResultModel.fromJson(Map<String, dynamic> json) => ResultModel(
//         errNo: json["errNo"],
//         errMsg: json["errMsg"],
//       );

//   // ResultEnt toEntity() {
//   //   return ResultEnt(
//   //     errMsg: errMsg,
//   //     errNo: errNo,
//   //   );
//   // }
// }
