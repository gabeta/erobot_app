import 'package:flutter/material.dart';

//PACKAGES
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bubbled_navigation_bar/bubbled_navigation_bar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

//SCREENS
import 'package:erobot_app/screens/arduino_doc/arduino_doc.dart';
import 'package:erobot_app/screens/home_page/home.dart';
import 'package:erobot_app/screens/root/main_drawer.dart';
import 'package:erobot_app/screens/aboutus/about_member.dart';
import 'package:erobot_app/screens/aboutus/team_reputation.dart';
import 'package:erobot_app/screens/login_page/log_choice.dart';

//ROOT PAGE
class Root extends StatefulWidget {
  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> with SingleTickerProviderStateMixin {
  int pageIndex = 0;
  int tabIndex = 0;
  bool userPageDragging = false;

  //CONTROLLER
  PreloadPageController _pageController;
  MenuPositionController _menuPositionController;
  TabController _tabController;
  ScrollController _scrollViewController;

  @override
  void initState() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    _menuPositionController = MenuPositionController(initPosition: 0);
    _pageController = PreloadPageController(
        initialPage: pageIndex, keepPage: true, viewportFraction: 1);
    _pageController.addListener(handlePageChange);

    _tabController =
        TabController(length: 2, vsync: this, initialIndex: tabIndex);
    _tabController.addListener(handleTabChange);

    _scrollViewController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollViewController.dispose();
    _tabController.dispose();
    _pageController.dispose();
    _menuPositionController.dispose();
    super.dispose();
  }

  List<String> titleName = ['E-Robot', 'Education', 'About Us', 'Profile'];

  void handleTabChange() {
    setState(() {
      tabIndex = _tabController.index;
    });
    print('Tab Change $tabIndex');
  }

  void handlePageChange() {
    _menuPositionController.absolutePosition = _pageController.page;
  }

