import 'package:flutter/material.dart';
import 'package:ghspandemic/core/services/validations.dart';
import 'package:ghspandemic/ui/shared/spacing.dart';
import 'package:ghspandemic/ui/shared/style.dart';
import 'package:ghspandemic/ui/widgets/Button.dart';
import 'package:ghspandemic/ui/widgets/RoundedTextformfield.dart';

class TraceMe extends StatefulWidget {
  @override
  _TraceMeState createState() => _TraceMeState();
}

class _TraceMeState extends State<TraceMe> {
  static List<String> symptomsList = [
    'Select Level',
    'Level 100',
    'Level 200',
    'Level 300',
    'Level 400'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        width: UiSpacing.fullWidth(context) / 1.10,
        child: Column(children: <Widget>[
          UiSpacing.verticalSpacingSmall(),
          Container(
              padding: UiSpacing.padding,
              margin: EdgeInsets.symmetric(horizontal: 7),
              width: UiSpacing.fullWidth(context),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                    color: primaryColor, width: 2, style: BorderStyle.solid),
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: buildTitleContainer(context, title: 'Trace Me'),
                      ),
                      Container(
                        margin: UiSpacing.padding,
                        child: Text(
                          'Call Us',
                          style: Theme.of(context)
                              .textTheme
                              .display1
                              .copyWith(color: kred),
                        ),
                      ),
                    ],
                  ),
                  UiSpacing.verticalSpacingTiny(),
                  RichText(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 6,
                    softWrap: false,
                    textAlign: TextAlign.left,
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: ' For us to know which of the ',
                          style: Theme.of(context).textTheme.body1),
                      TextSpan(
                          text: 'Pandemic ',
                          style: Theme.of(context)
                              .textTheme
                              .body1
                              .copyWith(color: kred)),
                      TextSpan(
                          text:
                              'you are experiencing, kindly provide the ncessary information so that we know what is wrong with you and come fullt prepared',
                          style: Theme.of(context).textTheme.body1),
                    ]),
                  ),
                ],
              )),
          buildTextContainer(context,
              text: 'Fill the form below so we can trace you'),
          RoundedTextformfield(
            validation: Validations().validateName,
            labelText: 'Name',
          ),
          UiSpacing.verticalSpacingSmall(),
          RoundedTextformfield(
            validation: Validations().validateName,
            labelText: 'Ghana PostGPS',
          ),
          UiSpacing.verticalSpacingSmall(),
          RoundedTextformfield(
            keyboardType: TextInputType.phone,
            validation: Validations().validatePhone,
            labelText: 'Phone Number',
          ),
          buildTextContainer(context,
              text: 'List all the symptoms you are experiencing'),
          RoundedTextformfield(
            validation: Validations().validateName,
            labelText: 'Fever, cough, headache, etc..',
          ),
          buildTextContainer(context,
              text: 'Since when did you start experiencing these symptoms'),
          RoundedTextformfield(
            validation: Validations().validateName,
            labelText: 'eg. 6 days',
          ),
          UiSpacing.verticalSpacingSmall(),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
                width: UiSpacing.fullWidth(context) / 3,
                child: RoundedButton(
                    size: MediaQuery.of(context).size,
                    buttonName: 'Submit',
                    onPressed: () {})),
          ),
          UiSpacing.verticalSpacingMedium(),
        ]));
  }

  Container buildTextContainer(BuildContext context, {@required String text}) {
    return Container(
        margin: UiSpacing.padding,
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .display1
              .copyWith(color: primaryColor),
        ));
  }

  Container buildTitleContainer(BuildContext context,
      {@required String title}) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
            color: primaryColor, borderRadius: BorderRadius.circular(30)),
        child: Text(
          title,
          style: Theme.of(context).textTheme.display1.copyWith(color: kwhite),
        ));
  }
}
