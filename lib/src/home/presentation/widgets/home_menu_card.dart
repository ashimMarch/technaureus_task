
import 'package:flutter/material.dart';

import '../../../../core/common/widgets/item_card.dart';
import '../../../../core/resources/color_res.dart';

class HomeMenuCard extends StatelessWidget {
  const HomeMenuCard({
    required this.icon,
    required this.title,
    this.onTap,
    super.key,
  });
  final IconData icon;
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap, 
      child: ItemCard(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Palette.primaryColor,
              size: 35,
            ),
            const SizedBox(height: 10,),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            )
          ],
        )
      ),
    );
  }
}