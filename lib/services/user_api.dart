import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../model/user.dart';

class UserApi {
  static Future<List<User>> fetchUsers() async {
    if (kDebugMode) {
      print('fetchUsers call');
    }
    const url = 'https://randomuser.me/api/?results=50';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;

    final users = results.map((e) {
      return User.fromMap(e);
    }).toList();
    if (kDebugMode) {
      print('fetchUsers complete');
    }

    return users;
  }
}
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:rest_apis/model/user_dob.dart';
// import 'package:rest_apis/model/user_location.dart';

// import '../model/user.dart';
// import '../model/user_name.dart';

// class UserApi {
//   static Future<List<User>> fetchUsers() async {
//     print('fetchUsers call');
//     const url = 'https://randomuser.me/api/?results=50';
//     final uri = Uri.parse(url);
//     final response = await http.get(uri);
//     final body = response.body;
//     final json = jsonDecode(body);
//     final results = json['results'] as List<dynamic>;

//     final transformed = results.map((e) {
//       final name = UserName(
//         title: e['name']['title'],
//         first: e['name']['first'],
//         last: e['name']['last'],
//       );
//       final date = DateTime.parse(e['dob']['date']);
//       final dob = UserDob(
//         date: date,
//         age: e['dob']['age'],
//       );
//       final street = LocationStreet(
//           name: e['location']['street']['name'],
//           number: e['location']['street']['number']);
//       final cordinates = LocationCordinates(
//           longitude: e['location']['coordinates']['longitude'],
//           latitude: e['location']['coordinates']['latitude']);
//       final timezone = LocationTimeZone(
//         offset: e['location']['timezone']['offset'],
//         description: e['location']['timezone']['description'],
//       );

//       final location = UserLocation(
//         city: e['location']['city'],
//         state: e['location']['state'],
//         country: e['location']['country'],
//         postcode: e['location']['postcode'].toString(),
//         street: street,
//         cordinates: cordinates,
//         timezone: timezone,
//       );
//       return User(
//         gender: e['gender'],
//         email: e['email'],
//         phone: e['phone'],
//         cell: e['cell'],
//         nat: e['nat'],
//         name: name,
//         dob: dob,
//         location: location,
//       );
//     }).toList();
//     print('fetchUsers complete');

//     return transformed;
//   }
// }
