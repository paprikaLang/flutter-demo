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
    final post = {'title': 'awesome blogs', 'body': 'save 200 words'};
    final postJson = json.encode(post);
    print(postJson);
    final postMap = json.decode(postJson);
    print(postMap);
    print(postMap['title']);
    print(postMap is Map);
    final model = Post.fromJson(postMap);
    print('title: ${model.title}');
    print('tojson: ${json.encode(model)}'); //encode 自动调用 toJson
  }

  fetchData() async {
    final response =
        await http.get('https://resources.ninghao.net/demo/posts.json');
    print('statuscode: ${response.statusCode}');
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Post {
  final String title;
  final String body;
  Post(this.title, this.body);
  Post.fromJson(Map json)
      : title = json['title'],
        body = json['body'];
  Map toJson() => {'title': title, 'body': body};
}
