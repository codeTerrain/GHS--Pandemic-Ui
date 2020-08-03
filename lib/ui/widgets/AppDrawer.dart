import 'package:ghspandemic/core/model/data.dart';
import 'package:ghspandemic/core/model/diseaseCategory.dart';
import 'package:ghspandemic/core/services/navigation_service.dart';
import 'package:ghspandemic/ui/shared/spacing.dart';
import 'package:ghspandemic/ui/shared/style.dart';
import 'package:flutter/material.dart';
import 'package:ghspandemic/ui/views/homepage.dart';
import 'package:ghspandemic/ui/widgets/Button.dart';
import 'package:chips_choice/chips_choice.dart';

import '../../locator.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  final NavigationService navigationService = locator<NavigationService>();
  int tag = 1;

  @override
  Widget build(BuildContext context) {
    List<DiseaseCategory> diseaseCategoryList = AppData.categoryList;
    Size size = MediaQuery.of(context).size;
    return Drawer(
        child: Container(
      decoration: BoxDecoration(color: kwhite),
      // color: kblue,
      child: new ListView(
        children: <Widget>[
          _createDrawerHeader(
            context,
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: ChipsChoice<int>.single(
                    itemConfig: ChipsChoiceItemConfig(
                      selectedColor: primaryColor,
                      labelStyle: Theme.of(context).textTheme.display1,
                    ),
                    isWrapped: true,
                    value: tag,
                    options: ChipsChoiceOption.listFrom<int, Widget>(
                        source: diseaseCategoryList
                            .map(
                              (category) => DiseaseGroup(
                                pandemic: category,
                                onSelected: (pandemic) {
                                  setState(() {
                                    diseaseCategoryList.forEach((item) {
                                      item.isSelected = false;
                                    });
                                    pandemic.isSelected = true;
                                    //filter = model.diseaseName.toLowerCase();
                                    //controller.text = filter;
                                  });
                                },
                              ),
                            )
                            .toList(),
                        value: (i, v) => i,
                        label: (i, v) => diseaseCategoryList[i].diseaseName,
                        avatar: (index, item) =>
                            Image.asset(diseaseCategoryList[index].image)),
                    onChanged: (val) => setState(() {
                      tag = val;
                      print(tag);
                    }),
                  ),
                ),
                // Container(
                //   height: 170,
                //   color: kwhite,
                //   child: GridView.count(
                //     physics: NeverScrollableScrollPhysics(),
                //     //shrinkWrap: true,
                //     childAspectRatio: 3,
                //     mainAxisSpacing: 10,
                //     crossAxisSpacing: 10,
                //     crossAxisCount: 2,
                //     children: List.generate(6, (index) {
                //       return Container(
                //           margin: EdgeInsets.symmetric(horizontal: 7),
                //           height: 20,
                //           width: 95,
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(30),
                //             border: Border.all(
                //                 color: primaryColor,
                //                 width: 1,
                //                 style: BorderStyle.solid),
                //           ),
                //           child: Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //             children: <Widget>[
                //               Icon(Icons.pie_chart),
                //               Text(
                //                 index.toString(),
                //                 style: Theme.of(context)
                //                     .textTheme
                //                     .display1
                //                     .copyWith(color: primaryColor),
                //               ),
                //             ],
                //           ));
                //     }),
                //   ),
                // ),
              ],
            ),
          ),
          Divider(
            color: primaryColor,
          ),
          _createDrawerItem(
            context: context,
            text: 'Settings',
            icon: Icons.settings,
            // pageNav: HomePage(),
          ),
          UiSpacing.verticalSpacingTiny(),
          _createDrawerItem(
            context: context,
            text: 'Safety Tips',
            icon: Icons.room_service,
            //  image: 'assets/images/drawerImages/trending.png',
            pageTitle: 'Trends View',
          ),
          UiSpacing.verticalSpacingTiny(),
          _createDrawerItem(
            context: context,
            text: 'News',
            icon: Icons.message,
          ),
          UiSpacing.verticalSpacingTiny(),
          _createDrawerItem(
              context: context,
              text: 'Trace Me',
              icon: Icons.track_changes,
              onTap: () {}),
          UiSpacing.verticalSpacingTiny(),
          _createDrawerItem(
              context: context,
              text: 'Connect',
              icon: Icons.cast_connected,
              onTap: () {}),
          UiSpacing.verticalSpacingTiny(),
          _createDrawerItem(
              context: context, text: 'About', icon: Icons.info, onTap: () {}),
          UiSpacing.verticalSpacingTiny(),
          Divider(
            color: primaryColor,
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
                width: size.width / 1.5,
                child: RoundedButton(
                    size: size,
                    buttonName: 'What You should Know',
                    onPressed: () {})),
          ),
          UiSpacing.verticalSpacingTiny(),
          Align(
            alignment: Alignment.center,
            child: Container(
                width: size.width / 1.5,
                child: RoundedButton(
                    size: size,
                    buttonName: 'How to protect yourself',
                    onPressed: () {})),
          ),
          UiSpacing.verticalSpacingTiny(),
          Align(
            alignment: Alignment.center,
            child: Container(
                width: size.width / 1.5,
                child: RoundedButton(
                    size: size,
                    buttonName: 'Myths / Not-trues',
                    onPressed: () {})),
          ),
          UiSpacing.verticalSpacingTiny(),
        ],
      ),
    ));
  }

  Column userInfoDrawer(BuildContext context,
      {String pandemic, Function onTap}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      //  crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(
          width: UiSpacing.fullWidth(context) / 2,
          child: Text(
            "Welcome to GHS Pandemic Smartboard",
            style: Theme.of(context).textTheme.display2.copyWith(
                  color: kwhite,
                ),
          ),
        ),
        UiSpacing.verticalSpacingTiny(),
        Text("Active Pandemic",
            maxLines: 3,
            overflow: TextOverflow.fade,
            style: Theme.of(context).textTheme.body1.copyWith(
                  color: kwhite,
                )),
        InkWell(
          onTap: onTap,
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 7),
              //: 30,
              width: 95,
              decoration: BoxDecoration(
                color: kwhite,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                    color: primaryColor, width: 2, style: BorderStyle.solid),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(Icons.pie_chart),
                  Text(
                    pandemic,
                    style: Theme.of(context)
                        .textTheme
                        .display1
                        .copyWith(color: kred),
                  ),
                ],
              )),
        )
      ],
    );
  }

  Widget _createDrawerHeader(BuildContext context,
      {String email, String username, String profilePicture}) {
    return Stack(
      children: <Widget>[
        ColorFiltered(
          colorFilter: ColorFilter.mode(
              primaryColor.withOpacity(0.7), BlendMode.srcOver),
          child: DrawerHeader(
            decoration: BoxDecoration(
                color: kblue,
                image: DecorationImage(
                    image: AssetImage('assets/images/chatbg.jpg'),
                    fit: BoxFit.cover)),
            child: Container(),
          ),
        ),
        Positioned(
          top: 30,
          left: 10,
          child: Row(
            //  crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              // UiSpacing.horizontalSpacingTiny(),
              ClipOval(
                child: Image.asset(
                  'assets/images/ghslogo1.jpg',
                  scale: 2.5,
                ),
                // child: CachedNetworkImage(
                //   imageUrl: profilePicture == null ? ' null' : profilePicture,
                //   errorWidget: (context, url, error) => Image.asset(
                //     'assets/images/executive.jpg',
                //     scale: 7,
                //   ),
                //   placeholder: (context, url) => CircularProgressIndicator(),
                //   placeholderFadeInDuration: Duration(milliseconds: 200),
                //   fit: BoxFit.cover,
                //   height: 90,
                //   width: 90,
                // ),
              ),
              UiSpacing.horizontalSpacingSmall(),
              userInfoDrawer(context, pandemic: 'Covid-19'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _createDrawerItem(
      {String text,
      GestureTapCallback onTap,
      IconData icon,
      String image,
      String pageTitle,
      BuildContext context,
      Widget pageNav}) {
    return GestureDetector(
      child: Row(
        children: <Widget>[
          UiSpacing.horizontalSpacingSmall(),
          icon != null
              ? Icon(
                  icon,
                  color: primaryColor,
                )
              : Image.asset(
                  image,
                  width: 20,
                  color: kgrey,
                ),
          UiSpacing.horizontalSpacingSmall(),
          Text(
            text,
            style: TextStyle(
                color: kgrey,
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontFamily: 'Roboto'),
          ),
        ],
      ),
      // onTap: onTap
      // != null
      //     ? onTap
      //     : () {
      //         text.toString() == 'Home'
      //             ? Navigator.pushReplacement(
      //                 context,
      //                 PageTransition(
      //                     type: PageTransitionType.leftToRight,
      //                     child: HomePage()))
      //             //navigationService.navigateTo(Routes.homepage)
      //             : Navigator.push(
      //                 context,
      //                 PageTransition(
      //                     type: PageTransitionType.leftToRight,
      //                     child: TemplateView(
      //                       title: pageTitle,
      //                       widget: pageNav,
      //                     ))
    );
  }
}
