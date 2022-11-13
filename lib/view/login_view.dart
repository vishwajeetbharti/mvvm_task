import 'package:flutter/material.dart';

import '../view_model/auth_view_model.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({Key? key}) : super(key: key);

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  final TextEditingController _countrycode = TextEditingController();
  final TextEditingController phone = TextEditingController();
  @override
  void initState() {
    _countrycode.text = "+91";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        margin: EdgeInsets.only(left: 10),
                        child: TextField(
                          controller: _countrycode,
                          style: const TextStyle(
                              fontSize: 20, color: Colors.black),
                          decoration:
                              const InputDecoration(border: InputBorder.none),
                        ),
                      ),
                      const Text(
                        "|",
                        style: TextStyle(fontSize: 40, color: Colors.grey),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.75,
                        margin: const EdgeInsets.only(left: 10),
                        child: TextField(
                          controller: phone,
                          keyboardType: TextInputType.phone,
                          style: const TextStyle(
                              fontSize: 20, color: Colors.black),
                          decoration: const InputDecoration(
                              border: InputBorder.none, hintText: "Phone"),
                        ),
                      ),
                    ],
                  ),
                )),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: GestureDetector(
                onTap: () {
                  LoginAuth.auth_otp(_countrycode.text, phone.text, context);
                },
                child: Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.lightGreen,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: const Center(
                    child: Text(
                      "Get Otp",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
