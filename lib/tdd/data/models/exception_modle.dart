class ExceptiomModle {
  String? message;
  Map<String,dynamic>? errors;

  ExceptiomModle({this.message, this.errors});

  ExceptiomModle.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    errors = json['errors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.errors != null) {
      data['errors'] = this.errors;
    }
    return data;
  }
}

// class Errors {
//   List<String>? password;
//
//   Errors({this.password});
//
//   Errors.fromJson(Map<String, dynamic> json) {
//     password = json['password'].cast<String>();
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['password'] = this.password;
//     return data;
//   }
// }
