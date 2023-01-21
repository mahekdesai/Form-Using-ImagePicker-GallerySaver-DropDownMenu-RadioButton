import 'package:flutter/material.dart';

const kPink =  Color(0xFFfc28b3);

const kBlue = Color(0xFF07e7f2);

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter Your Email',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kPink, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kBlue, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);