part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeSuccess extends HomeState {
  List<EqubEntity> equbModel;
  HomeSuccess({required this.equbModel});
}

final class HomeLoading extends HomeState {}

final class HomeFailure extends HomeState {
  String message;
  HomeFailure(this.message);
}

