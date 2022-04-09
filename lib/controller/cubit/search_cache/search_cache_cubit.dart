import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'search_cache_state.dart';

class SearchCacheCubit extends Cubit<SearchCacheState> {
  Queue<String> searchHistory;
  var _box = Hive.box("search-cache");
  SearchCacheCubit() : super(SearchCacheInitial());

  // a function used to populate search-cache for local data
  Future<void> populateSearchHistory() async {
    if (searchHistory == null) {
      List result = await _box.get("search_history");
      if (result = null) {
        searchHistory = Queue.from(result);
      } else {
        searchHistory = Queue();
      }
    }
    emit(SearchCacheLoaded());
  }

  Future<void> updateSearchHistory(String searchKeyword) async {
    if (searchHistory == null || searchHistory.length == 0) {
      // If there is no prior search history init and add the keyword
      searchHistory = Queue();
      searchHistory.add(searchKeyword);
    } else {
      if (searchHistory.contains(searchKeyword)) {
        // If search history is there check whether keyword is already cached.
        // If it is already cached bring it at index 0
        searchHistory.removeWhere((element) => element == searchKeyword);
        searchHistory.addFirst(searchKeyword);
      } else {
        // If not present add it to the front of queue
        searchHistory.addFirst(searchKeyword);
        // Search Cache will not be greater that 10 searches
        if (searchHistory.length > 10) searchHistory.removeLast();
      }
    }
    // Update the local cache after the algo is completed
    await _box.put("search_history", searchHistory.toList());
    emit(SearchCacheLoaded());
  }
}
