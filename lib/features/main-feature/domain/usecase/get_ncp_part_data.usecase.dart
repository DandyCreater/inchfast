import 'package:dartz/dartz.dart';

import '../entity/ncp_part_type.entity.dart';
import '../repository/main.repository.dart';

class GetNcpPartDataUseCase {
  final MainRepository _mainRepository;

  const GetNcpPartDataUseCase(this._mainRepository);

  Future<Either<String?, NcpPartTypeEntity?>> call() {
    return _mainRepository.ncpPartData();
  }
}
