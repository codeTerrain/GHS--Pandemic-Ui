import 'package:flutter/material.dart';
import 'package:ghspandemic/core/services/navigation_service.dart';
import 'package:ghspandemic/core/services/validations.dart';
import 'package:ghspandemic/ui/shared/Routes.dart';
import 'package:ghspandemic/ui/shared/spacing.dart';
import 'package:ghspandemic/ui/shared/style.dart';
import 'package:ghspandemic/ui/widgets/Button.dart';
import 'package:ghspandemic/ui/widgets/RoundedTextformfield.dart';

import '../../locator.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final NavigationService navigationService = locator<NavigationService>();
  FocusNode myFocusNode;
  String password, email;

  bool isOffline = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double spacing = MediaQuery.of(context).viewPadding.top;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            IgnorePointer(
              ignoring: false,
              child: Center(
                child: Container(
                  width: size.width / 1.4,
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: spacing,
                      ),
                      UiSpacing.verticalSpacingMedium(),
                      Image.asset(
                        'assets/images/ghslogo.jpg',
                        scale: 0.1,
                      ),
                      UiSpacing.verticalSpacingLarge(),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '  Sign In',
                          style: Theme.of(context).textTheme.display2,
                        ),
                      ),
                      UiSpacing.verticalSpacingTiny(),
                      Form(
                        key: _formKey,
                        //autovalidate: _autoValidate,
                        child: Center(
                          child: Container(
                            width: size.width / 1.4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                RoundedTextformfield(
                                    onChanged: (value) {
                                      email = value;
                                    },
                                    icon: Icons.person,
                                    labelText: 'Email',
                                    validation: Validations().validateEmail),
                                UiSpacing.verticalSpacingSmall(),
                                RoundedTextformfield(
                                  onChanged: (value) {
                                    password = value;
                                  },
                                  validation: Validations().validatePassword,
                                  icon: Icons.lock,
                                  labelText: 'Password',
                                ),
                                UiSpacing.verticalSpacingSmall(),
                                RoundedButton(
                                    size: size,
                                    buttonName: 'Login',
                                    onPressed: (!isOffline)
                                        ? () {
                                            if (_formKey.currentState
                                                .validate()) {
                                              _formKey.currentState.save();

                                              FocusScope.of(context)
                                                  .requestFocus(FocusNode());
                                              print('email: $email');
                                              print('password: $password');
                                              Navigator.pushNamed(
                                                  context, Routes.homepage);
                                            }
                                          }
                                        : null),
                              ],
                            ),
                          ),
                        ),
                      ),
                      UiSpacing.verticalSpacingSmall(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          GestureDetector(
                            onTap: null,
                            child: Image.asset(
                              "assets/images/social/fb.png",
                              height: 50,
                            ),
                          ),
                          GestureDetector(
                            onTap: null,
                            child: Image.asset(
                              "assets/images/social/gplus.png",
                              height: 50,
                            ),
                          ),
                          GestureDetector(
                            onTap: null,
                            child: Image.asset(
                              "assets/images/social/twitter.png",
                              height: 50,
                            ),
                          )
                        ],
                      ),
                      UiSpacing.verticalSpacingSmall(),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Not Registered?",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline
                                  .copyWith(
                                      color: kblack, fontSize: size.width / 24),
                            ),
                            UiSpacing.horizontalSpacingTiny(),
                            GestureDetector(
                                onTap: () =>
                                    navigationService.navigateTo(Routes.signup),
                                child: Text(
                                  'Create an account',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline
                                      .copyWith(fontSize: size.width / 24),
                                )),
                          ],
                        ),
                      ),
                      UiSpacing.verticalSpacingSmall(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
