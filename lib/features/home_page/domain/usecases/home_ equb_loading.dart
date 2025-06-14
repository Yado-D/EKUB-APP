import 'package:ekub_application/core/error/failure.dart';
import 'package:ekub_application/core/usecases/usecase.dart';
import 'package:ekub_application/features/home_page/domain/entity/equb_entity.dart';
import 'package:ekub_application/features/home_page/domain/repository/home_repostiory.dart';
import 'package:fpdart/src/either.dart';

class HomeEqubLoading implements UseCase<List<EqubEntity>, NoParam> {
  HomeRepository homeRepository;
  HomeEqubLoading(this.homeRepository);

  @override
  Future<Either<Failure, List<EqubEntity>>> call(NoParam param) async {
    return await homeRepository.LoadEqubDataFromLocal();
  }
}

class NoParam {}
