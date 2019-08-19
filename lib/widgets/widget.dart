import 'package:joken_po/utils/imports.dart';


class textApp extends StatelessWidget {

  String text;


  textApp(this.text);

  Widget build (BuildContext context) {



    return new Text(
      text,

      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 20,
          fontWeight: FontWeight.bold
      ),
    );


  }

}