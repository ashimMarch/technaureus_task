import 'package:flutter/material.dart';
import 'package:technaureus_task/core/extensions/build_context_extension.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    this.padding, 
    this.child,
  });
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    final width = context.width;
    return Container(
      width: width*0.45, height: width*0.38,
      padding: padding,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(blurRadius: 6,spreadRadius: 4,color: Colors.grey.shade200),
        ],
      ),
      child: child,
    );
  }
}