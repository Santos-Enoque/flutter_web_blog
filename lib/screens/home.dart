import 'package:flutter_web/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, dynamic>> posts = [];
  final PublishSubject subject = PublishSubject<String>();

  @override
  void dispose() {
    subject.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    getPosts();
//   subject.stream.debounce(Duration(milliseconds: 400)).listen(getPosts);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text("Home"),
          elevation: 0.0,

        actions: [
         Padding(
           padding: EdgeInsets.all(8.0),
           child:  FlatButton(
               onPressed: (){},
               child: Text("Create posts")
           )
         ),

         Padding(
             padding: EdgeInsets.all(8.0),
             child:  FlatButton(
                 onPressed: (){},
                 child: Text("Edit posts")
             )
         ),

         Padding(
             padding: EdgeInsets.all(8.0),
             child:  FlatButton(
                 onPressed: (){},
                 child: Text("Delete post")
             )
         ),
        ]
      ),
      drawer: Drawer(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            title: Text("My blog"),
            backgroundColor: Colors.pink
          ),
          body: Column(
            children: <Widget>[
              ListTile(title: Text("Dashboard")),
              ListTile(title: Text("Manage users")),
              ListTile(title: Text("Manage posts")),
              ListTile(title: Text("Log out")),

            ]
          )
        )
      ),

      body: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, int index){
        return    Container(
            width: 400,
            alignment: Alignment.center,
            child: Padding(padding: EdgeInsets.only(left: 100, right: 100),
                child: Card(
                    child: ExpansionTile(title: ListTile(title: Image.network(posts[index]["post_url"]),
                        subtitle: Text(posts[index]["post_header"], style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold))),
                        children: [
                          Padding(padding: EdgeInsets.all(12),
                          child: Text(posts[index]["post_body"])),
                        ])
                ))
        );
      })
    );
  }

  void getPosts() {
    http
        .get(
        'https://disgusted-vapors.000webhostapp.com/get.php')
        .then((res) => (res.body))
        .then(json.decode)
        .then((map) => map)
        .then((post) => post.forEach(addPost));
//      still have to define on error

  }

  void addPost(item) {
    setState(() {
      posts.add(item);
    });
  }
}
