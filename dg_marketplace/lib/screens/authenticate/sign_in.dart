import 'package:dg_marketplace/screens/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;

  const SignIn({super.key, required this.toggleView});

  @override
  State<SignIn> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //Text field state

  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: const Color.fromRGBO(34, 37, 41, 1),
          elevation: 0.0,
          title: const Text(
            'Sign in',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            TextButton.icon(
              icon: const Icon(Icons.person, color: Colors.white),
              label: const Text(
                "Register",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                widget.toggleView();
              },
            )
          ]),
      body: Container(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 20.0),
                //Email form field
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Enter your email",
                    labelText: "Email",
                  ),
                  validator: (val) => val!.isEmpty ? "Enter an email" : null,
                  onChanged: (val) {
                    // val represents whatever is in the form field at that point.
                    setState(() => email = val);
                  }, //Everytime the input changes, this function is being ran.
                ),
                const SizedBox(height: 20.0),
                //Password form field
                TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Enter your password",
                      labelText: "Password",
                    ),
                    validator: (val) => val!.length < 6
                        ? "Enter a password 6+ chars long"
                        : null,
                    obscureText: true,
                    onChanged: (val) {
                      //Password function
                      setState(() => password = val);
                    }),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink[400],
                  ),
                  child: const Text(
                    "Sign in",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      dynamic result = await _auth.signInWithEmailAndPassword(
                          email, password);
                      if (result == null) {
                        setState(() =>
                            error = "Could not sign in with those credentials");
                      }
                    }
                  },
                ),
                const SizedBox(height: 12.0),
                Text(error,
                    style: const TextStyle(color: Colors.red, fontSize: 14.0))
              ],
            ),
          )),
    );
  }
}
