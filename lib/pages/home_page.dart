import 'package:desktop_test/widgets/column_grid.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../controllers/comment_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final CommentController controller = Get.put(CommentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ONTA TMS'),
        backgroundColor: Colors.blue[800],
        elevation: 2,
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    // Search field
                    SizedBox(
                      width: 400,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Query Search',
                          prefixIcon: const Icon(Icons.search),
                          filled: true,
                          fillColor: Colors.grey[100],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // DataGrid
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: SfDataGrid(
                          source: controller.dataSource,
                          verticalScrollController:
                              controller.gridScrollController,
                          columnWidthMode: ColumnWidthMode.fill,
                          headerRowHeight: 60,
                          rowHeight: 50,
                          columns: [
                            GridColumn(
                              columnName: 'postId',
                              label: const HeaderCell(text: 'Post ID'),
                            ),
                            GridColumn(
                              columnName: 'id',
                              label: const HeaderCell(text: 'ID'),
                            ),
                            GridColumn(
                              columnName: 'name',
                              label: const HeaderCell(text: 'Name'),
                            ),
                            GridColumn(
                              columnName: 'email',
                              label: const HeaderCell(text: 'Email'),
                            ),
                            GridColumn(
                              columnName: 'body',
                              label: const HeaderCell(text: 'Body'),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Show more button
                    // Obx(
                    //   () =>
                    //       controller.reachedEnd.value && controller.hasMoreData
                    //       ? Padding(
                    //           padding: const EdgeInsets.symmetric(vertical: 12),
                    //           child: ElevatedButton(
                    //             style: ElevatedButton.styleFrom(
                    //               backgroundColor: Colors.blue[800],
                    //               padding: const EdgeInsets.symmetric(
                    //                 horizontal: 24,
                    //                 vertical: 12,
                    //               ),
                    //               shape: RoundedRectangleBorder(
                    //                 borderRadius: BorderRadius.circular(8),
                    //               ),
                    //             ),
                    //             onPressed: controller.loadMore,
                    //             child: Text(
                    //               'Show More (${controller.displayedComments.length} of ${controller.allComments.length})',
                    //               style: const TextStyle(
                    //                 fontSize: 16,
                    //                 color: Colors.white,
                    //               ),
                    //             ),
                    //           ),
                    //         )
                    //       : const SizedBox.shrink(),
                    // ),
                  ],
                ),
              ),
      ),
      backgroundColor: Colors.grey[100],
    );
  }
}
