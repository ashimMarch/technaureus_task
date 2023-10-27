import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technaureus_task/core/utils/constants.dart';
import 'package:technaureus_task/core/utils/snack_bar.dart';
import '../../../../core/common/widgets/item_card.dart';
import '../../domain/entity/product_entity.dart';
import '../bloc/product_bloc.dart';
import '../widgets/product_search_area.dart';
import '../widgets/produxt_count_btn.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});
  static const routeName = '/product-screen';

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<Product> productList = [];
  Timer? _debouncing;
  final itemList = ['Fruits'];

  @override
  void dispose() {
    _debouncing?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 45,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            ))),
        centerTitle: true,
        title: const Text(
          'Nesto Hypermarket',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            )),
        ],
      ),
      body: SizedBox.expand(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ProductSearchArea(
                  onChanged: (value) {
                    if (_debouncing?.isActive ?? false) {
                      _debouncing!.cancel();
                    }
                    _debouncing = Timer(
                      const Duration(milliseconds: 800), () {
                        if (value.isEmpty) {
                          context.read<ProductBloc>().add(const GetAllProductEvent());
                        }
                      }
                    );
                  },
                  onFieldSubmitted: (value) {
                    context.read<ProductBloc>().add(SearchProductEvent(productName: value));
                  },
                  itemList: itemList,
                  dropDownOChanged: (value) {},
                )),
            Expanded(
              child: BlocConsumer<ProductBloc, ProductState>(
                listener: (context, state) {
                  if (state is ProductError) {
                    AppSnackBar.showSnackBar(context, state.message);
                  }else if(state is ProductSearching){
                    AppSnackBar.loadingSnackBar(context);
                  }else if(state is ProductSearchCompleted){
                    AppSnackBar.turnOFFLoadingSnackBar(context);
                  }
                },
                builder: (context, state) {
                  if (state is ProductInitial || state is ProductLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if(state is ProductLoaded){
                    productList = state.products;
                  }else if(state is ProductSearchCompleted){
                    productList = state.products;
                  }
                  return GridView.builder(
                    itemCount: productList.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1.185,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    itemBuilder: (context, index) {
                      final product = productList[index];
                      return ItemCard(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: Image.network(
                                  '$kNetworkImageUrl${product.image}',
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 45,
                                width: double.maxFinite,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      child: RichText(
                                          text: TextSpan(
                                              text: product.name,
                                              children: [
                                                TextSpan(
                                                    text: '\n\$''${product.price}/-',
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal))
                                              ],
                                              style: const TextStyle(
                                                  fontSize: 11,
                                                  color: Colors.black,
                                                  fontWeight:
                                                      FontWeight.bold))),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                      child: VerticalDivider(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    ProductCountButton(
                                      increaseQTY: (quantity) {},
                                      decreaseQTY: (quantity) {},
                                    )
                                  ],
                                ),
                              )
                            ],
                          ));
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
