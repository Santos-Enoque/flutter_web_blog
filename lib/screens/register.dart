import 'package:blog/screens/home.dart';
import 'package:blog/screens/login.dart';
import 'package:flutter_web/material.dart';
import '../utils/boiler_plate.dart';
import '../db/user.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController passWord = TextEditingController();
  UserService _userService = UserService();
  bool isLoading = false;


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
                child: Image.network("https://disgusted-vapors.000webhostapp.com/cb.png", width: 100)
            ),
            Padding(padding: EdgeInsets.all(8),
              child: Container(
                width: 450,
                child: Padding(padding: EdgeInsets.all(0.0),
                  child: TextField(controller: userName,
                      decoration: InputDecoration(
                          labelText: "username"
                      )),),
              ),),

            Padding(padding: EdgeInsets.all(8),
              child: Container(
                width: 450,
                child: Padding(padding: EdgeInsets.all(0.0),
                  child: TextField(controller: email,
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
                      onPressed: (){
                        createUser();
                      },
//                      minWidth: MediaQuery.of(context).size.width,
                      child: Text(
                        "Create account",
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
                        chageScene(context, Login());
                      }, child: Text("Login", textAlign: TextAlign.center,style: TextStyle(color: Colors.grey)))
                  ),)

            )],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

//  THIS METHOD WILL STILL BE IMPROVED
  void createUser()async{
   Map<String, dynamic> user = await _userService.register(userName.text, email.text, passWord.text);
   if(user == null){
     print("there was an error");
   }else{
     _verificationAlert();
   }
  }


  void _verificationAlert() {
    var alert = new AlertDialog(
      content: ListTile(
        title: Text("Account created!"),
      ),
      actions: <Widget>[
        FlatButton(onPressed: (){
         chageScene(context, Home());
        }, child: Text('Yes')),
        FlatButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text('No')),

      ],
    );

    showDialog(context: context, builder: (_) => alert);
  }
}

