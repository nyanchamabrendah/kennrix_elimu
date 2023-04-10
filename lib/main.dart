
// ignore_for_file: use_key_in_widget_constructors

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kennrix_elimu/bh.dart';
import 'package:kennrix_elimu/copy.dart';
import 'package:kennrix_elimu/ken.dart';
import 'package:sidebarx/sidebarx.dart';



void main() => runApp(const SignUpApp());

class SignUpApp extends StatelessWidget {
  const SignUpApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) =>  SplashScreen(),
        '/welcome': (context) => SidebarXExampleApp(),

      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      // Navigates to the home screen after 5 seconds
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => SignInScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(
        primaryColor: Colors.yellow,

        canvasColor: Colors.white,
         ),
          child: Scaffold(
           body: Center(
               child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Image.asset("assets/logo.png"),
                 SizedBox(height: 20),
                 Text("Kennrix Elimu",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
          ],
        ),
      ),
          )
    );
  }
}




  class SignInScreen extends StatelessWidget {

  const SignInScreen();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent[200],
      body: const Center(
        child: SizedBox(
          width: 400,
          child: Card(
            child: SignUpForm(),
          ),
        ),
      ),
    );
  }
}
class SignUpForm extends StatefulWidget {
  const SignUpForm();
  @override
  // ignore: library_private_types_in_public_api
  _SignUpFormState createState() => _SignUpFormState();
}


class _SignUpFormState extends State<SignUpForm> {
  final _nameTextController = TextEditingController();
  final _admissionTextController = TextEditingController();
  final _schoolcodeTextController = TextEditingController();

