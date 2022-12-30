import 'package:ecommerce_app/bloc/login/login_bloc.dart';
import 'package:ecommerce_app/main.dart';
import 'package:ecommerce_app/pages/accountScreen.dart';
import 'package:ecommerce_app/screens/login_page.dart';
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
    PageController _controller = PageController();
    return Scaffold(
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LogInFail) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.redAccent,
                content: Text('Please Check Your Username or Password'),
              ),
            );
          }
        },
        child: SafeArea(
          child: Stack(children: [
            PageView(
              onPageChanged: (index) {
                setState(() {
                  lastPage = (index == 2);
                });
              },
              controller: _controller,
              children: [
                Container(
                  color: Colors.blueAccent,
                  child: Text("Page 1"),
                  alignment: Alignment.center,
                ),
                Container(
                  color: Colors.pinkAccent,
                  child: Text("Page 2"),
                  alignment: Alignment.center,
                ),
                Container(
                  child: LoginWidget(password: password, username: username, onTap: (){
                    if(!username.text.isEmpty || !password.text.isEmpty){

                    globals.index = 2;
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return Home();
                            }));
                    }
                  },),
                  color: Colors.greenAccent,
                ),
              ],
            ),
            Container(
              alignment: Alignment(0, .75),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                      onTap: () {
                        globals.index = 0;
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return Home();
                        }));
                      },
                      child: Text(
                        "Skip",
                        style: TextStyle(fontSize: 12),
                      )),
                  SmoothPageIndicator(
                    controller: _controller,
                    count: 3,
                    effect: WormEffect(activeDotColor: Colors.white),
                  ),
                  lastPage
                      ? InkWell(
                          onTap: () {
                            globals.index = 0;
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return Home();
                            }));
                          },
                          child: Text(
                            "Done",
                            style: TextStyle(fontSize: 12),
                          ))
                      : InkWell(
                          onTap: () {
                            _controller.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeIn);
                          },
                          child: Text(
                            "Next",
                            style: TextStyle(fontSize: 12),
                          ))
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
