// import 'package:onyx/features/sales_system/features/all_customer_order/widgets/result.dart';

// class GetAllModel {
//   final GrdLstModel grdLst;
//   final ResultModel result;

//   GetAllModel({required this.grdLst, required this.result});

//   factory GetAllModel.fromJson(Map<String, dynamic> json) {
//     return GetAllModel(
//       grdLst: GrdLstModel.fromJson(json['Data']),
//       result: ResultModel.fromJson(json['Result']),
//     );
//   }

//   // GetAllEnt toEntity() {
//   //   return GetAllEnt(
//   //     scrNm: grdLst.scrNm,
//   //     pgNo: grdLst.pgNo,
//   //     pgSz: grdLst.pgSz,
//   //     pgsCnt: grdLst.pgsCnt,
//   //     rowsCnt: grdLst.rowsCnt,
//   //     grdClmnsCnt: grdLst.grdClmnsCnt,
//   //     columnsEnt: grdLst.grdClmnsLblsLst.map((e) => e.toEntity()).toList(),
//   //     rowsEnt: grdLst.grdClmnsValsLst.map((e) => e.toEntity()).toList(),
//   //     usrActnPrvEnt: grdLst.usrActnPrv.toEntity(),
//   //   );
//   // }
// }

// class GrdLstModel {
//   final String scrNm;
//   final int? pgNo;
//   final int? pgSz;
//   final int? pgsCnt;
//   final int? rowsCnt;
//   final int? grdClmnsCnt;
//   final List<GridColumn> grdClmnsLblsLst;
//   final List<GridRow> grdClmnsValsLst;
//   // final UsrActnPrvModel usrActnPrv;

//   GrdLstModel({
//     required this.scrNm,
//     required this.pgNo,
//     required this.pgSz,
//     required this.pgsCnt,
//     required this.rowsCnt,
//     required this.grdClmnsCnt,
//     required this.grdClmnsLblsLst,
//     required this.grdClmnsValsLst,
//     // required this.usrActnPrv,
//   });

//   factory GrdLstModel.fromJson(Map<String, dynamic> json) {
//     return GrdLstModel(
//       scrNm: json['scrNm'],
//       pgNo: json['pgNo'] ?? 1,
//       pgSz: json['pgSz'],
//       pgsCnt: json['pgsCnt'],
//       rowsCnt: json['rowsCnt'],
//       grdClmnsCnt: json['grdClmnsCnt'],
//       // usrActnPrv: UsrActnPrvModel.fromJson(json["usrActnPrv"]),
//       grdClmnsLblsLst: (json['grdClmnsLblsLst'] as List)
//           .map((e) => GridColumn.fromJson(e))
//           .toList(),
//       grdClmnsValsLst: (json['grdClmnsValsLst'] as List)
//           .map((e) => GridRow.fromJson(e))
//           .toList(),
//     );
//   }
// }

// class GridColumn {
//   final String clmnNm;
//   final String? lblNm;
//   final bool vsbl;

//   GridColumn({required this.clmnNm, this.lblNm, required this.vsbl});

//   factory GridColumn.fromJson(Map<String, dynamic> json) {
//     return GridColumn(
//       clmnNm: json['clmnNm'],
//       lblNm: json['lblNm'],
//       vsbl: json['vsbl'],
//     );
//   }

//   // GridColumnEntity toEntity() {
//   //   return GridColumnEntity(clmnNm: clmnNm, lblNm: lblNm, vsbl: vsbl);
//   // }
// }

// class GridRow {
//   final Map<String, dynamic> values;

//   GridRow({required this.values});

//   factory GridRow.fromJson(Map<String, dynamic> json) {
//     return GridRow(values: json);
//   }

//   // GridRowEntity toEntity() {
//   //   return GridRowEntity(values: values);
//   // }
// }
