import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ghspandemic/core/services/navigation_service.dart';
import 'package:ghspandemic/core/services/validations.dart';
import 'package:ghspandemic/ui/shared/Routes.dart';
import 'package:ghspandemic/ui/shared/spacing.dart';
import 'package:ghspandemic/ui/shared/style.dart';
import 'package:ghspandemic/ui/views/login.dart';
import 'package:ghspandemic/ui/widgets/Button.dart';
import 'package:ghspandemic/ui/widgets/RoundedTextformfield.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../locator.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final NavigationService navigationService = locator<NavigationService>();
  int _genderValue;
  List items = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  int selectedDay = 1;
  int selectedYear = 1960;
  String selectedMonth = 'January';
  int setDay = 5;

  String dialer = '1';

  void _handleGenderValueChange(int value) {
    setState(() {
      _genderValue = value;
    });
  }

  File _image;
  Future cropImage(File image) async {
    if (image != null) {
      File croppedFile = await ImageCropper.cropImage(
        sourcePath: image.path,
        maxWidth: 512,
        maxHeight: 512,
      );
      userImage(croppedFile);
    }
  }

  userImage(File _image) {
    setState(() {
      this._image = _image;
    });
  }

  openGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    cropImage(image);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: primaryColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: size.width / 1.2,
            child: Column(
              children: <Widget>[
                UiSpacing.verticalSpacingMedium(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Create Account',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle
                            .copyWith(color: kblack)),
                    Text('Create a new account',
                        style: Theme.of(context)
                            .textTheme
                            .display1
                            .copyWith(fontWeight: FontWeight.normal)),
                  ],
                ),
                Container(
                  width: size.width / 1.4,
                  child: Column(children: [
                    UiSpacing.verticalSpacingMedium(),
                    Container(
                      //height: 340,
                      width: size.width / 1.5,
                      decoration: BoxDecoration(
                        color: kwhite,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () => openGallery(),
                              child: new Center(
                                child: _image == null
                                    ? new Center(
                                        child: new CircleAvatar(
                                          radius: 80.0,
                                          backgroundColor: Colors.grey[50],
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                _image == null
                                                    ? Icon(
                                                        Icons.camera_alt,
                                                        size: 70,
                                                        color: Colors.grey[400],
                                                      )
                                                    : Image.file(
                                                        _image,
                                                        height: 70,
                                                      ),
                                                Text('select',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .body1
                                                        .copyWith(
                                                            color: Colors
                                                                .grey[400],
                                                            fontSize: 11,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold))
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    : new Container(
                                        height: 160.0,
                                        width: 160.0,
                                        decoration: new BoxDecoration(
                                          color: const Color(0xff7c94b6),
                                          image: new DecorationImage(
                                            image: new ExactAssetImage(
                                                _image.path),
                                            fit: BoxFit.cover,
                                          ),
                                          border: Border.all(
                                              color: primaryColor, width: 5.0),
                                          borderRadius: new BorderRadius.all(
                                              const Radius.circular(80.0)),
                                        ),
                                      ),
                              ),
                            ),
                            UiSpacing.verticalSpacingMedium(),
                            Container(
                              width: size.width / 1.3,
                              child: Column(
                                children: <Widget>[
                                  RoundedTextformfield(
                                    validation: Validations().validateEmail,
                                    labelText: 'Email Address',
                                    // onChanged: (value) {
                                    //   widget.signupData.email = value;
                                    // },
                                  ),
                                  UiSpacing.verticalSpacingSmall(),
                                  RoundedTextformfield(
                                    validation: Validations().validatePassword,
                                    labelText: 'Password',
                                    // onChanged: (value) {
                                    //   widget.signupData.password = value;
                                    // },
                                  ),
                                  UiSpacing.verticalSpacingSmall(),
                                  RoundedTextformfield(
                                    validation: Validations().validateName,
                                    labelText: 'Age',
                                    // onChanged: (value) {
                                    //   widget.signupData.password = value;
                                    // },
                                  ),
                                  UiSpacing.verticalSpacingSmall(),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Date Of Birth',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline
                                            .copyWith(color: kblack),
                                      )),
                                  //UiSpacing.verticalSpacingSmall(),
                                  Row(
                                    children: <Widget>[
                                      DropdownButton<int>(
                                        value: selectedDay,
                                        // isExpanded: true,
                                        items: List.generate(31, (int index) {
                                          return DropdownMenuItem(
                                            value: index,
                                            child: Text(
                                              "$index",
                                            ),
                                          );
                                        }),
                                        onChanged: (index) {
                                          setState(() {
                                            selectedDay = index;
                                          });
                                        },
                                        // value: _value,
                                      ),
                                      Text('/'),
                                      DropdownButton<String>(
                                        value: selectedMonth,
                                        //isExpanded: true,
                                        items: List.generate(items.length,
                                            (int index) {
                                          return DropdownMenuItem(
                                            value: items[index],
                                            child: Text(
                                              "${items[index]}",
                                            ),
                                          );
                                        }),
                                        onChanged: (value) {
                                          setState(() {
                                            selectedMonth = value;
                                          });
                                        },
                                        // value: _value,
                                      ),
                                      Text('/'),
                                      DropdownButton(
                                        value: selectedYear,
                                        items: List.generate(70, (int index) {
                                          return DropdownMenuItem(
                                            value: index + 1940,
                                            child: Text(
                                              "${index + 1940}",
                                            ),
                                          );
                                        }),
                                        onChanged: (index) {
                                          setState(() {
                                            selectedYear = index;
                                          });
                                        },
                                        //  value: _value,
                                      ),
                                    ],
                                  ),
                                  UiSpacing.verticalSpacingSmall(),
                                  RoundedTextformfield(
                                    validation: Validations().validatePhone,
                                    labelText: 'Mobile Number',
                                    // onChanged: (value) {
                                    //   widget.signupData.password = value;
                                    // },
                                  ),
                                  UiSpacing.verticalSpacingSmall(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Column(
                                        children: <Widget>[
                                          Radio(
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: 1,
                                            groupValue: _genderValue,
                                            onChanged: _handleGenderValueChange,
                                          ),
                                          Text(
                                            'Male',
                                            style: Theme.of(context)
                                                .textTheme
                                                .body1
                                                .copyWith(
                                                    color: kblack,
                                                    fontWeight:
                                                        FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: <Widget>[
                                          Radio(
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: 2,
                                            groupValue: _genderValue,
                                            onChanged: _handleGenderValueChange,
                                          ),
                                          Text(
                                            'Female',
                                            style: Theme.of(context)
                                                .textTheme
                                                .body1
                                                .copyWith(
                                                    color: kblack,
                                                    fontWeight:
                                                        FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: <Widget>[
                                          Radio(
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: 3,
                                            groupValue: _genderValue,
                                            onChanged: _handleGenderValueChange,
                                          ),
                                          Text(
                                            'Unspecified',
                                            style: Theme.of(context)
                                                .textTheme
                                                .body1
                                                .copyWith(
                                                    color: kblack,
                                                    fontWeight:
                                                        FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    UiSpacing.verticalSpacingMedium(),
                  ]),
                ),
                Container(
                    width: size.width / 1.1,
                    child: RoundedButton(
                        size: size,
                        buttonName: 'Sign Up',
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => LoginScreen()));
                          }
                        })),
                UiSpacing.verticalSpacingSmall(),
                InkWell(
                    onTap: () => navigationService.navigateTo(Routes.login),
                    child: Text("Back to Login",
                        style: Theme.of(context).textTheme.headline)),
                UiSpacing.verticalSpacingSmall(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
