import 'package:demoappkanji/core/view_mode/homeModel.dart';
import 'package:demoappkanji/helper/generalinfor.dart';
import 'package:demoappkanji/helper/screenConfig.dart';
import 'package:demoappkanji/ui/LikeWordPage.dart';
import 'package:demoappkanji/ui/LoginPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'WordPage.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePage_State();
  }
}

class _HomePage_State extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    SizeConfig().init(context);
//    return Scaffold(
//      appBar: AppBar(
//        automaticallyImplyLeading: false,
//        actions: <Widget>[
//          IconButton(
//            icon: Icon(
//              Icons.favorite,
//              color: Colors.white,
//            ),
//            onPressed: () {},
//          ),
//        ],
////        leading: buildPreviousButton(),
//        backgroundColor: colorApp,
//        title: Text(
//          'Tra cứu',
//        ),
//
//        centerTitle: true,
//      ),
//      body: Column(
//        children: <Widget>[
//          Container(
////            color: Colors.pink,
//            padding: EdgeInsets.only(right: 10.0, left: 10.0),
//            height: SizeConfig.safeBlockVertical * 10,
////            child: Card(
//
//            child: TextField(
//              textAlign: TextAlign.start,
//              style: TextStyle(fontSize: 25.0),
//              decoration: InputDecoration(
//                  icon: Icon(
//                    Icons.collections,
//                    size: 45,
//                    color: colorApp,
//                  ),
//                  hintText: '終，chung',
//                  border: InputBorder.none,
//                  hintStyle: TextStyle(
//                      color: Colors.grey,
//                      fontSize: 25,
//                      fontStyle: FontStyle.normal),
//                  suffixIcon: IconButton(
//                      icon: Icon(
//                        Icons.search,
//                        color: colorApp,
//                        size: 27,
//                      ),
//                      onPressed: () {})),
//            ),
////decoration: BoxDecoration(
////  border: Border.all(width: 1.0),
////  borderRadius: BorderRadius.circular(20),
////),
////            ),
//          ),
//        ],
//      ),
//    );

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
      body: Consumer<HomeModel>(builder: (_, model, __) {
        return NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                automaticallyImplyLeading: false,
                backgroundColor: colorApp,
                expandedHeight: 40,
//              floating: false,
                pinned: true,
                flexibleSpace: AppBar(
                  automaticallyImplyLeading: false,
                  actions: <Widget>[
                    IconButton(
                        icon: Icon(
                          Icons.exit_to_app,
                          size: 35,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        }),
                  ],
//                      actions: <Widget>[
//                        IconButton(
//                          icon: Icon(
//                            Icons.favorite,
//                            color: Colors.white,
//                          ),
//                          onPressed: () {
//                            Navigator.push(
//                                context,
//                                MaterialPageRoute(
//                                    builder: (context) => LikeWordPage()));
//                          },
//                        ),
//                      ],
//        leading: buildPreviousButton(),
                  backgroundColor: colorApp,
                  title: Text(
                    'Tra cứu',
                  ),

                  centerTitle: true,
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverAppBarDelegate(
                    child: PreferredSize(
                  preferredSize: Size.fromHeight(65),
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.only(right: 10.0, left: 10.0),
                    height: SizeConfig.safeBlockVertical * 15,
//            child: Card(

                    child: TextField(
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 25.0),
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.collections,
                            size: 45,
                            color: colorApp,
                          ),
                          hintText: '終，chung',
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 25,
                              fontStyle: FontStyle.normal),
                          suffixIcon: IconButton(
                              icon: Icon(
                                Icons.search,
                                color: colorApp,
                                size: 27,
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LikeWordPage()));
                              })),
                    ),
//decoration: BoxDecoration(
//  border: Border.all(width: 1.0),
//  borderRadius: BorderRadius.circular(20),
//),
//            ),
                  ),
                )),
              )
            ];
          },
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
      }),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final PreferredSize child;

  _SliverAppBarDelegate({this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return child;
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => child.preferredSize.height;

  @override
  // TODO: implement minExtent
  double get minExtent => child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return false;
  }
}
