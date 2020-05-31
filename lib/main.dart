import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
 
ProgressDialog pr;
 
void main() {
  runApp(MaterialApp(
    home: FirstScreen(),
  ));
}
 
class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}
 
class _FirstScreenState extends State {
  ProgressDialog pr;
 
  @override
  Widget build(BuildContext context) {
    pr = new ProgressDialog(context);
    pr.style(
          message: 'processing',
          borderRadius: 8.0,
          backgroundColor: Colors.white,
          progressWidget: CircularProgressIndicator(),
          elevation: 8.0,
          insetAnimCurve: Curves.easeInOut,
          progress: 0.0,
          maxProgress: 100.0,
          progressTextStyle: TextStyle(
            color: Colors.white, fontSize: 13.0, fontWeight: FontWeight.w400),
          messageTextStyle: TextStyle(
            color: Colors.white, fontSize: 19.0, fontWeight: FontWeight.w600)
        );
 
    return Scaffold(
      appBar: AppBar(
          title: const Text('GeeksForGeeks'),
          backgroundColor: Colors.green,),
      body: Center(
        
        child: RaisedButton(
          child: Text('Click here..',
              style: TextStyle(color: Colors.white)),
          color: Colors.green,
          onPressed: () {
            pr.show();
            Future.delayed(Duration(seconds: 2)).then((value) {
              pr.hide().whenComplete(() {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => SecondScreen()));
              });
            });
          },
        ),
      ),
    );
  }
}
 
class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}
 
class _SecondScreenState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Back',
              style: TextStyle(color: Colors.white)),
          color: Colors.green,
        ),
      ),
    );
  }
}