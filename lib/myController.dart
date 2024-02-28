import 'dart:convert';

import 'package:book_library/bookModel.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;

class MyCobntroller extends GetxController {
  RxBool obxcheck = false.obs;
  RxList readList = [].obs;
  RxList bookList = [].obs;
  RxBool isLoading = false.obs;
  RxList searchList = [].obs;

  Future fetchData() async {
    bookList.value = [];
    isLoading.value = true;
    var url = "https://openlibrary.org/people/mekBot/books/already-read.json";
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var decodedData = json.decode(response.body);
      print(decodedData);
      var data = decodedData['reading_log_entries'];
      List<dynamic> resultList = [];

      for (var item in data) {
        if (item != null && item is Map<String, dynamic>) {
          resultList.add(item['work']);
          print(resultList);
        }
      }
      bookList.addAll(resultList);
      isLoading.value = false;
    }
  }

  getSearchData(String searchText) {
    searchList.value = [];
    if (searchText.isEmpty) {
      searchList.value = [];
    } else {
      print(bookList);
      searchList.value = bookList.value
          .where((element) => element['title']
              .toString()
              .toLowerCase()
              .startsWith(searchText.toLowerCase()))
          .toList();
    }
  }

  addToReadList(index) {
    if (readList.contains(index)) {
      readList.remove(index);
    } else {
      readList.add(index);
    }
  }
}
