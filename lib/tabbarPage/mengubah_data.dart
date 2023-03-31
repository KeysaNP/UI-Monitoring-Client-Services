import 'package:app_monitoring_cs/home.dart';
import 'package:flutter/material.dart';

class TambahData extends StatefulWidget {
  const TambahData({super.key});

  @override
  State<TambahData> createState() => _TambahDataState();
}

class _TambahDataState extends State<TambahData> {
  bool _isHidePasswordde = true;

  // ignore: unused_element
  void _toggllee() {
    setState(() {
      _isHidePasswordde = !_isHidePasswordde;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC52424),
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                width: 500,
                height: 480,
                child: Card(
                  color: const Color(0xFFFFF8E1),
                  elevation: 2.0,
                  child: Container(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      children: const <Widget>[
                        Padding(
                          padding: EdgeInsets.all(15),
                        ),
                        TextField(
                          scrollPadding: EdgeInsets.only(top: 15.0),
                          style: TextStyle(color: Colors.black, fontSize: 14.0),
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFFC52424))),
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFFC52424))),
                            icon: Icon(
                              Icons.email,
                              color: Color(0xFFC52424),
                            ),
                            hintText: "masukkan email",
                            hintStyle: TextStyle(
                              color: Color(0xFFC52424),
                              fontSize: 12.0,
                            ),
                            labelText: "Email",
                            labelStyle: TextStyle(
                              color: Color(0xFFC52424),
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(35.0),
                        ),
                        TextField(
                          scrollPadding: EdgeInsets.only(top: 15.0),
                          style: TextStyle(color: Colors.black, fontSize: 14.0),
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFFC52424))),
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFFC52424))),
                            icon: Icon(
                              Icons.person_rounded,
                              color: Color(0xFFC52424),
                            ),
                            hintText: "masukkan Username",
                            hintStyle: TextStyle(
                              color: Color(0xFFC52424),
                              fontSize: 12.0,
                            ),
                            labelText: "Username",
                            labelStyle: TextStyle(
                              color: Color(0xFFC52424),
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(35.0),
                        ),
                        TextField(
                          scrollPadding: EdgeInsets.only(top: 15.0),
                          style: TextStyle(color: Colors.black, fontSize: 14.0),
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFFC52424))),
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFFC52424))),
                            icon: Icon(
                              Icons.wysiwyg_outlined,
                              color: Color(0xFFC52424),
                            ),
                            hintText: "masukkan Nama",
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
                      ],
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
              ),
              SizedBox(
                width: 300,
                height: 52,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return const Dashboard();
                      }),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xFFFFF8E1)),
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
                    'Mengubah Data',
                    style: TextStyle(
                      color: Color(0xFFC52424),
                      letterSpacing: 1.5,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
