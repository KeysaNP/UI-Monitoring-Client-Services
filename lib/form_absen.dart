import 'dart:io';
import 'package:app_monitoring_cs/history_presensi.dart';
import 'package:app_monitoring_cs/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AbsenPage extends StatefulWidget {
  const AbsenPage({super.key});

  @override
  State<AbsenPage> createState() => _AbsenPageState();
}

class _AbsenPageState extends State<AbsenPage> {
// untuk kalender
// ignore: non_constant_identifier_names
  TextEditingController DateTimeInputt = TextEditingController();

  @override
  void initState() {
    DateTimeInputt.text = " ";
    super.initState();
  }

  //untuk foto
  // File? image;
  // Future getImage() async {
  //   final picker = ImagePicker();
  //   final XFile? imagePicked =
  //       await picker.pickImage(source: ImageSource.camera);

  //   image = File(imagePicked!.path);
  //   setState(() {});

  // }

  File? image;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8E1),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          backgroundColor: const Color(0xFFC52424),
          title: const Text("Formulir Presensi"),
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
                      return const Dashboard();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            Center(
              child: Container(
                width: 500,
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    // ignore: avoid_unnecessary_containers
                    SizedBox(
                      width: 500,
                      height: 200,
                      child: Card(
                        color: const Color(0xFFC52424),
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          children: [
                            const Padding(padding: EdgeInsets.all(10)),
                            SizedBox(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  StreamBuilder(
                                      stream: Stream.periodic(
                                        const Duration(seconds: 1),
                                      ),
                                      builder: (context, snapshot) {
                                        return Column(
                                          children: [
                                            Text(
                                              DateFormat('HH : mm')
                                                  .format(DateTime.now()),
                                              style: const TextStyle(
                                                fontSize: 18,
                                                color: Color(0xFFFFF8E1),
                                              ),
                                            ),
                                            Text(
                                              DateFormat('EEEE, dd MMMM y')
                                                  .format(DateTime.now()),
                                              style: const TextStyle(
                                                fontSize: 18,
                                                color: Color(0xFFFFF8E1),
                                              ),
                                            ),
                                          ],
                                        );
                                      }),
                                ],
                              ),
                            ),
                            const Padding(
                                padding: EdgeInsets.only(
                              top: 10,
                              bottom: 10,
                            )),
                            SizedBox(
                              child: Column(
                                children: [
                                  const Text(
                                    "Waktu Presensi",
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: Color(0xFFFFF8E1),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: const [
                                      Text(
                                        'Jam Masuk',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Color(0xFFFFF8E1)),
                                      ),
                                      Text(
                                        '09:00 - 09:30',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Color(0xFFFFF8E1)),
                                      ),
                                    ],
                                  ),
                                  const Padding(padding: EdgeInsets.all(5)),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: const [
                                      Text(
                                        'Jam Keluar',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Color(0xFFFFF8E1)),
                                      ),
                                      Text(
                                        '17:00 - 17:30',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Color(0xFFFFF8E1)),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(15)),
                    SizedBox(
                      child: Column(
                        children: <Widget>[
                          const TextField(
                            scrollPadding: EdgeInsets.only(top: 10.0),
                            style:
                                TextStyle(color: Colors.black, fontSize: 14.0),
                            decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFC52424))),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFC52424))),
                              icon: Icon(
                                Icons.groups_rounded,
                                color: Color(0xFFC52424),
                              ),
                              hintText: "masukkan nama anda",
                              hintStyle: TextStyle(
                                color: Color(0xFFC52424),
                                fontSize: 12.0,
                              ),
                              labelText: "Nama",
                              labelStyle: TextStyle(
                                color: Color(0xFFC52424),
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                          const Padding(padding: EdgeInsets.all(15)),
                          TextFormField(
                            controller: DateTimeInputt,
                            scrollPadding: const EdgeInsets.only(top: 10.0),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 14.0),
                            decoration: const InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFC52424))),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFC52424))),
                              icon: Icon(
                                Icons.calendar_month_rounded,
                                color: Color(0xFFC52424),
                              ),
                              hintText: "masukan tanggal absen",
                              hintStyle: TextStyle(
                                color: Color(0xFFC52424),
                                fontSize: 12.0,
                              ),
                              labelText: "Tanggal",
                              labelStyle: TextStyle(
                                color: Color(0xFFC52424),
                                fontSize: 20.0,
                              ),
                            ),
                            readOnly: true,
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1999),
                                lastDate: DateTime(2050),
                                builder: (context, child) => Theme(
                                    data: ThemeData().copyWith(
                                      colorScheme: const ColorScheme.dark(
                                        surface: Color(0xFFC52424),
                                        onSurface: Colors.black,
                                        primary: Color(0xFF455A64),
                                        onPrimary: Color(0xFFFFF8E1),
                                      ),
                                    ),
                                    child: child!),
                              );
                              if (pickedDate != null) {
                                // ignore: non_constant_identifier_names
                                String FormatDate = DateFormat("dd MMMM yyyy")
                                    .format(pickedDate);
                                setState(() {
                                  DateTimeInputt.text = FormatDate;
                                });
                              } else {
                                // ignore: avoid_print
                                print("tidak mengisi tanggal");
                                DateTimeInputt.text = " ";
                              }
                            },
                          ),
                          const Padding(padding: EdgeInsets.all(15)),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                image != null
                                    ? SizedBox(
                                        height: 500,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Image.file(
                                          image!,
                                          fit: BoxFit.cover,
                                        ))
                                    : Container(),
                                const Padding(
                                    padding: EdgeInsets.only(top: 10)),
                                MaterialButton(
                                  onPressed: () {
                                    pickImage();
                                  },
                                  color: const Color(0xFFC52424),
                                  shape: (RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  )),
                                  child: const Text(
                                    "ambil gambar",
                                    style: TextStyle(
                                        color: Color(0xFFFFF8E1), fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(20)),
                    SizedBox(
                      width: 300,
                      child: ElevatedButton(
                          onPressed: (() {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return const HistoryPresensi();
                              }),
                            );
                          }),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color(0xFFC52424)),
                            elevation: MaterialStateProperty.all(5.0),
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.all(15.0)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                          ),
                          child: const Text(
                            "submit presensi",
                            style: TextStyle(
                                fontSize: 20, color: Color(0xFFFFF8E1)),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
