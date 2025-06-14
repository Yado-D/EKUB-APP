import 'package:ekub_application/core/error/failure.dart';
import 'package:ekub_application/features/home_page/domain/entity/equb_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class HomeRepository {
  Future<Either<Failure, List<EqubEntity>>> LoadEqubDataFromLocal();

  Future<Either<Failure, List<EqubEntity>>> LoadUserDataFromLocal();
}
