import 'package:chat_app_ui/datasheet.dart';
import 'package:chat_app_ui/homeScreen.dart';
import 'package:chat_app_ui/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue[800] ,Hexcolor('edf2fb')],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child:Column(
          children: [
            SizedBox(height: 30,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                  },
                  icon: Icon(Icons.arrow_back, color: Colors.white,),
                ),
                SizedBox(width: 200,),
                IconButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatApp()));
                  },
                  icon: Icon(Icons.launch, color: Colors.white,),
                ),
                IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.short_text, color: Colors.white,),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image(image: NetworkImage('https://images.pexels.com/photos/1239291/pexels-photo-1239291.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260'),
                    fit: BoxFit.cover, height: 100, width: 60,
                  ),
                ),
                title: Text('Rachael Marlo',
                  style: GoogleFonts.getFont('Noto Sans', color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold) ,),
                subtitle: Text('Life is good and so am I',
                  style: GoogleFonts.getFont('Noto Sans', color: Colors.white60,) ,),
              ),
            ),
            SizedBox(height: 10,),
            Stack(
              children: [
                Container(
                  height: 550,
                  width: MediaQuery.of(context).size.width,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, top: 70),
                  child: Container(
                    height: 480,
                    width: 350,
                    decoration: BoxDecoration(
                      color: Hexcolor('e6f2ff'),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 250, top: 50),
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Hexcolor('ff7aa2'),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(Icons.create, color: Hexcolor('ffe0e9'), size: 30,),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 80, top: 90),
                  child: Text('My Posts', style: GoogleFonts.getFont('Poppins',
                    fontSize: 30, color: Hexcolor('3a0ca3'), fontWeight: FontWeight.bold,
                  ),),
                ),
                Container(
                  height: 520,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: dataset.map((i){
                      return Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10, top: 150, right: 10) ,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image(image: NetworkImage(i.userImages),
                                fit: BoxFit.cover, height: 290, width: 220,
                              ),
                            ),
                          ),
                          Container(
                            width: 220,
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            margin: EdgeInsets.only(left: 10, top: 400, right: 10) ,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                              child: Text('${i.userNames}', style: GoogleFonts.getFont('Poppins',
                                fontSize: 25, color: Hexcolor('3c096c'),),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 150, top: 470),
                            child: IconButton(
                                onPressed: (){},
                                enableFeedback: true,
                                highlightColor: Colors.blueAccent,
                                icon: Icon(Icons.thumb_up, color: Colors.black26,)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 190, top: 485),
                            child: Text('100', style: TextStyle(color: Colors.black26),),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ],
        ),
      )
    );
  }
}
