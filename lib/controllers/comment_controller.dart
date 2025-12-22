import 'dart:convert';
import 'package:desktop_test/data_source/comment_data_source.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/comment_model.dart';

class CommentController extends GetxController {
  final ScrollController gridScrollController = ScrollController();

  final RxBool isLoading = false.obs;
  final RxBool reachedEnd = false.obs;

  final int itemsPerPage = 40;
  int currentMaxIndex = 0;

  List<Comment> allComments = [];
  List<Comment> displayedComments = [];

  late CommentDataSource dataSource;

  @override
  void onInit() {
    super.onInit();

    dataSource = CommentDataSource(comments: []);

    gridScrollController.addListener(_onScroll);
    fetchComments();
  }

 void _onScroll() {
  if (gridScrollController.position.pixels >=
      gridScrollController.position.maxScrollExtent) {
    // reached bottom
    if (!reachedEnd.value) reachedEnd.value = true;
  } else {
    // scrolled up
    if (reachedEnd.value) reachedEnd.value = false;
  }
}


  Future<void> fetchComments() async {
    isLoading.value = true;

    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/comments'),
        headers: {
          'User-Agent': 'Flutter Desktop App',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode != 200) {
        throw Exception('HTTP ${response.statusCode}');
      }

      allComments = (json.decode(response.body) as List)
          .map((e) => Comment.fromJson(e))
          .toList();

      currentMaxIndex = itemsPerPage;
      displayedComments = allComments.take(currentMaxIndex).toList();
      dataSource.updateData(displayedComments);
    } catch (e) {
      debugPrint('ERROR: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void loadMore() {
    int nextMax = currentMaxIndex + itemsPerPage;
    if (nextMax > allComments.length) {
      nextMax = allComments.length;
    }

    currentMaxIndex = nextMax;
    displayedComments = allComments.take(currentMaxIndex).toList();
    dataSource.updateData(displayedComments);

    reachedEnd.value = false;
  }

  bool get hasMoreData => currentMaxIndex < allComments.length;

  @override
  void onClose() {
    gridScrollController.dispose();
    super.onClose();
  }
}
