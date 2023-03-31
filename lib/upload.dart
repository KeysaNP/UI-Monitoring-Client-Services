import 'dart:io';
import 'package:app_monitoring_cs/form_kunjungan.dart';
import 'package:app_monitoring_cs/kunjungan.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const Upload());
}

class Upload extends StatelessWidget {
  const Upload({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Uploadg(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Uploadg extends StatefulWidget {
  const Uploadg({super.key});
  final String title = 'yoo ';
  @override
  State<Uploadg> createState() => _UploadgState();
}

class _UploadgState extends State<Uploadg> {
  List<File>? image = [];

  Future getImage() async {
    // ignore: no_leading_underscores_for_local_identifiers
    final ImagePicker _picker = ImagePicker();
    final List<XFile> imagePicked = await _picker.pickMultiImage();

    image = imagePicked.map((e) => File(e.path)).toList();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8E1),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          backgroundColor: const Color(0xFFC52424),
          title: const Text("Formulir Tambah Kunjungan"),
          centerTitle: true,
          titleTextStyle: const TextStyle(
            fontSize: 20.0,
            color: Color(0xFFFFF8E1),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.arrow_circle_right,
                color: Color(0xFFFFF8E1),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const FormKunjungan();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 30),
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (File img in image!)
                      Container(
                        margin: const EdgeInsets.all(15),
                        width: MediaQuery.of(context).size.width,
                        child: Image.file(
                          img,
                          fit: BoxFit.cover,
                        ),
                      ),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: const Color(0xFFC52424),
                      ),
                      onPressed: () async {
                        await getImage();
                      },
                      child: const Text(
                        "Ambil Gambar",
                        style: TextStyle(color: Color(0xFFFFF8E1)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(15),
          ),
          Center(
            child: SizedBox(
              width: 250,
              height: 45,
              child: ElevatedButton(
                onPressed: (() {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return const DataKunjungan();
                    }),
                  );
                }),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xFFC52424)),
                  elevation: MaterialStateProperty.all(5.0),
                  padding:
                      MaterialStateProperty.all(const EdgeInsets.all(15.0)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                child: const Text(
                  "Kirim",
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
