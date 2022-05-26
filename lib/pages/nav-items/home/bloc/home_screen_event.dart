part of 'home_screen_bloc.dart';

abstract class HomeScreenEvent extends Equatable {
  const HomeScreenEvent();

  @override
  List<Object> get props => [];
}

class LoadingEvent extends HomeScreenEvent {
  const LoadingEvent();
  @override
  List<Object> get props => [];
}

class RefeshingEvent extends HomeScreenEvent {
  const RefeshingEvent();
  @override
  List<Object> get props => [];
}

class OnTapEvent extends HomeScreenEvent {
  final BuildContext context;
  // final ProductModel product;
  final String navigateData;
  const OnTapEvent({
    // this.product,
    this.context,
    this.navigateData,
  });
  @override
  List<Object> get props => [navigateData];
}
