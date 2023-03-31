import 'package:app_monitoring_cs/home.dart';
import 'package:flutter/material.dart';

class UbahData extends StatefulWidget {
  const UbahData({super.key});

  @override
  State<UbahData> createState() => _UbahDataState();
}

class _UbahDataState extends State<UbahData> {
  bool _isHidePassword = true;

  void _toggle() {
    setState(() {
      _isHidePassword = !_isHidePassword;
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
                height: 150,
                child: Card(
                  color: const Color(0xFFFFF8E1),
                  elevation: 2.0,
                  child: Container(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      children: <Widget>[
                        TextField(
                          obscureText: _isHidePassword,
                          scrollPadding: const EdgeInsets.only(top: 15.0),
                          style: const TextStyle(
                              color: Colors.black, fontSize: 14.0),
                          decoration: InputDecoration(
                              focusedBorder: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFC52424))),
                              enabledBorder: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFC52424))),
                              prefixIcon: const Icon(
                                Icons.lock_rounded,
                                color: Color(0xFFC52424),
                              ),
                              hintText: "masukkan password terbaru",
                              hintStyle: const TextStyle(
                                color: Color(0xFFC52424),
                                fontSize: 12.0,
                              ),
                              labelText: "Password",
                              labelStyle: const TextStyle(
                                color: Color(0xFFC52424),
                                fontSize: 15.0,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                    _isHidePassword
                                        ? Icons.visibility_rounded
                                        : Icons.visibility_off_rounded,
                                    color: const Color(0xFFC52424)),
                                onPressed: _toggle,
                              )),
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
                    'Mengubah Password',
                    style: TextStyle(
                      color: Color(0xFFC52424),
                      letterSpacing: 1.5,
                      fontSize: 17.5,
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
