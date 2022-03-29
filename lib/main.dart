import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:teaching_app/config/colors_.dart';
import 'package:teaching_app/screens/index_screen.dart';
import 'package:teaching_app/screens/search_screen.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.black));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Poppins",
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Widget> _screens = const [
    IndexScreen(),
    IndexScreen(),
    SearchScreen(),
    IndexScreen(),
    IndexScreen(),
  ];
  int _index = 0;
  @override
  void initState() {
    FlutterNativeSplash.remove();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBody: true,
        backgroundColor: const Color(0xffF4FAFB),
        body: _screens[_index],
        floatingActionButton: SizedBox(
          width: 58,
          height: 58,
          child: FloatingActionButton(
              onPressed: () {
                setState(() {
                  _index = 2;
                });
              },
              backgroundColor: _index == 2 ? greenLight : greenTint1,
              child: SvgPicture.asset(
                "assets/icons/search.svg",
                color: Colors.white,
              )),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: SizedBox(
          height: 60,
          child: BottomAppBar(
            notchMargin: 15,
            color: Colors.white,
            shape: const CircularNotchedRectangle(),
            child: Row(
              children: [
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            _index = 0;
                          });
                        },
                        icon: SvgPicture.asset(
                          "assets/icons/home.svg",
                          color: _index == 0 ? greenLight : greenTint1,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          "assets/icons/chat.svg",
                          color: _index == 1 ? greenLight : greenTint1,
                        ))
                  ],
                )),
                const SizedBox(
                  width: 73,
                ),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          "assets/icons/teach.svg",
                          color: _index == 3 ? greenLight : greenTint1,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          "assets/icons/profile.svg",
                          color: _index == 4 ? greenLight : greenTint1,
                        ))
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
