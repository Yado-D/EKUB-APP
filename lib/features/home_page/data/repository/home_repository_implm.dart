import 'package:ekub_application/core/error/failure.dart';
import 'package:ekub_application/features/home_page/data/data_source/home_remote_data_source.dart';
import 'package:ekub_application/features/home_page/domain/entity/equb_entity.dart';
import 'package:ekub_application/features/home_page/domain/repository/home_repostiory.dart';
import 'package:fpdart/src/either.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeRemoteDataResource homeRemoteDataResource;

  HomeRepositoryImpl(this.homeRemoteDataResource);
  @override
  Future<Either<Failure, List<EqubEntity>>> LoadEqubDataFromLocal() async {
    try {
      List<EqubEntity> equbs =
          await homeRemoteDataResource.LoadEqubDataFromLocal();
      return right(equbs);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<EqubEntity>>> LoadUserDataFromLocal() {
    // TODO: implement LoadUserDataFromLocal
    throw UnimplementedError();
  }
}
