import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technaureus_task/src/dashboard/presentation/cubit/nav_bar_cubit.dart';
import 'package:technaureus_task/src/product/presentation/view/product_screen.dart';
import '../widgets/home_menu_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          spacing: 10,
          runAlignment: WrapAlignment.start,
          runSpacing: 10,
          children: [
            HomeMenuCard(
              onTap: () {
                context.read<NavBarCubit>().changeTab(4);
              },
              icon: Icons.groups,
              title: 'Customers',
            ),
            HomeMenuCard(
              onTap: () {
                Navigator.pushNamed(context, ProductScreen.routeName);
              },
              icon: Icons.inventory,
              title: 'Products',
            ),
            HomeMenuCard(
              onTap: () {
                
              },
              icon: Icons.addchart_outlined,
              title: 'New Order',
            ),
            HomeMenuCard(
              onTap: () {
                
              },
              icon: Icons.subdirectory_arrow_left_outlined,
              title: 'Return Order',
            ),
            HomeMenuCard(
              onTap: () {
                
              },
              icon: Icons.payment,
              title: 'Add Payment',
            ),
            HomeMenuCard(
              onTap: () {
                
              },
              icon: Icons.receipt_long,
              title: "Today's Ordes",
            ),
            HomeMenuCard(
              onTap: () {
                
              },
              icon: Icons.content_paste_rounded,
              title: "Today's Summary",
            ),
            HomeMenuCard(
              onTap: () {
                
              },
              icon: Icons.route_rounded,
              title: 'Route',
            ),
          ],
        ),
      ),
    );
  }
}
