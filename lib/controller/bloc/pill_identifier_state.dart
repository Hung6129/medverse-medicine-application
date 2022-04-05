part of 'pill_identifier_bloc.dart';

abstract class PillIdentifierState extends Equatable {
  const PillIdentifierState();

  @override
  List<Object> get props => [];
}

class PillIdentifierInitial extends PillIdentifierState {}

class PillIdentifierLoading extends PillIdentifierState {}

class PillIdentifierLoaded extends PillIdentifierState {}

class PillIdentifierError extends PillIdentifierState {}