  final double _formProgress = 0;
  void _showApp() {
    Navigator.of(context).pushNamed('/welcome');
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LinearProgressIndicator(value: _formProgress),
          Text('log in', style: Theme
              .of(context)
              .textTheme
              .headline4),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _nameTextController,
              decoration: const InputDecoration(hintText: 'name'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _admissionTextController,
              decoration: const InputDecoration(hintText: 'admission'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _schoolcodeTextController,
              decoration: const InputDecoration(hintText: 'schoolcode'),
            ),
          ),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
                return states.contains(MaterialState.disabled) ? null : Colors.white;
              }),
              backgroundColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
                return states.contains(MaterialState.disabled) ? null : Colors.yellow;
              }),
            ),
            onPressed: _showApp,

            child: const Text('proceed'),
          ),
        ],
      ),
    );
  }
}
class SidebarXExampleApp extends StatelessWidget {
  SidebarXExampleApp({Key? key}) : super(key: key);

  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'kennrix Elimu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        canvasColor: canvasColor,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            color: Colors.white,
            fontSize: 46,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      home: Builder(
        builder: (context) {
          final isSmallScreen = MediaQuery.of(context).size.width < 600;
          return Scaffold(
            key: _key,
            appBar: isSmallScreen
                ? AppBar(
                  backgroundColor: canvasColor,
                   title: const Text ('dashboard'),
                  leading: IconButton(
                onPressed: () {
                  // if (!Platform.isAndroid && !Platform.isIOS) {
                  //   _controller.setExtended(true);
                  // }
                  _key.currentState?.openDrawer();
                    }, icon: const Icon(Icons.menu),
              ),
            )
                : null,
            drawer: ExampleSidebarX(controller: _controller),
            body: Row(
              children: [
                if (!isSmallScreen) ExampleSidebarX(controller: _controller),
                Expanded(
                  child: Center(
                    child: _ScreensExample(
                      controller: _controller,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}



class ExampleSidebarX extends StatelessWidget {
  const ExampleSidebarX({
    Key? key,
    required SidebarXController controller,
  })  : _controller = controller,
        super(key: key);

  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: _controller,
      theme: SidebarXTheme(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: canvasColor,
          borderRadius: BorderRadius.circular(20),
        ),
        hoverColor: scaffoldBackgroundColor,
        textStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
        selectedTextStyle: const TextStyle(color: Colors.white),
        itemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: canvasColor),
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: actionColor.withOpacity(0.37),
          ),
          gradient: const LinearGradient(
            colors: [accentCanvasColor, canvasColor],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.28),
              blurRadius: 30,
            )
          ],
        ),
        iconTheme: IconThemeData(
          color: Colors.white.withOpacity(0.7),
          size: 20,
        ),
        selectedIconTheme: const IconThemeData(
          color: Colors.white,
          size: 20,
        ),
      ),
      extendedTheme: const SidebarXTheme(
        width: 200,
        decoration: BoxDecoration(
          color: canvasColor,
        ),
      ),
      footerDivider: divider,
      headerBuilder: (context, extended) {
        return SizedBox(
          height: 100,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset('assets/images/avatar.png'),
          ),
        );
      },
      items: [
        SidebarXItem(
          icon: Icons.video_label,
          label: 'stream',
          onTap: () {
            Navigator .push(context,
                MaterialPageRoute(builder: (context)=> Item2Screen())
            );
          },
        ),
        SidebarXItem(
          icon: Icons.attach_money_rounded,
          label: 'accounts',
          onTap: (){
            Navigator .push(context,

                MaterialPageRoute(builder:(context)=> Item1Screen()));
          },
        ),
        SidebarXItem(
          icon: Icons.grading,
          label: 'exam audit',
          onTap: () {
            Navigator .push(context,
                MaterialPageRoute(builder:(context)=> Item3Screen()));
          },
        ),
        SidebarXItem(
            icon: Icons.notification_add_sharp,
            label: 'updates',
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>Item3Screen()));
            }
        ),
        SidebarXItem(
          icon: Icons.calendar_month_outlined,
          label: 'events ',
          onTap: (){
            Navigator .push(context,
                MaterialPageRoute(builder: (context)=>DropdownButtonPage()));
          },
        ),
        SidebarXItem(
            icon: Icons.book_online,
            label:'tender',
            onTap: (){
              Navigator .push(context,
                  MaterialPageRoute(builder:(context)=>Item3Screen()));
            }
        ),
        SidebarXItem(
          icon: Icons.message_rounded,
          label: 'messages',
          onTap: (){
            Navigator.push(context,
            MaterialPageRoute(builder: (context)=>ChatPage()));
          }
        ),
        const SidebarXItem(
          iconWidget: FlutterLogo(size: 20),
          label: 'kennrix',
        ),
      ],
    );
  }
}

class _ScreensExample extends StatelessWidget {
  const _ScreensExample({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SidebarXController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        // ignore: unused_local_variable
        final pageTitle= (controller.selectedIndex);
        switch (controller.selectedIndex) {
          case 0:
            return ListView.builder(
              padding: const EdgeInsets.only(top: 10),
              itemBuilder: (context, index) => Container(
                height: 100,
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).primaryColor,
                  boxShadow: const [BoxShadow()],
                ),
              ),
            );
          default:
            return SchoolFeesScreen();
        }
      },
    );
  }
}


const primaryColor = Color(0xFF685BFF);
const canvasColor = Color(0xFF2E2E48);
const scaffoldBackgroundColor = Color(0xFF464667);
const accentCanvasColor = Color(0xFF3E3E61);
const white = Colors.white;
final actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);
final divider = Divider(color: white.withOpacity(0.3), height: 1);


class SchoolFeesScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _SchoolFeesScreenState createState() => _SchoolFeesScreenState();
}

class _SchoolFeesScreenState extends State<SchoolFeesScreen> {
  int _balance = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text ('School Fees'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Current Balance: $_balance'),
          ElevatedButton(
            onPressed: () {
              // Payment processing logic goes here
              // After payment is successful, update the balance
              setState(() {
                _balance -= 53000;
              });

            },
            child: const Text('Pay School Fees'),
          ),
        ],
      ),
    );
  }
}



