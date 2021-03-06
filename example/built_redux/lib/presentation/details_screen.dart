import 'package:built_redux_sample/containers/edit_todo.dart';
import 'package:built_redux_sample/models/models.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_samples/flutter_architecture_samples.dart';

class DetailsScreen extends StatelessWidget {
  final Todo todo;
  final Function onDelete;
  final Function(bool) toggleCompleted;

  DetailsScreen({
    Key key,
    @required this.todo,
    @required this.onDelete,
    @required this.toggleCompleted,
  })
      : super(key: ArchSampleKeys.todoDetailsScreen);

  @override
  Widget build(BuildContext context) {
    final localizations = ArchSampleLocalizations.of(context);

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(localizations.todoDetails),
        actions: [
          new IconButton(
            tooltip: localizations.deleteTodo,
            icon: new Icon(Icons.delete),
            key: ArchSampleKeys.deleteTodoButton,
            onPressed: () {
              onDelete();
              Navigator.pop(context, todo);
            },
          )
        ],
      ),
      body: new Padding(
        padding: new EdgeInsets.all(16.0),
        child: new ListView(
          children: [
            new Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Padding(
                  padding: new EdgeInsets.only(right: 8.0),
                  child: new Checkbox(
                    key: ArchSampleKeys.detailsTodoItemCheckbox,
                    value: todo.complete,
                    onChanged: toggleCompleted,
                  ),
                ),
                new Expanded(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      new Padding(
                        padding: new EdgeInsets.only(
                          top: 8.0,
                          bottom: 16.0,
                        ),
                        child: new Text(
                          todo.task,
                          key: ArchSampleKeys.detailsTodoItemTask,
                          style: Theme.of(context).textTheme.headline,
                        ),
                      ),
                      new Text(
                        todo.note,
                        key: ArchSampleKeys.detailsTodoItemNote,
                        style: Theme.of(context).textTheme.subhead,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        key: ArchSampleKeys.editTodoFab,
        tooltip: localizations.editTodo,
        child: new Icon(Icons.edit),
        onPressed: () {
          Navigator.of(context).push(
            new MaterialPageRoute(
              builder: (context) {
                return new EditTodo(
                  todo: todo,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
