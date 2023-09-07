import 'package:rising_gym/core/error/failuers.dart';
import 'package:rising_gym/tdd/presentaion/modules/product/product_consumer.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/usecases/usecase.dart';
import '../../repositories/repository_provider.dart';

class ProductUseCase extends UseCase<ProductData,NoPrams>{
  DependencyRepostProvider<Map<String, dynamic>> repo;
  ProductUseCase({required this.repo});

  @override
  Future<Either<Failure, ProductData>> call({required NoPrams data}) {
    // TODO: implement call
    throw UnimplementedError();
  }

}