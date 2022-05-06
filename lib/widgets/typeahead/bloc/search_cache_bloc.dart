import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_cache_event.dart';
part 'search_cache_state.dart';

class SearchCacheBloc extends Bloc<SearchCacheEvent, SearchCacheState> {
  Queue<String> list;
  SearchCacheBloc() : super(SearchCacheInitial()) {
    on<LoadCache>(onLoadCache);
    on<AddToCached>(addToCached);
  }
  //
  void onLoadCache(LoadCache event, Emitter<SearchCacheState> emit) async {
    emit(SearchCacheLoading());
    
  }

  //
  void addToCached(AddToCached event, Emitter<SearchCacheState> emit) async {}
}
