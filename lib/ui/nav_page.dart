import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:guest5stars/icons/app_icons.dart';
import 'package:guest5stars/locale.dart';
import 'package:guest5stars/ui/router/app_router.dart';

@RoutePage()
class NavPage extends StatefulWidget {
  const NavPage({super.key});

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: [
        SearchRoute(),
        AddRecordRoute(),
        PaymentsRoute(),
        ProfileRoute(),
      ],
      navigatorObservers: () => [AutoRouteObserver()],
      bottomNavigationBuilder: (context, tabsRouter) {
        return Container(
          height: 76.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(6.0),
              topRight: Radius.circular(6.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).shadowColor,
                blurRadius: 4,
                offset: Offset(0, -2),
              ),
            ],
            color: Theme.of(context).colorScheme.surfaceContainer,
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) {
              if (index == tabsRouter.activeIndex) {
                final router = tabsRouter.stackRouterOfIndex(index);
                if (router?.canPop() == true) {
                  router?.popUntilRoot();
                }
              } else {
                tabsRouter.setActiveIndex(index);
              }
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(AppIcons.search),
                label: S.of(context).search,
              ),
              BottomNavigationBarItem(
                icon: Icon(AppIcons.person_add),
                label: S.of(context).add,
              ),
              BottomNavigationBarItem(
                icon: Icon(AppIcons.money),
                label: S.of(context).payments,
              ),
              BottomNavigationBarItem(
                icon: Icon(AppIcons.person),
                label: S.of(context).profile,
              ),
            ],
            iconSize: 20.0,
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
            selectedFontSize: 12.5,
            unselectedFontSize: 12.5,
            selectedItemColor: Theme.of(context).colorScheme.primary,
            unselectedItemColor: Theme.of(context).colorScheme.onSurfaceVariant,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
        );
      },
    );
  }
}
