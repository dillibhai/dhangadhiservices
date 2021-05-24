import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myservices/pages/registerpage.dart';
import 'package:myservices/widgets/custom_btn.dart';
import 'package:myservices/widgets/custom_input.dart';
import 'package:myservices/widgets/drawclip.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future<void> _alertDialogBuilder(String error) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
              title: Text("Error"),
              content: Container(
                child: Text(error),
              ),
              actions: [
                ElevatedButton(
                  child: Text("Close"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ]);
        });
  }

  Future<String> _loginAccount() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _loginEmail, password: _loginPassword);
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  void _submitForm() async {
    //set the form to loading state
    setState(() {
      _loginFormLoading = true;
    });
    //run the create account method
    String _logInFeedback = await _loginAccount();
    // if string is not null, we got error while create account.
    if (_logInFeedback != null) {
      _alertDialogBuilder(_logInFeedback);

//set the form to regular state[not loading]
      setState(() {
        _loginFormLoading = false;
      });
    }
  }

// default form loading state
  bool _loginFormLoading = false;
  //form input field values
  String _loginEmail = "";
  String _loginPassword = "";

//focus node for input field
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
                          "LOGIN",
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
                        _loginEmail = value;
                      },
                      onSubmitted: (value) {
                        _passwordFocusNode.requestFocus();
                      },
                      textInputAction: TextInputAction.next,
                    ),
                    CustomInput(
                      hintText: "Password...",
                      onChanged: (value) {
                        _loginPassword = value;
                      },
                      focusNode: _passwordFocusNode,
                      isPasswordField: true,
                      onSubmitted: (value) {
                        _submitForm();
                      },
                    ),
                    CustomBtn(
                      text: "Login",
                      onPressed: () {
                        _submitForm();
                      },
                      isLoading: _loginFormLoading,
                    ),
                  ],
                ),
                SizedBox(height: 40.0),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 16.0,
                  ),
                  child: CustomBtn(
                    text: "Create New Account",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()));
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