  @override
  Widget build(BuildContext context) {
    //ROOT PAGE
    return ScrollConfiguration(
      //ScrollConfiguration IS USED TO HIDE SCROLL EFFECT (WHITE EFFECT)
      behavior: ScrollBehavior()
        ..buildViewportChrome(context, null, AxisDirection.down),
      child: WillPopScope(
        onWillPop: _onBackPressed,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            elevation: pageIndex == 2 ? 0 : 5,
            leading: Padding(
              padding: const EdgeInsets.only(left: 13),
              child: Builder(
                  builder: (context) => IconButton(
                      icon: FaIcon(
                        FontAwesomeIcons.alignLeft,
                        size: 20,
                      ),
                      onPressed: () => Scaffold.of(context).openDrawer())),
            ),
            title: Text(
              titleName[pageIndex],
              style: TextStyle(
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w500,
                  fontSize: 18),
            ),
          ),
          drawer: MainDrawer(),
          body: Container(
            //PRELOAD : TO ENSURE PAGES ARE LOADED BEFORE USABLE
            child: PreloadPageView(
              children: <Widget>[
                HomeScreen(),
                ArduinoDoc(),
                aboutUs(),
                LogInChoice()
              ],
              physics: const AlwaysScrollableScrollPhysics(),
              preloadPagesCount: 4,
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  pageIndex = index;
                });
              },
            ),
          ),
          //BOTTOM NAVIGATION
          bottomNavigationBar: BubbledNavigationBar(
            defaultBubbleColor: Colors.white,
            backgroundColor: Hexcolor('172634'),
            initialIndex: pageIndex,
            controller: _menuPositionController,
            itemMargin: EdgeInsets.symmetric(horizontal: 0),
            iconRightMargin: 10,

            //TAB BAR SWITCHING INSPIRED BY FACEBOOK APP
            onTap: (_index) async {
              var duration = 250;

              //FROM PAGE[0] TO PAGE[3] => ANIMATE TO PAGE[2] THEN PAGE[3]
              if (_index == 3 && pageIndex == 0) {
                await _pageController.animateToPage(2,
                    curve: Curves.easeInOut,
                    duration: Duration(milliseconds: duration));
                _pageController.animateToPage(3,
                    curve: Curves.easeInOut,
                    duration: Duration(milliseconds: duration + 100));
              }
              //FROM PAGE[3] TO PAGE[0] => ANIMATE TO PAGE[1] THEN PAGE[0]
              if (_index == 0 && pageIndex == 3) {
                await _pageController.animateToPage(1,
                    curve: Curves.easeInOut,
                    duration: Duration(milliseconds: duration));
                _pageController.animateToPage(0,
                    curve: Curves.easeInOut,
                    duration: Duration(milliseconds: duration + 100));
              }
              //FROM PAGE THAT INDEX -= 2 => ANIMATE TO MIDDLE PAGE THEN DESTINATION
              if ((_index - pageIndex) == 2 || (pageIndex - _index) == 2) {
                int _indexR; //Destination
                if (_index > pageIndex) //Check which is destination
                  _indexR = pageIndex;
                else
                  _indexR = _index;
                await _pageController.animateToPage(_indexR + 1,
                    curve: Curves.easeInOut,
                    duration: Duration(milliseconds: duration));
                _pageController.animateToPage(_index,
                    curve: Curves.easeInOut,
                    duration: Duration(milliseconds: duration + 100));
              }
              //FROM PAGE THAT INDEX -= 1 => ANIMATE TO PAGE DIRECTLY
              else {
                _pageController.animateToPage(_index,
                    curve: Curves.easeInOut,
                    duration: Duration(milliseconds: duration + 100));
              }
            },
            //BOTTOM NAVIGATION ITEMS
            items: <BubbledNavigationBarItem>[
              //HOME
              BubbledNavigationBarItem(
                icon: Icon(Icons.home, size: 30, color: Colors.white),
                activeIcon: Icon(
                  Icons.home,
                  size: 30,
                  color: Hexcolor('172634'),
                ),
                title: Text(
                  'Home',
                  style: TextStyle(color: Hexcolor('172634'), fontSize: 12),
                ),
              ),
              //EDUCATION
              BubbledNavigationBarItem(
                icon: Icon(Icons.school, size: 30, color: Colors.white),
                activeIcon: Icon(
                  Icons.school,
                  size: 30,
                  color: Hexcolor('172634'),
                ),
                title: Text(
                  'Education',
                  style: TextStyle(
                      color: Hexcolor('172634'),
                      fontFamily: 'Raleway',
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      letterSpacing: .5),
                ),
              ),
              //ABOUT US
              BubbledNavigationBarItem(
                icon: Icon(Icons.people, size: 30, color: Colors.white),
                activeIcon: Icon(
                  Icons.people,
                  size: 30,
                  color: Hexcolor('172634'),
                ),
                title: Text(
                  'About us',
                  style: TextStyle(
                      color: Hexcolor('172634'),
                      fontFamily: 'Raleway',
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      letterSpacing: .5),
                ),
              ),
              //PROFILE
              BubbledNavigationBarItem(
                icon: Icon(Icons.person, size: 30, color: Colors.white),
                activeIcon: Icon(
                  Icons.person,
                  size: 30,
                  color: Hexcolor('172634'),
                ),
                title: Text(
                  'Profile',
                  style: TextStyle(
                      color: Hexcolor('172634'),
                      fontFamily: 'Raleway',
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      letterSpacing: .5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //ABOUT US SCREEN WITH TWO TABS
  DefaultTabController aboutUs() {
    return DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          backgroundColor: Hexcolor('172634'),
          //CENTERING APP BAR
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(
                kToolbarHeight), //kToolbarHeight HAS SAME CONSTANT THAT AppBar USES.
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Hexcolor('172634'),
                    blurRadius: 30.0,
                    spreadRadius: 0.0,
                    offset: Offset(0.0, 0.0),
                    // MOVE TO (RIGHT HORIZONTALLY, BOTTOM VERTICALLY)
                  )
                ],
              ),
              //TAB BAR
              child: SafeArea(
                child: Column(
                  children: <Widget>[
                    Expanded(child: Container()),
                    TabBar(
                      controller: _tabController,
                      isScrollable: true,
                      dragStartBehavior: DragStartBehavior.start,
                      labelStyle: TextStyle(
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                      indicatorColor: Colors.white,
                      tabs: <Widget>[
                        Tab(text: 'About Member'),
                        Tab(text: 'Team Reputation')
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          //MERGE TAB VIEW WITH PAGE VIEW
          body: NotificationListener(
            onNotification: (overscroll) {
              if (overscroll is UserScrollNotification &&
                  (overscroll.direction == ScrollDirection.forward ||
                      overscroll.direction == ScrollDirection.reverse)) {
                print('scrolling');
              } else if (overscroll is OverscrollNotification &&
                  overscroll.overscroll != 0 &&
                  overscroll.dragDetails != null) {
                print(overscroll.overscroll);

                //IF USER SCROLL DOWN ON TAB[0] => DO NOTHINGS
                if (overscroll.overscroll > 25 && tabIndex == 0) {
                  print('Scrolling on tab[0]');
                }
                //IF USER SWAP LEFT ON TAB[1] => ANIMATE TO PAGE 3 (LOGIN)
                else if (overscroll.overscroll > 20 && tabIndex == 1) {
                  print('Swaping on tab[1]');
                  _pageController.animateToPage(3,
                      curve: Curves.easeOutQuad,
                      duration: Duration(milliseconds: 300));
                }
                //IF USER SWAP LEFT ON TAB[1] => ANIMATE TO PAGE 1 (EDUCATON)
                else if (overscroll.overscroll < -25 && tabIndex == 0) {
                  print('Swapping on tab[0]');
                  _pageController.animateToPage(1,
                      curve: Curves.easeOutQuad,
                      duration: Duration(milliseconds: 300));
                }
              }
              return true;
            },
            child: TabBarView(controller: _tabController, children: [
              AboutMember(),
              TeamReputation(),
            ]),
          ),
        ));
  }

  //HUDDLE BACK PRESSED
  Future<bool> _onBackPressed() {
    return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: Color(0xFF161F28),
            title: Text(
              'Are you sure?',
              style: TextStyle(
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: 18),
            ),
            content: Text(
              'Do you want to exit an App',
              style: TextStyle(
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontSize: 16),
            ),
            actions: <Widget>[
              InkWell(
                onTap: () => Navigator.of(context).pop(false),
                child: DialogBtn('No'),
              ),
              SizedBox(height: 40),
              GestureDetector(
                onTap: () => Navigator.of(context).pop(true),
                child: DialogBtn('Yes'),
              ),
              SizedBox(
                width: 10,
              )
            ],
          ),
        ) ??
        false;
  }
}

//YES or NO BUTTON ON DIALOG
class DialogBtn extends StatelessWidget {
  final String yRN;
  DialogBtn(this.yRN);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Text(
        yRN,
        style: TextStyle(
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontSize: 16),
      ),
    );
  }
}
