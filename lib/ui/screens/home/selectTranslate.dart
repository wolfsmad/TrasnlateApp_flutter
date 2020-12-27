import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


List<Map> _items = [
  
    {
      "value": 'en',
      "text": 'English'
    },
    {
      "value": 'fa',
      "text": 'Persian'
    },
     {
      "value": 'de',
      "text": 'German'
    },
    
      {
      "value": 'af',
      "text": 'Afrika'
    },
      {
      "value": 'es',
      "text": 'Spanish'
    },
    {
      "value": 'fr',
      "text": 'French'
    },
    {
      "value": 'ar',
      "text": 'Arabia'
    },
      {
      "value": 'ja',
      "text": 'Japan'
    },
      
    
    {
      "value": 'pt',
      "text": 'Portugal'
    },
     {
      "value": 'pl',
      "text": 'Polish'
    },
    
        {
      "value": 'it',
      "text": 'Italy'
    },
       {
      "value": 'ro',
      "text": 'Romanian'
    },
       {
      "value": 'ru',
      "text": 'Russian'
    },
        {
      "value": 'th',
      "text": 'Thailand'
    },
        {
      "value": 'sv',
      "text": 'Swedish'
    },
         {
      "value": 'ko',
      "text": 'Korean'
    },
        {
      "value": 'tr',
      "text": 'Turkey'
    },
  ];

  String firstLang;
  String secondLang;
class SelectTranslate extends StatefulWidget {
  @override
  _SelectTranslate createState() => _SelectTranslate();
}

class _SelectTranslate extends State<SelectTranslate> {

// a simple usage




  @override
  Widget build(BuildContext context) {
    return  
       Column(
     
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'From Language',style: GoogleFonts.architectsDaughter(textStyle:TextStyle(fontSize:20)),
                ),
              SizedBox(width: 15,),
                DropdownButton(
                  disabledHint: firstLang != null
                    ? Text(_items.firstWhere((item) => item["value"] == firstLang)["text"])
                    : null,
                  items: _items.map((item) => DropdownMenuItem(
                    value: item["value"],
                    child: Text(item["text"],style: GoogleFonts.architectsDaughter(textStyle:TextStyle(fontSize:20))),
                  )).toList(),
                  onChanged:  (v) => setState(() {
                      firstLang = v;
                    })
                    ,
                  value: firstLang,
                ), 
              
                Text(
                  'To Language',style: GoogleFonts.architectsDaughter(textStyle:TextStyle(fontSize:20))
                ),
                            SizedBox(width: 15,),

                DropdownButton(
                  disabledHint: secondLang != null
                    ? Text(_items.firstWhere((item) => item["value"] == secondLang)["text"])
                    : null,
                  items: _items.map((item) => DropdownMenuItem(
                    
                    value: item["value"],
                    child: Text(item["text"],style: GoogleFonts.architectsDaughter(textStyle:TextStyle(fontSize:20))),
                  )).toList(),
                  onChanged:  (v2) => setState(() {
                      secondLang = v2;
                    })
                    ,
                  value: secondLang,
                )
              ],
            ),
            
          ],
       );
     
  }
}
