import 'package:book_library/appColors.dart';
import 'package:flutter/material.dart';

class BookInfoScreen extends StatelessWidget {
  final Map<String, dynamic> bookData;
  const BookInfoScreen({super.key, required this.bookData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Book Info"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: 400,
            width: 500,
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.primaryColor, width: 20),
                //color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
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
                      Text(
                        bookData['author_names'].toString() ?? 'Not Available',
                      )
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
                      Text(bookData['first_publish_year'].toString() ??
                          'Not Available')
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
