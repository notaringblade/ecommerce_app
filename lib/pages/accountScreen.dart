import 'package:ecommerce_app/bloc/history/history_bloc.dart';
import 'package:ecommerce_app/bloc/login/login_bloc.dart';
import 'package:ecommerce_app/config/theme.dart';
import 'package:ecommerce_app/screens/login_page.dart';
import 'package:ecommerce_app/widgets/common/default_input.dart';
import 'package:ecommerce_app/widgets/common/item_widget.dart';
import 'package:ecommerce_app/widgets/common/panel.dart';
import 'package:ecommerce_app/widgets/history_widgets.dart/inputs.dart';
import 'package:ecommerce_app/widgets/history_widgets.dart/label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextEditingController username = TextEditingController();
    TextEditingController password = TextEditingController();

    return Scaffold(
        body: BlocListener<LoginBloc, LoginState>(listener: (context, state) {
      if (state is LogInFail) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text('Please Check Your Username or Password'),
          ),
        );
      }
    }, child: BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
          if (state is LoginInitial || state is LogInFail) {
          return LoginWidget(username: username, password: password, onTap: (){},);
        }
        else if (state is LoggingIn) {
          return Center(
              child: CircularProgressIndicator(
            color: Colors.black,
          ));
        }
        else if (state is LoggedIn) {
          return accountDisplay(context, state);
        }  
        else {
          return Container();
        }
      },
    )));
  }

  SingleChildScrollView accountDisplay(BuildContext context, LoggedIn state) {
    return SingleChildScrollView(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LabelText(labelText: "User Info"),
                      InkWell(
                          onTap: () {
                            context.read<LoginBloc>()..add(LoggingOutEvent());
                          },
                          child: Text("Sign out",
                              style: theme().textTheme.headline4!.copyWith(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold)))
                    ],
                  ),
                  Inputs(value: state.username, sectionName: "Username"),
                  Inputs(value: "email", sectionName: "Email"),
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
    );
  }
}


