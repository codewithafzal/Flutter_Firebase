

import 'package:emoradd/Screens/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/framework.dart';

import 'Home.dart';
import 'allproduct.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  TextEditingController email_control = TextEditingController();
  TextEditingController pass_control = TextEditingController();
  @override



  login(context) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email_control.text,
        password: pass_control.text,
      );
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => AllProductsView()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }





  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,


      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("LOGIN",style: TextStyle(fontSize: 50,color: Colors.black)),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: email_control,
              decoration: const InputDecoration(

                focusColor: Colors.white,
                border: OutlineInputBorder(


                ),

                labelText: 'Email',


              ),
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(

              controller: pass_control,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
          ),
          SizedBox(height: 10,),
          GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignupView()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Did not have account"),
                  Text(" Signup?",style: TextStyle(color: Colors.orange),)
                ],
              )

          ),
          SizedBox(height: 20,),
          ElevatedButton(

              onPressed: () {
                login(context);
                print('successfuly');
              },
              child: Text("Login",style: TextStyle(fontSize: 20),))

        ],
      ),
    );

  }
}

