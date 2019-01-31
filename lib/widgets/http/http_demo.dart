import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class HttpDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(
        title: Text('http'),
        elevation: 0.0,
      ),
      body: HttpDemoHome(),
    ));
  }
}

class HttpDemoHome extends StatefulWidget {
  _HttpDemoHomeState createState() => _HttpDemoHomeState();
}

class _HttpDemoHomeState extends State<HttpDemoHome> {
  @override
  void initState() {
    super.initState();
    // fetchData();
    // final post = {'title': 'awesome blogs', 'description': 'save 200 words'};
    // final postJson = json.encode(post);
    // print(postJson);
    // final postMap = json.decode(postJson);
    // print(postMap);
    // print(postMap['title']);
    // print(postMap is Map);
    // final model = Post.fromJson(postMap);
    // print('title: ${model.title}');
    // print('tojson: ${json.encode(model)}'); //encode 自动调用 toJson
  }

  Future<List<Post>> fetchData() async {
    final response =
        await http.get('https://resources.ninghao.net/demo/posts.json');
    if (response.statusCode == 200) {
      final resMap = json.decode(response.body); //json -> map
      List<Post> posts =
          resMap['posts'].map<Post>((item) => Post.fromJson(item)).toList();
      return posts;
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        print('state: ${snapshot.connectionState}');
        print('data: ${snapshot.data}');
        if(snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Text('loading ... '),
          );
        }
        return ListView(
          children: snapshot.data.map<Widget>((item){
            return ListTile(
              title: Text(item.title),
              subtitle: Text(item.author),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(item.imageUrl),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

class Post {
  final int id;
  final String author;
  final String title;
  final String description;
  final String imageUrl;

  Post(this.title, this.description, this.id, this.author, this.imageUrl);
  Post.fromJson(Map json)
      : title = json['title'],
        description = json['description'],
        id = json['id'],
        author = json['author'],
        imageUrl = json['imageUrl'];
  Map toJson() => {
        'title': title,
        'description': description,
        'id': id,
        'author': author,
        'imageUrl': imageUrl
      };
}
