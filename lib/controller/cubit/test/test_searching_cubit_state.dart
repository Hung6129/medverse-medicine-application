part of 'test_searching_cubit_cubit.dart';

abstract class TestSearchingCubitState extends Equatable {
  const TestSearchingCubitState();

  @override
  List<Object> get props => [];
}

class TestSearchingCubitInitial extends TestSearchingCubitState {}

class TestSearchingCubitLoading extends TestSearchingCubitState {}

class TestSearchingCubitLoaded extends TestSearchingCubitState {}

class TestSearchingCubitError extends TestSearchingCubitState {}
