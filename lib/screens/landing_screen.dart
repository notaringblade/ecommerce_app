import 'package:ecommerce_app/bloc/login/login_bloc.dart';
import 'package:ecommerce_app/config/theme.dart';
import 'package:ecommerce_app/main.dart';
import 'package:ecommerce_app/screens/login_page.dart';
import 'package:ecommerce_app/widgets/common/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../config/globals.dart' as globals;
import 'package:flutter_bloc/flutter_bloc.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);
  static const String routeName = '/LandingScreen';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const LandingScreen());
  }

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  bool lastPage = false;
  @override
  Widget build(BuildContext context) {
    TextEditingController username = TextEditingController();
    TextEditingController password = TextEditingController();
    PageController controller = PageController();
    return Scaffold(
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LogInFail) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.redAccent,
                content: Text('Please Check Your Username or Password'),
              ),
            );
          }
        },
        child: Stack(children: [
          PageView(
            onPageChanged: (index) {
              setState(() {
                lastPage = (index == 2);
              });
            },
            controller: controller,
            children: [
              Container(
                color: Colors.blueAccent,
                alignment: Alignment.center,
                child: const Text("Page 1"),
              ),
              Container(
                color: Colors.pinkAccent,
                alignment: Alignment.center,
                child: const Text("Page 2"),
              ),
              Container(
                color: Colors.white60,
                child: BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    if (state is LoginInitial || state is LogInFail) {
                      return LoginWidget(
                        password: password,
                        username: username,
                        onTap: () {
                          if (username.text.isNotEmpty ||
                              password.text.isNotEmpty) {
                            // globals.index = 2;
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return const Home();
                            }));
                          }
                        },
                      );
                    } else if (state is LoggingIn) {
                      return const LoadingWidget();
                    } else if (state is LoggedIn) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Text("Logged in Successfully", style: theme().textTheme.displayMedium,),
                        const SizedBox(height: 40,),
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return const Home();
                            }));
                          },
                          child: Text("Continue", style: theme().textTheme.displaySmall ,),
                        )
                      ]);
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
            ],
          ),
          Container(
            alignment: const Alignment(0, .75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                    onTap: () {
                      globals.index = 0;
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return const Home();
                      }));
                    },
                    child: const Text(
                      "Skip",
                      style: TextStyle(fontSize: 12),
                    )),
                SmoothPageIndicator(
                  controller: controller,
                  count: 3,
                  effect: const WormEffect(activeDotColor: Colors.white),
                ),
                lastPage
                    ? InkWell(
                        onTap: () {
                          globals.index = 0;
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return const Home();
                          }));
                        },
                        child: const Text(
                          "Done",
                          style: TextStyle(fontSize: 12),
                        ))
                    : InkWell(
                        onTap: () {
                          controller.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn);
                        },
                        child: const Text(
                          "Next",
                          style: TextStyle(fontSize: 12),
                        ))
              ],
            ),
          )
        ]),
      ),
    );
  }
}
