import 'package:dartz/dartz.dart';

import '../entity/ncp_feedback_location.entity.dart';
import '../repository/main.repository.dart';

class GetNcpFeedBackLocationUseCase {
  final MainRepository _mainRepository;

  const GetNcpFeedBackLocationUseCase(this._mainRepository);

  Future<Either<String?, NcpFeedBackLocationEntity?>> call() {
    return _mainRepository.ncpFeedBackLocation();
  }
}
