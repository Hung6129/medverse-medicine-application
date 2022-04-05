part of 'search_cache_cubit.dart';

abstract class SearchCacheState extends Equatable {
  const SearchCacheState();

  @override
  List<Object> get props => [];
}

class SearchCacheInitial extends SearchCacheState {}

class SearchCacheLoaded extends SearchCacheState {}
