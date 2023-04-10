import 'package:flutter/material.dart';
class SignUpScreen extends StatelessWidget {
  const SignUpScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent[200],
      body: const Center(
        child: SizedBox(
          width: 400,
          child: Card(
            child: SigninForm(),
          ),
        ),
      ),
    );
  }
}
class SigninForm extends StatefulWidget {
  const SigninForm();
  @override
  _SignUpFormState createState() => _SignUpFormState();
}
class _SignUpFormState extends State<SigninForm> {
  final _nameTextController = TextEditingController();
  final _admissionTextController = TextEditingController();
  final _schoolcodeTextController = TextEditingController();
  final _emailTextController=TextEditingController();
  double _formProgress = 0;

  void _showMainViewState() {
    Navigator.of(context).pushNamed('/sign in');
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
            controller: _emailTextController,
            decoration: const InputDecoration(hintText:'@gmail.com'),
          )
        ),
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: TextFormField(
           controller: _schoolcodeTextController,
           decoration: const InputDecoration(hintText: 'schoolcode/schoolname'),
         ),
       ),

       TextButton(
          style: ButtonStyle(
             foregroundColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
           return states.contains(MaterialState.disabled) ? null : Colors.white;
            }),
           backgroundColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
           return states.contains(MaterialState.disabled) ? null : Colors.lightGreen;
           }),
           ),
          onPressed: _showMainViewState,

             child: const Text(' sign up instead'),
           ),
        ],
        ),
      );
     }
    }
