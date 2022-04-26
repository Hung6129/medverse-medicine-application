part of 'search_cache_bloc.dart';

abstract class SearchCacheState extends Equatable {
  const SearchCacheState();

  @override
  List<Object> get props => [];
}

class SearchCacheInitial extends SearchCacheState {}

class SearchCacheLoading extends SearchCacheState {}

class SearchCacheLoaed extends SearchCacheState {}
