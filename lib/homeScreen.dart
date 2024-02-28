import 'package:book_library/appColors.dart';
import 'package:book_library/myController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MyCobntroller())..fetchData();
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text("Book Library"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  onChanged: (value) {},
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
                // Expanded(
                //   child: ListView.builder(itemBuilder: (context, index) {
                //     return const ListTile(
                //       //  leading: Image.asset(""),
                //       title: Text('Index'),
                //     );
                //   }),
                // ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                    controller.bookList.isEmpty
                        ? const Center(child: CircularProgressIndicator())
                        : GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: 25,
                                    mainAxisExtent: 310,
                                    crossAxisSpacing: 10,
                                    crossAxisCount: 3),
                            itemCount: controller.bookList.length,
                            itemBuilder: (context, index) {
                              var book = controller.bookList[index];

                              return Container(
                                //color: Colors.grey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                            '${book['title']}',
                                            style: const TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text('${book['author_names']}',
                                              style: const TextStyle(
                                                color: AppColors.primaryColor,
                                                fontSize: 11,
                                              )),
                                          Text('${book['first_publish_year']}',
                                              style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 11,
                                              )),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      height: 40,
                                      color: Colors.green,
                                      child: const Center(
                                        child: Text(
                                          "Read",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    )
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
