import 'dart:math';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'contactname.dart';

class MyOtp extends StatefulWidget {
  final String phoneNumber;
  const MyOtp({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  State<MyOtp> createState() => _MyOtpState(phoneNumber);
}

class _MyOtpState extends State<MyOtp> {
  String verificationCode = "";
  String phoneNumber;
  String error = '';
  late String otp;
  ConfirmationResult? webConfirmationResult;
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController text1 = TextEditingController();
  TextEditingController text2 = TextEditingController();
  TextEditingController text3 = TextEditingController();
  TextEditingController text4 = TextEditingController();
  TextEditingController text5 = TextEditingController();
  TextEditingController text6 = TextEditingController();

  _MyOtpState(this.phoneNumber);
  bool isWeb = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    try {
      if ((defaultTargetPlatform == TargetPlatform.iOS) || (defaultTargetPlatform == TargetPlatform.android)) {
        // Some android/ios specific code
        _verifyPhone();
      }
      else if ((defaultTargetPlatform == TargetPlatform.linux) || (defaultTargetPlatform == TargetPlatform.macOS) || (defaultTargetPlatform == TargetPlatform.windows)) {
        // Some desktop specific code there
        _verifyWebPhoneNumber();
      }
      else {
        // Some web specific code there
        _verifyWebPhoneNumber();
      }
    }  catch (e) {
      debugPrint(e.toString());
    }

  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Card(
        child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.white, width: 5.0),
                image: const DecorationImage(
                    image: AssetImage("assets/home.png"), fit: BoxFit.fill)),
           // padding: const EdgeInsets.only(top: 30.0),
            child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                const Padding(padding: EdgeInsets.only(top: 10)),
                Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.arrow_back_sharp)),
            ],
                ),
                const Padding(padding: EdgeInsets.only(right: 100)),
                const Text(
            "Create a Account",
            style: TextStyle(
                color: Colors.black,
                fontFamily: "walle",
                fontSize: 22.0,
                height: 1.4,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
                ),
                const Padding(padding: EdgeInsets.only(top: 80)),
                const Text(
            "Just sent you OTP, please enter to",
            style: TextStyle(
                color: Colors.black,
                fontFamily: "walle",
                fontSize: 20.0,
                height: 1.4,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
                ),
                const Padding(padding: EdgeInsets.only(top: 30)),
                Text(
            "+91 ${widget.phoneNumber}",
            style: const TextStyle(
                color: Color(0XFF424242),
                fontFamily: "walle",
                fontSize: 20.0,
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
                      first: true,
                      last: false,
                      textEditingController: text1),
                  const SizedBox(
                    width: 2,
                  ),
                  _textFormFieldPhoneNumber(
                      first: false,
                      last: false,
                      textEditingController: text2),
                  const SizedBox(
                    width: 2,
                  ),
                  _textFormFieldPhoneNumber(
                      first: false,
                      last: false,
                      textEditingController: text3),
                  const SizedBox(
                    width: 2,
                  ),
                  _textFormFieldPhoneNumber(
                      first: false,
                      last: false,
                      textEditingController: text4),
                  const SizedBox(
                    width: 2,
                  ),
                  _textFormFieldPhoneNumber(
                      first: false,
                      last: false,
                      textEditingController: text5),
                  const SizedBox(
                    width: 2,
                  ),
                  _textFormFieldPhoneNumber(
                      first: false,
                      last: true,
                      textEditingController: text6),
                ],
              )),
                const Padding(padding: EdgeInsets.only(top: 30)),
                Text(error,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 18,
                fontFamily: "walle",
              )),
                const Padding(padding: EdgeInsets.only(top: 30)),
                ElevatedButton(
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(const Size(200, 50)),
                backgroundColor: (text1.text.isNotEmpty &&
                        text2.text.isNotEmpty &&
                        text3.text.isNotEmpty &&
                        text4.text.isNotEmpty &&
                        text5.text.isNotEmpty &&
                        text6.text.isNotEmpty
                    ? MaterialStateProperty.all<Color>(Colors.black87)
                    : MaterialStateProperty.all<Color>(
                        Colors.grey.shade300)),
              ),
              child: const Text(
                "VERIFY OTP",
                style: TextStyle(
                  fontFamily: "walle",
                ),
              ),
              onPressed: () async {
                print("verification code is " + verificationCode);
                try {
                  if ((defaultTargetPlatform == TargetPlatform.iOS) || (defaultTargetPlatform == TargetPlatform.android)) {
                    // Some android/ios specific code
                    verifyotp();
                  }
                  else if ((defaultTargetPlatform == TargetPlatform.linux) || (defaultTargetPlatform == TargetPlatform.macOS) || (defaultTargetPlatform == TargetPlatform.windows)) {
                    // Some desktop specific code there
                    _confirmCodeWeb();
                  }
                  else {
                    // Some web specific code there
                    _confirmCodeWeb();
                  }
                }  catch (e) {
                  debugPrint(e.toString());
                }


              }),
                const Padding(padding: EdgeInsets.only(top: 30)),
                TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            MyOtp(phoneNumber: phoneNumber)));
              },
              child: const Text(
                "Resend OTP?",
                style: TextStyle(
                    color: Color(0xFFA57914),
                    decoration: TextDecoration.underline),
              )),
                const Padding(padding: EdgeInsets.only(top: 50)),
                Container(
            height: 60,
            width: 150,
            child: const Image(
                image: AssetImage("assets/images/wallie_logo.png")),
                ),
              ])),
      ),
    );
  }

  Widget _textFormFieldPhoneNumber(
      {required bool first,
      last,
      required TextEditingController textEditingController}) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(color: Colors.grey.shade300),
      child: TextFormField(
          controller: textEditingController,
          showCursor: false,
          autofocus: false,
          // textInputAction: TextInputAction.next,
          validator: (value) {
            if (value!.isEmpty) {
              const Text(" please provide value",
                  style: TextStyle(
                    fontFamily: "walle",
                  ));
            }
          },
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(),
          style: const TextStyle(
              fontFamily: "walle",
              fontSize: 15.0,
              fontWeight: FontWeight.bold),
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
                          otp = "${text1.text}"
                              "${text2.text}"
                              "${text3.text}"
                              "${text4.text}"
                              "${text5.text}"
                              "${text6.text}";
                        }
                      }
                    }
                  }
                }
              }
            }
          }),
    );
  }

  Future<void> _verifyPhone() async {
    await auth.verifyPhoneNumber(
      phoneNumber: "+91 ${phoneNumber}",
      verificationCompleted: (PhoneAuthCredential credential) async {
        // await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, int? resendToken) async {
        verificationCode = verificationId.toString();
        setState(() {
          verificationCode = verificationId;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        verificationCode = verificationId;
      },
      timeout: const Duration(seconds: 60),
    );
  }

  Future<void> verifyotp() async {
    AuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: verificationCode, smsCode: otp);

    signInWithPhoneAuthCredential(phoneAuthCredential);
  }

  void signInWithPhoneAuthCredential(AuthCredential phoneAuthCredential) async {
    try {
      final authCredential =
          await auth.signInWithCredential(phoneAuthCredential);

      if (authCredential.user != null) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ContactName(phoneNumber: phoneNumber)));
      }
    } on FirebaseAuthException catch (e) {
      print(e);
      setState(() {
        error = "Wrong OTP entered!";
      });
    }
  }

  Future<void> _verifyWebPhoneNumber() async {
    ConfirmationResult confirmationResult =
        await auth.signInWithPhoneNumber('+91${phoneNumber}');

    webConfirmationResult = confirmationResult;
  }


  Future<void> _confirmCodeWeb() async {
    if (webConfirmationResult != null) {
      try {
        await webConfirmationResult!
            .confirm(otp)
            .whenComplete(() => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ContactName(phoneNumber: phoneNumber),
                )));
      } catch (e) {
        print(e.toString());
        setState(() {
          error = "Wrong OTP web entered!";
        });
      }
    } else {}
  }
  // @override
  //  void dispose() {
  //    super.dispose();
  //    text1.dispose();
  //    text2.dispose();
  //    text3.dispose();
  //    text4.dispose();
  //    text5.dispose();
  //    text6.dispose();
  // }
}
