import 'package:bloc/bloc.dart';

import '/services//service_data.dart';
import '/models/test/drugs_product_test.dart';
import 'package:equatable/equatable.dart';

part 'drugs_data_state.dart';

class DrugsDataCubit extends Cubit<DrugsDataState> {
  List<drugProductTest> drugs = [];

  DrugsDataCubit() : super(DrugsDataInitial());

  Future<void> getRecommendedDrugs({bool isRefresh = false}) async {
    if (!isRefresh) emit(DrugsDataInitial());

    try {
      emit(DrugsDataLoading());
      List<drugProductTest> data = await RecommenedData.getRecommened();
      drugs.clear();
      drugs = data;
      emit(DrugsDataLoaded());
    } catch (e) {
      if (isRefresh) {
        throw Exception(
            "Failed to refresh, please check your network and try again!");
      } else {
        emit(DrugsDataError());
      }
    }
  }
}
