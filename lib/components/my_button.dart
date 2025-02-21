import 'package:enhanzer/utils/colors.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback? login;
  final String text;
  const MyButton({
    super.key,
    required this.isLoading,
    this.login,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.07,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: mixed2,
      ),
      child: TextButton(
        onPressed: isLoading ? null : login,
        child: isLoading
            ? CircularProgressIndicator()
            : Center(
                child: Text(
                  text,
                  style: TextStyle(
                    color: white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
      ),
    );
  }
}
