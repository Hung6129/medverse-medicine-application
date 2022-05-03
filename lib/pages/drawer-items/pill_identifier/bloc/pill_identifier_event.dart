part of 'pill_identifier_bloc.dart';

abstract class PillIdentifierEvent extends Equatable {
  const PillIdentifierEvent();

  @override
  List<Object> get props => [];
}

class OnTapEvent extends PillIdentifierEvent {
  String query;
  OnTapEvent();
  @override
  List<Object> get props => [];
}
