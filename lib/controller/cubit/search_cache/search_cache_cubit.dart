import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_cache_state.dart';

class SearchCacheCubit extends Cubit<SearchCacheState> {
  SearchCacheCubit() : super(SearchCacheInitial());
}
