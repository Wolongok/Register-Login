import 'package:flutter/material.dart';
import 'package:pplg2/custom_checkbox.dart';
import 'package:pplg2/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {

  final FocusNode _usernameFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ValueNotifier<bool> _isTextNotEmpty = ValueNotifier<bool>(false);
  Color _usernameBackgroundColor = Color(0xFF141519);
  Color _passwordBackgroundColor = Color(0xFF141519);
  bool _isButtonEnabled = false;
  bool _obsecureText = true;
  bool isIconVisible = false;
  bool isChecked = false;

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

    _passwordFocusNode.addListener(() {
      setState(() {
        _passwordBackgroundColor =
        _passwordFocusNode.hasFocus ? Color(0xFF24252A) : Color(0xFF141519);
      });
    });
  }

  @override
  void dispose() {
    _usernameFocusNode.dispose();
    _passwordFocusNode.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.close_outlined,
            color: Colors.white,
            size: 32,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "Create Account",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          color: Colors.black,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  width: 40,
                ),
              ),
              Container(
                child: Image(
                  image: AssetImage('assets/Crunch.jpg'),
                  width: 1600,
                ),
              ),              SizedBox(height: 12.0),

              Container(
                color: _usernameBackgroundColor,
                child: TextField(
                  focusNode: _usernameFocusNode,
                  controller: _usernameController,
                  cursorColor: Color(0xFFFE6407),
                  cursorHeight: 20,
                  style: TextStyle(color: Colors.white,),
                  decoration: InputDecoration(
                    labelStyle: TextStyle(
                      color: Color(0xFFD4D5D7),
                    ),
                    labelText: 'Email',
                    filled: true,
                    contentPadding: EdgeInsets.only(top: 5, left: 15, bottom: 10),
                    fillColor: Colors.transparent,
                    alignLabelWithHint: true,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF545456),width: 2),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFFE6407),width: 2),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                color: _passwordBackgroundColor,
                child: TextField(
                  focusNode: _passwordFocusNode,
                  controller: _passwordController,
                  obscureText: _obsecureText,
                  cursorColor: Color(0xFFFE6407),
                  cursorHeight: 20,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    suffixIcon: ValueListenableBuilder<TextEditingValue>(
                      valueListenable: _passwordController,
                      builder: (context, value, child) {
                        bool shouldShowIcon = value.text.isNotEmpty || _passwordFocusNode.hasFocus;
                        return shouldShowIcon
                            ? GestureDetector(
                          onTap: () {
                            setState(() {
                              _obsecureText = !_obsecureText;
                            });
                          },
                          child: Icon(
                            _obsecureText ? Icons.visibility_off : Icons.visibility,
                            color: Color(0xFFD8D9DB),
                          ),
                        )
                            : SizedBox.shrink();
                      },
                    ),
                    labelStyle: TextStyle(color: Color(0xFFD4D5D7), fontSize: 15),
                    labelText: 'Password',
                    filled: true,
                    fillColor: Colors.transparent,
                    alignLabelWithHint: true,
                    contentPadding: EdgeInsets.only(top: 5, left: 15, bottom: 10),
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF545456),width: 2),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFFE6407),width: 2),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Transform.scale(
                    scale: 1,  // Scale factor
                    child: Custom_Checkbox(
                      size: 20,
                      iconSize: 16,
                      isChecked: isChecked,
                      onChange: (value) {
                        setState(() {
                          isChecked = value;
                        });
                        print(value);
                      },
                      backgroundColor: Colors.black,
                      borderColor: Colors.white,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "I want all the latest Crunchyroll info, offers, and news.",
                      style: TextStyle(color: Colors.white, fontSize: 11.5),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),

              SizedBox(
                child: Row(
                  children: [
                    Flexible(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(
                            color: Colors.white,
                            height: 1.4,
                            fontSize: 11.5,
                          ),
                          children: [
                            TextSpan(text: "By creating an account you're agreeing to our "),
                            TextSpan(
                              text: "Terms",
                              style: TextStyle(color: Color(0xFFFE6407)),
                            ),
                            TextSpan(text: " & "),
                            TextSpan(
                              text: "Privacy Policy",
                              style: TextStyle(color: Color(0xFFFE6407)),
                            ),
                            TextSpan(text: " and are at least 16 years old"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              SizedBox(
                width: 400,
                child: ElevatedButton(
                  onPressed: _isButtonEnabled ? () {} : null,
                  child: Text("CREATE ACCOUNT"),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor:
                    _isButtonEnabled ? Color(0xFFFE6407) : Colors.black,
                    disabledForegroundColor: Color(0xFF595959),
                    disabledBackgroundColor: Colors.black,
                    side: BorderSide(
                      color: _isButtonEnabled
                          ? Color(0xFFFE6407)
                          : Color(0xFF595959),
                      width: 1.5,
                    ),
                    shape: RoundedRectangleBorder(),
                  ),
                ),
              ),
              Container(height: 25),
              IntrinsicHeight(
                child: Row(
                  children: [
                    Spacer(),
                    Text(
                      'Already have an account?',
                      style: TextStyle(color: Color(0xFFFFFFFF)),
                    ),
                    SizedBox(
                      width: 63,
                      child:
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => LoginPage()),
                          );                        },
                        style: TextButton.styleFrom(

                          backgroundColor: Colors.transparent, // Text color
                        ),
                        child: Text('Log In', style: TextStyle(color: Color(0xFFFE6407), fontWeight: FontWeight.normal),),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: 100,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: RegisterPage(),
  ));
}
