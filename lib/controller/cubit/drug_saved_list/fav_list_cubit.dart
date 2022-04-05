import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'fav_list_state.dart';

class FavListCubit extends Cubit<FavListState> {
  FavListCubit() : super(FavListInitial());
}
