import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:walliefinal/screens/preference.dart';
import 'otp.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  late String phoneNo;
  //late String verificationId = "";
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController text1 = TextEditingController();
  TextEditingController text2 = TextEditingController();
  TextEditingController text3 = TextEditingController();
  TextEditingController text4 = TextEditingController();
  TextEditingController text5 = TextEditingController();
  TextEditingController text6 = TextEditingController();
  TextEditingController text7 = TextEditingController();
  TextEditingController text8 = TextEditingController();
  TextEditingController text9 = TextEditingController();
  TextEditingController text10 = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(color: Colors.white, width: 5.0),
              image: const DecorationImage(
                  image: AssetImage("assets/home.png"), fit: BoxFit.fill)),
          padding: const EdgeInsets.only(top: 50.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            const Padding(padding: EdgeInsets.only(top: 10)),
            const Text(
              "Log in/Sing up",
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: "walle",
                  fontSize: 22.0,
                  height: 1.4,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const Padding(padding: EdgeInsets.only(top: 150)),
            const Text(
              "Please Enter Your Phone Number",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontFamily: "walle",
                  height: 1.4,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const Padding(padding: EdgeInsets.only(top: 50)),
            Container(
                height: 60,
                width: 300,
                alignment: Alignment.center,
                color: Colors.white,
                padding: const EdgeInsets.all(10.0),
                child: Flex(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  direction: Axis.horizontal,
                  children: [
                    _textFormFieldPhoneNumber(
                        first: true, last: false, textEditingController: text1),
                    const SizedBox(
                      width: 2,
                    ),
                    _textFormFieldPhoneNumber(
                        first: false, last: false, textEditingController: text2),
                    const SizedBox(
                      width: 2,
                    ),
                    _textFormFieldPhoneNumber(
                        first: false, last: false, textEditingController: text3),
                    const SizedBox(
                      width: 2,
                    ),
                    _textFormFieldPhoneNumber(
                        first: false, last: false, textEditingController: text4),
                    const SizedBox(
                      width: 2,
                    ),
                    _textFormFieldPhoneNumber(
                        first: false, last: false, textEditingController: text5),
                    const SizedBox(
                      width: 2,
                    ),
                    _textFormFieldPhoneNumber(
                        first: false, last: false, textEditingController: text6),
                    const SizedBox(
                      width: 2,
                    ),
                    _textFormFieldPhoneNumber(
                        first: false, last: false, textEditingController: text7),
                    const SizedBox(
                      width: 2,
                    ),
                    _textFormFieldPhoneNumber(
                        first: false, last: false, textEditingController: text8),
                    const SizedBox(
                      width: 2,
                    ),
                    _textFormFieldPhoneNumber(
                        first: false, last: false, textEditingController: text9),
                    const SizedBox(
                      width: 2,
                    ),
                    _textFormFieldPhoneNumber(
                        first: false, last: true, textEditingController: text10),
                  ],
                )),
            const Padding(padding: EdgeInsets.only(top: 50)),
            ElevatedButton(
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(const Size(200, 50)),
                backgroundColor: (text1.text.isNotEmpty &&
                        text2.text.isNotEmpty &&
                        text3.text.isNotEmpty &&
                        text4.text.isNotEmpty &&
                        text5.text.isNotEmpty &&
                        text6.text.isNotEmpty &&
                        text7.text.isNotEmpty &&
                        text8.text.isNotEmpty &&
                        text9.text.isNotEmpty &&
                        text10.text.isNotEmpty
                    ? MaterialStateProperty.all<Color>(Colors.black87)
                    : MaterialStateProperty.all<Color>(Colors.grey.shade300)),
              ),
              child: const Text(
                "CONTINUE",
                style: TextStyle(
                  fontFamily: "walle",
                ),
              ),
              onPressed: () async {
                // await _verifyPhone();
                if ( //phoneNo!=null
                    text1.text.isNotEmpty &&
                        text2.text.isNotEmpty &&
                        text3.text.isNotEmpty &&
                        text4.text.isNotEmpty &&
                        text5.text.isNotEmpty &&
                        text6.text.isNotEmpty &&
                        text7.text.isNotEmpty &&
                        text8.text.isNotEmpty &&
                        text9.text.isNotEmpty &&
                        text10.text.isNotEmpty) {
                  debugPrint(phoneNo);
                  var route = MaterialPageRoute(
                      builder: (context) => MyOtp(
                            phoneNumber: phoneNo,
                            // verificationCode: verificationId
                          ));
                  //print("phone page id "+verificationId);
                  Navigator.of(context).push(route);
                } else {
                  () {};
                }
              },
            ),
            const Padding(padding: EdgeInsets.only(top: 150)),
            Container(
              height: 60,
              width: 150,
              child:
                  const Image(image: AssetImage("assets/images/wallie_logo.png")),
            ),
          ])),
    );
  }

  Widget _textFormFieldPhoneNumber(
      {required bool first,
      last,
      required TextEditingController textEditingController}) {
    return Container(
      width: 22,
      height: 40,
      decoration: BoxDecoration(color: Colors.grey.shade300),
      child: TextFormField(
        controller: textEditingController,
        showCursor: false,
        autofocus: false,
        // textInputAction: TextInputAction.next,
        validator: (value) {
          if (value!.isEmpty) {
            const Text(
              " please provide number",
              style: TextStyle(
                fontFamily: "walle",
              ),
            );
          }
        },
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(),
        style: const TextStyle(
            fontFamily: "walle", fontSize: 15.0, fontWeight: FontWeight.bold),
        maxLength: 1,
        buildCounter: (BuildContext context,
                {int? currentLength,
                int? maxLength,
                required bool isFocused}) =>
            null,
        onChanged: (value) {
          if (value.length == 1 && last == false) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty && first == false) {
            FocusScope.of(context).previousFocus();
          }
          if (value.length == 1) {
            if (text1.text.length == 1) {
              if (text2.text.length == 1) {
                if (text3.text.length == 1) {
                  if (text4.text.length == 1) {
                    if (text5.text.length == 1) {
                      if (text6.text.length == 1) {
                        if (text7.text.length == 1) {
                          if (text8.text.length == 1) {
                            if (text9.text.length == 1) {
                              if (text10.text.length == 1) {
                                phoneNo = "${text1.text}"
                                    "${text2.text}"
                                    "${text3.text}"
                                    "${text4.text}"
                                    "${text5.text}"
                                    "${text6.text}"
                                    "${text7.text}"
                                    "${text8.text}"
                                    "${text9.text}"
                                    "${text10.text}";
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        },

        //border:OutlineInputBorder(),
      ),
    );
  }

}
