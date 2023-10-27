
import 'package:flutter/material.dart';

import '../../../../core/resources/color_res.dart';



final ButtonStyle _buttonStyle =  ElevatedButton.styleFrom(
  backgroundColor: Palette.primaryColor,
  padding: const EdgeInsets.all(5),
  minimumSize: const Size(8, 8),
  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
  elevation: 1
);

class ProductCountButton extends StatefulWidget {
  const ProductCountButton({
    super.key,
    required this.decreaseQTY,
    required this.increaseQTY,
    this.enableAddBtn = true,
  });

  final void Function(int quantity) increaseQTY;
  final void Function(int quantity) decreaseQTY;
  final bool enableAddBtn;

  @override
  State<ProductCountButton> createState() => _ProductCountButtonState();
}

class _ProductCountButtonState extends State<ProductCountButton> {
  bool showCounterButton = false;
  int selectedQty = 0;
  @override
  void initState() {
    super.initState();
    showCounterButton = !widget.enableAddBtn;
  }
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Palette.primaryColor,
        borderRadius: BorderRadius.circular(5)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical:1),
        child: showCounterButton ? Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedQty++;
                });
                widget.increaseQTY(selectedQty);
              },
              style: _buttonStyle,
              child: const Icon(Icons.add,size: 12,color: Colors.white)
            ),
            const SizedBox(width: 1,),
            Text('$selectedQty',style: const TextStyle(color: Colors.white),),
            const SizedBox(width: 1,),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedQty--;
                });
                widget.decreaseQTY(selectedQty);
              },
              style: _buttonStyle,
              child: const Icon(Icons.remove,size: 12,color: Colors.white)
            ),
          ],
        )
        : ElevatedButton(
          onPressed: () {
            setState(() {
              showCounterButton = !showCounterButton;
            });
          }, 
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(50, 10),
            maximumSize: const Size(50, 40),
            padding: const EdgeInsets.symmetric(vertical: 5),
            backgroundColor: Palette.primaryColor,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: const Text('Add',style: TextStyle(color: Colors.white),)
        )
      ),
    );
  }
}
