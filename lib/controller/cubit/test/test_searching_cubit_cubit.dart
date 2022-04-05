import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'test_searching_cubit_state.dart';

class TestSearchingCubitCubit extends Cubit<TestSearchingCubitState> {
  TestSearchingCubitCubit() : super(TestSearchingCubitInitial());
}
