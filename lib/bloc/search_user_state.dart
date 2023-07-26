part of 'search_user_bloc.dart';

abstract class SearchUserState extends Equatable {
  const SearchUserState();

  @override
  List<Object> get props => [];
}

class SearchUserInitial extends SearchUserState {}
class SearchUserLoaded extends SearchUserState{
  final List <Data> data;
  const SearchUserLoaded({required this.data});
}
class SearchUserError extends SearchUserState{}


