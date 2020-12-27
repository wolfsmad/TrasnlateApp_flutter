import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../util/responsive.dart';
import 'package:share/share.dart';
import 'package:clipboard_manager/clipboard_manager.dart';
import '../../screens/home/home_screen.dart';
class ResultStream extends StatelessWidget {
  final Stream<String> stream;

  const ResultStream({Key key, this.stream}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive _size = new Responsive(context);
    return StreamBuilder<String>(
      stream: stream,
      initialData: "",
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null && snapshot.data != "") {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 15.0),
            color: Colors.grey[700],
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(25.0),
                  width: _size.width(),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: 150
                    ),
                    
                                          child: SelectableText(
         "${snapshot.data}"
                      ,
                        enableInteractiveSelection: true,
                        showCursor: true,
                        cursorColor: Colors.white,
                       
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                  
                    ),
                  ),
              
             
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
