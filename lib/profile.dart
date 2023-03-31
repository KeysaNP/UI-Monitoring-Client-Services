// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, avoid_print

import 'dart:io';
import 'package:app_monitoring_cs/home.dart';
import 'package:app_monitoring_cs/logout/alert_dialog.dart';
import 'package:flutter/material.dart';
// import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String selectedImagePath = '';

  bool tappedYes = false;
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    String title;
    return Scaffold(
      backgroundColor: Color(0xFFFFF8E1),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          backgroundColor: const Color(0xFFC52424),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Color(0xFFFFF8E1),
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Dashboard();
                  },
                ),
              );
            },
          ),
          title: Text("Menu User"),
          centerTitle: true,
          titleTextStyle: const TextStyle(
            fontSize: 20.0,
            color: Color(0xFFFFF8E1),
          ),
          actions: [
            IconButton(
              onPressed: () async {
                final action = await AlertDialogs.yesCancelDialog(
                    context, "Logout", "anda yakin ingin keluar?");
                if (action == DialogsAction.yes) {
                  setState(() => tappedYes = true);
                } else {
                  setState(() => tappedYes = false);
                }
              },
              icon: const Icon(
                Icons.logout_rounded,
                color: Color(0xFFFFF8E1),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.only(top: 50)),
                if (selectedImagePath == '')
                  Icon(
                    Icons.account_circle_rounded,
                    size: 180,
                    color: Color(0xFFC52424),
                  )
                else
                  ClipOval(
                    child: Image.file(
                      File(selectedImagePath),
                      height: 160,
                      width: 160,
                      fit: BoxFit.fill,
                    ),
                  ),
                const SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  width: 155,
                  height: 55,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xFFC52424)),
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(20)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        )),
                        textStyle: MaterialStateProperty.all(const TextStyle(
                            fontSize: 14, color: Color(0xFFFFF8E1)))),
                    onPressed: () async {
                      selectImage();
                      setState(() {});
                    },
                    child: const Text(
                      'Edit Profile',
                      style: TextStyle(color: Color(0xFFFFF8E1), fontSize: 15),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Padding(padding: EdgeInsets.only(left: 10, top: 30)),
                SizedBox(
                  width: 500,
                  height: 500,
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.all(15)),
                      Row(
                        children: const [
                          Padding(
                              padding: EdgeInsets.only(
                            left: 70,
                          )),
                          Icon(
                            Icons.wysiwyg_outlined,
                            color: Color(0xFFC52424),
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                            left: 15,
                          )),
                          Text(
                            'Nama :',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsets.all(15)),
                      Row(
                        children: const [
                          Padding(
                              padding: EdgeInsets.only(
                            left: 70,
                          )),
                          Icon(
                            Icons.person_rounded,
                            color: Color(0xFFC52424),
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                            left: 15,
                          )),
                          Text(
                            'Username :',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsets.all(15)),
                      Row(
                        children: const [
                          Padding(
                              padding: EdgeInsets.only(
                            left: 70,
                          )),
                          Icon(
                            Icons.lock_rounded,
                            color: Color(0xFFC52424),
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                            left: 15,
                          )),
                          Text(
                            'Password :',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsets.all(15)),
                      Row(
                        children: const [
                          Padding(padding: EdgeInsets.only(left: 70)),
                          Icon(
                            Icons.email_rounded,
                            color: Color(0xFFC52424),
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                            left: 15,
                          )),
                          Text(
                            'Email :',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future selectImage() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: SizedBox(
              height: 150,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    const Text(
                      'Select Image From !',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            selectedImagePath = await selectImageFromGallery();

                            print('Image_Path:-');

                            print(selectedImagePath);
                            if (selectedImagePath != '') {
                              Navigator.pop(context);
                              setState(() {});
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("No Image Selected !"),
                              ));
                            }
                          },
                          child: Card(
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: const [
                                    Icon(Icons.image_rounded),
                                    Text('Gallery'),
                                  ],
                                ),
                              )),
                        ),
                        GestureDetector(
                          onTap: () async {
                            selectedImagePath = await selectImageFromCamera();
                            print('Image_Path:-');
                            print(selectedImagePath);

                            if (selectedImagePath != '') {
                              Navigator.pop(context);
                              setState(() {});
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("No Image Selected !"),
                              ));
                            }
                          },
                          child: Card(
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: const [
                                    Icon(Icons.camera_alt_rounded),
                                    Text('Camera'),
                                  ],
                                ),
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  selectImageFromGallery() async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 100);
    if (file != null) {
      return file.path;
    } else {
      return '';
    }
  }

  //
  selectImageFromCamera() async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 100);
    if (file != null) {
      return file.path;
    } else {
      return '';
    }
  }
}
