import 'package:flutter/material.dart';
import 'package:mosh_portfolio_flutter/provider/scroll_offset.dart';
import 'package:mosh_portfolio_flutter/widget/custom_appbar.dart';
import 'package:provider/provider.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  ScrollController? _scrollController;
  PageController? _pageController;

  var list = ["HOME", "ABOUT", "SERVICES", "SKILLS", "PORTFOLIO", "CONTACT"];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        Provider.of<ScrollOffsetNotifier>(context, listen: false);
      });
    _pageController = PageController()
      ..addListener(() {
        var provider =
            Provider.of<ScrollOffsetNotifier>(context, listen: false);
        provider.setOffSet(_pageController!.offset);
      });
  }

  @override
  void dispose() {
    _scrollController?.dispose();
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
        child: PageView(
          controller: _pageController,
          pageSnapping: false,
          scrollDirection: Axis.vertical,
          children: List.generate(
            list.length,
            (index) {
              return Container(
                width: MediaQuery.of(context).size.width,
                height: double.maxFinite,
                child: Center(
                  child: Text(
                    list[index],
                    style: TextStyle(color: Colors.black, fontSize: 50),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _scrollToIndex() {
    var provider = Provider.of<ScrollOffsetNotifier>(context, listen: false);
    _pageController?.animateToPage(provider.index,
        duration: Duration(seconds: 2), curve: Curves.fastLinearToSlowEaseIn);
  }
}
