import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'table_column.dart';
import 'package:flutter/material.dart';

class GenericDataSource<T> extends DataGridSource {
  final List<TableColumn<T>> columns;
  List<DataGridRow> _rows = [];

  GenericDataSource({
    required List<T> data,
    required this.columns,
  }) {
    _buildRows(data);
  }

  void _buildRows(List<T> data) {
    _rows = data.map((item) {
      return DataGridRow(
        cells: columns.map((col) {
          return DataGridCell(
            columnName: col.columnName,
            value: col.value(item),
          );
        }).toList(),
      );
    }).toList();

    notifyListeners();
  }

  @override
  List<DataGridRow> get rows => _rows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map((cell) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
