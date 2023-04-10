import 'package:amazon_cognito_identity_dart/cognito.dart';
import 'package:flutter/material.dart';

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
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  final double _formProgress = 0;

  void _signUpWithCognito() async {
    final cognitoUser = CognitoUser(
      _emailTextController.text,
      _passwordTextController.text,
      userPool: CognitoUserPool(
        _POOL_ID,
        _CLIENT_ID,
      ),
    );

    try {
      await cognitoUser.signUp();
      // Handle successful sign up
    } catch (e) {
      // Handle sign up error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
            children: [
            LinearProgressIndicator(value: _formProgress),
             Text('Sign Up', style: Theme
                 .of(context)
                    .textTheme
                .headline4),
              Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: TextFormField(
                     controller: _nameTextController,
                       decoration: const InputDecoration(hintText: 'Name'),
                              ),
                                       ),
                Padding(
                   padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                               controller: _admissionTextController,
                                       decoration: const InputDecoration(hintText: 'Admission'),
                                                 ),
                                                     ),
            Padding(
               padding: const EdgeInsets.all(8.0),
                 child: TextFormField(
                     controller: _schoolcodeTextController,
                           decoration: const InputDecoration(hintText: 'School Code'),
                               ),
                                   ),
                 Padding(
                     padding: const EdgeInsets.all(8.0),
                   child: TextFormField(
               controller: _emailTextController,
                decoration: const InputDecoration(hintText: 'Email'),
             ),
             ),
           Padding(
             padding: const EdgeInsets.all(8.0),
               child: TextFormField(
               controller: _passwordTextController,
                decoration: InputDecoration(hintText: 'password'),
              ),
                ),
          ],
  };
