import 'package:clipper/constants/constants.dart';
import 'package:clipper/validations/fzvalidations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget input(String hint, bool pass) {
  return Padding(
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
          hintText: hint,
          hintStyle: GoogleFonts.ubuntu(
            color: Colors.grey,
          ),
          contentPadding: EdgeInsets.only(
            top: 15.0,
            bottom: 15.0,
          ),
          prefixIcon: pass
              ? Icon(
                  Icons.lock_outline,
                  color: Colors.grey,
                )
              : Icon(
                  Icons.person_outline,
                  color: Colors.grey,
                ),
          suffixIcon: pass
              ? null
              : Icon(
                  Icons.check_circle,
                  color: Colors.greenAccent,
                ),
          border: UnderlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
        onSaved: (val) => pass
            ? Constants.loginpassword = val.trim()
            : Constants.loginemail = val.trim(),
        validator: (value) => pass
            ? FzValidation.passwordValidator(value)
            : FzValidation.emailValidator(value),
      ),
    ),
  );
}
