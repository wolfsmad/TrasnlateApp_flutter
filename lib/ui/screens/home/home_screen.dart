import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stream_transform/stream_transform.dart';
import '../../../blocs/translator_bloc.dart';
import '../../widgets/home/result_card.dart';
import '../../../util/responsive.dart';
import './selectTranslate.dart';

  bool change;
  bool translating;
  String doubleTrabslate;
  String fromLang;
  String toLang;
  var translatorBLoC = TranslatorBloc(  );
  Responsive _size;
  Stream<String> a;
  bool show = false;
  StreamController<String> _streamWritingController = StreamController();

 Container inputText = Container(
      height: 200,
      padding: const EdgeInsets.all(25.0),
      child: TextField(
        
        textAlign: TextAlign.center,
        minLines: 1,
        maxLines:15,
        textCapitalization: TextCapitalization.sentences,
        onChanged: (string) {
          if (string.length == 1) {
            translating = false;
            translatorBLoC.translator("Trasnlating...");
          } else if (string.length == 0) {
            translating = false;
            translatorBLoC.translator("");
          }
          _streamWritingController.add(string);
        },
        onSubmitted: (string) {
          translatorBLoC.translator(string);

        },
        autocorrect: false,
        style: TextStyle(fontSize: 16.0),
        decoration: InputDecoration.collapsed(hintText: "Created By Mohammad Akhlaghi"),
      ),
    );
 
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class MyIntent extends Intent {}

class _HomeScreenState extends State<HomeScreen> {

 

  @override
  void initState() {
    translating = false;
    final debounce = StreamTransformer<String, String>.fromBind(
        (s) => s.debounce(const Duration(milliseconds: 350)));

    debounce.bind(_streamWritingController.stream).listen((s) {
      print("print $s");
      translating = true;
      _translator(s);
    });

    _size = new Responsive(context);
    change = false;
 
    super.initState();
  }

  _translator(text) {
    if (translating) {
      translatorBLoC.translator(text);
    } else {
      translatorBLoC.translator("");
    }
  }
  final FocusNode _focusNode = FocusNode();
//  void _handleKeyEvent(RawKeyEvent event) {
//     setState(() {
//       if(event.logicalKey == LogicalKeyboardKey.shiftLeft);
      
//     });
//     }
  @override
  Widget build(BuildContext context) {
    
  
   

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
                    SelectTranslate(),

          Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
            ),
           
          ),
          SizedBox(
            height: _size.height() * 0.03,
          ),
          Card(
              
              margin: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Stack(
                children: <Widget>[
                  
                  inputText,
                ],
              ),
            ),
          SizedBox(
            height: _size.height() * 0.01,
          ),
          ResultStream(stream: translatorBLoC.streamTranslator),
          SizedBox(height:20),
          ResultStream(stream:translatorBLoC.streamDouble),
          SizedBox(height:20),
        
          Text('BZTE UNIVERSITY - SOFTWARE ENGIEERING 2020',style: GoogleFonts.architectsDaughter(textStyle:TextStyle(fontSize:20)))
        ],
      ),
    );
  }
}
