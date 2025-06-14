import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ekub_application/features/home_page/domain/entity/equb_entity.dart';
import 'package:ekub_application/features/home_page/domain/usecases/home_%20equb_loading.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeEqubLoading _homeEqubLoading;
  HomeBloc({required HomeEqubLoading homeEqubLoading})
      : _homeEqubLoading = homeEqubLoading,
        super(HomeInitial()) {
    on<LoadEqubFromLocal>(_loadEqubFromLocal);
  }

  FutureOr<void> _loadEqubFromLocal(
      LoadEqubFromLocal event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    print("...before loading from home bloc...");
    final res = await _homeEqubLoading(NoParam());
    print("...after loading from home bloc...");
    res.fold(
      (onLeft) => emit(HomeFailure(onLeft.message.toString())),
      (onRight) => emit(
        HomeSuccess(equbModel: onRight),
      ),
    );
  }
}
