part of 'fav_list_cubit.dart';

abstract class FavListState extends Equatable {
  const FavListState();

  @override
  List<Object> get props => [];
}

class FavListInitial extends FavListState {}

class FavListLoading extends FavListState {}

class FavListLoaded extends FavListState {}

class FavListError extends FavListState {}
