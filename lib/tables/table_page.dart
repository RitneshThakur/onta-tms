// table_page_responsive.dart
import 'package:desktop_test/tables/table_query.dart';
import 'package:desktop_test/widgets/big_text.dart';
import 'package:desktop_test/widgets/button_w_icon.dart';
import 'package:desktop_test/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:desktop_test/tables/generic_tables.dart';
import 'table_column.dart';
import 'table_datas.dart'; // your travelRequests

class TablePageResponsive extends StatelessWidget {
  const TablePageResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    final travelColumns = <TableColumn<TravelRequest>>[
      TableColumn(columnName: 'sn', header: 'SN', value: (t) => t.sn),
      TableColumn(columnName: 'qId', header: 'Q.ID', value: (t) => t.qId),
      TableColumn(
        columnName: 'entryDate',
        header: 'ENTRY DATE',
        value: (t) => t.entryDate,
      ),
      TableColumn(
        columnName: 'ledgerName',
        header: 'LEDGER NAME',
        value: (t) => t.ledgerName,
      ),
      TableColumn(
        columnName: 'purpose',
        header: 'PURPOSE',
        value: (t) => t.purpose,
      ),
      TableColumn(
        columnName: 'travelDate',
        header: 'TRAVEL_DATE',
        value: (t) => t.travelDate,
      ),
      TableColumn(
        columnName: 'returnDate',
        header: 'RETURN_DATE',
        value: (t) => t.returnDate,
      ),
      TableColumn(columnName: 'from', header: 'FROM', value: (t) => t.from),
      TableColumn(columnName: 'to', header: 'TO', value: (t) => t.to),
      TableColumn(
        columnName: 'noOfPax',
        header: 'NO.OF PAX',
        value: (t) => t.noOfPax,
      ),
      TableColumn(columnName: 'qDays', header: 'Q/DAYS', value: (t) => t.qDays),
      TableColumn(
        columnName: 'airlines',
        header: 'AIRLINES',
        value: (t) => t.airlines,
      ),
      TableColumn(
        columnName: 'paxName',
        header: 'PAX NAME',
        value: (t) => t.paxName,
      ),
      // TableColumn(columnName: 'agent', header: 'AGENT', value: (t) => t.agent),
      // TableColumn(
      //   columnName: 'tNumber',
      //   header: 'T_NUMBER',
      //   value: (t) => t.tNumber,
      // ),
      // TableColumn(
      //   columnName: 'tStatus',
      //   header: 'T_STATUS',
      //   value: (t) => t.tStatus,
      // ),
      TableColumn(
        columnName: 'remarks',
        header: 'REMARKS',
        value: (t) => t.remarks,
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Travel Requests Table')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HEADER ROW
            Container(
              height: _size.height * 0.1,
              width: _size.width,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BigText(text: "Query Records", size: 30),
                  Spacer(),
                  Container(
                    width:
                        _size.width *
                        0.3, // TextField takes 30% of screen width
                    decoration: BoxDecoration(
                      color: Colors.white,

                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        suffixIcon: Icon(Icons.search, size: 30),
                        hintText: "Search...",
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ),
                  ButtonWIcon(
                    icon: Icons.import_export,
                    name: "export",
                    onPressed: () {},
                    color: Color(0XFFF7A032),
                  ),
                  ButtonWIcon(
                    icon: Icons.add,
                    name: "Add New Query",
                    onPressed: () {},
                    color: Color(0xff113c7c),
                  ),
                ],
              ),
            ),

            // TABLE
            Expanded(
              child: GenericTable<TravelRequest>(
                data: travelRequests,
                columns: travelColumns,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
