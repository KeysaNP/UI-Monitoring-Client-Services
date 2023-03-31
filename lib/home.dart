import 'package:app_monitoring_cs/form_absen.dart';
import 'package:app_monitoring_cs/history_presensi.dart';
import 'package:app_monitoring_cs/profile.dart';
import 'package:app_monitoring_cs/form_kunjungan.dart';
import 'package:app_monitoring_cs/kofig.dart';
import 'package:app_monitoring_cs/kunjungan.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Dashboard(),
  ));
}

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String title = 'Menu Utama';

  //untuk tanggal
  // ignore: non_constant_identifier_names
  TextEditingController DateTimeIn = TextEditingController();

  @override
  void initState() {
    DateTimeIn.text = " ";
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
          title: const Text("Menu Utama"),
          centerTitle: true,
          titleTextStyle: const TextStyle(
            fontSize: 20.0,
            color: Color(0xFFFFF8E1),
          ),
        ),
      ),
      body: ListView(
        children: [
          Center(
            child: Stack(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Center(
                        child: Wrap(
                          spacing: 20.0,
                          runSpacing: 20.0,
                          children: [
                            // box untuk user
                            SizedBox(
                              width: 400,
                              height: 130,
                              child: Card(
                                color: const Color(0xFFC52424),
                                elevation: 2.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Center(
                                  child: TextButton(
                                    child: Row(
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.all(25),
                                        ),
                                        const Icon(
                                          Icons.person,
                                          color: Color(0xFFFFF8E1),
                                          size: 67,
                                        ),
                                        const Padding(
                                            padding: EdgeInsets.only(left: 35)),
                                        const Text(
                                          "User",
                                          style: TextStyle(
                                              color: Color(0xFFFFF8E1),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (context) {
                                          return const Profile();
                                        }),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),

                            //untuk box tambah kunjungan
                            SizedBox(
                              width: 400,
                              height: 130,
                              child: Card(
                                color: const Color(0xFFC52424),
                                elevation: 2.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Center(
                                  child: TextButton(
                                    child: Row(
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.all(25),
                                        ),
                                        const Icon(
                                          Icons.group_add_rounded,
                                          color: Color(0xFFFFF8E1),
                                          size: 67,
                                        ),
                                        const Padding(
                                            padding: EdgeInsets.only(left: 30)),
                                        Center(
                                          child: Column(
                                            children: const [
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 34,
                                                      bottom: 10,
                                                      left: 8)),
                                              Text(
                                                "Tambah kunjungan",
                                                style: TextStyle(
                                                    color: Color(0xFFFFF8E1),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                                textAlign: TextAlign.center,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (context) {
                                          return const FormKunjungan();
                                        }),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),

                            //box untuk data kunjungan
                            SizedBox(
                              width: 400,
                              height: 130,
                              child: Card(
                                color: const Color(0xFFC52424),
                                elevation: 2.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Center(
                                  child: TextButton(
                                    child: Row(
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.all(25),
                                        ),
                                        const Icon(
                                          Icons.contact_page_rounded,
                                          color: Color(0xFFFFF8E1),
                                          size: 67,
                                        ),
                                        const Padding(
                                            padding: EdgeInsets.only(left: 30)),
                                        Center(
                                          child: Column(
                                            children: const [
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 34,
                                                      bottom: 10,
                                                      left: 8)),
                                              Text(
                                                "Data Kunjungan",
                                                style: TextStyle(
                                                    color: Color(0xFFFFF8E1),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                                textAlign: TextAlign.center,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (context) {
                                          return const DataKunjungan();
                                        }),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),

                            //box untuk konfigurasi
                            SizedBox(
                              width: 400,
                              height: 130,
                              child: Card(
                                color: const Color(0xFFC52424),
                                elevation: 2.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Center(
                                  child: TextButton(
                                    child: Row(
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.all(25),
                                        ),
                                        const Icon(
                                          Icons.settings_rounded,
                                          color: Color(0xFFFFF8E1),
                                          size: 67,
                                        ),
                                        const Padding(
                                            padding: EdgeInsets.only(left: 35)),
                                        const Text(
                                          "Konfigurasi",
                                          style: TextStyle(
                                              color: Color(0xFFFFF8E1),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (context) {
                                          return const Konfig();
                                        }),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),

                            //box untuk absensi
                            SizedBox(
                              width: 400,
                              height: 130,
                              child: Card(
                                color: const Color(0xFFC52424),
                                elevation: 2.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Center(
                                  child: TextButton(
                                    child: Row(
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.all(25),
                                        ),
                                        const Icon(
                                          Icons.present_to_all_rounded,
                                          color: Color(0xFFFFF8E1),
                                          size: 67,
                                        ),
                                        const Padding(
                                            padding: EdgeInsets.only(left: 35)),
                                        const Text(
                                          "Presensi",
                                          style: TextStyle(
                                              color: Color(0xFFFFF8E1),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (context) {
                                          return const AbsenPage();
                                        }),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),

                            //box untuk history presensi
                            SizedBox(
                              width: 400,
                              height: 130,
                              child: Card(
                                color: const Color(0xFFC52424),
                                elevation: 2.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Center(
                                  child: TextButton(
                                    child: Row(
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.all(25),
                                        ),
                                        const Icon(
                                          Icons.access_time_filled_rounded,
                                          color: Color(0xFFFFF8E1),
                                          size: 67,
                                        ),
                                        const Padding(
                                            padding: EdgeInsets.only(left: 30)),
                                        Center(
                                          child: Column(
                                            children: const [
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 34,
                                                      bottom: 10,
                                                      left: 8)),
                                              Text(
                                                "History Presensi",
                                                style: TextStyle(
                                                    color: Color(0xFFFFF8E1),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                                textAlign: TextAlign.center,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (context) {
                                          return const HistoryPresensi();
                                        }),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
