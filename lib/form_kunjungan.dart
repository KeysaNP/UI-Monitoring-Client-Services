// ignore_for_file: prefer_const_constructors, unnecessary_new
import 'package:intl/intl.dart';
import 'package:app_monitoring_cs/home.dart';
import 'package:app_monitoring_cs/upload.dart';
import 'package:flutter/material.dart';

class FormKunjungan extends StatefulWidget {
  const FormKunjungan({super.key});

  @override
  State<FormKunjungan> createState() => _FormKunjunganState();
}

class _FormKunjunganState extends State<FormKunjungan> {
  // ignore: non_constant_identifier_names
  TextEditingController DateTimeInput = TextEditingController();

  @override
  void initState() {
    DateTimeInput.text = " ";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF8E1),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          backgroundColor: const Color(0xFFC52424),
          title: const Text("Tambah Kunjungan"),
          centerTitle: true,
          titleTextStyle: const TextStyle(
            fontSize: 20.0,
            color: Color(0xFFFFF8E1),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.arrow_circle_right,
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
          ],
        ),
      ),
      body:  ListView(
        children: <Widget>[
           Container(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: <Widget>[
                TextField(
                  scrollPadding:  EdgeInsets.only(top: 10.0),
                  style: TextStyle(color: Colors.black, fontSize: 14.0),
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFC52424))),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFC52424))),
                    icon: Icon(
                      Icons.groups_rounded,
                      color: Color(0xFFC52424),
                    ),
                    hintText: "masukkan kode kunjungan",
                    hintStyle: TextStyle(
                      color: Color(0xFFC52424),
                      fontSize: 12.0,
                    ),
                    labelText: "Kode Kunjungan",
                    labelStyle: TextStyle(
                      color: Color(0xFFC52424),
                      fontSize: 15.0,
                    ),
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 40.0),
                ),
                // ignore: avoid_unnecessary_containers
                Container(
                  child: new TextField(
                    scrollPadding: new EdgeInsets.only(top: 10.0),
                    style: TextStyle(color: Colors.black, fontSize: 14.0),
                    decoration: new InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFC52424))),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFC52424))),
                      icon: Icon(
                        Icons.add_location_alt_rounded,
                        color: Color(0xFFC52424),
                      ),
                      hintText: "masukkan tempat kunjungan",
                      hintStyle: TextStyle(
                        color: Color(0xFFC52424),
                        fontSize: 12.0,
                      ),
                      labelText: "Tempat Kunjungan",
                      labelStyle: TextStyle(
                        color: Color(0xFFC52424),
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40.0),
                ),
                // ignore: avoid_unnecessary_containers
                Container(
                  child: TextFormField(
                    controller: DateTimeInput,
                    scrollPadding: EdgeInsets.only(top: 10.0),
                    style: TextStyle(color: Colors.black, fontSize: 14.0),
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFC52424))),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFC52424))),
                      icon: Icon(
                        Icons.calendar_month_rounded,
                        color: Color(0xFFC52424),
                      ),
                      hintText: "masukan tanggal",
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
                              colorScheme: ColorScheme.dark(
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
                        String FormatDate =
                            DateFormat("dd MMMM yyyy").format(pickedDate);
                        setState(() {
                          DateTimeInput.text = FormatDate;
                        });
                      } else {
                        // ignore: avoid_print
                        print("tidak mengisi tanggal");
                        DateTimeInput.text = " ";
                      }
                    },
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 40.0),
                ),
                new TextField(
                  scrollPadding: new EdgeInsets.only(top: 10.0),
                  style: TextStyle(color: Colors.black, fontSize: 14.0),
                  maxLines: 3,
                  decoration: new InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFC52424))),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFC52424))),
                    icon: Icon(
                      Icons.description_rounded,
                      color: Color(0xFFC52424),
                    ),
                    hintText: "masukkan keterangan",
                    hintStyle: TextStyle(
                      color: Color(0xFFC52424),
                      fontSize: 12.0,
                    ),
                    labelText: "Keterangan",
                    labelStyle: TextStyle(
                      color: Color(0xFFC52424),
                      fontSize: 15.0,
                    ),
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 40.0),
                ),
                SizedBox(
                  width: 350,
                  height: 47,
                  child: new ElevatedButton(
                    onPressed: (() {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return Upload();
                        }),
                      );
                    }),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xFFC52424)),
                      elevation: MaterialStateProperty.all(5.0),
                      padding: MaterialStateProperty.all(EdgeInsets.all(15.0)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                    child: const Text(
                      "Lanjut",
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
