// ignore_for_file: file_names
import 'package:app_monitoring_cs/home.dart';
import 'package:app_monitoring_cs/tabbarPage/ubah_password.dart';
import 'package:app_monitoring_cs/tabbarPage/mengubah_data.dart';
import 'package:flutter/material.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({super.key});

  @override
  State<TabBarPage> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage>
    with SingleTickerProviderStateMixin {
  late TabController tabControler;
  @override
  void initState() {
    tabControler = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabControler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFC52424),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            backgroundColor: const Color(0xFFC52424),
            title: const Text("Konfigurasi"),
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  Container(
                    //height: 50,
                    width: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF8E1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: TabBar(
                            unselectedLabelColor: const Color(0xFFC52424),
                            labelColor: const Color(0xFFFFF8E1),
                            indicatorColor: Colors.grey,
                            indicatorWeight: 2,
                            indicator: BoxDecoration(
                              color: const Color(0xFFC52424),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            controller: tabControler,
                            tabs: const [
                              Tab(
                                child: Text("Mengubah Data",
                                    style: TextStyle(fontSize: 14)),
                              ),
                              Tab(
                                child: Text("Mengubah Password",
                                    style: TextStyle(fontSize: 14)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child:
                          TabBarView(controller: tabControler, children: const [
                    TambahData(),
                    UbahData(),
                  ])),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
