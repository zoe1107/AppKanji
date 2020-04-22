import 'package:demoappkanji/core/view_mode/loginModel.dart';
import 'package:demoappkanji/helper/generalinfor.dart';
import 'package:demoappkanji/helper/screenConfig.dart';
import 'package:demoappkanji/ui/HomePage.dart';
import 'package:demoappkanji/ui/SignUpPage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginPage_State();
  }
}

class _LoginPage_State extends State<LoginPage> {
  Map _loginmap = new Map();
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  TextEditingController _phone_number = TextEditingController();
  TextEditingController _pass = TextEditingController();

  String validatePass(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Trường này không được để trống";
    }
    return null;
  }

  String validateMobile(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Trường này không được để trống";
    }
    return null;
  }

  String validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Email is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Invalid Email";
    } else {
      return null;
    }
  }

  _sendToServer() {
    if (_key.currentState.validate()) {
      // No any error in validation
      _key.currentState.save();
//      print("Name $name");
//      print("Mobile $mobile");
//      print("Email $email");
    } else {
      // validation error
      setState(() {
        _validate = true;
      });
    }
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: new Text(value, textAlign: TextAlign.start),
        duration: Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      body: SingleChildScrollView(
        child: Consumer<LoginModel>(builder: (_, model, __) {
          return Form(
            key: _key,
            autovalidate: _validate,
//            onChanged: ,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: SizeConfig.safeBlockVertical * 40,
                      decoration: BoxDecoration(
                        color: colorApp,
                      ),
                      child: Image.asset(
                        'assets/LogoKanji.png',
                        cacheHeight: 200,
                      ),
                    ),
                    SizedBox(height: SizeConfig.safeBlockVertical * 2),
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          TextFormField(
                              style: TextStyle(fontSize: 20.0),
                              decoration: InputDecoration(
                                hintText: 'Email/ Số điện thoại',
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.only(left: 5),
                                hintStyle: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  color: Colors.grey[400],
                                  fontSize: 20,
                                ),
                              ),
                              autofocus: false,
                              keyboardType: TextInputType.phone,
//                            maxLength: 10,
                              validator: validateMobile,
                              onSaved: (String val) {
                                _phone_number.text = val.trim();
                              }),
                          SizedBox(
                            width: double.infinity,
                            height: SizeConfig.safeBlockVertical * 2,
                          ),
                          _buildBox('Mật khẩu', true),
                        ],
                      ),
                    ),
//
                    SizedBox(
                      height: 60,
                    ),
                    RaisedButton(
                      // onPressed: () {
                      //   if (_controller.text == '0123456789') {
                      //     Navigator.push(context,
                      //         MaterialPageRoute(builder: (context) => MyBottomNavigationBarStudent(0, 'name', 'status', 'id', 'subject', 'grade', 'form_teaching', 'lesson_per_week', 'time_per_lesson', 'student_per_class', 'address', 'tuition_fee', 'class_fee', 'about_course')));
                      //   } else if (_controller.text == '0123456788') {
                      //     Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) =>
                      //                 ClassDetailRequestDemo()));
                      //   }
                      onPressed: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));

//                        _sendToServer();
//
//                        _loginmap["phone_number"] = _phone_number.text;
//                        _loginmap["password"] = _pass.text;
//                        var loginSuccess1 = await model.login1(_loginmap);
////
//                        if (loginSuccess1) {
////                          Navigator.push(
////                            context,
////                            MaterialPageRoute(
////                              builder: (context) => ClassDetailRequestDemo()));
//                          Navigator.push(
//                              context,
//                              MaterialPageRoute(
//                                  builder: (context) => MyBottomNavigationBar()));
//
//                        }
//                        else {
//                          var _message = await model.Infor;
//                          showInSnackBar(_message);
//                        }
                      },
                      color: colorApp,
                      child: Container(
                        width: SizeConfig.safeBlockHorizontal * 40,
                        height: SizeConfig.safeBlockHorizontal * 10,
                        child: Center(
                          child: Text(
                            'Đăng Nhập',
                            style: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal * 5,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RaisedButton(
                      // onPressed: () {
                      //   if (_controller.text == '0123456789') {
                      //     Navigator.push(context,
                      //         MaterialPageRoute(builder: (context) => MyBottomNavigationBarStudent(0, 'name', 'status', 'id', 'subject', 'grade', 'form_teaching', 'lesson_per_week', 'time_per_lesson', 'student_per_class', 'address', 'tuition_fee', 'class_fee', 'about_course')));
                      //   } else if (_controller.text == '0123456788') {
                      //     Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) =>
                      //                 ClassDetailRequestDemo()));
                      //   }
                      onPressed: () async {

                        Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpPage()));
//                        _sendToServer();
//
//                        _loginmap["phone_number"] = _phone_number.text;
//                        _loginmap["password"] = _pass.text;
//                        var loginSuccess1 = await model.login1(_loginmap);
////
//                        if (loginSuccess1) {
////                          Navigator.push(
////                            context,
////                            MaterialPageRoute(
////                              builder: (context) => ClassDetailRequestDemo()));
//                          Navigator.push(
//                              context,
//                              MaterialPageRoute(
//                                  builder: (context) => MyBottomNavigationBar()));
//
//                        }
//                        else {
//                          var _message = await model.Infor;
//                          showInSnackBar(_message);
//                        }
                      },
                      color: Colors.red[700],
                      child: Container(
                        width: SizeConfig.safeBlockHorizontal * 40,
                        height: SizeConfig.safeBlockHorizontal * 10,
                        child: Center(
                          child: Text(
                            'Đăng Kí',
                            style: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal * 5,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _buildBox(String _a, bool _b) {
    return Consumer<LoginModel>(builder: (_, model, __) {
      return TextFormField(
          obscureText: model.count,
          style: TextStyle(fontSize: 20.0),
          decoration: InputDecoration(
              hintText: 'Mật khẩu',
              contentPadding: EdgeInsets.only(left: 5),
              border: OutlineInputBorder(),
              hintStyle: TextStyle(
//                fontFamily: 'HI',
                color: Colors.grey[400],
                fontSize: 20,
              ),
              suffixIcon: IconButton(
                icon: model.count
                    ? Icon(Icons.visibility_off)
                    : Icon(Icons.visibility),
                onPressed: () {
                  model.change();
//                  print(model.Count);
//                model.Count = !model.Count;
//                print(model.Count);
                },
              )),
          keyboardType: TextInputType.visiblePassword,
//                            maxLength: 10,
          validator: validatePass,
          onSaved: (String val) {
            _pass.text = val.trim();
          });
    });
  }
}
