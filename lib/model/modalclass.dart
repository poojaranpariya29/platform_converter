import 'dart:io';

import 'package:flutter/material.dart';

class ModelClass {
  String? name;
  String? number;
  String? chat;
  File? Image;
  var Date;
  var Time;

  ModelClass(
      {required this.name,
      required this.number,
      required this.chat,
      required this.Image,
      this.Date,
      this.Time});
}
