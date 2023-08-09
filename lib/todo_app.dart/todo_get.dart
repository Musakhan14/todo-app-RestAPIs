// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:rest_apis/todo_app.dart/todo_list.dart';
import 'package:rest_apis/todo_app.dart/todo_services/todo_services.dart';
import 'package:rest_apis/todo_app.dart/utils/snacbar_helper.dart';
import 'package:rest_apis/todo_app.dart/widget/todo_card.dart';

class TodoGet extends StatefulWidget {
  const TodoGet({super.key});

  @override
  State<TodoGet> createState() => _TodoGetState();
}

class _TodoGetState extends State<TodoGet> {
  TextEditingController titleController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();
  bool isLoading = true;
  List items = [];
  Future<void> fetchTodo() async {
    final response = await TodoService.fetchTodo();
    if (response != null) {
      setState(() {
        items = response;
      });
    } else {
      showSuccessMessage(context, 'Somehing went wrong');
    }
  }

  Future<void> deleteById(String id) async {
    final isSuccess = await TodoService.deleteById(id);
    if (isSuccess) {
      final filtered = items.where((element) => element['_id'] != id).toList();
      setState(() {
        items = filtered;
      });
      showSuccessMessage(context, 'Deleted successfully');
    } else {}
  }

  Future<void> navigateToEditPage(Map item) async {
    final route = MaterialPageRoute(builder: (context) => AddTodo(todo: item));
    await Navigator.push(context, route);
    setState(() {
      isLoading = true;
    });
    fetchTodo();
  }

  Future<void> navigateToAddPage() async {
    final route = MaterialPageRoute(
      builder: (context) => const AddTodo(),
    );
    await Navigator.push(context, route);
    setState(() {
      isLoading = true;
    });
    fetchTodo();
  }

  @override
  void initState() {
    super.initState();
    fetchTodo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Todo List',
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Visibility(
        visible: isLoading,
        child: RefreshIndicator(
          onRefresh: fetchTodo,
          child: Visibility(
            visible: items.isNotEmpty,
            replacement: const Center(
              child: Text(
                'Not Todo Items',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            child: ListView.builder(
              itemCount: items.length,
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, index) {
                final item = items[index];
                // final id = item['_id'];
                return TodoCard(
                  deleteById: deleteById,
                  index: index,
                  item: item,
                  navigateEdit: navigateToEditPage,
                );
              },
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          navigateToAddPage();
        },
        child: const Text('Add'),
      ),
    );
  }
}
