import 'package:flutter/material.dart';
import 'package:mosh_portfolio_flutter/provider/scroll_offset.dart';
import 'package:mosh_portfolio_flutter/screens/about_screen.dart';
import 'package:mosh_portfolio_flutter/screens/contact_screen.dart';
import 'package:mosh_portfolio_flutter/screens/demo_pages_screen.dart';
import 'package:mosh_portfolio_flutter/screens/home_screen.dart';
import 'package:mosh_portfolio_flutter/screens/location_screen.dart';
import 'package:mosh_portfolio_flutter/screens/portfolio_screen.dart';
import 'package:mosh_portfolio_flutter/screens/services_screen.dart';
import 'package:mosh_portfolio_flutter/screens/skills_screen.dart';
import 'package:mosh_portfolio_flutter/widget/custom_appbar.dart';
import 'package:provider/provider.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  // ScrollController? _scrollController;
  PageController? _pageController;

  var screenList = const [
    HomeScreen(),
    AboutScreen(),
    ServicesScreen(),
    SkillsScreen(),
    PortfolioScreens(),
    ContactScreen(),
  ];

  @override
  void initState() {
    super.initState();
    // _scrollController = ScrollController()
    //   ..addListener(() {
    //     Provider.of<ScrollOffsetNotifier>(context, listen: false);
    //   });
    _pageController = PageController()
      ..addListener(() {
        var provider =
            Provider.of<ScrollOffsetNotifier>(context, listen: false);
        provider.setOffSet(_pageController!.offset);
      });
  }

  @override
  void dispose() {
    // _scrollController?.dispose();
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 100),
        child: Consumer<ScrollOffsetNotifier>(
          builder: (context, value, child) => CustomAppBar(
            scrollOffSet: value.scrollOffSet,
            func: _scrollToIndex,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [
              Color(0xffC1FFFC),
              Color(0xFFFFFFFF),
            ],
          ),
        ),
        child: Consumer<ScrollOffsetNotifier>(builder: (context, value, child) {
          //TODO try to debug kanang e try ang children ang e return dria
          if (value.page == 1) {
            return Scrollbar(
              controller: _pageController,
              isAlwaysShown: true,
              child: PageView(
                physics: const ClampingScrollPhysics(),
                controller: _pageController,
                pageSnapping: false,
                scrollDirection: Axis.vertical,
                onPageChanged: (index) {
                  WidgetsBinding.instance?.focusManager.primaryFocus?.unfocus();
                },
                children: List.generate(
                  screenList.length,
                  (index) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: double.maxFinite,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [Expanded(child: screenList[index])],
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          } else if (value.page == 2) {
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              height: double.maxFinite,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Expanded(
                      child: LocationScreen(),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              height: double.maxFinite,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Expanded(
                      child: DemoPagesScreen(),
                    ),
                  ],
                ),
              ),
            );
          }
        }),
      ),
    );
  }

  void _scrollToIndex() {
    var provider = Provider.of<ScrollOffsetNotifier>(context, listen: false);
    _pageController?.animateToPage(provider.index,
        duration: const Duration(seconds: 2), curve: Curves.easeIn);
  }
}
