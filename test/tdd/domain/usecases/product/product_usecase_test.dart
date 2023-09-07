import 'package:rising_gym/core/data/sqlflite/sql_db.dart';
import 'package:rising_gym/tdd/domain/repositories/repository_provider.dart';
import 'package:rising_gym/tdd/domain/usecase/product/product_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockProductRepository extends Mock implements DependencyRepostProvider{}

void main() {
  late ProductUseCase usecase;
  late MockProductRepository repo;
  /// Set up Initial
  setUp(() {
    repo = MockProductRepository();
  });

  const maxData = 100;
  const page = 1;
  test("Fetch Data from API Repository", () async {
    /// Arrange
    // when(repo.GetLocalSQLDBRequest(SQLDBParams(any)));
    /// Act

    /// Assert
  });
}