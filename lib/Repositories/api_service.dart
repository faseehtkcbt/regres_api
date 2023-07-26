import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Model/datamodel.dart';


class APISeivices{
 Future<List<Data>> getAllData ()async{
    final response= await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
    if(response.statusCode==200){
      final jsonData = jsonDecode(response.body);
      final List<dynamic> data = jsonData['data']; // Assuming your API returns a list of data
      return data.map((item) => Data.fromJson(item)).toList();
    }
    else{
      throw Exception("Error occured");
    }
  }

}