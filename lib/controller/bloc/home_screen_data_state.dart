part of 'home_screen_data_bloc.dart';

abstract class HomeScreenDataState extends Equatable {
  const HomeScreenDataState();

  @override
  List<Object> get props => [];
}

class HomeScreenDataInitial extends HomeScreenDataState {}

class HomeScreenDataLoading extends HomeScreenDataState {}

class HomeScreenDataLoaded extends HomeScreenDataState {
  final ProductModel product;
  HomeScreenDataLoaded(
    List<ProductModel> data, {
    this.product,
  });
  @override
  List<Object> get props => [product];
}

class HomeScreenDataError extends HomeScreenDataState {
  final String message;
  HomeScreenDataError(this.message);
}
