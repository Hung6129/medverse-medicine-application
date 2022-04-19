import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medverse_mobile_app/models/drug_bank_db/product_model.dart';

import '../../services/service_data.dart';

part 'home_screen_data_event.dart';
part 'home_screen_data_state.dart';

class HomeScreenDataBloc
    extends Bloc<HomeScreenDataEvent, HomeScreenDataState> {
  HomeScreenDataBloc() : super(HomeScreenDataInitial()) {
    on<HomeScreenDataEvent>((event, emit) {});

    on<GetData>((event, emit) async {
      try {
        emit(HomeScreenDataLoading());
        final data = await RecommenedData.getRecommened();
        emit(HomeScreenDataLoaded(data));
      } catch (e) {
        emit(HomeScreenDataError(e));
      }
    });
  }
}
