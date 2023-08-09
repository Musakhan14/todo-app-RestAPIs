// ignore_for_file: use_build_context_synchronously

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rest_apis/todo_app.dart/todo_services/todo_services.dart';
import 'package:rest_apis/todo_app.dart/utils/snacbar_helper.dart';

class AddTodo extends StatefulWidget {
  final Map? todo;
  const AddTodo({this.todo, super.key});

  @override
  State<AddTodo> createState() => _TodoListState();
}

class _TodoListState extends State<AddTodo> {
  TextEditingController titleController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  Future<void> updateData() async {
    final todo = widget.todo;
    if (todo == null) {
      if (kDebugMode) {
        print('You can not call updated with out todo data');
        return;
      }
    }
    final id = todo!['_id'];

    final title = titleController.text;
    final description = descriptionController.text;
    final body = {
      "title": title,
      "description": description,
      "is_completed": false
    };
    //udate data to the sever
    final isSuccess = await TodoService.updateData(id, body);
    //show succes or fail based on status
    if (isSuccess) {
      if (kDebugMode) {
        print('success');
      }
      showSuccessMessage(context, 'Todo Update successfully');
    } else {
      showErrorMessage(context, 'Failed to Update todo');
      if (kDebugMode) {
        print('faild');
      }
    }
    //show succes or fail based on status
  }

  void submitData() async {
    final title = titleController.text;
    final description = descriptionController.text;
    final body = {
      "title": title,
      "description": description,
      "is_completed": false
    };
    final isSuccess = await TodoService.submitData(body);
    if (isSuccess) {
      print('success');
      titleController.text = '';
      descriptionController.text = '';
      showSuccessMessage(context, 'Todo added successfully');
    } else {
      showErrorMessage(context, 'Failed to add todo');
      print('faild');
    }
  }

  bool isEdit = false;
  @override
  void initState() {
    super.initState();
    final todo = widget.todo;
    if (todo != null) {
      isEdit = true;
      final title = todo['title'];
      final description = todo['description'];
      titleController.text = title;
      descriptionController.text = description;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isEdit ? 'Edit Todo' : 'Add Todo',
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(hintText: 'Title'),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: descriptionController,
              keyboardType: TextInputType.multiline,
              minLines: 5,
              maxLines: 8,
              decoration: const InputDecoration(hintText: 'Description'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: isEdit ? updateData : submitData,
              // onPressed: () => submitData,
              child: Text(isEdit ? 'Update' : 'Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
