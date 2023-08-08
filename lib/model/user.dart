import 'package:rest_apis/model/user_dob.dart';
import 'package:rest_apis/model/user_location.dart';
import 'package:rest_apis/model/user_name.dart';
import 'package:rest_apis/model/user_pictur.dart';

class User {
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final UserName name;
  final UserDob dob;
  final UserLocation location;
  final UserPicture picture;
  User({
    required this.location,
    required this.dob,
    required this.name,
    required this.gender,
    required this.email,
    required this.phone,
    required this.cell,
    required this.nat,
    required this.picture,
  });

  String get fullName {
    return '${name.title} ${name.first} ${name.last}';
  }

  factory User.fromMap(Map<String, dynamic> e) {
    final name = UserName.fromMap(e['name']);
    final dob = UserDob.fromMap(e['dob']);
    final location = UserLocation.fromMap(e['location']);
    final picture = UserPicture.fromMap(e['picture']);
    return User(
      gender: e['gender'],
      email: e['email'],
      phone: e['phone'],
      cell: e['cell'],
      nat: e['nat'],
      name: name,
      dob: dob,
      location: location,
      picture: picture,
    );
  }
}
