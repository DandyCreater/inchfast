import 'package:dartz/dartz.dart';

import '../entity/ncp_part_number.entity.dart';
import '../parameter/ncp_part_number.parameter.dart';
import '../repository/main.repository.dart';

class SearchNcpNumberUseCase {
  final MainRepository _mainRepository;

  const SearchNcpNumberUseCase(this._mainRepository);

  Future<Either<String?, NcpPartNumberEntity?>> call(
    NcpPartNumberParameter params,
  ) {
    return _mainRepository.searchNcpPartNumber(params);
  }
}
