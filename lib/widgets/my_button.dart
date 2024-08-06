import 'package:flutter/material.dart';

class MYButton extends StatelessWidget {

  final bool isButtonEnabled;

  const MYButton({super.key, required this.isButtonEnabled});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: ElevatedButton(
        onPressed: isButtonEnabled ? () {} : null,
        child: Text("LOG IN"),
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor:
          isButtonEnabled ? Color(0xFFFE6407) : Colors.black,
          disabledForegroundColor: Color(0xFF595959),
          disabledBackgroundColor: Colors.black,
          side: BorderSide(
            color: isButtonEnabled
                ? Color(0xFFFE6407)
                : Color(0xFF595959),
            width: 1.5,
          ),
          shape: RoundedRectangleBorder(),
        ),
      ),
    );
  }


}
