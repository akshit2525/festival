import 'dart:ffi';
import 'dart:io';
import 'dart:ui' as ui ;
import 'dart:typed_data';

import 'package:festival_app/uttils/festival_model.dart';
import 'package:festival_app/uttils/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:share_plus/share_plus.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  int i = 0, a = 0, image = 0;
  bool isvisible = true;
  bool italic = false;
  bool bold = false;
  GlobalKey globalKey = GlobalKey();
  Alignment txtAlign = Alignment.center;
  TextEditingController txtname = TextEditingController();
  double value = 15;

  @override
  Widget build(BuildContext context) {
    List<FestivalModel> l1 =
        ModalRoute.of(context)!.settings.arguments as List<FestivalModel>;

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        actions: [
          SizedBox(
            width: 30,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
          ),
          SizedBox(
            width: 40,
          ),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: TextField(
                      controller: Global.g1.txtname,
                      decoration: InputDecoration(
                        hintText: "Enter the Text",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Ok"))
                    ],
                  );
                },
              );
            },
            icon: Icon(Icons.text_fields_rounded),
          ),
          SizedBox(
            width: 40,
          ),
          IconButton(
            onPressed: () {
              saveImage();
            },
            icon: Icon(Icons.download),
          ),
          SizedBox(
            width: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(
              onPressed: ()  async {
                File file = await saveImage();
                await Share.shareXFiles([XFile(file.path)]);

              },
              icon: Icon(Icons.share_rounded),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      RepaintBoundary(
                        key: globalKey,
                        child: Stack(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.50,
                              width: MediaQuery.of(context).size.width * 1.00,
                              decoration: BoxDecoration(
                                color: Global.g1.colorList[i],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Visibility(
                                  visible: isvisible,
                                  child: Image.asset(
                                    "${l1[image].image}",
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            Container(
                              alignment: txtAlign,
                              child: SelectableText(
                                "${Global.g1.txtname.text}",
                                style: TextStyle(
                                  color: Global.g1.colorList[i],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 150,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: l1.length,
                          itemExtent: 160,
                          itemBuilder: (context, index) => Container(
                            margin: EdgeInsets.all(5),
                            height: MediaQuery.of(context).size.height * 0.2,
                            width: MediaQuery.of(context).size.width * 0.2,
                            color: Colors.red,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  isvisible = true;
                                  image = index;
                                });
                              },
                              child: Image.asset(
                                "${l1[index].image}",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 53,
                      ),
                      Container(
                        height: 130,
                        width: MediaQuery.of(context).size.width * 1.00,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10)),


                        child: Column(
                          children: [
                            Slider(
                              value: value,
                              activeColor: Colors.blue,
                              onChanged: (double s) {
                                setState(() {
                                  value = s;
                                });
                              },
                              divisions: 10,
                              min: 5,
                              max: 60,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isvisible = false;
                                      if (i < Global.g1.colorList.length - 1) {
                                        i++;
                                      } else {
                                        i = 3;
                                      }
                                    });
                                  },
                                  icon: Icon(Icons.palette),
                                ),

                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (a < Global.g1.colorList.length - 2) {
                                        a++;
                                      } else {
                                        a = 0;
                                      }
                                    });
                                  },
                                  icon: Icon(Icons.text_format_outlined),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      bold = !bold;
                                    });
                                  },
                                  icon: Icon(Icons.format_bold_sharp),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      italic = !italic;
                                    });
                                  },
                                  icon: Icon(Icons.format_italic_sharp),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
  Future<dynamic> saveImage() async {
    RenderRepaintBoundary boundary =
    globalKey.currentContext?.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    String imagepath =
    ("${DateTime.now().year}${DateTime.now().month}${DateTime.now().day}${DateTime.now().hour}${DateTime.now().minute}${DateTime.now().second}");
    return await File("/storage/emulated/0/Download/$imagepath.png")
        .writeAsBytes(byteData!.buffer.asUint8List());
  }
}
