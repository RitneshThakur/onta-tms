// generic_table_responsive.dart
import 'package:desktop_test/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'generic_data_source.dart';
import 'table_column.dart';

class GenericTable<T> extends StatelessWidget {
  final List<T> data;
  final List<TableColumn<T>> columns;

  /// optional: map columnName to proportion of total width (0.0-1.0)
  final Map<String, double>? columnProportions;

  const GenericTable({
    Key? key,
    required this.data,
    required this.columns,
    this.columnProportions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataSource = GenericDataSource<T>(data: data, columns: columns);

    return LayoutBuilder(
      builder: (context, constraints) {
        final totalWidth = constraints.maxWidth;

        // Fallback: even distribution if proportions not provided
        final colWidths = <String, double>{};
        if (columnProportions != null) {
          columns.forEach((c) {
            colWidths[c.columnName] =
                totalWidth * (columnProportions![c.columnName] ?? 0.07);
          });
        } else {
          final evenWidth = totalWidth / columns.length;
          columns.forEach((c) => colWidths[c.columnName] = evenWidth);
        }

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: totalWidth, // min width is total screen width
            child: SfDataGrid(
              source: dataSource,
              columnWidthMode: ColumnWidthMode.none,
              gridLinesVisibility: GridLinesVisibility.both,
              headerGridLinesVisibility: GridLinesVisibility.both,
              frozenColumnsCount: 2, // freeze SN & Q.ID
              columns: columns.map((c) {
                final width = colWidths[c.columnName]!;

                return GridColumn(
                  columnName: c.columnName,
                  width: width < 70 ? 70 : width, // minimum column width
                  label: Container(
                    color: const Color(0xff113c7c),
                    padding: const EdgeInsets.all(8),
                    alignment: Alignment.centerLeft,
                    child: BigText(
                      text: c.header,
                      size: 10.5,
                      color: Colors.white,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
