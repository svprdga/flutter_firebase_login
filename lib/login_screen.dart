import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/login_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginModel>(
      create: (_) => LoginModel(
        Provider.of<Logger>(context, listen: false),
      ),
      child: Consumer<LoginModel>(
        builder: (context, model, child) => Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.centerLeft,
                stops: [
                  0.0,
                  1.0,
                ],
                colors: [
                  Color(0xFF6dd5ed),
                  Color(0xFF2193b0),
                  // Color(0xFFcc2b5e),
                  // Color(0xFF753a88),
                  // Color(0xFF734b6d),
                  // Color(0xFF42275a),
                  // Color(0xFF06beb6),
                  // Color(0xFF48b1bf),
                ],
              ),
            ),
            child: _Welcome(),
          ),
        ),
      ),
    );
  }
}

class _Welcome extends StatefulWidget {
  @override
  State<_Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<_Welcome> with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    final LoginModel model = Provider.of<LoginModel>(context, listen: false);

    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = Tween<double>(begin: 1.0, end: 0.0).animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          // FocusScope.of(context).requestFocus(_usernameFocus);
          model.section = LoginSection.username;
        } else if (status == AnimationStatus.dismissed) {
          FocusScope.of(context).requestFocus(FocusNode());
          model.section = LoginSection.welcome;
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginModel>(
      builder: (context, model, child) => Visibility(
        visible: model.section == LoginSection.welcome ||
            model.section == LoginSection.welcomeToUsername,
        child: Center(
          child: Opacity(
            opacity: _animation.value,
            child: Container(
              margin: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome!',
                    style: GoogleFonts.lobster(
                      textStyle: const TextStyle(
                        fontSize: 54.0,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.white54,
                    indent: 16.0,
                    endIndent: 16.0,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Sign in',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
