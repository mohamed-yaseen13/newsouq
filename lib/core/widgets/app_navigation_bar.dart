import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newsouq/core/constants/app_constants.dart';
import 'package:newsouq/core/helpers/extension.dart';
import 'package:newsouq/core/routing/app_routes.dart';

class AppNavigationBar extends StatefulWidget {
  final NavigationBarEnum selectedScreen;

  const AppNavigationBar({super.key, required this.selectedScreen});

  @override
  State<AppNavigationBar> createState() => _AppNavigationBarState();
}

class _AppNavigationBarState extends State<AppNavigationBar> {
  int _enumToIndex(NavigationBarEnum screen) {
    return NavigationBarEnum.values.indexOf(screen);
  }

  NavigationBarEnum _indexToEnum(int index) {
    return NavigationBarEnum.values[index];
  }

  String _enumToRoute(NavigationBarEnum screen) {
    switch (screen) {
      case NavigationBarEnum.home:
        return AppRoutes.homeScreen;
      case NavigationBarEnum.search:
        return AppRoutes.searchScreen;
      //case NavigationBarEnum.saved:
      //return AppRoutes.home;
      //case NavigationBarEnum.cart:
      //return AppRoutes.profileScreen;
      //case NavigationBarEnum.account:
      //return AppRoutes.settingsScreen;
      default:
        return AppRoutes.homeScreen;
    }
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: [
        NavigationDestination(
          icon: SvgPicture.asset('assets/icons/Home.svg'),
          selectedIcon: SvgPicture.asset('assets/icons/Home_selected.svg'),
          label: 'Home',
        ),
        NavigationDestination(
          icon: SvgPicture.asset('assets/icons/Search.svg'),
          selectedIcon: SvgPicture.asset('assets/icons/Search_selected.svg'),
          label: 'Search',
        ),
        NavigationDestination(
          icon: SvgPicture.asset('assets/icons/Heart.svg'),
          selectedIcon: SvgPicture.asset('assets/icons/Heart_selected.svg'),
          label: 'Saved',
        ),
        NavigationDestination(
          icon: SvgPicture.asset('assets/icons/Cart.svg'),
          selectedIcon: SvgPicture.asset('assets/icons/Cart_selected.svg'),
          label: 'Cart',
        ),
        NavigationDestination(
          icon: SvgPicture.asset('assets/icons/User.svg'),
          selectedIcon: SvgPicture.asset('assets/icons/User_selected.svg'),
          label: 'Account',
        ),
      ],
      selectedIndex: _enumToIndex(widget.selectedScreen),
      onDestinationSelected: (index) {
        final selected = _indexToEnum(index);

        if (selected != widget.selectedScreen) {
          context.pushNamed(_enumToRoute(selected));
        }
      },
      backgroundColor: Colors.white,
      indicatorColor: Colors.white,
    );
  }
}
