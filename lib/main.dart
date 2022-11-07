import 'package:easyplane_app/cubit/page_cubit.dart';
import 'package:easyplane_app/ui/pages/bonus_page.dart';
import 'package:easyplane_app/ui/pages/detail_page.dart';
import 'package:easyplane_app/ui/pages/get_started.dart';
import 'package:easyplane_app/ui/pages/main_page.dart';
import 'package:easyplane_app/ui/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'ui/pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => PageCubit())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/getStarted': (context) => const GetStartedPage(),
          '/signup': (context) => const SignUpPage(),
          '/bonus': (context) => const BonusPage(),
          '/main': (context) => const MainPage(),
          '/detail': (context) => const DetailPage(),
        },
      ),
    );
  }
}
