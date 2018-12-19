import 'package:flutter/material.dart';

class Second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 平均分配
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // IconBadgeDemo(Icons.beach_access, size: 64),
          Stack(
            alignment: Alignment(-.8, -.8), //stack后云彩没有对齐,可以设置
            children: <Widget>[
              SizedBox(
                width: 200,
                height: 200,
                child: Container(
                  alignment: Alignment(0.8, 0.8), // 坐标轴最中心(0,0)
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(3, 23, 233, 1.0),
                      // borderRadius: BorderRadius.circular(5),
                      shape: BoxShape.rectangle,
                      gradient: LinearGradient(colors: [
                        Color.fromRGBO(7, 77, 177, 1.0),
                        Color.fromRGBO(3, 23, 233, 1.0)
                      ])),
                  child:
                      Icon(Icons.brightness_2, size: 32.0, color: Colors.white),
                ),
              ),
              SizedBox(
                height: 20, // 作用类似 <br>
              ),
              SizedBox(
                width: 50,
                height: 50,
                child: Container(
                    child: Icon(Icons.wb_cloudy, size: 32, color: Colors.white),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(50))),
              ),
              Positioned(
                child: Icon(Icons.wb_cloudy, size: 32, color: Colors.white),
                right: 20,
                top: 60, // 位置相对最大的部件
              ),
              Positioned(
                child: Icon(Icons.wb_cloudy, size: 32, color: Colors.white),
                right: 50,
                top: 120, // 位置相对最大的部件
              ),
              Positioned(
                child: Icon(Icons.wb_cloudy, size: 22, color: Colors.white),
                left: 60, // 位置相对最大的部件
                top: 20,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class IconBadgeDemo extends StatelessWidget {
  final IconData icon;
  final double size;
  IconBadgeDemo(this.icon, {this.size = 32.0});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(icon, size: size, color: Colors.white),
      width: size + 60,
      height: size + 60,
      color: Color.fromRGBO(3, 24, 233, 1.0),
    );
  }
}

class ContainerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Icon(Icons.pool, size: 50, color: Colors.white),
            padding: EdgeInsets.all(9),
            margin: EdgeInsets.all(15),
            width: 120,
            height: 120,
            decoration: BoxDecoration(
                color: Color.fromRGBO(3, 24, 233, 1.0),
                border: Border(
                    top: BorderSide(
                  color: Colors.indigoAccent[100],
                  width: 3,
                  style: BorderStyle.solid,
                ))),
          )
        ],
      ),
    );
  }
}

class RichTextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: 'hello world',
          style: TextStyle(
              fontStyle: FontStyle.italic, fontSize: 20, color: Colors.orange),
          children: [
            TextSpan(
              text: 'paprikaLang',
              style: TextStyle(fontSize: 15, color: Colors.orange[500]),
            )
          ]),
    );
  }
}

class CenterText extends StatelessWidget {
  final TextStyle _textStyle = TextStyle(fontWeight: FontWeight.bold);
  final String _author = 'tiyo';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'second container, $_author',
        style: _textStyle,
        maxLines: 3,
        overflow: TextOverflow.ellipsis, // 不够显示的文字用省略号代替
      ),
    );
  }
}
//  AspectRatio(
//   aspectRatio: 2.0 / 1.0,
//   child: Container(
//     width: 10,
//     height: 10,
//     color: Colors.white,
//   ),
// ),