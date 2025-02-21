import 'package:enhanzer/utils/colors.dart';
import 'package:flutter/material.dart';

class MyDontHave extends StatelessWidget {
  final void Function() signup;
  const MyDontHave({super.key, required this.signup});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Don't have an account?"),
          SizedBox(
            width: 3,
          ),
          TextButton(
            onPressed: () {
              signup();
            },
            child: Text(
              "Sign Up",
              style: TextStyle(
                color: mixed,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
