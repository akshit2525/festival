import 'package:festival_app/models/category_model.dart';
import 'package:festival_app/uttils/festival_model.dart';
import 'package:flutter/material.dart';

import '../uttils/global.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void initState() {
    super.initState();

    Global.g1.imgList.map((e) {
      FestivalModel f1 = FestivalModel.frommap(e);
      Global.g1.modelList.add(f1);
    }).toList();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: const Text("Festival studio"),
        centerTitle: true,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisExtent: 240),
        itemCount: Global.g1.categoryList.length,
        itemBuilder: (context, index) {
          return containerTile(Global.g1.categoryList[index]);
          // return containerTile(Global.g1.categoryList [index]);
        },
      ),
    ));
  }

  Container containerTile(categoryModel c1) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // color: c1.color,
      ),
      margin: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: (){
          List<FestivalModel>l1=[];
          Global.g1.festivalname=c1.name;
          for(
          var x in Global.g1.modelList){
            if(x.name==c1.name){
              l1.add(x);
            }
          }
          Navigator.pushNamed(context, 'edit',arguments: l1);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "${c1.name}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                '${c1.image}',
                height: 150,
                width: 150,
              ),
            ),
          ],
        ),
      ),
    );
  }
}