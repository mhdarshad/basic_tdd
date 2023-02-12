import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../error/failuers.dart';

abstract class UseCase<type,Params>{
  Future<Either<Failure, type>> call({required Params data});
}
class NoPrams extends Equatable{

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class Param extends Equatable{
  Map<String,dynamic> data;
  Param( this.data,);

  @override
  // TODO: implement props
  List<Object?> get props => [data];
}
class Methed {
  static String Get = 'GET';
  static String Post = 'POST';
  static String Put = 'PUT';
  static String Delete = 'DELETE';

}