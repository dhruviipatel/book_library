import 'package:book_library/myController.dart';
import 'package:flutter/material.dart';
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
                                    mainAxisSpacing: 10,
                                    mainAxisExtent: 300,
                                    crossAxisSpacing: 10,
                                    crossAxisCount: 3),
                            itemCount: controller.bookList.length,
                            itemBuilder: (context, index) {
                              var book = controller.bookList[index];

                              return Container(
                                //color: Colors.grey,
                                child: Column(
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
                                    Text(
                                      '${book['title']}',
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
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
