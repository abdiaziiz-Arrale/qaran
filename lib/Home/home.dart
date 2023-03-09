import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:translucent_navigation_bar/translucent_navigation_bar.dart';

import '../auth/SingInPage.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  final like = false.obs;
  final save = false.obs;
  int selectedIndex = 0;

  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade300,
        extendBody: true,
        bottomNavigationBar: TranslucentNavigationBar(
          mainTranslucentNavigationBarItem:
              TranslucentNavigationBarItem(iconData: Icons.home),
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
            _pageController.animateToPage(
              selectedIndex,
              duration: const Duration(milliseconds: 750),
              curve: Curves.bounceIn,
            );
          },
          onMainIconTap: () {
            showDialog(
              context: context,
              builder: (context) => const AlertDialog(
                title: Text('Main Icon pressed'),
              ),
            );
          },
          selectedIndex: selectedIndex,
          mainIconBackgroundColor: const Color(0xff0066ff),
          mainIconColor: Colors.white,
          items: [
            TranslucentNavigationBarItem(iconData: Icons.holiday_village),
            TranslucentNavigationBarItem(
              iconData: Icons.home,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: ListView.builder(
              itemCount: 6,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            // border: Border.all(
                            // color: Colors.grey,
                            // width: 1,
                            // style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ListTile(
                                  trailing: IconButton(
                                    icon: Icon(Icons.more_vert_rounded),
                                    onPressed: () {},
                                  ),
                                  title: Text(
                                    "Muuse Biixi Cabdi",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                  subtitle: Text(
                                    "2 days ago",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  leading: CircleAvatar(
                                    radius: 25,
                                    backgroundImage:
                                        AssetImage("assets/images/spr.jpg"),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 13),
                                  child: Text(
                                      "Where can I share my GitHub project?  Once you finished setting up your project and are ready to shareWhere can I share my GitHub project? Once you finished setting up your project and are ready to share ."),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 13),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "assets/slflag.ico",
                                        width: 19,
                                      ),
                                      Image.asset(
                                        "assets/slflag.ico",
                                        width: 19,
                                      ),
                                      Image.asset(
                                        "assets/slflag.ico",
                                        width: 19,
                                      ),
                                      Image.asset(
                                        "assets/slflag.ico",
                                        width: 19,
                                      ),
                                      Image.asset(
                                        "assets/slflag.ico",
                                        width: 19,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Image.asset(
                                  "assets/images/spr.jpg",
                                ),
                                SizedBox(
                                  height: 0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          "assets/images/likefull.png",
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Text("10")
                                      ],
                                    ),
                                    Text("20 Comments")
                                  ],
                                ),
                                Divider(),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          FirebaseAuth.instance.signOut();
Get.to(SingInScreen());
                                          like.value = !like.value;
                                          print(like.value);
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.red.shade50,
                                            borderRadius:
                                                BorderRadius.circular(13),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15, vertical: 8),
                                            child: Obx(() {
                                              return Row(
                                                children: [
                                                  like.value
                                                      ? Image.asset(
                                                          "assets/images/heart.png",
                                                          width: 20,
                                                        )
                                                      : Image.asset(
                                                          "assets/images/heartf.png",
                                                          // color: Colors.blue,
                                                          width: 20,
                                                        ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    "like",
                                                    style:
                                                        TextStyle(fontSize: 15),
                                                  )
                                                ],
                                              );
                                            }),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade50,
                                          borderRadius:
                                              BorderRadius.circular(13),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 8),
                                          child: Row(
                                            children: [
                                              Image.asset(
                                                "assets/images/comment.png",
                                                width: 20,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                "Comment",
                                                style: TextStyle(fontSize: 15),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          save.value = !save.value;
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.green.shade50,
                                            borderRadius:
                                                BorderRadius.circular(13),
                                          ),
                                          child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 15,
                                                      vertical: 8),
                                              child: Obx(
                                                () {
                                                  return Row(
                                                    children: [
                                                      save.value
                                                          ? Image.asset(
                                                              "assets/images/save.png",
                                                              width: 17,
                                                            )
                                                          : Image.asset(
                                                              "assets/images/savef.png",
                                                              color:
                                                                  Colors.green,
                                                              width: 17,
                                                            ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        "Save",
                                                        style: TextStyle(
                                                            fontSize: 15),
                                                      )
                                                    ],
                                                  );
                                                },
                                              )),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ]),
                        ),
                      ),
                      // ListTile(
                      //   leading: CircleAvatar(
                      //     radius: 15,
                      //     backgroundImage: AssetImage("assets/images/spr.jpg"),
                      //   ),
                      //   title: TextField(
                      //     decoration: InputDecoration(
                      //       hintText: "Comment...",
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                );
              }),
        ));
  }
}
