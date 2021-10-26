import 'package:animate_do/animate_do.dart';
import 'package:connect_cubit/core/constants/enums.dart';
import 'package:connect_cubit/logic/cubit/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(136, 224, 239, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: BlocBuilder<InternetCubit, InternetState>(
              // ignore: missing_return
              builder: (context, state) {
                if (state is InternetConnected &&
                    state.connectionType == ConnectionType.wifi) {
                  return BounceInDown(
                    duration: const Duration(seconds: 3),
                    child: Container(
                      width: 250,
                      height: 250,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/wifi.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                } else if (state is InternetConnected &&
                    state.connectionType == ConnectionType.mobile) {
                  return BounceInLeft(
                     duration: const Duration(seconds: 3),
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/mobile.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                } else if (state is InternetDisconnected) {
                  return BounceInUp(
                     duration: const Duration(seconds: 3),
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image:
                              AssetImage("assets/images/lost-connection.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
