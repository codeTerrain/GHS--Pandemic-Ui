import 'package:flutter/material.dart';
import 'package:ghspandemic/ui/shared/spacing.dart';
import 'package:ghspandemic/ui/shared/style.dart';

class EbolaHome extends StatefulWidget {
  final String pandemic;
  EbolaHome({
    this.pandemic,
    Key key,
  }) : super(key: key);

  @override
  _EbolaHomeState createState() => _EbolaHomeState();
}

class _EbolaHomeState extends State<EbolaHome> {
  String readStat = 'Read More';

  int y = 85;

  bool b = false;

  bool reportType = true;

  void toggleFullNews() {
    setState(() {
      b = !b;
      if (b == true) {
        y = null;
        readStat = 'View Less';
      } else if (b == false) {
        y = 85;
        readStat = 'Read More';
      }
    });
  }

  Column aboutDisease(Size size, {String aboutDisease}) {
    return aboutDisease.length > 200
        ? Column(
            children: <Widget>[
              Text(
                ' ${reportType == true ? aboutDisease.substring(0, y) : aboutDisease}',
                style: TextStyle(color: kblack),
              ),
              Visibility(
                visible: reportType == true ? true : false,
                child: GestureDetector(
                  onTap: toggleFullNews,
                  child: Container(
                    alignment: Alignment.centerRight,
                    width: size.width / 1.3,
                    child: Text(
                      '$readStat',
                      style: TextStyle(color: kred),
                    ),
                  ),
                ),
              )
            ],
          )
        : Text(' $aboutDisease', style: TextStyle(color: kblack));
  }

  Container statsContainer(BuildContext context,
      {int numOfcases, String statType, Color statcolor}) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        margin: EdgeInsets.symmetric(horizontal: 7),
        height: 40,
        width: 90,
        decoration: BoxDecoration(
          color: kwhite,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              numOfcases.toString(),
              style:
                  Theme.of(context).textTheme.display1.copyWith(color: kblack),
            ),
            Text(
              statType,
              style: Theme.of(context).textTheme.display1.copyWith(
                  color: statcolor != null ? statcolor : primaryColor),
            ),
          ],
        ));
  }

  Align buildTextTitle(BuildContext context, {String text}) {
    return Align(
        alignment: Alignment.centerRight,
        child: Text(
          text,
          textAlign: TextAlign.left,
          style:
              Theme.of(context).textTheme.body1.copyWith(color: primaryColor),
        ));
  }

  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are you sure?'),
            content: Text('You are going to exit the application!!'),
            actions: <Widget>[
              FlatButton(
                child: Text('NO'),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              FlatButton(
                child: Text('YES'),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Column(
        children: <Widget>[
          buildTextTitle(context, text: 'Ghana\'Ebola Stats  '),
          Container(
              margin: EdgeInsets.only(top: 5),
              padding: EdgeInsets.all(10),
              height: 200,
              width: UiSpacing.fullWidth(context),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/statsbg/statsbg2.jpg'),
                      fit: BoxFit.cover),
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(30)),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 0,
                    left: 0,
                    child: statsContainer(context,
                        numOfcases: 50313, statType: 'Cases', statcolor: kred),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 30,
                    child: statsContainer(context,
                        numOfcases: 1013,
                        statType: 'Recovered',
                        statcolor: primaryColor),
                  ),
                  Positioned(
                    top: 50,
                    left: 100,
                    child: statsContainer(context,
                        numOfcases: 13, statType: 'New', statcolor: kblue),
                  ),
                  Positioned(
                    top: 10,
                    right: 0,
                    child: statsContainer(context,
                        numOfcases: 50313,
                        statType: 'Active',
                        statcolor: kgrey),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Column(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 35,
                          backgroundColor: kwhite,
                          child: Text(
                            '201,129',
                            style: Theme.of(context)
                                .textTheme
                                .display1
                                .copyWith(color: kblack),
                          ),
                        ),
                        Text('World Stats',
                            style: Theme.of(context)
                                .textTheme
                                .display1
                                .copyWith(color: kwhite))
                      ],
                    ),
                  )
                ],
              )),
          UiSpacing.verticalSpacingSmall(),
          buildTextTitle(context, text: 'Overview'),
          aboutDisease(size,
              aboutDisease:
                  'A virus that causes severe bleeding, organ failure and can lead to death. Humans may spread the virus to other humans through contact with bodily fluids such as blood. Initial symptoms include fever, headache, muscle pain and chills. Later, a person may experience internal bleeding resulting in vomiting or coughing blood. Treatment is supportive hospital care. '),
          UiSpacing.verticalSpacingSmall(),
          buildTextTitle(context, text: 'Quick Tips  '),
          Container(
            height: 500,
            color: kwhite,
            child: GridView.count(
              physics: NeverScrollableScrollPhysics(),
              childAspectRatio: 1.3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              crossAxisCount: 2,
              children: List.generate(6, (index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 7),
                  width: 95,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                          image: AssetImage('assets/images/tips.jpg'),
                          fit: BoxFit.cover)),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
