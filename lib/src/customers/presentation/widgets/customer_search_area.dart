
import 'package:flutter/material.dart';
import 'package:technaureus_task/core/common/widgets/custom_icon_button.dart';

import '../../../../core/common/widgets/search_field.dart';

class CustomerSearchArea extends StatelessWidget {
  const CustomerSearchArea({
    super.key,
    this.addProduct,
    this.controller,
    this.onChanged,
    this.onFieldSubmitted,
  });
  final VoidCallback? addProduct;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return SearchField(
      controller: controller,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      suffixIcon: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.qr_code_2_rounded,
            color: Colors.black38,
          ),
          CustomIconButton(
            onPressed: addProduct,
            icon: const Icon(
              Icons.add,size: 15,
              color: Colors.white,
            ),
          )
        ]
      ),
    );
  }
}
