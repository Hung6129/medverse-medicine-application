import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medverse_mobile_app/models/drug_bank_db/pill_identifiter_model.dart';

import '../../../../services/service_data.dart';

part 'pill_identifier_event.dart';
part 'pill_identifier_state.dart';

class PillIdentifierBloc
    extends Bloc<PillIdentifierEvent, PillIdentifierState> {
  //List of Result
  List<PillIdentifierModel> listData;
  PillIdentifierBloc() : super(PillIdentifierInitial()) {
    on<PillIdentifierEvent>((event, emit) {});

    //
    on<OnTapEvent>((event, emit) async {
      emit(PillIdentifierLoading());
      listData = await PillIdentifierData.getPillIdentifierData(event.query);
      if (listData.isEmpty) {
        emit(PillIdentifierLoading());
      }
      emit(PillIdentifierLoaded());
      
    });
  }
}
