import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/bloc/search_user_bloc.dart';
import 'package:untitled/bloc/users_list_bloc_bloc.dart';

import '../Utilities/UserCard.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);
    final TextEditingController textEditingController=TextEditingController();
    
  @override
  Widget build(BuildContext context) {
    context.read<UsersListBlocBloc>().add(UserListingEvent());
    return BlocConsumer<UsersListBlocBloc,UsersListBlocState>(
      listener: (context, userstate) {

      },
      builder: (context, userstate) {

   if(userstate is UsersListBlocLoaded){
     return BlocConsumer<SearchUserBloc,SearchUserState>(
       builder: (context, searchstate) {
         if(searchstate is SearchUserInitial){
           context.read<SearchUserBloc>().add(SearchingUser(data:userstate.data , str: ""));

         }
         else if (searchstate is SearchUserLoaded) {
           return Scaffold(
             appBar: AppBar(
               backgroundColor: Colors.black38,
               elevation: 4,
               title: const Text("Regress_Api", style: TextStyle(
                 fontSize: 17,

               ),),
               centerTitle: true,


             ),
             body: SafeArea(
                 child: Center(
                   child: Column(
                     children: [
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: TextFormField(
                           onChanged: (value){

                             context.read<SearchUserBloc>().add(SearchingUser(data:userstate.data , str: value));

                           },
                           controller: textEditingController,
                           decoration: InputDecoration(
                               border: OutlineInputBorder(
                                   borderRadius: BorderRadius.circular(10)
                               ),
                               hintText: "Enter the text",
                               contentPadding: const EdgeInsets.all(5),
                               suffixIcon: const Icon(Icons.search_rounded,
                                 color: Colors.black38,)
                           ),
                         ),
                       ),
                       Expanded(child: UserCard(context, searchstate.data))
                     ],
                   ),
                 )),
           );
         }
         else if(searchstate is SearchUserError){

         }
         return const Center(
           child: SizedBox(
             height: 40,
             width: 40,
             child: CircularProgressIndicator(
               color: Colors.black54,
             ),
           ),
         );
       }
       ,
       listener: (context, searchstate) {

       },) ;
   }
   return const Center(
     child: SizedBox(
       height: 40,
       width: 40,
       child: CircularProgressIndicator(
         color: Colors.black54,
       ),
     ),
   );

      },
    );

  }
}









