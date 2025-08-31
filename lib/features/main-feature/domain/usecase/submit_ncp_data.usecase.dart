import 'package:dartz/dartz.dart';

import '../entity/submit_ncp.entity.dart';
import '../parameter/submit_ncp.parameter.dart';
import '../repository/main.repository.dart';

class SubmitNcpDataUseCase {
  final MainRepository _mainRepository;

  const SubmitNcpDataUseCase(this._mainRepository);

  Future<Either<String?, SubmitNcpEntity?>> call(AddNcpParameter params) {
    return _mainRepository.submitNcpData(
      params,
    );
  }
}
