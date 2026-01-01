class TableColumn<T>{
   final String columnName;   // internal id (used by DataGrid)
  final String header;       // text shown in UI
  final Object? Function(T item) value;

  TableColumn({
    required this.columnName,
    required this.header,
    required this.value,
  });
}