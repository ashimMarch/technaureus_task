
import 'package:flutter/material.dart';

import '../../../../core/common/widgets/search_field.dart';

class ProductSearchArea extends StatelessWidget {
  const ProductSearchArea({
    required this.itemList,
    required this.dropDownOChanged,
    super.key,
    this.controller,
    this.onChanged,
    this.onFieldSubmitted,
  });

  final List<String> itemList;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function(String?)? dropDownOChanged;
  final void Function(String)? onFieldSubmitted;
  @override
  Widget build(BuildContext context) {
    return SearchField(
      controller: controller,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      suffixIcon: Row(
        children: [
          const Icon(
            Icons.qr_code_2_rounded,
            color: Colors.black38,
          ),
          const SizedBox(
            height: 20,
            width: 5,
            child: VerticalDivider(color: Colors.black45,),
          ),
          
          Expanded(
            child: DropdownButton<String>(
              onChanged: dropDownOChanged,
              value: itemList.first,
              alignment: Alignment.center,
              elevation: 16,
              iconEnabledColor: Colors.black38,
              icon: null,
              style: const TextStyle(
                color: Colors.black45,
              ),
              underline: const SizedBox(),
              // borderRadius: BorderRadius.circular(10),
              menuMaxHeight: 250,
              isExpanded: true,
              items: itemList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  alignment: Alignment.centerLeft,
                  value: value,
                  child: Text(
                    value,
                  ),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}

