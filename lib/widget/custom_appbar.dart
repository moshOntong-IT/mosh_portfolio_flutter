import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mosh_portfolio_flutter/provider/scroll_offset.dart';
import 'package:mosh_portfolio_flutter/widget/nav_item.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget {
  final double scrollOffSet;
  final Function func;
  const CustomAppBar({Key? key, this.scrollOffSet = 0.0, required this.func})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //TODO add box shadow later
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
      color: Colors.white.withOpacity(
        (scrollOffSet / 350).clamp(0, 1).toDouble(),
      ),
      child: CustomAppBarDesktop(onTap: () {
        var provider =
            Provider.of<ScrollOffsetNotifier>(context, listen: false);
        func();
      }),
    );
  }
}

class CustomAppBarDesktop extends StatelessWidget {
  final Function onTap;
  const CustomAppBarDesktop({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                var provider =
                    Provider.of<ScrollOffsetNotifier>(context, listen: false);

                provider.setIndex(0);
                onTap();
              },
              child: SvgPicture.asset(
                './assets/images/logo.svg',
              ),
            ),
            SizedBox(
              width: _size.width * 0.3,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NavItem(
                    title: 'ABOUT',
                    onTap: () {
                      var provider = Provider.of<ScrollOffsetNotifier>(context,
                          listen: false);

                      provider.setIndex(1);
                      onTap();
                    },
                  ),
                  NavItem(
                    title: 'SERVICES',
                    onTap: () {
                      var provider = Provider.of<ScrollOffsetNotifier>(context,
                          listen: false);

                      provider.setIndex(2);
                      onTap();
                    },
                  ),
                  NavItem(
                    title: 'SKILLS',
                    onTap: () {
                      var provider = Provider.of<ScrollOffsetNotifier>(context,
                          listen: false);

                      provider.setIndex(3);
                      onTap();
                    },
                  ),
                  NavItem(
                    title: 'PORTFOLIO',
                    onTap: () {
                      var provider = Provider.of<ScrollOffsetNotifier>(context,
                          listen: false);

                      provider.setIndex(4);
                      onTap();
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFFFF9F1C),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      'Demo Pages',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
