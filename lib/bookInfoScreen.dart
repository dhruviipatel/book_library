import 'package:book_library/appColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import 'myController.dart';

class BookInfoScreen extends StatelessWidget {
  final Map<String, dynamic> bookData;
  const BookInfoScreen({super.key, required this.bookData});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MyCobntroller());

    final name = bookData['author_names'].toString();
    final authorname = name.substring(1, name.length - 1);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book Info"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: 450,
            width: 500,
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.primaryColor, width: 20),
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Image.network(
                    "https://covers.openlibrary.org/b/id/${bookData['cover_id']}-M.jpg",
                    height: 210,
                    width: 190,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Name:  ",
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: AppColors.primaryColor),
                      ),
                      Text("${bookData['title']}")
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Author:  ",
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: AppColors.primaryColor),
                      ),
                      Text(authorname)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Publish Year:  ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor),
                      ),
                      Text(bookData['first_publish_year'].toString())
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Obx(
                    () => FlutterSwitch(
                        width: 70.0,
                        height: 30.0,
                        value: controller.readList.contains(bookData)
                            ? true
                            : false,
                        activeColor: Colors.green,
                        inactiveColor: Colors.transparent,
                        inactiveToggleColor: Colors.grey,
                        inactiveSwitchBorder: Border.all(color: Colors.red),
                        showOnOff: true,
                        activeText: 'Read',
                        inactiveText: '',
                        valueFontSize: 12,
                        onToggle: (value) {
                          controller.addToReadList(bookData);
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
