
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/nav_bar_cubit.dart';


class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({
    required this.currentTab,
    super.key,
  });

  final int currentTab;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentTab,
      onTap: (index) {
        context.read<NavBarCubit>().changeTab(index);
      },
      items: [
        BottomNavigationBarItem(
            icon: Icon(currentTab == 0 ? Icons.home : Icons.home_outlined),
            label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(currentTab == 1 ? Icons.addchart_outlined : Icons.addchart_outlined),
            label: 'New Order'),
        BottomNavigationBarItem(
            icon: Icon(currentTab == 2 ? Icons.shopping_cart : Icons.shopping_cart_outlined),
            label: 'Cart'),
        BottomNavigationBarItem(
            icon: Icon(currentTab == 3 ? Icons.subdirectory_arrow_left_outlined : Icons.subdirectory_arrow_left_outlined),
            label: 'Return Order'),
        BottomNavigationBarItem(
            icon: Icon(currentTab == 4 ? Icons.groups_rounded : Icons.groups_outlined),
            label: 'Customers'),
      ],
    );
  }
}
