import 'package:blog/screens/register.dart';
import 'package:flutter_web/material.dart';
import '../utils/boiler_plate.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController passWord = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.pink,
        title: Text("My blog")
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(padding: EdgeInsets.all(10),
                child: Image.network("https://disgusted-vapors.000webhostapp.com/login.png", width: 100)
            ),

            Padding(padding: EdgeInsets.all(8),
              child: Container(
                width: 450,
                child: Padding(padding: EdgeInsets.all(0.0),
                  child: TextField(controller: userName,
                      decoration: InputDecoration(
                          labelText: "email"
                      )),),
              ),),

            Padding(padding: EdgeInsets.all(8),
              child: Container(
                width: 450,
                child: Padding(padding: EdgeInsets.all(0.0),
                  child: TextField(controller: passWord,
                      decoration: InputDecoration(
                          labelText: "password"
                      )),),
              ),),

            Container(
              width: 450,
              child: Padding(
                padding:
                const EdgeInsets.all(0),
                child: Material(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.pink,
                    elevation: 0.0,
                    child: MaterialButton(
                      onPressed: (){},
//                      minWidth: MediaQuery.of(context).size.width,
                      child: Text(
                        "Login",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                    )),
              ),
            ),

            Padding(padding: EdgeInsets.all(8),
                child: Container(
                  width: 450,
                  child: Padding(padding: EdgeInsets.all(0.0),
                      child: FlatButton(onPressed: (){
                        chageScene(context, Register());
                      }, child: Text("create account", textAlign: TextAlign.center,style: TextStyle(color: Colors.grey)))
                  ),)

            )],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
