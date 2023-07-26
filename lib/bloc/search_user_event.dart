part of 'search_user_bloc.dart';

abstract class SearchUserEvent extends Equatable {
  const SearchUserEvent();
  @override
  List<Object> get props => [];
}

class SearchingUser extends SearchUserEvent{
 final String str;
  final List <Data> data;
   const SearchingUser({required this.data,required this.str});
  @override
  List<Object> get props => [str,data];

}


