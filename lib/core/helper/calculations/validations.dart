
extension<T> on T {
  //Extension Method demonstration
  double? dp() =>(this !=null)?(this is String)?((this as String) !='')?double.tryParse((this as String)):0.0:double.tryParse(toString()):0.0;
  int ip() =>(this !=null)?(this is String)?((this as String) !='')?int.parse((this as String)):0:int.parse(toString()):0;
}
extension<T> on List<T> {
  //Extension Method demonstration
 double sum() {
   double val = 0;
   forEach((e) => val+=(double.tryParse(e.toString())??0.0));
   return val;
 }
}

class CountCalculation {

}