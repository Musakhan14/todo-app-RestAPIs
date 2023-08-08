import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  final int index;
  final Map item;
  final Function(Map) navigateEdit;
  final 
  const TodoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 218, 230, 236),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.black,
          child: Text('${index + 1}'),
        ),
        title: Text(
          item['title'],
        ),
        subtitle: Text(
          item['description'],
        ),
        trailing: PopupMenuButton(onSelected: (value) {
          if (value == 'Edit') {
            navigateToEditPage(item);
          } else if (value == 'Delete') {
            deleteById(id);
          }
        }, itemBuilder: (context) {
          return [
            const PopupMenuItem(
              value: 'Edit',
              child: Text('Edit'),
            ),
            const PopupMenuItem(
              value: 'Delete',
              child: Text('Delete'),
            ),
          ];
        }),
      ),
    );
  }
}
