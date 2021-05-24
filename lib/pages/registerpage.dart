import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myservices/widgets/custom_btn.dart';
import 'package:myservices/widgets/custom_input.dart';
import 'package:myservices/widgets/drawclip.dart';

import 'loginpage.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  Future<void> _alertDialogBuilder(String error) async {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Error"),
            content: Container(
              child: Text("Just some random text"),
            ),
            actions: [
              ElevatedButton(
                child: Text("Close"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

  Future<String> _createAccount() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _registerEmail, password: _registerPassword);
      return null;
    } on FirebaseException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email';
      }
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  void _submitForm() async {
    setState(() {
      _registerFormLoading = true;
    });
    //run account create method
    String _createAccountFeedback = await _createAccount();
    //if the string is not null, we got error
    if (_createAccountFeedback != null) {
      _alertDialogBuilder(_createAccountFeedback);
      //set state [not loading]
      setState(() {
        _registerFormLoading = false;
      });
    } else {
      Navigator.pop(context);
    }
  }

  bool _registerFormLoading = false;

  String _registerEmail = "";
  String _registerPassword = "";

  FocusNode _passwordFocusNode;

  @override
  void initState() {
    _passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          ClipPath(
                            clipper: DrawClip(),
                            child: Container(
                              height: size.height / 2.4,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      Color(0xffff5f6d),
                                      Color(0xffffc371)
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight),
                              ),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 50.0),
                              height: size.height / 4.4,
                              width: double.infinity,
                              child: Image.asset("assets/images/dhangadhi.png"))
                        ],
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.1),
                        child: Text(
                          "SIGN UP",
                          style: TextStyle(
                              color: Color(0xffff5f6d),
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    CustomInput(
                      hintText: "Email...",
                      onChanged: (value) {
                        _registerEmail = value;
                      },
                      onSubmitted: (value) {
                        _passwordFocusNode.requestFocus();
                      },
                      textInputAction: TextInputAction.next,
                    ),
                    CustomInput(
                      isPasswordField: true,
                      hintText: "Password...",
                      onChanged: (value) {
                        _registerPassword = value;
                      },
                      focusNode: _passwordFocusNode,
                      onSubmitted: (value) {
                        _submitForm();
                      },
                    ),
                    CustomBtn(
                      text: "Create New Account",
                      onPressed: () {
                        _submitForm();
                      },
                      isLoading: _registerFormLoading,
                      outlineBtn: false,
                    ),
                  ],
                ),
                SizedBox(height: 40.0),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 16.0,
                  ),
                  child: CustomBtn(
                    text: "Back to login",
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    outlineBtn: true,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
