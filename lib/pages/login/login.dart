import 'package:clipper/constants/constants.dart';
import 'package:clipper/provider/checkinternet.dart';
import 'package:clipper/provider/data.dart';
import 'package:clipper/widgets/clip1.dart';
import 'package:clipper/widgets/clip2.dart';
import 'package:clipper/widgets/loginFields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  @override
  void initState() {
    super.initState();
    Provider.of<InternetStatus>(context, listen: false).updateInternetStatus();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    // UserDataPref userDataPref = UserDataPref();
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: DrawClip2(),
                  child: Container(
                    width: size.width,
                    height: size.height * .785,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xffa58fd2),
                          Color(0xffddc3fc),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                ),
                ClipPath(
                  clipper: DrawClip(),
                  child: Container(
                    width: size.width,
                    height: size.height * .785,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xffddc3fc),
                          Color(0xff91c5fc),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Login",
                          style: GoogleFonts.ubuntu(
                            color: Colors.white,
                            fontSize: 35,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        //input textfields
                        input("Email", false),
                        input("Password", true),
                        SizedBox(
                          height: 20,
                        ),
                        MaterialButton(
                          onPressed: () {
                            SystemChannels.textInput
                                .invokeMethod('TextInput.hide');
                            if (validateAndSave()) {
                              Navigator.pushNamed(context, Constants.home);
                            } else {}
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 40.0,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xff6a74ce),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              height: 50.0,
                              child: Center(
                                child: Text(
                                  "Login",
                                  style: GoogleFonts.ubuntu(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            "Forgot your password?",
                            style: GoogleFonts.ubuntu(
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Center(
              child: Text(
                "Or connect with",
                style: GoogleFonts.ubuntu(
                  color: Colors.grey,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 20.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xff38a4ef),
                          offset: Offset(3.0, 3.0),
                          blurRadius: 15.0,
                          spreadRadius: 1.0,
                        ),
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(-3.0, -3.0),
                          blurRadius: 15.0,
                          spreadRadius: 1.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(
                        30.0,
                      ),
                      color: Color(0xff38a4ef),
                    ),
                    height: 40,
                    width: size.width * .4,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/facebook.png",
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            "Facebook",
                            style: GoogleFonts.ubuntu(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xff38a4ef),
                          offset: Offset(3.0, 3.0),
                          blurRadius: 15.0,
                          spreadRadius: 1.0,
                        ),
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(-3.0, -3.0),
                          blurRadius: 15.0,
                          spreadRadius: 1.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(
                        30.0,
                      ),
                      color: Color(0xff5172b4),
                    ),
                    height: 40,
                    width: size.width * .4,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/twitter.png",
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Twitter",
                            style: GoogleFonts.ubuntu(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have account?",
                  style: GoogleFonts.ubuntu(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    "Sign Up",
                    style: GoogleFonts.ubuntu(
                      color: Color(0xff5172b4),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
