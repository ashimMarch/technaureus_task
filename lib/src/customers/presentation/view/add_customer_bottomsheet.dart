import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technaureus_task/core/common/widgets/custom_icon_button.dart';
import 'package:technaureus_task/core/common/widgets/input_textfield.dart';
import 'package:technaureus_task/core/extensions/build_context_extension.dart';
import 'package:technaureus_task/core/resources/color_res.dart';
import 'package:technaureus_task/core/utils/constant_widgets.dart';
import 'package:technaureus_task/core/utils/snack_bar.dart';
import 'package:technaureus_task/src/customers/domain/repository/customer_params.dart';
import 'package:technaureus_task/src/customers/presentation/bloc/customer_bloc.dart';

import '../../domain/entity/customer.dart';

Future<void> customerBottomsheet({
  required BuildContext context,
  required CustomerBloc bloc,
}) async {
  await showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20))),
    backgroundColor: Colors.white,
    constraints: BoxConstraints(
        maxHeight: context.height * 0.68, minHeight: context.height * 0.5),
    isScrollControlled: true,
    builder: (context) {
      return BlocProvider<CustomerBloc>.value(
        value: bloc,
        child: const CustomerDetails(),
      );
    },
  );
}

class CustomerDetails extends StatefulWidget {
  const CustomerDetails({super.key, this.customer});

  final Customer? customer;

  @override
  State<CustomerDetails> createState() => _CustomerDetailsState();
}

class _CustomerDetailsState extends State<CustomerDetails> {
  late final TextEditingController _name;
  late final TextEditingController _phone;
  late final TextEditingController _email;
  late final TextEditingController _street1;
  late final TextEditingController _street2;
  late final TextEditingController _city;
  late final TextEditingController _pincode;
  late final TextEditingController _country;
  late final TextEditingController _state;

  @override
  void initState() {
    super.initState();
    _name = TextEditingController(text: 'Teena');
    _phone = TextEditingController(text: '1234567890');
    _email = TextEditingController(text: 'teena@gmail.com');
    _street1 = TextEditingController(text: 'street one');
    _street2 = TextEditingController(text: 'street two');
    _city = TextEditingController(text: 'tvm');
    _pincode = TextEditingController(text: '695565');
    _state = TextEditingController(text: 'Kerala');
    _country = TextEditingController(text: 'India');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15)
          .copyWith(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: BlocConsumer<CustomerBloc, CustomerState>(
        listener: (context, state) {
          if (state is CustomerUploading) {
            Navigator.pop(context);
            AppSnackBar.loadingSnackBar(context);
          }
        },
        builder: (context, state) {
          bool isUploading = false;
          if (state is CustomerUploading) {
            isUploading = true;
          }
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Add Customer',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    CustomIconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      backgroundColor: const Color(0xFFe6ecf6),
                      elevation: 0,
                      size: const Size(29, 29),
                      icon: const Icon(
                        Icons.close,
                        size: 15,
                        color: Palette.primaryColor,
                      ),
                    ),
                  ],
                ),
                InputTextField(
                  controller: _name,
                  keyboardType: TextInputType.name,
                  labelText: 'Customer Name',
                ),
                kHeight10,
                InputTextField(
                  controller: _phone,
                  keyboardType: TextInputType.phone,
                  labelText: 'Mobile Number',
                ),
                kHeight10,
                InputTextField(
                  controller: _email,
                  keyboardType: TextInputType.emailAddress,
                  labelText: 'email',
                ),
                kHeight20,
                const Text(
                  'Address',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                kHeight10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 1,
                      child: InputTextField(
                        controller: _street1,
                        keyboardType: TextInputType.text,
                        labelText: 'Street 1',
                      ),
                    ),
                    kWidth10,
                    Flexible(
                      flex: 1,
                      child: InputTextField(
                        controller: _street2,
                        keyboardType: TextInputType.text,
                        labelText: 'Street 2',
                      ),
                    ),
                  ],
                ),
                kHeight10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 1,
                      child: InputTextField(
                        controller: _city,
                        keyboardType: TextInputType.text,
                        labelText: 'City',
                      ),
                    ),
                    kWidth10,
                    Flexible(
                      flex: 1,
                      child: InputTextField(
                        controller: _pincode,
                        keyboardType: TextInputType.text,
                        labelText: 'Pincode',
                      ),
                    ),
                  ],
                ),
                kHeight10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 1,
                      child: InputTextField(
                        controller: _country,
                        keyboardType: TextInputType.text,
                        labelText: 'Country',
                      ),
                    ),
                    kWidth10,
                    Flexible(
                      flex: 1,
                      child: InputTextField(
                        controller: _state,
                        keyboardType: TextInputType.text,
                        labelText: 'State',
                      ),
                    ),
                  ],
                ),
                kHeight20,
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: !isUploading ? () {
                      context.read<CustomerBloc>().add(CreateCustomerEvent(
                        customerInfo: CustomerParams(
                          id: null, 
                          name: _name.text, 
                          mobileNumber: _phone.text, 
                          email: _email.text, 
                          street: _street1.text, 
                          streetTwo: _street2.text, 
                          city: _city.text, 
                          pincode: int.tryParse(_pincode.text) ?? 0, 
                          country: _country.text, 
                          state: _state.text,
                        )
                      ));
                    } : null,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Palette.primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                        minimumSize: const Size(150, 45)
                    ),
                    child: const Text('Submit'),
                  ),
                ),
                kHeight20,
              ],
            ),
          );
        },
      ),
    );
  }
}
