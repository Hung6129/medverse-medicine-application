part of 'home_screen_data_bloc.dart';

abstract class HomeScreenDataEvent extends Equatable {
  const HomeScreenDataEvent();

  @override
  List<Object> get props => [];
}

class GetData extends HomeScreenDataEvent {}
