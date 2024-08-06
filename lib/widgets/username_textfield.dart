import 'package:flutter/material.dart';

class UsernameTextfield extends StatefulWidget {
  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<UsernameTextfield> {
  Color _usernameBackgroundColor = Color(0xFF141519);
  final TextEditingController _usernameController = TextEditingController();
  final FocusNode _usernameFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _usernameFocusNode.addListener(() {
      setState(() {
        _usernameBackgroundColor = _usernameFocusNode.hasFocus
            ? Color(0xFF24252A)
            : Color(0xFF141519);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _usernameBackgroundColor,
      child: TextField(
        focusNode: _usernameFocusNode,
        controller: _usernameController,
        cursorColor: Color(0xFFFE6407),
        cursorHeight: 20,
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          labelStyle: TextStyle(
            color: Color(0xFFD4D5D7),
          ),
          labelText: 'Email',
          filled: true,
          fillColor: Colors.transparent,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF545456),
              width: 2,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFFE6407),
              width: 2,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameFocusNode.dispose();
    _usernameController.dispose();
    super.dispose();
  }
}
