import 'package:ecommerce_app/bloc/history/history_bloc.dart';
import 'package:ecommerce_app/config/theme.dart';
import 'package:ecommerce_app/models/history_model.dart';
import 'package:ecommerce_app/widgets/common/item_widget.dart';
import 'package:ecommerce_app/widgets/common/panel.dart';
import 'package:ecommerce_app/widgets/history_widgets.dart/inputs.dart';
import 'package:ecommerce_app/widgets/history_widgets.dart/label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 650,
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Icon(
                  Icons.person,
                  size: 56,
                ),
              ),
              Panel(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    LabelText(labelText: "User Info"),
                    Inputs(),
                  ],
                ),
              ),
              Panel(
                height: 310,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LabelText(labelText: "Product History"),
                    BlocBuilder<HistoryBloc, HistoryState>(
                      builder: (context, state) {
                        if (state is HistoryLoaded) {
                          return Container(
                            width: 400,
                            height: 260,
                            child: ListView.builder(
                                // reverse: true,
                                // shrinkWrap: true,
                                // reverse: true,
                                itemCount: state.products.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding:
                                        EdgeInsets.only(right: 4.0, left: 0.0),
                                    child: ProductCard(
                                      product: state.products[index],
                                    ),
                                  );
                                  // child: Text(state.products[index].name, style: theme().textTheme.displayMedium,));
                                }),
                            // child: Text(state.products.length.toString()),
                          );
                        } else if (state is HistoryLoading) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: Colors.black,
                            ),
                          );
                        } else {
                          return Center(
                            child: Text(
                              "error",
                              style: theme().textTheme.displayMedium,
                            ),
                          );
                        }
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
