import 'package:demoappkanji/core/view_mode/signupModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'core/view_mode/homeModel.dart';
import 'core/view_mode/likewordModel.dart';
import 'core/view_mode/loginModel.dart';
import 'core/view_mode/wordmodel.dart';

List<SingleChildCloneableWidget> getProviders() {
  List<SingleChildCloneableWidget> independentServices = [
    ChangeNotifierProvider(
      create: (context) => LoginModel(),
    ),
ChangeNotifierProvider(
      create: (context) => SignUpModel(),
    ),
ChangeNotifierProvider(
      create: (context) => HomeModel(),
    ),
ChangeNotifierProvider(
      create: (context) => WordModel(),
    ),
ChangeNotifierProvider(
      create: (context) => LikeWordModel(),
    ),

  ];

//  List<SingleChildCloneableWidget> dependentServices = [
//    ChangeNotifierProxyProvider<AuthenticationService, SignInModel>(
//      update: (_, authenticationService, __) =>
//          SignInModel(authenticationService: authenticationService),
//    ),
//
//  ];

  List<SingleChildCloneableWidget> providers = [
    ...independentServices,
//    ...dependentServices,
//     ...uiConsumableProviders
  ];

  return providers;
}
