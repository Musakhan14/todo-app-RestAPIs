import 'package:flutter/material.dart';
import 'package:rest_apis/model/user.dart';
import 'package:rest_apis/services/user_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = []; // Declare the type explicitly as List<User>
  Future<void> fetchUsers() async {
    final response = await UserApi.fetchUsers();
    setState(() {
      users = response;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: const Text('Home'),
        ),
        body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            // final email = user.email
            return ListTile(
              title: Text(user.fullName),
              subtitle: Text(user.location.city),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
        ),
      ),
    );
  }
}

// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:rest_apis/model/user.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   // List<User> users = [];

//   @override
//   void initState() {
//     fetchUsers();
//     super.initState();
//   }
//   List<User> users = []; // Declare the type explicitly as List<User>

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.blueGrey,
//           title: const Text('Home'),
//         ),
//         body: ListView.builder(
//           itemCount: users.length,
//           itemBuilder: (context, index) {
//             final user = users[index];
//             final email = user.email;

//             return ListTile(
//               // leading: ClipRRect(
//               //   borderRadius: BorderRadius.circular(100),
//               //   child: Image.network(imageUrl),
//               // ),
//               title: Text(email),
//             );
//           },
//         ),
//         floatingActionButton: FloatingActionButton(onPressed: () {
//           fetchUsers();
//         }),
//       ),
//     );
//   }

//   void fetchUsers() async {
//     print('fetchUsers call');
//     const url = 'https://randomuser.me/api/?results=50';
//     final uri = Uri.parse(url);
//     final response = await http.get(uri);
//     final body = response.body;
//     final json = jsonDecode(body);
//     final results = json['results'] as List<dynamic>;

//     final transformed = results.map((e) {
//       return User(
//           gender: e['gender'],
//           email: e['email'],
//           phone: e['phone'],
//           cell: e['cell'],
//           nat: e['nat']);
//     }).toList;
//     setState(() {
//       users = transformed;
//     });
//     print('fetchUsers complete');
//   }
// }
