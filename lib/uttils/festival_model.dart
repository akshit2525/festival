import 'dart:ui';

import 'package:flutter/foundation.dart';

class FestivalModel {
  String? image,name;

  FestivalModel({this.image,this.name});

 factory FestivalModel.frommap(Map m1){
    FestivalModel f1 = FestivalModel(
      image: m1['image'],
      name : m1['name'],
    );
    return f1;
  }
}
