import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:untitled/Model/datamodel.dart';
import 'package:untitled/Repositories/api_service.dart';

part 'users_list_bloc_event.dart';
part 'users_list_bloc_state.dart';

class UsersListBlocBloc extends Bloc<UsersListBlocEvent, UsersListBlocState> {

  UsersListBlocBloc() : super(UsersListBlocInitial()) {
    on<UserListingEvent>((event, emit) async{
      emit(UsersListBlocInitial());

      List<Data> users=await APISeivices().getAllData();


      emit (UsersListBlocLoaded(data: users));



    });
  }
}
