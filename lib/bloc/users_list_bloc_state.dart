part of 'users_list_bloc_bloc.dart';

abstract class UsersListBlocState extends Equatable {
  const UsersListBlocState();
  
  @override
  List<Object> get props => [];
}

class UsersListBlocInitial extends UsersListBlocState {}
class UsersListBlocLoaded extends UsersListBlocState{
  final List <Data> data;
  UsersListBlocLoaded({required this.data});
}
class UsersListBlocError extends UsersListBlocState {}

