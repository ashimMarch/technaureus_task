import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technaureus_task/core/resources/image_res.dart';
import 'package:technaureus_task/src/product/presentation/view/cart_screen.dart';
import 'package:technaureus_task/src/customers/presentation/view/customers_screen.dart';
import 'package:technaureus_task/src/others/comingsoon.dart';
import '../../../home/presentation/view/home_screen.dart';
import '../cubit/nav_bar_cubit.dart';
import '../widgets/bottom_nav_bar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});
  static const routeName = '/dashboard';
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final _widgetList = const [
    HomeScreen(),
    ComingSoonScreen(),
    CartScreen(),
    ComingSoonScreen(),
    CustomersScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavBarCubit(),
      child: BlocBuilder<NavBarCubit, NavBarState>(
        builder: (context, state) {
        final selectedIndex = state.props.first as int;
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leadingWidth: 45,
              leading: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: CircleAvatar(
                  backgroundColor: Colors.black12,
                  child: Image.asset(
                    ImageRes.noProfileImg,
                    width: 20,
                  ),
                ),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.black,
                  )
                ),
              ],
            ),
            body: _widgetList[selectedIndex],
            bottomNavigationBar: BottomNavBarWidget(
              currentTab: selectedIndex,
            ),
          );
        },
      ),
    );
  }
}
