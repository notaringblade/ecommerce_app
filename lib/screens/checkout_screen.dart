import 'package:ecommerce_app/bloc/login/login_bloc.dart';
import 'package:ecommerce_app/config/theme.dart';
import 'package:ecommerce_app/main.dart';
import 'package:ecommerce_app/widgets/homePageWidgets/item_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../config/globals.dart' as globals;

import '../bloc/cart/cart_bloc.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);
  static const String routeName = '/Checkout';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const CheckoutScreen());
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController addressController = TextEditingController();
    final TextEditingController cityController = TextEditingController();
    final TextEditingController stateController = TextEditingController();
    final TextEditingController zipCodeController = TextEditingController();

    return BlocBuilder<CartBloc, CartState>(
      builder: (context, cstate) {
        if (cstate is CartLoaded) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                title: Text("Checkout",
                    style: Theme.of(context).textTheme.headline1),
                centerTitle: true,
                elevation: 0,
                toolbarHeight: 55,
                leading: const BackButton(
                  color: Colors.black,
                ),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Expanded(
                    child: BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, state) {
                        if (state is LoggedIn) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                child: Column(
                                  children: [
                                    Text("User Info",
                                        style: theme()
                                            .textTheme
                                            .headline2!
                                            .copyWith(
                                                fontWeight: FontWeight.bold)),
                                    _buildTextFormField(context, nameController,
                                        "", state.username),
                                    _buildTextFormField(
                                        context, emailController, "Email", ""),
                                  ],
                                ),
                              ),
                              SizedBox(
                                child: Column(
                                  children: [
                                    Text("Delivery Information",
                                        style: theme()
                                            .textTheme
                                            .headline2!
                                            .copyWith(
                                                fontWeight: FontWeight.bold)),
                                    _buildTextFormField(context,
                                        addressController, "Address", ""),
                                    _buildTextFormField(
                                        context, stateController, "State", ""),
                                    _buildTextFormField(
                                        context, cityController, "City", ""),
                                    _buildTextFormField(context,
                                        zipCodeController, "Zip Code", ""),
                                  ],
                                ),
                              ),
                              SizedBox(
                                  child: Column(
                                children: [
                                  Text("Order Summary",
                                      style: theme()
                                          .textTheme
                                          .headline2!
                                          .copyWith(
                                              fontWeight: FontWeight.bold)),
                                  SizedBox(
                                      height: 260,
                                      child: ItemList(
                                        products: cstate.cart.products,
                                        itemCount: cstate.cart.products.length,
                                      ))
                                ],
                              ))
                            ],
                          );
                        } else {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 300,
                              ),
                              Center(
                                child: Text(
                                  "Please Log in To Continue",
                                  style: theme().textTheme.displayMedium,
                                ),
                              ),
                            ],
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
              bottomNavigationBar: BottomAppBar(
                color: Colors.transparent,
                elevation: 0,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
                  child: Container(
                    height: 65, //set your height here
                    width: double.maxFinite, //set your width here
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: BlocBuilder<CartBloc, CartState>(
                        builder: (context, state) {
                          if (state is CartLoaded) {}
                          return Row(
                            // mainAxisSize: MainAxisSize.max,
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BlocBuilder<LoginBloc, LoginState>(
                                builder: (context, lstate) {
                                  if (state is CartLoaded &&
                                      lstate is LoggedIn) {
                                    return SizedBox(
                                      child: Text(
                                        "\$ ${state.cart.grandTotalString}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1,
                                      ),
                                    );
                                  } else {
                                    return const SizedBox();
                                  }
                                },
                              ),
                              BlocBuilder<LoginBloc, LoginState>(
                                builder: (context, state) {
                                  if (state is LoggedIn) {
                                    return Builder(builder: (context) {
                                      return FloatingActionButton.extended(
                                        onPressed: () {},
                                        label: const Text("Order Now"),
                                        icon: const Icon(Icons.shopping_cart),
                                        backgroundColor: Colors.black,
                                        elevation: 0,
                                      );
                                    });
                                  } else {
                                    return Center(
                                      child: FloatingActionButton.extended(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          globals.index = 2;
                                          Navigator.pushReplacement(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return const Home();
                                          }));
                                        },
                                        label: const Text("Login To Order"),
                                        icon: const Icon(Icons.login_outlined),
                                        backgroundColor: Colors.black,
                                        elevation: 0,
                                      ),
                                    );
                                  }
                                },
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ));
        } else {
          return const Center(
            child: Text("Error"),
          );
        }
      },
    );
  }

  _buildTextFormField(BuildContext context, TextEditingController controller,
      String s, String init) {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: TextFormField(
          autofocus: false,
          controller: TextEditingController(text: init),
          decoration: InputDecoration(
              filled: true,
              label: Text(s),
              labelStyle: const TextStyle(color: Colors.black),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              fillColor: Colors.white,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 16)),
        ));
  }
}
