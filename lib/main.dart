import 'package:cal_ai/configs/theme.dart';
import 'package:cal_ai/firebase_options.dart';
import 'package:cal_ai/hive_init.dart';
import 'package:cal_ai/screens/root_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await initHive();

  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 800),
      builder: (context, child) {
        return MaterialApp(
          scrollBehavior: const CupertinoScrollBehavior(),
          debugShowCheckedModeBanner: false,
          home: const RootPage(),
          theme: theme(),
        );
      },
    );
  }
}
