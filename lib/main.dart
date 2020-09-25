import 'package:chat_app_ui/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';



void main() {runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: ChatApp()));
}

class ChatApp extends StatefulWidget {
  @override
  _ChatAppState createState() => _ChatAppState();
}

class _ChatAppState extends State<ChatApp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text('Enter using Credentials', style: GoogleFonts.getFont('Noto Sans',
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold,
              ),),
              floating: true,
              expandedHeight: 250,
              centerTitle: true,
              flexibleSpace: Container(
                height: 250,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Hexcolor('202d6e') ,Colors.blue[800]],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: IconButton(
                  onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen())),
                  icon: Icon(Icons.whatshot, color: Colors.white, size: 50,),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
              Container(
              height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue[800] ,Hexcolor('edf2fb')],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  children: [
                    Text('OR', style: GoogleFonts.getFont('Noto Sans',
                      fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold,
                    ),),
                    SizedBox(height: 160,),
                    Text('Guest', style: GoogleFonts.getFont('Noto Sans',
                      fontSize: 45, color: Colors.white, fontWeight: FontWeight.bold,
                    ),),
                    Text('Scroll up and click the home icon', style: GoogleFonts.getFont('Noto Sans',
                      fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold,
                    ),),
                    SizedBox(height: 300,),
                    FloatingActionButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                      },
                      backgroundColor: Hexcolor('e05780'),
                      child: Icon(Icons.home, color: Hexcolor('ffe0e9'),),
                      elevation: 10,
                    ),
                  ],
                ),
              ),
                ]
              ),
            ),
          ],
        ),
        // floatingActionButton: Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 135, vertical: 50),
        //   child: FloatingActionButton(
        //     onPressed: (){
        //       Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
        //     },
        //     backgroundColor: Hexcolor('e05780'),
        //     child: Icon(Icons.home, color: Hexcolor('ffe0e9'),),
        //     elevation: 10,
        //   ),
        // ),
      ),
    );
  }
}
