import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../models/comment_model.dart';

class CommentDataSource extends DataGridSource {
  List<DataGridRow> _rows = [];

  CommentDataSource({required List<Comment> comments}) {
    updateData(comments);
  }

  void updateData(List<Comment> comments) {
    _rows = comments
        .map(
          (c) => DataGridRow(
            cells: [
              DataGridCell(columnName: 'postId', value: c.postId),
              DataGridCell(columnName: 'id', value: c.id),
              DataGridCell(columnName: 'name', value: c.name),
              DataGridCell(columnName: 'email', value: c.email),
              DataGridCell(columnName: 'body', value: c.body),
            ],
          ),
        )
        .toList();

    notifyListeners();
  }

  @override
  List<DataGridRow> get rows => _rows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map((cell) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          // alignment: Alignment.centerLeft,
          decoration: const BoxDecoration(
            border: Border(
              right: BorderSide(color: Colors.grey, width: 1), 
            ),
          ),
          child: Text(cell.value.toString()),
        );
      }).toList(),
    );
  }
}
