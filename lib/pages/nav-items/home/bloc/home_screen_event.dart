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

// class OnTapItemEvent extends NewsEvent {
//   final BuildContext context;
//   final NewsModel newsModel;
//   const OnTapItemEvent({required this.newsModel, required this.context});
//   @override
//   List<Object?> get props => [newsModel];
// }
