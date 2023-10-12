import 'package:festival_app/uttils/festival_model.dart';
import 'package:flutter/material.dart';
import '../models/category_model.dart';

class Global {
  static Global g1 = Global();


  List<categoryModel> categoryList = [

    categoryModel(
        name: "Uttrayan",
        image: "assets/image/uttrayan.png",),

    categoryModel(
        name: "Shivratri",
        image: "assets/image/shivratri.png",),

    categoryModel(
        name: "Holi",
        image: "assets/image/holi.png",),

    categoryModel(
        name: "Rakshabandhan",
        image: "assets/image/rakshabandhan.png",),

    categoryModel(
        name: "Janmashtami",
        image: "assets/image/janmashtami.png",),

    categoryModel(
        name: "Ganesha",
        image: "assets/image/ganesha.png",),

    categoryModel(
        name: "Navratri",
        image: "assets/image/navratri.png",),

    categoryModel(
        name: "Diwali",
        image: "assets/image/diwali.png",),

    categoryModel(
        name: "New Year",
        image: "assets/image/newyear.png",),

    categoryModel(
        name: "Natal",
        image: "assets/image/natal.png",),

  ];


  List<Color> colorList = [
    Colors.black,
    Colors.white,
    ...Colors.primaries,
  ];

  List imageList = [
    "diwali.jpg",
    "ganesha.jpg",
    "holi.jpg",
    "janmashtami.jpg",
    "natal.jpg",
    "newyeaar.jpg",
    "rakshabandhan.jpg",
    "shivratri.jpg",
    "navratri.jpg",
    "uttrayan.jpg",
  ];

  List<Map>imgList=[
    {"image" : "assets/image/bg/uttryan1.jpeg","name" : "Uttrayan",},
    {"image" : "assets/image/bg/uttryan2.png","name" : "Uttrayan",},
    {"image" : "assets/image/bg/uttryan3.jpg","name" : "Uttrayan",},

    {"image" : "assets/image/bg/holi.jpg","name" : "Holi"},
    {"image" : "assets/image/bg/holi1.jpg","name" : "Holi"},
    {"image" : "assets/image/bg/holi2.jpg","name" : "Holi"},
    {"image" : "assets/image/bg/holi3.jpeg","name" : "Holi"},

    {"image" : "assets/image/bg/shivratri.jpg","name" : "Shivratri"},
    {"image" : "assets/image/bg/shivratri1.jpg","name" : "Shivratri"},
    {"image" : "assets/image/bg/shivratri2.jpg","name" : "Shivratri"},
    {"image" : "assets/image/bg/shivratri3.jpg","name" : "Shivratri"},

    {"image" : "assets/image/bg/rakshabandhan.jpg","name" : "Rakshabandhan"},
    {"image" : "assets/image/bg/raksha1.jpg","name" : "Rakshabandhan"},
    {"image" : "assets/image/bg/raksha2.jpg","name" : "Rakshabandhan"},
    {"image" : "assets/image/bg/raksha3.jpg","name" : "Rakshabandhan"},

    {"image" : "assets/image/bg/janmashtami.jpg","name" : "Janmashtami"},
    {"image" : "assets/image/bg/janmashtami2.jpg","name" : "Janmashtami"},
    {"image" : "assets/image/bg/janmashtami3.jpg","name" : "Janmashtami"},

    {"image" : "assets/image/bg/ganesha.jpg","name" : "Ganesha chaturthi"},
    {"image" : "assets/image/bg/ganesha1.jpeg","name" : "Ganesha chaturthi"},
    {"image" : "assets/image/bg/ganesha2.jpg","name" : "Ganesha chaturthi"},
    {"image" : "assets/image/bg/ganesha3.jpg","name" : "Ganesha chaturthi"},

    {"image" : "assets/image/bg/navratri.jpg","name" : "Navratri"},
    {"image" : "assets/image/bg/navratri1.jpeg","name" : "Navratri"},
    {"image" : "assets/image/bg/navratri2.jpg","name" : "Navratri"},
    {"image" : "assets/image/bg/navratri3.jpg","name" : "Navratri"},

    {"image" : "assets/image/bg/diwali.jpg","name" : "Diwali"},
    {"image" : "assets/image/bg/diwali1.jpeg","name" : "Diwali"},
    {"image" : "assets/image/bg/diwali2.jpg","name" : "Diwali"},
    {"image" : "assets/image/bg/diwali3.jpg","name" : "Diwali"},

    {"image" : "assets/image/bg/newyeaar.jpg","name" : "New Year"},
    {"image" : "assets/image/bg/newyear1.jpeg","name" : "New Year"},
    {"image" : "assets/image/bg/newyear2.jpeg","name" : "New Year"},
    {"image" : "assets/image/bg/newyear3.jpg","name" : "New Year"},

    {"image" : "assets/image/bg/natal.jpg","name" : "Natal"},
    {"image" : "assets/image/bg/natal1.jpeg","name" : "Natal"},
    {"image" : "assets/image/bg/natal2.jpg","name" : "Natal"},
    {"image" : "assets/image/bg/natal3.jpg","name" : "Natal"},


  ];
   List<FestivalModel> modelList = [];
  String? festivalname;
  TextEditingController txtname = TextEditingController();

}