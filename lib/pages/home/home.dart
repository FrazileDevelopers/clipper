import 'package:clipper/constants/constants.dart';
import 'package:clipper/provider/checkinternet.dart';
import 'package:clipper/validations/fzvalidations.dart';
import 'package:clipper/widgets/clip1.dart';
import 'package:clipper/widgets/clip2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
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
                    height: size.height * .5,
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
                    height: size.height * .5,
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
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 50.0,
                            vertical: 10.0,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: Colors.white,
                            ),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Name',
                                hintStyle: GoogleFonts.ubuntu(
                                  color: Colors.grey,
                                ),
                                contentPadding: EdgeInsets.only(
                                  top: 15.0,
                                  bottom: 15.0,
                                ),
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.grey,
                                ),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              onSaved: (val) => Constants.getname = val.trim(),
                              validator: (value) =>
                                  FzValidation.nameValidator(value),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        MaterialButton(
                          onPressed: () {
                            SystemChannels.textInput
                                .invokeMethod('TextInput.hide');
                            if (validateAndSave()) {
                              ///
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
                                  "Get User Details",
                                  style: GoogleFonts.ubuntu(
                                    color: Colors.white,
                                  ),
                                ),
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
    );
  }
}
