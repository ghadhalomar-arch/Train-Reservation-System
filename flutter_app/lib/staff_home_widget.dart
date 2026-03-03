import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'staffm_model.dart';
export 'staffm_model.dart';

///
///
class StaffmWidget extends StatefulWidget {
  const StaffmWidget({super.key});

  static String routeName = 'staffm';
  static String routePath = '/staffm';

  @override
  State<StaffmWidget> createState() => _StaffmWidgetState();
}

class _StaffmWidgetState extends State<StaffmWidget> {
  late StaffmModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StaffmModel());
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
        backgroundColor: Color(0xFF1E3A8A),
        appBar: AppBar(
          backgroundColor: Color(0xFF1E40AF),
          automaticallyImplyLeading: false,
          title: Text(
            'Welcome, Staff',
            style: FlutterFlowTheme.of(context).headlineLarge.override(
                  font: GoogleFonts.interTight(
                    fontWeight: FontWeight.bold,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                  ),
                  color: Colors.white,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                ),
          ),
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
              child: FlutterFlowIconButton(
                borderRadius: 20,
                buttonSize: 40,
                fillColor: Color(0xFF3B82F6),
                icon: Icon(
                  Icons.settings,
                  color: Colors.white,
                  size: 24,
                ),
                onPressed: () {
                  print('IconButton pressed ...');
                },
              ),
            ),
          ],
          centerTitle: false,
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    GridView(
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.7,
                      ),
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 8,
                                color: Color(0x4D1E40AF),
                                offset: Offset(
                                  0,
                                  4,
                                ),
                              )
                            ],
                            gradient: LinearGradient(
                              colors: [Color(0xFF3B82F6), Color(0xFF1D4ED8)],
                              stops: [0, 1],
                              begin: AlignmentDirectional(1, 1),
                              end: AlignmentDirectional(-1, -1),
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.train,
                                  color: Colors.white,
                                  size: 32,
                                ),
                                Text(
                                  'Train Status\n',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        font: GoogleFonts.interTight(
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .fontStyle,
                                        ),
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontStyle,
                                      ),
                                ),
                              ].divide(SizedBox(height: 12)),
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 8,
                                color: Color(0x4D1E40AF),
                                offset: Offset(
                                  0,
                                  4,
                                ),
                              )
                            ],
                            gradient: LinearGradient(
                              colors: [Color(0xFF2563EB), Color(0xFF1E40AF)],
                              stops: [0, 1],
                              begin: AlignmentDirectional(1, 1),
                              end: AlignmentDirectional(-1, -1),
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.people,
                                  color: Colors.white,
                                  size: 32,
                                ),
                                Text(
                                  'Passenger Management',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        font: GoogleFonts.interTight(
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .fontStyle,
                                        ),
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontStyle,
                                      ),
                                ),
                              ].divide(SizedBox(height: 12)),
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 8,
                                color: Color(0x4D1E40AF),
                                offset: Offset(
                                  0,
                                  4,
                                ),
                              )
                            ],
                            gradient: LinearGradient(
                              colors: [Color(0xFF1D4ED8), Color(0xFF1E3A8A)],
                              stops: [0, 1],
                              begin: AlignmentDirectional(1, 1),
                              end: AlignmentDirectional(-1, -1),
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.timer,
                                  color: Colors.white,
                                  size: 32,
                                ),
                                Text(
                                  'Schedule Updates',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        font: GoogleFonts.interTight(
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .fontStyle,
                                        ),
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontStyle,
                                      ),
                                ),
                              ].divide(SizedBox(height: 12)),
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 8,
                                color: Color(0x4D1E40AF),
                                offset: Offset(
                                  0,
                                  4,
                                ),
                              )
                            ],
                            gradient: LinearGradient(
                              colors: [Color(0xFF1E40AF), Color(0xFF2563EB)],
                              stops: [0, 1],
                              begin: AlignmentDirectional(1, 1),
                              end: AlignmentDirectional(-1, -1),
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.error,
                                  color: Colors.white,
                                  size: 32,
                                ),
                                Text(
                                  'Emergency Alerts',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        font: GoogleFonts.interTight(
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .fontStyle,
                                        ),
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontStyle,
                                      ),
                                ),
                              ].divide(SizedBox(height: 12)),
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 8,
                                color: Color(0x4D1E40AF),
                                offset: Offset(
                                  0,
                                  4,
                                ),
                              )
                            ],
                            gradient: LinearGradient(
                              colors: [Color(0xFF3B82F6), Color(0xFF1D4ED8)],
                              stops: [0, 1],
                              begin: AlignmentDirectional(1, 1),
                              end: AlignmentDirectional(-1, -1),
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.analytics,
                                  color: Colors.white,
                                  size: 32,
                                ),
                                Text(
                                  'Analytics',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        font: GoogleFonts.interTight(
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .fontStyle,
                                        ),
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontStyle,
                                      ),
                                ),
                              ].divide(SizedBox(height: 12)),
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 8,
                                color: Color(0x4D1E40AF),
                                offset: Offset(
                                  0,
                                  4,
                                ),
                              )
                            ],
                            gradient: LinearGradient(
                              colors: [Color(0xFF2563EB), Color(0xFF1E40AF)],
                              stops: [0, 1],
                              begin: AlignmentDirectional(1, 1),
                              end: AlignmentDirectional(-1, -1),
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.notifications,
                                  color: Colors.white,
                                  size: 32,
                                ),
                                Text(
                                  'Notifications',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        font: GoogleFonts.interTight(
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .fontStyle,
                                        ),
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontStyle,
                                      ),
                                ),
                              ].divide(SizedBox(height: 12)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xFF1E40AF),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4,
                              color: Color(0x4D1E40AF),
                              offset: Offset(
                                0,
                                2,
                              ),
                            )
                          ],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'System Status',
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          font: GoogleFonts.interTight(
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontStyle,
                                          ),
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 4, 0, 0),
                                    child: Text(
                                      'All systems operational',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFFBFDBFE),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                width: 12,
                                height: 12,
                                decoration: BoxDecoration(
                                  color: Color(0xFF10B981),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]
                      .divide(SizedBox(height: 24))
                      .addToStart(SizedBox(height: 24)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

}