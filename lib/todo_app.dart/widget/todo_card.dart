import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  final int index;
  final Map item;
  final Function(Map) navigateEdit;
  final Function(String) deleteById;
  const TodoCard({
    super.key,
    required this.index,
    required this.item,
    required this.navigateEdit,
    required this.deleteById,
  });

  @override
  Widget build(BuildContext context) {
    final id = item['_id'] as String;
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
            navigateEdit(item);
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
