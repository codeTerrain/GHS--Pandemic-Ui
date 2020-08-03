import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ghspandemic/core/model/data.dart';
import 'package:ghspandemic/core/model/diseaseCategory.dart';
import 'package:ghspandemic/ui/shared/spacing.dart';
import 'package:ghspandemic/ui/shared/style.dart';
import 'package:ghspandemic/ui/views/connect.dart';
import 'package:ghspandemic/ui/views/ebolaHome.dart';
import 'package:ghspandemic/ui/views/traceMe.dart';
import 'package:ghspandemic/ui/widgets/AppDrawer.dart';
import 'package:ghspandemic/ui/widgets/search.dart';
import 'package:ghspandemic/ui/views/diseaseHome.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController controller = new TextEditingController();
  String filter;
  String panPage;

  void initState() {
    super.initState();

    controller.addListener(() {
      setState(() {
        filter = controller.text;
      });
    });
  }

  Widget categoryWidget(List<DiseaseCategory> categoryList) {
    return Container(
      width: UiSpacing.fullWidth(context),
      height: 80,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: categoryList
            .map(
              (category) => DiseaseGroup(
                pandemic: category,
                onSelected: (pandemic) {
                  setState(() {
                    categoryList.forEach((item) {
                      item.isSelected = false;
                    });
                    pandemic.isSelected = true;
                    filter = pandemic.diseaseName.toLowerCase();
                    controller.text = filter;
                    panPage = pandemic.diseaseName;
                  });
                },
              ),
            )
            .toList(),
      ),
    );
  }

  final _items = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home, size: 28, color: kwhite),
      title: Text(
        'Home',
        style: TextStyle(fontWeight: FontWeight.bold, color: kwhite),
      ),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sentiment_satisfied, size: 28, color: kwhite),
      title: Text(
        'Safety Tips',
        style: TextStyle(fontWeight: FontWeight.bold, color: kwhite),
      ),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.message, size: 28, color: kwhite),
      title: Text(
        'News',
        style: TextStyle(fontWeight: FontWeight.bold, color: kwhite),
      ),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.track_changes, size: 28, color: kwhite),
      title: Text(
        'Trace Me',
        style: TextStyle(fontWeight: FontWeight.bold, color: kwhite),
      ),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.cast_connected, size: 28, color: kwhite),
      title: Text(
        'Connect',
        style: TextStyle(fontWeight: FontWeight.bold, color: kwhite),
      ),
    )
  ];

  int indexer = 0;

  @override
  Widget build(BuildContext context) {
    List<DiseaseCategory> diseaseCategoryList = AppData.categoryList;
    Size size = MediaQuery.of(context).size;

    Widget screenToShow(int index) {
      if (index == 0) {
        if (panPage == 'Covid-19' || panPage == null) {
          return DiseaseHome(
            pandemic: panPage,
          );
        } else if (panPage == 'Ebola') {
          return EbolaHome(
            pandemic: panPage,
          );
        }
        return Text('Out of Screens');
      } else if (index == 1) {
        return Text('Next Screen');
      } else if (index == 2) {
        return Text('Next Screen');
      } else if (index == 3) {
        return TraceMe();
      } else if (index == 4) {
        return Connect();
      } else
        return Text('Out of Screens');
    }

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            indexer = index;
          });
        },
        backgroundColor: primaryColor,
        selectedFontSize: 10,
        type: BottomNavigationBarType.fixed,
        elevation: 10,
        items: _items,
      ),
      key: _scaffoldKey,
      drawer: AppDrawer(),
      appBar: AppBar(
        elevation: 0,
        leading: Center(
          child: GestureDetector(
            onTap: () => _scaffoldKey.currentState.openDrawer(),
            child: Container(
              height: 37, width: 37,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: primaryColor),
              //  radius: 3,
              child: Icon(Icons.menu),
            ),
          ),
        ),
        actions: <Widget>[
          Container(
            height: 37, width: 37,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: primaryColor),
            //  radius: 3,
            child: Icon(Icons.person),
          ),
          UiSpacing.horizontalSpacingTiny(),
          Container(
            height: 37, width: 37,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: primaryColor),
            //  radius: 3,
            child: Icon(Icons.phone_iphone),
          ),
          UiSpacing.horizontalSpacingTiny(),
        ],
      ),
      body: SingleChildScrollView(
          child: Center(
              child: Container(
                  width: size.width / 1.10,
                  child: Column(children: <Widget>[
                    UiSpacing.verticalSpacingSmall(),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Info on which',
                            style: Theme.of(context)
                                .textTheme
                                .display1
                                .copyWith(color: Colors.grey[400]),
                          ),
                          Text(
                            'Pandemic?',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle
                                .copyWith(color: kgrey),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Container(
                            child: search(
                                filter: filter,
                                controller: controller,
                                hintText: 'Search'),
                          ),
                        ),
                        Card(
                          clipBehavior: Clip.hardEdge,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: 'null',
                            errorWidget: (context, url, error) => Image.asset(
                              'assets/images/executive.jpg',
                              scale: 15,
                            ),
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            placeholderFadeInDuration:
                                Duration(milliseconds: 200),
                            fit: BoxFit.cover,
                            height: 50,
                            width: 50,
                          ),
                        )
                      ],
                    ),
                    Divider(
                      color: primaryColor,
                      thickness: 2,
                    ),
                    Container(
                        height: 50, child: categoryWidget(diseaseCategoryList)),
                    UiSpacing.verticalSpacingSmall(),
                    screenToShow(
                      indexer,
                    )
                  ])))),
    );
  }
}

class DiseaseGroup extends StatelessWidget {
  final ValueChanged<DiseaseCategory> onSelected;
  final DiseaseCategory pandemic;
  DiseaseGroup({Key key, this.pandemic, this.onSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return pandemic.diseaseName == null
        ? Container(width: 5)
        : GestureDetector(
            onTap: () => onSelected(pandemic),
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                margin: EdgeInsets.symmetric(horizontal: 7),
                height: 35,
                width: 110,
                decoration: BoxDecoration(
                  color:
                      pandemic.isSelected ? primaryColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                      color: primaryColor, width: 2, style: BorderStyle.solid),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Image.asset(
                      pandemic.image,
                      scale: 7,
                    ),
                    Text(
                      pandemic.diseaseName,
                      style: Theme.of(context).textTheme.display1.copyWith(
                          color: pandemic.isSelected ? kwhite : primaryColor),
                    ),
                  ],
                )));
  }
}
