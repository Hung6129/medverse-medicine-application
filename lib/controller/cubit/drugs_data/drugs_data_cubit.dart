import 'package:bloc/bloc.dart';
import 'package:medverse_mobile_app/models/drug_bank_db/product_model.dart';
import '/services//service_data.dart';
import 'package:equatable/equatable.dart';
part 'drugs_data_state.dart';

class DrugsDataCubit extends Cubit<DrugsDataState> {
  // List<drugProductTest> drugTest = [];
  List<ProductModel> drugReTop10 = [];
  List<ProductModel> drugPoTop10 = [];

  DrugsDataCubit() : super(DrugsDataInitial());

// Get 10 products
  Future<void> getRecommendedDrugs({bool isRefresh = false}) async {
    if (!isRefresh) emit(DrugsDataInitial());
    try {
      emit(DrugsDataLoading());
      List<ProductModel> dataRe = await RecommenedData.getRecommened();
      List<ProductModel> dataPo = await PopularData.getPopular();
      drugReTop10.clear();
      drugPoTop10.clear();
      drugReTop10 = dataRe;
      drugPoTop10 = dataPo;
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

//   Future<void> getPopularDrugs({bool isRefresh = false}) async {
//     if (!isRefresh) emit(DrugsDataInitial());
//     try {
//       emit(DrugsDataLoading());
//       List<ProductModel> data = await PopularData.getPopular();
//       drugPoTop10.clear();
//       drugPoTop10 = data;
//       emit(DrugsDataLoaded());
//     } catch (e) {
//       if (isRefresh) {
//         throw Exception(
//             "Failed to refresh, please check your network and try again!");
//       } else {
//         emit(DrugsDataError());
//       }
//     }
//   }
// }
