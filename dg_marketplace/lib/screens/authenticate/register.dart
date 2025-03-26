import 'package:flutter/material.dart';
import 'package:dg_marketplace/screens/services/auth.dart';

class Register extends StatefulWidget {
  final Function toggleView;

  const Register({super.key, required this.toggleView});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
          title: const Text('Sign up', style: TextStyle(color: Colors.white)),
          actions: [
            TextButton.icon(
              icon: const Icon(Icons.person),
              label: const Text("Sign In"),
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
                SizedBox(height: 20.0),
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
                SizedBox(height: 20.0),
                TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Enter your password",
                      labelText: "Password",
                    ),
                    obscureText: true,
                    validator: (val) => val!.length < 6
                        ? "Enter a password 6+ chars long"
                        : null,
                    onChanged: (val) {
                      //Password function
                      setState(() => password = val);
                    }),
                SizedBox(height: 20.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink[400],
                  ),
                  child: const Text(
                    "Register",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      dynamic result = await _auth.registerWithEmailAndPassword(
                          email, password);
                      if (result == null) {
                        setState(() => error = "Please supply a valid email");
                      }
                    }
                  },
                ),
                const SizedBox(height: 12.0),
                Text(error, style: TextStyle(color: Colors.red, fontSize: 14.0))
              ],
            ),
          )),
    );
  }
}
