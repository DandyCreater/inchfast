import 'package:dartz/dartz.dart';

import '../entity/packing_month.entity.dart';
import '../repository/main.repository.dart';

class PackingMonthUseCase {
  final MainRepository _mainRepository;

  const PackingMonthUseCase(this._mainRepository);

  Future<Either<String, PackingMonthEntity?>> call() {
    return _mainRepository.packingMonth();
  }
}
