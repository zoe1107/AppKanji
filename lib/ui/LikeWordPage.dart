import 'package:demoappkanji/core/view_mode/likewordModel.dart';
import 'package:demoappkanji/core/view_mode/signupModel.dart';
import 'package:demoappkanji/helper/generalinfor.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';

import 'WordPage.dart';

class LikeWordPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _LikeWordPage();
  }
}

class _LikeWordPage extends State<LikeWordPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<LikeWordModel>(builder: (_ ,model, __){
      return Scaffold(
        appBar: AppBar(
//        leading: buildPreviousButton(),
          backgroundColor: colorApp,
          title: Text(
            'Từ vựng yêu thích',
          ),

          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                child: Container(
//                  padding: EdgeInsets.all(5.0),
//                        height: SizeConfig.blockSizeVertical*10,
                  child: ListTile(
                    leading: Text(
                      '終',
                      style: TextStyle(fontSize: 35),
                    ),
                    trailing: IconButton(
                        icon: model.Likeword
                            ? Icon(
                          Icons.favorite,
                          color: Colors.pink,
                        )
                            : Icon(Icons.favorite),
                        onPressed: () {
                          model.change();
                        }),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'kun: おわる  おわる  おわる  おえる  つい  ついに',
                          style: TextStyle(color: Colors.purple),
                        ),
                        Text('on: シュウ', style: TextStyle(color: Colors.red)),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WordPage()));
                    },
                  ),
                ),
              );
            }),

      );
    });
  }

}