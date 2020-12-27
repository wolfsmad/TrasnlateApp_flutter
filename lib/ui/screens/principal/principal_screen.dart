
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../home/home_screen.dart';


class PrincipalScreen extends StatefulWidget {
  @override
  _PrincipalScreenState createState() => _PrincipalScreenState();
}

class _PrincipalScreenState extends State<PrincipalScreen> {
  int _selectedIndex;
  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
   
  ];
 
 

  @override
  void initState() {
    _selectedIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[700],
        centerTitle: true,
        title: Text("Type To Trasnlate",style: GoogleFonts.architectsDaughter(textStyle:TextStyle(fontSize:29))),
      ),
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          
          children: _widgetOptions,
        ),
      ),
   
    );
  }
}
