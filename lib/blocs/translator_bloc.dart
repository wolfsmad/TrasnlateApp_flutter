import 'dart:async';
import 'package:translator/translator.dart';

import '../ui/screens/home/selectTranslate.dart';

class TranslatorBloc {
  String _google;
  String _translateDouble;



  TranslatorBloc() {

 
    _google = "";
    _translateDouble="";
  }
  final _controllerText = StreamController<String>();
  Stream<String> get streamTranslator => _controllerText.stream;

  final _controllerFromLang = StreamController<String>();
  Stream<String> get streamFromLang => _controllerFromLang.stream;

  final _controllerToLang = StreamController<String>();
  Stream<String> get streamToLang => _controllerToLang.stream;

   final _controllerDouble = StreamController<String>();
  Stream<String> get streamDouble => _controllerDouble.stream;

  void translator(String text) async {
    if (text == "Translating...") {
      _controllerText.add(text);
    } else if (text == "" || text.isEmpty || text.length == 0) {
      _controllerText.add("");
    } else {
      final translator = GoogleTranslator();
      if (text != null) {
        _google = await translator.translate(text,
            from: '$firstLang', to: '$secondLang');
        _translateDouble = await translator.translate(text,
            from: '$secondLang', to: '$firstLang');
        if (_google != null) {
          print("$_google");
          _controllerText.add(_google);
          _controllerDouble.add(_translateDouble);
        }
      }
    }
   
    
  }

  void fromLang(String fromLang) {
    firstLang = fromLang;
    _controllerFromLang.add(fromLang);
  }

  void toLang(String toLang) {
    secondLang = toLang;
    _controllerToLang.add(toLang);
  }
  void translateDouble(String translateDouble) {
    _translateDouble = translateDouble;
    _controllerToLang.add(translateDouble);
  }
}
