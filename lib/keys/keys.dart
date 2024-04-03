import 'package:demo/keys/checkable_todo_item.dart';
import 'package:flutter/material.dart';

class Todo {
  const Todo(this.text, this.priority);

  final String text;
  final Priority priority;
}

class Keys extends StatefulWidget {
  const Keys({super.key});
  @override
  State<Keys> createState() {
    return _Keys();
  }
}

class _Keys extends State<Keys> {
  var _order = 'asc';
  final _todos = [
    const Todo(
      'Learn flutter',
      Priority.urgent,
    ),
    const Todo(
      'Prastice Flutter',
      Priority.normal,
    ),
    const Todo(
      "explore new courses",
      Priority.low,
    ),
  ];
  List<Todo> get _orderedTodos {
    final sortedTodos = List.of(_todos);
    sortedTodos.sort((a, b) {
      final bComesAterA = a.text.compareTo(b.text);
      return _order == 'asc' ? bComesAterA : -bComesAterA;
    });
    return sortedTodos;
  }

  void _changeOrdered() {
    setState(() {
      _order = _order == 'asc' ? 'dsc' : 'asc';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: TextButton.icon(
            onPressed: _changeOrdered,
            icon: Icon(
                _order == 'asc' ? Icons.arrow_downward : Icons.arrow_upward),
            label: Text('sort ${_order == 'asc' ? 'Decending' : "Ascending"}'),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              for (final todo in _orderedTodos)
                CheckableTodoItems(
                  key: ValueKey(todo.text),
                  todo.text,
                  todo.priority,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
