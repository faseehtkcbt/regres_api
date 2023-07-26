import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Model/datamodel.dart';

part 'search_user_event.dart';
part 'search_user_state.dart';

class SearchUserBloc extends Bloc<SearchUserEvent, SearchUserState> {


  SearchUserBloc() : super(SearchUserInitial()) {
    on<SearchingUser>((event, emit) {
      emit(SearchUserInitial());
      List <Data> searchUsers=[];
        for(var user in event.data){
          if(user.firstName!.toLowerCase().contains(event.str) || user.lastName!.toLowerCase().contains(event.str))
          {
            searchUsers.add(user);
          }
        }
        emit(SearchUserLoaded(data:searchUsers));
    });
  }
}
