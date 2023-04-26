// class Calculations{
//   // amountToPercentage(double amount) {
//   //   double discount_percentage = 0.00;
//   //   var totalBeforeDiscount = getTaxableAmountAndTotalTax();
//   //   discount_percentage = (100 * amount) / dp("${totalBeforeDiscount["net_total"]}");
//   // }
//   int ip(dynamic val)=> val != '' ? val is String?int.parse(val):int.parse((val??0).toString()) : 0;
//   double dp(dynamic val) => (val != ''&& val !='null') ? val is String?double.parse(val):double.parse((val??0.0).toString()) : 0.0;
//   // getTaxableAmountAndTotalTax() {
//   //   double taxableAmount = 0.00;
//   //   double totalTax = 0.00;
//   //   double net_total = 0.00;
//   //   double addon_total = 0.00;
//   //   for (var c in cartController.getCart()) {
//   //     if (c['isVoid'] == 0) {
//   //       taxableAmount += c['taxlessPrice'] * c['qty'];
//   //       net_total += dp(c['price']) * dp(c['qty'].toString());
//   //       for (var a in c['addons']) {
//   //         taxableAmount += dp(a['rate']) * c['qty'];
//   //         addon_total += dp(a['rate']) * int.parse(c['qty'].toString()) * int.parse((a['qty']!=''&&a['qty']!=null?a['qty']:1).toString());
//   //       }
//   //       totalTax += (dp(c['price']) - c['taxlessPrice']) * c['qty'];
//   //     }
//   //   }
//   //   net_total += addon_total;
//   //   var data = {};
//   //   data['taxableAmount'] = taxableAmount;
//   //   data['totalTax'] = totalTax;
//   //   data['grand_total'] = taxableAmount + totalTax;
//   //   data['net_total'] = net_total;
//   //   return data;
//   // }
// }
extension ParsetToNumber on dynamic{
  int? get parseInt=> int.tryParse(toString());
  double? get parseDouble => double.tryParse(toString());
}