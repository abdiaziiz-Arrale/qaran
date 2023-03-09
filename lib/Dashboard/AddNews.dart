import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../Widgets/CustomTextFeild.dart';
import '../Widgets/NumberTextfeild.dart';

class AddNews extends StatefulWidget {
  const AddNews({Key? key}) : super(key: key);

  @override
  State<AddNews> createState() => _AddNewsState();
}

class _AddNewsState extends State<AddNews> {
  final selectedImage = ''.obs;

  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();
  int like = 0;




  var productadded = false.obs;
  var loarding = false.obs;
  Color statuscolor =  Colors.blue.shade400;

  void pickImage() async {
    final XFile? image =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image?.path == null) {
      return;
    }
    selectedImage.value = image!.path;
  }

  var Selectdropdown;

  final Categorys = [].obs;

  void GetCategory() async {
    final db = FirebaseFirestore.instance;
    final collection = db.collection('Category');
    final results = await collection.get();

    for (final document in results.docs) {
      final Category = {
        'Id': document.id,
        'name': document.data()['name'],
      };
print("kkkkkkkkkkkkkkk"+Category.toString());
      Categorys.add(Category);
    }
  }

  void AddtoNews() async {
    if (title.text.isEmpty ||content.text.isEmpty ||

        selectedImage.value.isEmpty ||
        Selectdropdown == null ||
        Selectdropdown == "") {
      const snackdemo = SnackBar(
        content: Text('Please Fill The Missing Input '),
        backgroundColor: Colors.red,
        elevation: 10,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(5),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackdemo);

      return;
    }
    loarding.value = true;
    final picture = File(selectedImage.value);

    final db = FirebaseFirestore.instance;

    final collection = db.collection('News');
    final document = collection.doc();
    final storage = FirebaseStorage.instance;
    final imageRef = storage.ref('NewsImage').child(document.id);
    await imageRef.putFile(File(picture.path));

    final imageUrl = await imageRef.getDownloadURL();

    await document.set({
      'title': title.text,
      'content': content.text,
      'category': Selectdropdown,
      'like': like,
      'image': imageUrl,
    });
    loarding.value = false;
    ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(
      padding: const EdgeInsets.all(8),
      backgroundColor: Colors.green,
      elevation: 0,
      content: Text('${title.text} was added to your Feeds!'),
      contentTextStyle: const TextStyle(color: Colors.white),
      actions: [
        GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
              productadded.value = false;
              title.clear();
              content.clear();


              Selectdropdown = "";
              selectedImage.value = "";
            },
            child: const Icon(
              Icons.close,
              color: Colors.white,
            ))
      ],
    ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetCategory();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      elevation: 0,
      leading: GestureDetector(
          onTap: () => Get.back(),
          child:  IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back_sharp))),
      centerTitle: true,
      backgroundColor: Colors.green.shade400,
      title: const Text('Add News'),
    ),
    body: ListView(
      children: [
        GestureDetector(
          onTap: () => pickImage(),
          child: Stack(
            children: [
              Container(
                margin:
                const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                height: MediaQuery.of(context).size.width * .88,
                width: MediaQuery.of(context).size.width,
                child: Obx(
                      () => selectedImage.value.isEmpty
                      ? Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 22, vertical: 8),
                    height: MediaQuery.of(context).size.width * .88,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(18)),
                  )
                      : Container(
                    margin:
                    const EdgeInsets.symmetric(horizontal: 32),
                    child: Image.file(
                      File(selectedImage.value),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 65,
                bottom: 10,
                child: Icon(Icons.camera_alt_outlined,
                    size: 40, color: Colors.black),
              )
            ],
          ),
        ),
        CustomTextField(
            textController: title,
            autofocus: false,
            isDecorated: false,
            // function: (p0) => controller.name.value = p0,
            hint: 'Title'),

        Obx(
              () => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: DropdownButton(
              hint: Text("Choice Category"),
              items: Categorys.map((e) {
                return DropdownMenuItem(
                  child: Text(e['name']),
                  value: e['Id'],
                );
              }).toList(),

              onChanged: (value) {
                setState(() {
                  print(value);
                  Selectdropdown = value.toString();
                });
              },

              icon: Padding(
                //Icon at tail, arrow bottom is default icon
                  padding: EdgeInsets.only(left: 20),
                  child: Icon(
                    Icons.arrow_circle_down_sharp,
                    color: Colors.black,
                  )),
              iconEnabledColor: Colors.white,
              //Icon color
              style: TextStyle(
                //te
                color: Colors.black, //Font color
                //font size on dropdown button
              ),
              value: Selectdropdown,
              dropdownColor: Colors.white,
              //dropdown background color
              underline: Container(),
              //remove underline
              isExpanded: true, //make true to make width 100%
            ),
          ),
        ),

        CustomTextField(
            textController: content,
            autofocus: false,
            isDecorated: false,
            // function: (p0) => controller.name.value = p0,
            hint: 'Content Discription'),
        Obx(
              () => Padding(
            padding: const EdgeInsets.all(12.0),
            child: MaterialButton(
              elevation: 5,
              onPressed: loarding.isTrue
                  ? null
                  : () {
                AddtoNews();
              },
              height: 50,
              padding: EdgeInsets.all(10),
              color: Colors.black,
              child: loarding.isTrue
                  ? LoadingAnimationWidget.fourRotatingDots(
                  color: statuscolor, size: 72)
                  : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Add News ",
                    style:
                    TextStyle(fontSize: 16, color: Colors.white),
                  )
                ],
              ),
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(8)),
            ),
          ),
        ),
      ],
    ),
  );
}
