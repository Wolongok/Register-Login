import 'package:flutter/material.dart';
import 'package:pplg2/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FocusNode _usernameFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Color _usernameBackgroundColor = Color(0xFF141519);
  Color _passwordBackgroundColor = Color(0xFF141519);
  bool _isButtonEnabled = false;
  bool _obsecureText = true;
  bool isIconVisible = false;

  @override
  void initState() {
    super.initState();

    _usernameFocusNode.addListener(() {
      setState(() {
        _usernameBackgroundColor = _usernameFocusNode.hasFocus!
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

    void _checkIfButtonShouldBeEnabled() {
      setState(() {
        _isButtonEnabled = _usernameController.text.isNotEmpty &&
            _passwordController.text.isNotEmpty;
      });
    }

    _usernameController.addListener(_checkIfButtonShouldBeEnabled);
    _passwordController.addListener(_checkIfButtonShouldBeEnabled);
  }

  void _checkIfButtonShouldBeEnabled() {
    setState(() {
      _isButtonEnabled = _usernameController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty;
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
          "Log In",
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
                  width: 100,
                ),
              ),
              Container(
                child: Image(
                  image: AssetImage('assets/img.jpg'),
                  width: 1600,
                ),
              ),
              Container(height: 15),
              SizedBox(
                child: Row(
                  children: [
                    Flexible(
                        child: Text(
                      "Welcome to Crunchyroll! To Log in, you can use either Crunchtroll or Funimation",
                      style: TextStyle(
                          color: Colors.white, height: 0, fontSize: 14.3),
                      textAlign: TextAlign.center,
                      textWidthBasis: TextWidthBasis.longestLine,
                    )),
                  ],
                ),
              ),
              Container(height: 30),
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
                            TextSpan(text: "By logging in you're agreeing to our "),
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
              Container(height: 15),
              SizedBox(
                width: 400,
                child: ElevatedButton(
                  onPressed: _isButtonEnabled ? () {} : null,
                  child: Text("LOG IN"),
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
                    TextButton(
                      onPressed: () {
                        // Your onPressed function here
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.transparent, // Text color
                      ),
                      child: Text('Forgot Password?', style: TextStyle(color: Color(0xFFFE6407), fontWeight: FontWeight.normal),),
                    ),
                    SizedBox(
                      height: 14, // Adjust this value to your desired height
                      child: VerticalDivider(
                        color: Colors.white,
                        thickness: 1,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegisterPage()),
                        );
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.transparent, // Text color
                      ),
                      child: Text('Create Account', style: TextStyle(color: Color(0xFFFE6407), fontWeight: FontWeight.normal),),
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
