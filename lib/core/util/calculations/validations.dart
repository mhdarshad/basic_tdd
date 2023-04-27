
extension IsNumber on dynamic{
  isNumerical()=>double.tryParse(this) != null;
}
extension ToNotNull on dynamic{
  dynamic get toNullCheck => toString()!='null'?this:null;
}