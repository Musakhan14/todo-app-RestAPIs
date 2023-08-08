import 'package:flutter/material.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: const Color.fromARGB(115, 43, 8, 8),
        appBar: AppBar(
          centerTitle: true,
          // backgroundColor: Colors.black54,
          title: const Text(
            'Add Todo List',
          ),
        ),
      ),
    );
  }
}
