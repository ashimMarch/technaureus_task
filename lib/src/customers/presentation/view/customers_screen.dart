import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:technaureus_task/core/resources/image_res.dart';
import 'package:technaureus_task/core/utils/constants.dart';
import 'package:technaureus_task/core/utils/snack_bar.dart';
import 'package:technaureus_task/src/customers/domain/entity/customer.dart';
import 'package:technaureus_task/src/customers/presentation/bloc/customer_bloc.dart';
import 'package:technaureus_task/src/customers/presentation/view/add_customer_bottomsheet.dart';
import '../../../../core/resources/icons_res.dart';
import '../widgets/customer_search_area.dart';

class CustomersScreen extends StatefulWidget {
  const CustomersScreen({super.key});

  @override
  State<CustomersScreen> createState() => _CustomersScreenState();
}

class _CustomersScreenState extends State<CustomersScreen> {
  List<Customer> customerList = [];
  Timer? _debouncing;

  @override
  void dispose() {
    _debouncing?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.maxFinite,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CustomerSearchArea(
              onChanged: (value) {
                if (_debouncing?.isActive ?? false) {
                  _debouncing!.cancel();
                }
                _debouncing = Timer(const Duration(milliseconds: 800), () {
                  if (value.isEmpty) {
                    context.read<CustomerBloc>().add(const GetAllCustomerEvent());
                  }
                });
              },
              onFieldSubmitted: (value) {
                context.read<CustomerBloc>().add(SearchCustomerEvent(value));
              },
              addProduct: () async {
                await customerBottomsheet(
                  context: context,
                  bloc: context.read<CustomerBloc>(),
                );
              },
            ),
          ),
          BlocConsumer<CustomerBloc, CustomerState>(
            listener: (context, state) {
              if (state is CustomerSearching) {
                AppSnackBar.loadingSnackBar(context);
              }else if (state is SearchingCompleted) {
                AppSnackBar.turnOFFLoadingSnackBar(context);
              }else if (state is CustomerError) {
                AppSnackBar.showSnackBar(context, state.message);
              }
            },
            builder: (context, state) {
              if (state is CustomerInitial || state is CustomerLoading) {
                return const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if(state is CustomerLoaded){
                customerList = state.customers;
              } else if(state is SearchingCompleted){
                customerList = state.customers;
              }
              return Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(10),
                  itemCount: customerList.length,
                  itemBuilder: (context, index) {
                    final customer = customerList[index];
                    return Container(
                      width: double.maxFinite,
                      height: 100,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 6,
                              spreadRadius: 4,
                              color: Colors.grey.shade200),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 80,
                            child: customer.profilePic != null ? Image.network(
                              // 'http://62.72.44.247/media/customers/avatar_BiclVBz.jpg',
                              '$kNetworkImageUrl${customer.profilePic}',
                              fit: BoxFit.cover,
                            )
                            : Image.asset(ImageRes.noProfileImg),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  // 'Nescafe',
                                  customer.name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                                Text(
                                  // 'ID: ID01DR',
                                  'ID: ${customer.id}',
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  // 'My new address in the city, state,',
                                  '${customer.street}, ${customer.streetTwo}, ${customer.city}, ${customer.state}, ${customer.country}, ${customer.pincode}, ',
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                RichText(
                                  text: const TextSpan(
                                    text: 'Due Amount: ',
                                    children: [
                                      TextSpan(
                                          text: '\$100',
                                          style: TextStyle(color: Colors.red))
                                    ],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 14),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                  onTap: () {},
                                  child: SvgPicture.asset(IconRes.phone,
                                      width: 15, fit: BoxFit.cover)),
                              const SizedBox(
                                width: 4,
                              ),
                              InkWell(
                                  onTap: () {},
                                  child: SvgPicture.asset(IconRes.whatsapp,
                                      width: 15, fit: BoxFit.cover)),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                ),
              );
            },
          ),
          // const SizedBox(height: 10,)
        ],
      ),
    );
  }
}
