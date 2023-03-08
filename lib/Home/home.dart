import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.file_copy,
                ),
                label: "dsfs"),
            BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded), label: "dfs"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_rounded), label: "dsfd")
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: ListView.builder(
              itemCount: 6,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey,
                                width: 1,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(10)),
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Text(
                                    "Where can I share my GitHub project? Once you finished setting up your project and are ready to shareWhere can I share my GitHub project? Once you finished setting up your project and are ready to share ."),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Image.asset("assets/images/spr.jpg"),
                              SizedBox(
                                height: 0,
                              ),
                              Divider(),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.favorite_rounded),
                                          color: Colors.red,
                                        ),
                                        Text("love")
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.comment),
                                        ),
                                        Text("Comment")
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.download),
                                        ),
                                        Text("Save")
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ]),
                      ),
                      ListTile(
                        leading: CircleAvatar(
                          radius: 15,
                          backgroundImage: AssetImage("assets/images/spr.jpg"),
                        ),
                        title: TextField(
                          decoration: InputDecoration(
                            hintText: "Comment...",
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }),
        ));
  }
}
