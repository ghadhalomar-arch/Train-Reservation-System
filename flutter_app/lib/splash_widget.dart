

  @override
  Widget build(BuildContext context) }

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'splash_model.dart';
export 'splash_model.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({super.key});

  static String routeName = 'splash';
  static String routePath = '/splash';

  @override
  State<SplashWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  late SplashModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SplashModel());
    class _SplashWidgetState extends State<SplashWidget> {

    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      context.pushNamed(WelcomeWidget.routeName);
    });
  }
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();


  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFF1A237E),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF538CCB), Color(0xFF538CCB)],
                    stops: [0, 1],
                    begin: AlignmentDirectional(1, -1),
                    end: AlignmentDirectional(-1, 1),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.04, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Color(0xC661A7F3),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 20,
                            color: Color(0x13000000),
                            offset: Offset(
                              0,
                              10,
                            ),
                          )
                        ],
                        shape: BoxShape.circle,
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Icon(
                          Icons.train,
                          color: Colors.white,
                          size: 120,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                      child: Text(
                        ' TrainConnect',
                        style:
                            FlutterFlowTheme.of(context).displayMedium.override(
                                  font: GoogleFonts.outfit(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .displayMedium
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  fontSize: 45,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .displayMedium
                                      .fontStyle,
                                ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                      child: Text(
                        'Your Journey Starts Here',
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              font: GoogleFonts.outfit(
                                fontWeight: FontWeight.normal,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .fontStyle,
                              ),
                              color: Color(0xCCFFFFFF),
                              fontSize: 22,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.normal,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .fontStyle,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.01, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 80),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(WelcomeWidget.routeName);
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Color(0x33FFFFFF),
                              shape: BoxShape.circle,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0, 0),
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


