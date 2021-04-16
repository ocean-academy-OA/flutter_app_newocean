import 'package:country_code_picker/country_codes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:ui';
import 'package:url_launcher/url_launcher.dart';
import '../../../route/navigation_locator.dart';
import '../../../route/navigation_service.dart';
import '../../../route/routeNames.dart';
import 'otp.dart';

class LogIn extends StatefulWidget {
  static ConfirmationResult confirmationResult;
  static String registerNumber;
  static bool isLogin = false;
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool isNumValid = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController _phoneNumberController = TextEditingController();
  String countryCode;
  List<Map<String, String>> contri = codes;
  bool rememberMe = false;
  String phoneNumber;

  ConfirmationResult confirmationResult;
  getOTP() async {
    LogIn.confirmationResult = await auth.signInWithPhoneNumber(
        '${countryCode.toString()} ${_phoneNumberController.text}');
    LogIn.registerNumber =
        '${countryCode.toString()} ${_phoneNumberController.text}';
    print("${LogIn.confirmationResult}LogIn.confirmationResult");
  }

  // session() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setInt('login', 1);
  //   await prefs.setString('user', _phoneNumberController.text);
  //   print('Otp Submited');
  // }

  List getContryCode() {
    List<String> contryCode = [];
    for (var cCode in contri) {
      contryCode.add(cCode['code']);
    }
    return contryCode;
  }

  _launchURL() async {
    try {
      const url = 'https://oceanacademy.in/';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xff2b9dd1),
            image: DecorationImage(
                image: MediaQuery.of(context).size.width > 900 &&
                        MediaQuery.of(context).size.width < 1000
                    ? AssetImage('images/login-xs.png')
                    : MediaQuery.of(context).size.width > 1000 &&
                            MediaQuery.of(context).size.width < 1400
                        ? AssetImage('images/login-sm.png')
                        : MediaQuery.of(context).size.width > 1400 &&
                                MediaQuery.of(context).size.width < 1900
                            ? AssetImage('images/login-md.png')
                            : AssetImage('images/login-lg.png'),
                // alignment: Alignment.center,
                fit: BoxFit.cover),
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          // color: Color(0xff2B9DD1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 500.0,
                height: 470.0,
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                decoration: BoxDecoration(
                    color: Color(0xff006793),
                    borderRadius: BorderRadius.circular(6.0)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome Back!',
                      style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: 340,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10.0,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 50.0,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5.0, vertical: 5.0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(3.0)),
                                child: CountryCodePicker(
                                  backgroundColor: Colors.transparent,
                                  onChanged: print,
                                  // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                                  initialSelection: getContryCode()[
                                      getContryCode().indexOf('IN')],
                                  countryFilter: getContryCode(),
                                  showFlagDialog: true,
                                  showDropDownButton: true,
                                  dialogBackgroundColor: Colors.white,

                                  hideSearch: true,
                                  dialogSize: Size(300.0, 550.0),
                                  onInit: (code) {
                                    countryCode = '+91';
                                    print(
                                        '${countryCode.toString()}countryCode.toString()');
                                  },

                                  dialogTextStyle:
                                      TextStyle(color: Colors.white),
                                  enabled: true,
                                  boxDecoration: BoxDecoration(
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                              Container(
                                height: 70.0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 50.0,
                                      width: 300.0,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(3.0)),
                                      child: TextField(
                                        decoration: InputDecoration(
                                            hintText:
                                                'Enter your Mobile Number',
                                            fillColor: Colors.white,
                                            border: OutlineInputBorder()),
                                        controller: _phoneNumberController,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'^\d+\.?\d{0,1}')),
                                          LengthLimitingTextInputFormatter(13),
                                        ],
                                        onChanged: (value) {
                                          setState(() {
                                            phoneNumber = value;
                                          });
                                        },
                                      ),
                                    ),
                                    Visibility(
                                        visible: isNumValid,
                                        child: Text(
                                          'Enter valid PhoneNumber',
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 15.0),
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RawMaterialButton(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Color(0xff014965),
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                    alignment: Alignment.center,
                                    padding:
                                        EdgeInsets.symmetric(vertical: 15.0),
                                    width: 420.0,
                                    child: Text(
                                      'NEXT',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  elevation: 0.0,
                                  onPressed: () async {
                                    print(
                                        "${_phoneNumberController.text}_phoneNumberController.text");
                                    setState(() {
                                      //Navbar.visiblity = false;
                                      OTP.userID =
                                          '${countryCode.toString()} ${_phoneNumberController.text}';
                                      // MenuBar.stayUser = OTP.userID;
                                    });

                                    if (_phoneNumberController.text.length >=
                                        10) {
                                      //getData();

                                      ///todo remove the hide get otp
                                      //session();

                                      //
                                      // Provider.of<Routing>(context,
                                      //         listen: false)
                                      //     .updateRouting(
                                      //         widget: OTP(
                                      //   confirmationResult: confirmationResult,
                                      // ));
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) => OTP(
                                      //               confirmationResult:
                                      //                   confirmationResult,
                                      //             )));
                                      await getOTP();

                                      locator<NavigationService>()
                                          .navigateTo(OTPRoute);
                                    } else {
                                      isNumValid = true;
                                    }
                                  }),
                            ],
                          ),
                          // Row(
                          //   children: [
                          //     Checkbox(
                          //       value: rememberMe,
                          //       activeColor: Colors.blue,
                          //       checkColor: Colors.white,
                          //       onChanged: (bool value) {
                          //         setState(() {
                          //           if (rememberMe) {
                          //             print(rememberMe);
                          //             rememberMe = value;
                          //             print(rememberMe);
                          //           } else {
                          //             rememberMe = value;
                          //             print(rememberMe);
                          //           }
                          //         });
                          //       },
                          //     ),
                          //     Text(
                          //       'Remember Me',
                          //       style: TextStyle(
                          //           color: Colors.white, fontSize: 18.0),
                          //     ),
                          //   ],
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 430.0,
                                child: RichText(
                                  text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                      text:
                                          'By clicking the button above, you are creating an account with Ocean Academy and agree to our ',
                                      children: [
                                        TextSpan(
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                print('Privacy Policy taped');
                                              },
                                            text: 'Privacy Policy',
                                            style: TextStyle(
                                                color: Colors.cyanAccent)),
                                        TextSpan(text: ' and '),
                                        TextSpan(
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                print('Terms of Use taped');
                                              },
                                            text: 'Terms of Use',
                                            style: TextStyle(
                                                color: Colors.cyanAccent)),
                                        TextSpan(
                                            text:
                                                ', including receiving emails. '),
                                      ]),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(vertical: 15.0),
                width: 500,
                padding: EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                    color: Color(0xff006793),
                    borderRadius: BorderRadius.circular(6.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Or ',
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                    TextButton(
                      child: Text(
                        'click here',
                        style:
                            TextStyle(color: Colors.cyanAccent, fontSize: 18.0),
                      ),
                      onPressed: _launchURL,
                    ),
                    Text(
                      ' to visit website',
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
