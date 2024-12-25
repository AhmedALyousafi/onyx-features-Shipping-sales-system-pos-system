class InvoiceState {
  final bool haedproductgrid;
  final bool calculator;
  final bool settingMultiablePayment;
  final bool plutogridwidget;
  final bool cash;
  final bool bank;
  final bool credit;
  final bool account;
  final bool additional;

  final bool cheek;
  final bool trans;
  final bool creditcard;
  final bool month;
  final bool day;
  final bool isBankFieldVisible;

  InvoiceState(
      {this.calculator = false,
      this.haedproductgrid = false,
      this.settingMultiablePayment = false,
      this.plutogridwidget = false,
      this.cash = false,
      this.bank = false,
      this.credit = false,
      this.account = false,
      this.additional = false,
      this.cheek = false,
      this.creditcard = false,
      this.trans = false,
      this.month = false,
      this.day = false,
      this.isBankFieldVisible = false});

  InvoiceState copyWith(
      {bool? calculator,
      bool? haedproductgrid,
      bool? settingMultiablePayment,
      bool? plutogridwidget,
      bool? cash,
      bool? bank,
      bool? credit,
      bool? account,
      bool? additional,
      bool? cheek,
      bool? creditcard,
      bool? trans,
      bool? month,
      bool? day,
      bool? isBankFieldVisible}) {
    return InvoiceState(
        calculator: calculator ?? this.calculator,
        haedproductgrid: haedproductgrid ?? this.haedproductgrid,
        settingMultiablePayment:
            settingMultiablePayment ?? this.settingMultiablePayment,
        plutogridwidget: plutogridwidget ?? this.plutogridwidget,
        cash: cash ?? this.cash,
        bank: bank ?? this.bank,
        additional: additional ?? this.additional,
        account: account ?? this.account,
        credit: credit ?? this.credit,
        cheek: cheek ?? this.cheek,
        creditcard: creditcard ?? this.creditcard,
        trans: trans ?? this.trans,
        month: month ?? this.month,
        day: day ?? this.day,
        isBankFieldVisible: isBankFieldVisible ?? this.isBankFieldVisible);
  }
}
