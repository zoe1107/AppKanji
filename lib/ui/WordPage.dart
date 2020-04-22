import 'package:demoappkanji/core/view_mode/wordmodel.dart';
import 'package:demoappkanji/helper/generalinfor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'LikeWordPage.dart';

class WordPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WordPage_State();
  }
}

class _WordPage_State extends State<WordPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<WordModel>(
        builder: (_ ,model, __){
          return Scaffold(
            floatingActionButton: new FloatingActionButton(
              backgroundColor: colorApp,
              child: Icon(
                Icons.favorite,
                color: Colors.red,
                size: 35,
              ),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => LikeWordPage()));
              },
            ),
            appBar: AppBar(
              backgroundColor: colorApp,
              title: Text(
                '終',
                style: TextStyle(fontSize: 35),
              ),
              centerTitle: true,
//        actions: <Widget>[
//          IconButton(
//            icon: Icon(
//              Icons.favorite,
//              color: Colors.white,
//            ),
//            onPressed: () {
//              Navigator.push(context,
//                  MaterialPageRoute(builder: (context) => LikeWordPage()));
//            },
//          ),
//        ],
            ),
            body: ListView(
              children: <Widget>[
                Card(
                  child: Column(
                    children: <Widget>[
                      IconButton(
                        icon: model.Likeword ? Icon(Icons.favorite, color: Colors.pink,) : Icon(Icons.favorite, color: Colors.grey,) ,
                        onPressed: () {
                          model.change();
                        },
                      ),
                      _line('Kanji:', '終 - CHUNG'),
                      _lineColor(
                          'Kunyomi:', Colors.purple, 'おわる  おわる  おわる  おえる  つい  ついに'),
                      _lineColor('Onyomi:', Colors.red, 'シュウ'),
                      _line('Số nét:', '11'),
                      _line('JLPT:', '4'),
                      _line('Bộ:', '糸 MỊCH 冬 ĐÔNG'),
                      _line('Nghĩa:',
                          'Hết. Sau. Trọn. Chết. Kết cục. Một năm cũng gọi là chung. Đã. Đất vuông nghìn dặm gọi là chung.')
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Ví dụ phân loại theo cách đọc:',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        _tableKun(),
                        _tableOn(),
                        SizedBox(
                          height: 15,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }
    );
  }

  Widget _line(String _tieude, String _thongtin) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 15),
      child: Row(
        children: <Widget>[
          Container(
//          alignment: Alignment.center,
            padding: EdgeInsets.only(left: 5.0, bottom: 5.0),
            width: 85,
            color: Colors.grey[400],
            child: Text(
              _tieude,
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Text(
              _thongtin,
              style: TextStyle(fontSize: 20),
            ),
          )
        ],
      ),
    );
  }

  Widget _lineColor(
    String _tieude,
    Color _color,
    String _thongtin,
  ) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 15),
      child: Row(
        children: <Widget>[
          Container(
//          alignment: Alignment.center,
            padding: EdgeInsets.only(left: 5.0, bottom: 5.0),
            width: 85,
            color: Colors.grey[400],
            child: Text(
              _tieude,
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Text(
              _thongtin,
              style: TextStyle(fontSize: 20, color: _color),
            ),
          )
        ],
      ),
    );
  }

  Widget _tableKun() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        Container(
          padding: EdgeInsets.all(5.0),
          width: double.infinity,
          color: Colors.purple[200],
          child: Text(
            'Kunyomi',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          child: Table(
            border: TableBorder.all(color: Colors.grey),
            children: [
              TableRow(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _text_table('終る'),
                    _text_table('おわる'),
                  ],
                ),
                _text_table('CHUNG'),
                _text_table('Tới kết thúc'),
              ]),
              TableRow(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _text_table('終える'),
                    _text_table('おえる'),
                  ],
                ),
                _text_table('CHUNG'),
                _text_table('Hoàn thành'),
              ]),
              TableRow(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _text_table('書き終る'),
                    _text_table('かきおわる'),
                  ],
                ),
                _text_table('THƯ CHUNG	'),
                _text_table('Viết xong'),
              ]),
            ],
          ),
        ),
      ],
    );
  }

  Widget _tableOn() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        Container(
          padding: EdgeInsets.all(5.0),
          width: double.infinity,
          color: Colors.red[200],
          child: Text(
            'Onyomi',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          child: Table(
            border: TableBorder.all(color: Colors.grey),
            children: [
              TableRow(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _text_table('終夜'),
                    _text_table('しゅうや'),
                  ],
                ),
                _text_table('CHUNG DẠ	'),
                _text_table('Cả đêm'),
              ]),
              TableRow(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _text_table('終始する'),
                    _text_table('しゅうし'),
                  ],
                ),
                _text_table('CHUNG THỦY'),
                _text_table('Làm việc từ đầu đến cuối'),
              ]),
              TableRow(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _text_table('終期'),
                    _text_table('しゅうき'),
                  ],
                ),
                _text_table('CHUNG KÌ		'),
                _text_table('Sự kết thúc'),
              ]),
            ],
          ),
        ),
      ],
    );
  }

  Widget _text_table(String _text) {
    return Padding(
      padding: EdgeInsets.only(left: 5.0),
      child: Text(_text,
          style: TextStyle(
            fontSize: 18,
          )),
    );
  }
}
