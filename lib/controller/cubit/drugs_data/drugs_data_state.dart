part of 'drugs_data_cubit.dart';

abstract class DrugsDataState extends Equatable {
  const DrugsDataState();

  @override
  List<Object> get props => [];
}

class DrugsDataInitial extends DrugsDataState {}

class DrugsDataLoading extends DrugsDataState {}

class DrugsDataLoaded extends DrugsDataState {}

class DrugsDataError extends DrugsDataState {}


