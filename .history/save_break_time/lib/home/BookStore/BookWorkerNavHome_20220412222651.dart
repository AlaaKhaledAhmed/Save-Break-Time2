import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:save_break_time/Models/virables.dart';
import 'package:save_break_time/localization/localization_methods.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

import '../CafeteriaWorkerPage/WorkerNotification/BookWorkerNotification.dart';
import 'BookWorkerProducts/BookWorkerProduct.dart';
import 'BookWorkerRequest/BookWorkerRequest.dart';

class BookWorkerNavHome extends StatefulWidget {
  BookWorkerNavHome({Key key}) : super(key: key);

  @override
  State<BookWorkerNavHome> createState() => _BookWorkerNavHomeState();
}

class _BookWorkerNavHomeState extends State<BookWorkerNavHome> {
  int number = 10;
  int bookSelectedIndex = 1;
   List <Widget>bookWorkerPage=[BookWorkerNotification(),BookWorkerProductMainPage(),BookWorkerRequest()];

  void initState() {
    super.initState();
    pageController = PageController(initialPage: bookSelectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: bookWorkerPage,
        ),
        bottomNavigationBar: ConvexAppBar.badge(
          {0: '$number'},
          badgeColor: red,
          badgeMargin: EdgeInsets.only(bottom: 10.h, right: 50.w),
          style: TabStyle.reactCircle,
          //selest icon color
          activeColor: deepGrey,
          elevation: 10,
          //bar color
          backgroundColor: gry,
          //icon color
          height: 50.h,
         
          color: black.withOpacity(.7),
          items: [
            TabItem(
                icon: notificationsIcon,
                title: '${getTranslated(context, 'NOTIFICATION')}'),
            TabItem(icon: homeIcon, title: '${getTranslated(context, 'HOME')}'),
            TabItem(
                icon: requstIcon,
                title: '${getTranslated(context, 'REQUEST')}'),
          ],
          initialActiveIndex: 1, //optional, default as 0
          onTap: onTap,
        ));
  }

  //click methos--------------------------
  void onTap(int index) {
    setState(() {
      bookSelectedIndex = index;
    });
    pageController.animateToPage(bookSelectedIndex,
        duration: const Duration(milliseconds: 400), curve: Curves.easeInCirc);
  }
}
