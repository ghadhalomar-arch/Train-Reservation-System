// lib/screens/splash_screen.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_app/screens/welcome_screen.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  // لو تبين نفس فكرة routeName
  static const String routeName = '/splash';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    // انتقال تلقائي بعد ثانيتين
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, WelcomePage.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF1A237E),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF538CCB), Color(0xFF538CCB)],
                    stops: [0, 1],
                    begin: AlignmentDirectional(1, -1),
                    end: AlignmentDirectional(-1, 1),
                  ),
                ),
              ),

              // المحتوى بالوسط
              Align(
                alignment: const AlignmentDirectional(-0.04, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      decoration: const BoxDecoration(
                        color: Color(0xC661A7F3),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 20,
                            color: Color(0x13000000),
                            offset: Offset(0, 10),
                          )
                        ],
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.train,
                          color: Colors.white,
                          size: 120,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Text(
                      ' TrainConnect',
                      style: GoogleFonts.outfit(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 0.0,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Your Journey Starts Here',
                      style: GoogleFonts.outfit(
                        fontSize: 22,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xCCFFFFFF),
                        letterSpacing: 0.0,
                      ),
                    ),
                  ],
                ),
              ),

              // زر السهم تحت
              Align(
                alignment: const AlignmentDirectional(-0.01, 0),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 80),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            Navigator.pushReplacementNamed(
                              context,
                              WelcomePage.routeName,
                            );
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              color: Color(0x33FFFFFF),
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.arrow_forward_rounded,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
