import 'dart:io';
import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:flutter_absolute_path/flutter_absolute_path.dart';
import 'package:my_autocare/chat/controller/user_model_controller.dart';
import 'package:my_autocare/shared_perferences/login_user_data.dart';

class MultipleImageChat extends StatefulWidget {
  final typeMessage,otherUserAvatar,sessionId,otherUserId;
  MultipleImageChat({this.typeMessage,this.otherUserAvatar,this.sessionId,this.otherUserId});
  @override
  _MultipleImageChatState createState() => _MultipleImageChatState();
}

class _MultipleImageChatState extends State<MultipleImageChat> {
  List fileImageArrayMain;
  List<File> fileImageArray = [];
  int num=0;
  bool isLoading=true;

  ChatController c;

  TextEditingController commentImage=TextEditingController();

  getImages()async
  {
    fileImageArrayMain=await loadAssets();
    setState(() {
      isLoading=false;
    });
  }

  @override
  void initState()
  {
    c=ChatController();
    getImages();
    commentImage.text=widget.typeMessage;
    super.initState();
  }

  Future<List> loadAssets() async {

    List<Asset> assetArray = [];
    try {
      assetArray = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: true,
        selectedAssets:  assetArray ,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "",
          actionBarTitle: "ImagePicker",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    }
    on Exception catch (e) {
      print( e.toString());
    }

    for (int i = 0; i < assetArray.length; i++) {
      var path = await FlutterAbsolutePath.getAbsolutePath(assetArray[i].identifier);
      print(File(path));
      fileImageArray.add(File(path));

    }

    return fileImageArray;
  }
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title:Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(widget.otherUserAvatar),
              )
            ],
          ) ,
        ),
        body:isLoading?Center(child: CircularProgressIndicator()): Column(
          children:[
            Expanded(
              child: Container(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.file(fileImageArrayMain[num])),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
              padding: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.message),
                    iconSize: 25,
                    color: Theme.of(context).primaryColor,
                    onPressed: () {

                    },
                  ),
                  Expanded(
                    child: TextField(
                      controller: commentImage,
                      decoration: InputDecoration(
                        hintText: 'Give a Comment',
                        border: InputBorder.none,
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    iconSize: 25,
                    color: Theme.of(context).primaryColor,
                    onPressed: () async{
                      String session_id=await getUserAuth();
                      print(widget.otherUserId);
                     await c.getSentImageInfo(files:fileImageArrayMain,
                      sessionId:session_id,
                      otherUserId: widget.otherUserId,
                      message: commentImage.text);
                      Navigator.pop(context);

                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height:100,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount:fileImageArrayMain.length,
                    itemBuilder: (context,index){
                  return GestureDetector(
                    onTap: (){
                      setState(() {
                        num=index;
                      });
                    },
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.file(fileImageArrayMain[index])),
                      ));
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
