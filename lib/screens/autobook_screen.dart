import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:my_autocare/autobook_controller/autocare_controller.dart';
import 'dart:math' as math;
import 'package:my_autocare/chat/chat_console.dart';
import 'package:my_autocare/main_model/autobook_model.dart';
import 'package:my_autocare/main_model/like_post_model.dart';
import 'package:my_autocare/shared_perferences/login_user_data.dart';
import 'package:http/http.dart' as http;
import 'package:video_player/video_player.dart';

class AutoBookScreen extends StatefulWidget {
  @override
  _AutoBookScreenState createState() => _AutoBookScreenState();
}

class _AutoBookScreenState extends State<AutoBookScreen> {

  AutobookModel autoBook;
  bool isloading=true;


  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  String utf8convert(String text) {
    List<int> bytes = text.toString().codeUnits;
    return utf8.decode(bytes);
  }


  getAutoBookData() async
  {
    AutobookController autoBookController=AutobookController();
    String userAuthId=await getUserAuth();
    print(userAuthId);
    autoBook=await autoBookController.getAutobookInfo(userAuthId);
    setState(() {
      isloading=false;
    });
  }


  //Show Like Button//
  LikePost lk;
  Future<LikePost> showLikeButton(String session_id,String post_id)async
  {
    var response=await http.post("http://myautocare.in/Socialmedia/mobile_api/like_post",
        body: {"session_id":session_id,"post_id":post_id});
    if(response.statusCode==200)
    {
      return likePostFromJson(response.body);
    }
    else
    {
        print("Error");
    }
  }

  //Show Like Button//
  Future<bool> repostButton(String session_id,String post_id)async
  {
    var response=await http.post("http://myautocare.in/Socialmedia/mobile_api/publication_repost",
        body: {"session_id":session_id,"post_id":post_id});
    if(response.statusCode==200)
    {
      print("Retweet");
      return true;
    }
    else
    {
      return false;
    }
  }




  @override
  void initState() {
    getAutoBookData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Text("Autobook",style: TextStyle(color: Colors.red,
            fontWeight: FontWeight.bold,
        fontSize: 24),),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.red
              ),
              child: IconButton(
                icon: Icon(Icons.search,color: Colors.white,),
                onPressed: (){},
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.red
              ),
              child: Transform.rotate(
                angle: 45 * math.pi / 180,
                child: Center(
                  child: IconButton(
                    icon: Icon(
                      Icons.navigation,
                      color: Colors.white,
                    ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatConsole()));
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: isloading?Center(child: CircularProgressIndicator()):
      ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: autoBook.data.feeds.length,
                itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 2, 0, 4),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                      ),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [

                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(100),
                                          color: Colors.white
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: CircleAvatar(
                                          radius: 35.0,
                                          backgroundImage: NetworkImage(
                                              autoBook.data.feeds[index].owner.avatar
                                          ),
                                        ),
                                      ),
                                    ),


                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: Text(utf8convert(autoBook.data.feeds[index].owner.name.toString()),
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17
                                            ),),
                                          ),


                                          Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: Text(autoBook.data.feeds[index].time,style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold
                                            ),),
                                          )
                                        ],
                                      ),
                                    )

                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: IconButton(icon: Icon(Icons.more_horiz,
                                  color: Colors.white,size: 35,),
                                    onPressed: ()async{
                                  String session_id=await getUserAuth();
                                      showBottom(context,session_id,autoBook.data.feeds[index].id.toString());
                                    }),
                              ),
                            ],
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(utf8convert(autoBook.data.feeds[index].text),style: TextStyle(
                              color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold,
                              fontFamily: '',
                            ),),
                          ),

                          autoBook.data.feeds[index].media.length==0?Container():
                          Container(
                            height: 150,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: autoBook.data.feeds[index].media.length,
                                itemBuilder: (context,index2)
                                {
                                  return autoBook.data.feeds[index].media[index2].type=="image"?
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: (){
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15.0)
                                        ),
                                        child: Image.network("${autoBook.data.feeds[index].media[index2].xImg}"),
                                      ),
                                    ),
                                  ):
                                  Stack(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: InkWell(
                                          onTap:(){
                                            },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(15.0)
                                            ),
                                            child: Image.network("${autoBook.data.feeds[index].media[index2].xImg}"),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                          top:10,
                                          right:10,
                                          child: Icon(Icons.videocam,
                                              color: Colors.white))
                                    ],
                                  );
                                }),
                          ),


                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("${autoBook.data.feeds[index].likesCount} Likes "
                                "${autoBook.data.feeds[index].replysCount} Comments",style:
                            TextStyle(color: Colors.white,
                                fontWeight: FontWeight.bold),),
                          ),
                          Container(
                            color: Colors.grey[700],
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    IconButton(icon:Icon(Icons.favorite,
                                        color:autoBook.data.feeds[index].hasLiked?Colors.deepOrangeAccent:
                                    Colors.white),
                                        onPressed:()async{
                                          String userAuth=await getUserAuth();
                                          print(autoBook.data.feeds[index].id);
                                          await showLikeButton(userAuth,autoBook.data.feeds[index].id.toString());
                                          await getAutoBookData();

                                        }),
                                    Text(autoBook.data.feeds[index].hasLiked?"UNLIKE":"LIKE",style:
                                    TextStyle(color:autoBook.data.feeds[index].hasLiked?Colors.deepOrangeAccent:Colors.white,
                                        fontWeight: FontWeight.bold)),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    IconButton(icon:Icon(Icons.comment,color: Colors.white),
                                        onPressed:(){}),
                                    Text("COMMENTS",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold))
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Row(
                                      children: [
                                        IconButton(icon:Icon(Icons.share,color: Colors.white),
                                            onPressed:(){}),
                                        Text("SHARE",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                                      ]
                                  ),
                                ),


                              ],
                            ),
                          )

                        ],
                      ),
                    ),
                  );
            })
    );
  }
}



Widget shortVideos()
{
  return Container(
    child: Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Short Videos",style: TextStyle(
                color: Colors.grey[700],fontWeight: FontWeight.bold,
                fontSize: 18
              ),),
            ),
          ],
        ),
        Container(
          height: 235,
          width: double.infinity,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 160,
                    height: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage("images/logos.png"),
                        fit: BoxFit.cover
                      )
                    ),
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(12, 0, 2, 0),
                          child: Text("Samvinod Sam",style: TextStyle(color: Colors.white,
                          fontWeight: FontWeight.bold),),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(12, 0, 2, 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.thumb_up,color: Colors.white,
                              size: 16,),
                              SizedBox(
                                width: 4,
                              ),
                              Text("20.3k",style: TextStyle(
                                color: Colors.white,fontWeight: FontWeight.bold
                              ),)
                            ],
                          ),
                        )

                      ],
                    ),
                  ),
                );
              }),
        )

      ],
    ),
  );
}

void showBottom(BuildContext context,String session_id,String postId) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              ListTile(
                onTap: (){

                },
                leading: Icon(Icons.keyboard_hide),
                title: Text("Hide Post"),
              ),
              ListTile(
                leading: Icon(Icons.edit),
                title: Text("Edit Post"),
              ),
            ],
          ),
        );
      });
}
