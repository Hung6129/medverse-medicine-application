import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import '/models/drug_bank_db/product_model.dart';
import '/services/service_data.dart';
part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  List<ProductModel> drugReTop10 = [];
  List<ProductModel> drugPoTop10 = [];
  HomeScreenBloc() : super(HomeScreenInitial()) {
    on<LoadingEvent>(onLoading);
    on<RefeshingEvent>(onRefeshing);
    on<OnTapEvent>(onTap);
  }

  void onLoading(LoadingEvent event, Emitter<HomeScreenState> emit) async {
    emit(LoadingState());
    drugReTop10 = await RecommenedData.getRecommened();
    drugPoTop10 = await PopularData.getPopular();
    if (drugPoTop10.isEmpty && drugReTop10.isEmpty) {
      emit(LoadingErrorState());
      return;
    }
    emit(LoadingSucessState());
  }

  Future<void> onRefeshing(
      RefeshingEvent event, Emitter<HomeScreenState> emit) async {
    drugPoTop10.clear();
    drugReTop10.clear();
    emit(LoadingState());
    drugReTop10 = await RecommenedData.getRecommened();
    drugPoTop10 = await PopularData.getPopular();
    if (drugPoTop10.isEmpty && drugReTop10.isEmpty) {
      emit(LoadingErrorState());
      return;
    }
    emit(LoadingSucessState());
  }

  void onTap(OnTapEvent event, Emitter<HomeScreenState> emit) async {
    Navigator.pushNamed(event.context, "/detail-page",
        arguments: event.product);
  }
}
