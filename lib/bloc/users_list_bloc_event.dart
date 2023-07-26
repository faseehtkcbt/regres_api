part of 'users_list_bloc_bloc.dart';

abstract class UsersListBlocEvent extends Equatable {
  const UsersListBlocEvent(); 
  @override
  List<Object> get props => [];
}
class UserListingEvent extends UsersListBlocEvent{}


