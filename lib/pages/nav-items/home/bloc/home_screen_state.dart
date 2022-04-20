part of 'home_screen_bloc.dart';

abstract class HomeScreenState extends Equatable {
  const HomeScreenState();

  @override
  List<Object> get props => [];
}

class HomeScreenInitial extends HomeScreenState {}

class LoadingState extends HomeScreenState {
  const LoadingState();
  @override
  List<Object> get props => [];
}

class LoadingSucessState extends HomeScreenState {
  const LoadingSucessState();
  @override
  List<Object> get props => [];
}

class LoadingErrorState extends HomeScreenState {
  const LoadingErrorState();
  @override
  List<Object> get props => [];
}
