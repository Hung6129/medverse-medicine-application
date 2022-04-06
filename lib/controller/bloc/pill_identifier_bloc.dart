import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pill_identifier_event.dart';
part 'pill_identifier_state.dart';

class PillIdentifierBloc
    extends Bloc<PillIdentifierEvent, PillIdentifierState> {
  PillIdentifierBloc() : super(PillIdentifierInitial()) {
    on<PillIdentifierEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
