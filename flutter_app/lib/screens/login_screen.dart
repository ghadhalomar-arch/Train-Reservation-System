// lib/screens/login_screen.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_app/screens/admin_menu_page.dart';
import 'package:flutter_app/screens/staff_menu_page.dart';
import 'package:flutter_app/database/db_helper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const String routeName = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();

  bool _rememberMe = false;
  bool _passwordVisible = false;

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  void _onSignIn() async {
    final user = await DBHelper.instance.login(
      _emailCtrl.text.trim(),
      _passCtrl.text.trim(),
    );

    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Wrong username or password')),
      );
      return;
    }

    final role = user['role'];
    print("ROLE = $role");
    if (role == 'Admin') {
      Navigator.pushReplacementNamed(context, AdminMenuPage.routeName);
    } else if (role == 'Staff') {
      Navigator.pushReplacementNamed(context, StaffMenuPage.routeName);
    }
  }

  InputDecoration _inputDecoration({
    required String hint,
    required IconData prefixIcon,
    Widget? suffix,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: GoogleFonts.inter(color: const Color(0xFF64748B)),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFFE2E8F0), width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFF1E3A8A), width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFFEF4444), width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFFEF4444), width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      filled: true,
      fillColor: const Color(0xFFF8FAFC),
      contentPadding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
      prefixIcon: Icon(prefixIcon, color: const Color(0xFF64748B), size: 20),
      suffixIcon: suffix,
    );
  }

  Widget _socialBox(IconData icon) {
    return Container(
      width: 62.7,
      height: 56,
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0), width: 2),
      ),
      child: Center(
        child: FaIcon(icon, color: const Color(0xFF538CCB), size: 24),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: const Color(0xFF538CCB),
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF538CCB), Color(0xFF3B82F6)],
                stops: [0, 1],
                begin: AlignmentDirectional(1, -1),
                end: AlignmentDirectional(-1, 1),
              ),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(32, 0, 32, 0),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Container(
                    width: 420,
                    constraints: const BoxConstraints(maxWidth: 420),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 20,
                          color: Color(0x33000000),
                          offset: Offset(0, 10),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Header
                          Column(
                            children: [
                              const Icon(
                                Icons.train_rounded,
                                color: Color(0xFF538CCB),
                                size: 64,
                              ),
                              Text(
                                'TrainConnect',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.interTight(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF538CCB),
                                ),
                              ),
                              Text(
                                'Your journey starts here',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                  color: const Color(0xFF64748B),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),

                          // Form
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                const SizedBox(height: 16),
                                TextFormField(
                                  controller: _emailCtrl,
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.emailAddress,
                                  cursorColor: const Color(0xFF1E3A8A),
                                  style: GoogleFonts.inter(fontSize: 16),
                                  decoration: _inputDecoration(
                                    hint: 'Email address',
                                    prefixIcon: Icons.email_outlined,
                                  ),
                                  validator: (v) {
                                    if (v == null || v.trim().isEmpty) {
                                      return 'Email is required';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 16),
                                TextFormField(
                                  controller: _passCtrl,
                                  textInputAction: TextInputAction.done,
                                  obscureText: !_passwordVisible,
                                  cursorColor: const Color(0xFF1E3A8A),
                                  style: GoogleFonts.inter(fontSize: 16),
                                  decoration: _inputDecoration(
                                    hint: 'Password',
                                    prefixIcon: Icons.lock_outlined,
                                    suffix: InkWell(
                                      onTap: () => setState(
                                        () => _passwordVisible =
                                            !_passwordVisible,
                                      ),
                                      child: Icon(
                                        _passwordVisible
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                        color: const Color(0xFF64748B),
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                  validator: (v) {
                                    if (v == null || v.isEmpty) {
                                      return 'Password is required';
                                    }
                                    return null;
                                  },
                                  onFieldSubmitted: (_) => _onSignIn(),
                                ),
                                const SizedBox(height: 16),

                                // Remember + Forgot
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Theme(
                                          data: ThemeData(
                                            checkboxTheme: CheckboxThemeData(
                                              visualDensity:
                                                  VisualDensity.compact,
                                              materialTapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                            ),
                                          ),
                                          child: Checkbox(
                                            value: _rememberMe,
                                            onChanged: (v) => setState(
                                              () => _rememberMe = v ?? false,
                                            ),
                                            activeColor: const Color(
                                              0xFF1E3A8A,
                                            ),
                                            checkColor: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          'Remember me',
                                          style: GoogleFonts.inter(
                                            color: const Color(0xFF475569),
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Text(
                                        'Forgot password?',
                                        style: GoogleFonts.inter(
                                          color: const Color(0xFF1E3A8A),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 16),

                                // Sign In Button
                                SizedBox(
                                  width: double.infinity,
                                  height: 56,
                                  child: ElevatedButton.icon(
                                    onPressed: () {
                                      if (_formKey.currentState?.validate() ??
                                          false) {
                                        _onSignIn();
                                      }
                                    },
                                    icon: const Icon(
                                      Icons.login_rounded,
                                      size: 20,
                                    ),
                                    label: Text(
                                      'Sign In',
                                      style: GoogleFonts.interTight(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF538CCB),
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 24),

                          // Divider
                          Container(
                            width: double.infinity,
                            height: 1,
                            color: const Color(0xFFE2E8F0),
                          ),

                          const SizedBox(height: 24),

                          // Social
                          Column(
                            children: [
                              Text(
                                'Or continue with',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                  color: const Color(0xFF64748B),
                                ),
                              ),
                              const SizedBox(height: 12),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  _socialBox(FontAwesomeIcons.windows),
                                  _socialBox(FontAwesomeIcons.google),
                                  Container(
                                    width: 62.7,
                                    height: 56,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFF8FAFC),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: const Color(0xFFE2E8F0),
                                      ),
                                    ),
                                    child: const Center(
                                      child: FaIcon(
                                        FontAwesomeIcons.apple,
                                        color: Color(0xFF538CCB),
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          const SizedBox(height: 24),

                          // Footer
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account?",
                                style: GoogleFonts.inter(
                                  color: const Color(0xFF64748B),
                                ),
                              ),
                              const SizedBox(width: 4),
                              InkWell(
                                onTap: () {
                                  // لاحقاً: صفحة Sign up
                                },
                                child: Text(
                                  'Sign up',
                                  style: GoogleFonts.inter(
                                    color: const Color(0xFF1E3A8A),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
