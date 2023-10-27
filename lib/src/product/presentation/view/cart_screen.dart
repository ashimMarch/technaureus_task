import 'package:flutter/material.dart';
import 'package:technaureus_task/core/resources/color_res.dart';
import 'package:technaureus_task/core/utils/constant_widgets.dart';
import 'package:technaureus_task/src/product/presentation/widgets/produxt_count_btn.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        children: [
          Flexible(
            flex: 1,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              itemCount: 25,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: double.maxFinite,
                  height: 65,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        flex: 1,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            kHeight10,
                            Text(
                              'Kashmir Kivi| 250g',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            kHeight5,
                            Text(
                              '\$180/-',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      kWidth10,
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ProductCountButton(
                            increaseQTY: (quantity) {},
                            decreaseQTY: (quantity) {},
                            enableAddBtn: false,
                          ),
                          IconButton(
                            onPressed: (){}, 
                            icon: const Icon(Icons.delete,color: Colors.red,),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(color: Colors.black26,height: 3,thickness: 1),
            ),
          ),
          Container(
            width: double.maxFinite,
            height: 175,
            margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10).copyWith(top: 30),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black26),
              borderRadius: BorderRadius.circular(20)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CalculationRow(
                  firstText: 'Subtotal',
                  secondText: '\$470/-',
                ),
                const CalculationRow(
                  firstText: 'Tax',
                  secondText: '\$50/-',
                ),
                const Divider(color: Colors.black26,),
                const CalculationRow(
                  firstText: 'Total',
                  secondText: '\$520/-',
                  fontSize: 19,
                  isBoldText: true,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PrimaryElevatedButton(
                      onPressed: (){},
                      buttonText: 'Submit',
                    ),
                    PrimaryElevatedButton(
                      onPressed: (){},
                      buttonText: 'Order & Delivery',
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CalculationRow extends StatelessWidget {
  const CalculationRow({
    super.key,
    required this.firstText,
    required this.secondText,
    this.fontSize = 16,
    this.isBoldText = false,
  });
  final String firstText;
  final String secondText;
  final double fontSize;
  final bool isBoldText;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          firstText,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          secondText,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: isBoldText ? FontWeight.bold : FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class PrimaryElevatedButton extends StatelessWidget {
  const PrimaryElevatedButton({
    required this.buttonText,
    required this.onPressed,
    super.key,
  });
  final String buttonText;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed, 
      style: ElevatedButton.styleFrom(
          backgroundColor: Palette.primaryColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40)),
          minimumSize: const Size(120, 30)
      ),
      child: Text(buttonText)
    );
  }
}
