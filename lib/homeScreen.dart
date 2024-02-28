import 'package:book_library/appColors.dart';
import 'package:book_library/bookInfoScreen.dart';
import 'package:book_library/myController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MyCobntroller())..fetchData();
    var searchContoller = TextEditingController();

    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text("Book Library"),
          actions: [
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(5)),
              child: const Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 20,
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: Colors.white,
                  ),
                  child: TextFormField(
                    controller: searchContoller,
                    onChanged: (value) {
                      controller.getSearchData(value);
                    },
                    cursorColor: const Color(0xff787575),
                    decoration: InputDecoration(
                        filled: true,
                        isDense: true,
                        contentPadding: const EdgeInsets.all(13),
                        fillColor: const Color.fromRGBO(204, 204, 204, 0.19),
                        hintText: "Search",
                        suffixIcon: const Icon(Icons.search),
                        suffixIconColor: const Color(0xff787575),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(204, 204, 204, 0.3),
                              width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(204, 204, 204, 0.3),
                              width: 1),
                        )),
                  ),
                ),
                controller.searchList.isNotEmpty
                    ? ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.searchList.length,
                        itemBuilder: (context, index) {
                          var searchdata = controller.searchList[index];
                          return InkWell(
                            onTap: () {
                              Get.to(
                                  () => BookInfoScreen(bookData: searchdata));
                              controller.searchList.clear();
                              searchContoller.text = '';
                            },
                            child: ListTile(
                              leading: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Image.network(
                                    'https://covers.openlibrary.org/b/id/${searchdata['cover_id']}-M.jpg'),
                              ),
                              title: Text("${searchdata['title']}"),
                            ),
                          );
                        })
                    : controller.bookList.isEmpty
                        ? Container(
                            height: 600,
                            child: const Center(
                                child: CircularProgressIndicator(
                              color: AppColors.primaryColor,
                            )),
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      "Book Collections",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                              ),
                              GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          mainAxisSpacing: 35,
                                          mainAxisExtent: 290,
                                          crossAxisSpacing: 10,
                                          crossAxisCount: 3),
                                  itemCount: controller.bookList.length,
                                  itemBuilder: (context, index) {
                                    var book = controller.bookList[index];

                                    var author =
                                        book['author_names'].toString();
                                    var myauthor = '';

                                    if (author.length > 30) {
                                      myauthor =
                                          author.substring(1, 30) + "...";
                                    } else {
                                      myauthor = author.substring(
                                          1, author.length - 1);
                                    }

                                    var bookname = book['title'] ?? '';
                                    var mybookname = '';
                                    if (bookname.length > 30) {
                                      mybookname =
                                          bookname.substring(0, 30) + "...";
                                    } else {
                                      mybookname = bookname;
                                    }

                                    return Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 150,
                                            width: 115,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                      'https://covers.openlibrary.org/b/id/${book['cover_id']}-M.jpg',
                                                    ),
                                                    fit: BoxFit.cover)),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  '$mybookname',
                                                  style: const TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text('$myauthor',
                                                    style: const TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 11,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                Text(
                                                    '${book['first_publish_year']}',
                                                    style: const TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 11,
                                                    )),
                                                InkWell(
                                                    onTap: () {
                                                      Get.to(() =>
                                                          BookInfoScreen(
                                                              bookData: book));
                                                    },
                                                    child: const Text(
                                                        "View Details",
                                                        style: TextStyle(
                                                            fontSize: 11,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: AppColors
                                                                .primaryColor)))
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              Obx(
                                                () => FlutterSwitch(
                                                    width: 50.0,
                                                    height: 20.0,
                                                    value: controller.readList
                                                            .contains(book)
                                                        ? true
                                                        : false,
                                                    activeColor: Colors.green,
                                                    inactiveColor:
                                                        Colors.transparent,
                                                    inactiveToggleColor:
                                                        Colors.grey,
                                                    inactiveSwitchBorder:
                                                        Border.all(
                                                            color: Colors.red),
                                                    showOnOff: true,
                                                    activeText: 'Read',
                                                    inactiveText: '',
                                                    valueFontSize: 8,
                                                    onToggle: (value) {
                                                      controller
                                                          .addToReadList(book);
                                                    }),
                                              ),
                                              Expanded(child: Container())
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  })
                            ],
                          ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
