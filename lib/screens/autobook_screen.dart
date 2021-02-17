import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:my_autocare/chat/chat_console.dart';

class AutoBookScreen extends StatefulWidget {
  @override
  _AutoBookScreenState createState() => _AutoBookScreenState();
}

class _AutoBookScreenState extends State<AutoBookScreen> {
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
      body: SingleChildScrollView(
        child: Container(
        child:Column(
          children: [
            autobookInfo(),
            autobookInfo(),
            shortVideos()
          ],
        )
        ),
      ),

    );
  }
}

Widget autobookInfo()
{
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 2, 0, 4),
    child: Container(
      color: Colors.black,
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
                          backgroundImage: AssetImage("images/logos.png"),
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
                            child: Text("Samvinod",style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17
                            ),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text("12:00 pm",style: TextStyle(
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
                child: IconButton(icon: Icon(Icons.more_horiz,color: Colors.white,size: 35,), onPressed: (){}),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Flexible Coworking space for startups",style: TextStyle(
              color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold
            ),),
          ),
          Container(
            height: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/img.jpg"),
                fit: BoxFit.cover
              )
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("${0} Likes ${0} Comments",style:
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
                    IconButton(icon:Icon(Icons.favorite,color: Colors.white),
                        onPressed:(){}),
                    Text("LIKE",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
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