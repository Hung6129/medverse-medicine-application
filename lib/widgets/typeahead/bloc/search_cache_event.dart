part of 'search_cache_bloc.dart';

abstract class SearchCacheEvent extends Equatable {
  const SearchCacheEvent();

  @override
  List<Object> get props => [];
}

class AddToCached extends SearchCacheEvent {}

class LoadCache extends SearchCacheEvent {}
