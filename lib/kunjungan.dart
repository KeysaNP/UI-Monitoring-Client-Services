import 'package:app_monitoring_cs/home.dart';
import 'package:flutter/material.dart';

class DataKunjungan extends StatefulWidget {
  const DataKunjungan({super.key});

  @override
  State<DataKunjungan> createState() => _DataKunjunganState();
}

class _DataKunjunganState extends State<DataKunjungan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8E1),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          backgroundColor: const Color(0xFFC52424),
          title: const Text("Data Kunjungan"),
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
      body: ListView(
        children: [
          Center(
            child: Column(
              children: const [
                Padding(
                  padding: EdgeInsets.all(10),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
