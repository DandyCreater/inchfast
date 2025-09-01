import 'package:dartz/dartz.dart';

import '../entity/ncp_number.entity.dart';
import '../repository/main.repository.dart';

class GetNcpNumberUseCase {
  final MainRepository _mainRepository;

  const GetNcpNumberUseCase(this._mainRepository);

  Future<Either<String?, NcpNumberEntity?>> call() {
    return _mainRepository.getNcpNumber();
  }
}
