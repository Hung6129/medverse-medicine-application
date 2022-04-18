import 'package:bloc/bloc.dart';
import 'package:medverse_mobile_app/models/drug_bank_db/product.dart';

import '/services//service_data.dart';
import '/models/test/drugs_product_test.dart';
import 'package:equatable/equatable.dart';

part 'drugs_data_state.dart';

class DrugsDataCubit extends Cubit<DrugsDataState> {
  // List<drugProductTest> drugTest = [];
  List<ProductDB> drug = [];

  DrugsDataCubit() : super(DrugsDataInitial());

// Get 10 products
  Future<void> getRecommendedDrugs({bool isRefresh = false}) async {
    if (!isRefresh) emit(DrugsDataInitial());
    try {
      emit(DrugsDataLoading());
      // List<drugProductTest> dataTest = await RecommenedData.getRecommened();
      List<ProductDB> data = await RecommenedData.getRecommened();
      // drug.clear();
      drug.clear();
      // drug = data;
      drug = data;
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
