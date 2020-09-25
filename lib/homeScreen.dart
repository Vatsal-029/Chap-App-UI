import 'package:chat_app_ui/datasheet.dart';
import 'package:chat_app_ui/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        slivers: [
          SliverFixedExtentList(
            itemExtent: MediaQuery.of(context).size.height,
            delegate: SliverChildListDelegate(
              [
                Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blue[800], Hexcolor('edf2fb')],
                      begin: Alignment.topCenter,
                      end: Alignment.center,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile()));
                            },
                            icon: Icon(Icons.arrow_back, color: Colors.white,),
                          ),
                          IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.search, color: Colors.white,),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Discover', style: GoogleFonts.getFont('Noto Sans',
                              fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold,
                            ),),
                            Text('Show all', style: GoogleFonts.getFont('Noto Sans',
                                color: Colors.white
                            ),),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 200.0,
                        width: MediaQuery.of(context).size.width,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: dataset.map((info){
                            return Padding(
                              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                              child: Stack(
                                children: [
                                  Container(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image(
                                        image: NetworkImage(info.userImages),
                                        height: 160,
                                        width: 130,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 120, left:5),
                                    child: Text('${info.userNames}',
                                        textAlign: TextAlign.start ,
                                        style: GoogleFonts.getFont('Ubuntu',
                                          color: Colors.white, fontSize: 18,),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text('${dataset.length.toString()} Friends Online',
                          style: GoogleFonts.getFont('Roboto',
                          color: Colors.grey[600], fontSize: 15,),
                        ),
                      ),
                      Divider(),
                      Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            children: dataset.map((info) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 8, right: 2),
                                child: Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    Container(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image(image: NetworkImage(info.userImages),
                                          fit: BoxFit.cover,
                                          height: 50,
                                          width: 50,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(
                                        color: Hexcolor('02c39a'),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList()
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        child: Text('Recent Conversations', style: GoogleFonts.getFont('Roboto',
                          color: Colors.grey[600], fontSize: 15,
                        ),),
                      ),
                      Divider(),
                      Container(
                        height: 300,
                        width: MediaQuery.of(context).size.width,
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          children: dataset.map((msg) {
                            return Column(
                              children: [
                                Container(
                                  child: ListTile(
                                    leading: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image(image: NetworkImage(msg.userImages),
                                        height: 50, width: 50,
                                        fit: BoxFit.cover,),
                                    ),
                                    title: Text('${msg.userNames}',style: GoogleFonts.getFont('Noto Sans',
                                      color: Colors.black87, fontSize: 15,),
                                    ),
                                    subtitle: Text('${msg.userMsg}',style: GoogleFonts.getFont('Roboto',
                                      color: Colors.black45, fontSize: 12,),
                                    ),
                                    trailing: Icon(Icons.navigate_next, color: Colors.grey),
                                  ),
                                ),
                                Divider(),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ]
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 15, bottom: 25),
        child: FloatingActionButton(
          onPressed: (){},
          backgroundColor: Hexcolor('e05780'),
          child: Icon(Icons.message, color: Hexcolor('fadde1'),),
          elevation: 10,
        ),
      ),
    );
  }
}
