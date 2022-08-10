import '../auth/auth_util.dart';
import '../components/tab_fake_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../forgot_pass_page/forgot_pass_page_widget.dart';
import '../main.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({Key key}) : super(key: key);

  @override
  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  TextEditingController emailAddressLoginController;
  TextEditingController passwordLoginController;
  bool passwordLoginVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailAddressLoginController = TextEditingController();
    passwordLoginController = TextEditingController();
    passwordLoginVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Align(
            alignment: AlignmentDirectional(0, 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 120, 0, 0),
                    child: Image.asset(
                      'assets/images/Group_62.png',
                      width: 117,
                      height: 75.36,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 50),
                    child: Text(
                      '슬세권에서 닿는 입주민 커뮤니티 !!',
                      style: FlutterFlowTheme.of(context).bodyText2,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(44, 0, 44, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TabFakeWidget(),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                          child: Container(
                            width: 320,
                            child: TextFormField(
                              controller: emailAddressLoginController,
                              onChanged: (_) => EasyDebounce.debounce(
                                'emailAddressLoginController',
                                Duration(milliseconds: 2000),
                                () => setState(() {}),
                              ),
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Email Address',
                                labelStyle: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF95A1AC),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                hintText: 'Enter your email...',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF95A1AC),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true,
                                fillColor: Color(0xFFF3F2F4),
                                contentPadding:
                                    EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                              ),
                              style:
                                  FlutterFlowTheme.of(context).title3.override(
                                        fontFamily: 'IM_Hyemin',
                                        color: Color(0xFF8A8E9A),
                                        useGoogleFonts: false,
                                      ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                          child: Container(
                            width: 320,
                            child: TextFormField(
                              controller: passwordLoginController,
                              onChanged: (_) => EasyDebounce.debounce(
                                'passwordLoginController',
                                Duration(milliseconds: 2000),
                                () => setState(() {}),
                              ),
                              obscureText: !passwordLoginVisibility,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF95A1AC),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                hintText: 'Enter your password...',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF95A1AC),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true,
                                fillColor: Color(0xFFF3F2F4),
                                contentPadding:
                                    EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                suffixIcon: InkWell(
                                  onTap: () => setState(
                                    () => passwordLoginVisibility =
                                        !passwordLoginVisibility,
                                  ),
                                  focusNode: FocusNode(skipTraversal: true),
                                  child: Icon(
                                    passwordLoginVisibility
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color: Color(0xFF95A1AC),
                                    size: 20,
                                  ),
                                ),
                              ),
                              style:
                                  FlutterFlowTheme.of(context).title3.override(
                                        fontFamily: 'IM_Hyemin',
                                        color: Color(0xFF8A8E9A),
                                        useGoogleFonts: false,
                                      ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              final user = await signInWithEmail(
                                context,
                                emailAddressLoginController.text,
                                passwordLoginController.text,
                              );
                              if (user == null) {
                                return;
                              }

                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      NavBarPage(initialPage: 'feedPage'),
                                ),
                              );
                            },
                            text: 'Login',
                            options: FFButtonOptions(
                              width: 205,
                              height: 48,
                              color: Color(0xFF7342FF),
                              textStyle:
                                  FlutterFlowTheme.of(context).title3.override(
                                        fontFamily: 'IM_Hyemin',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        useGoogleFonts: false,
                                      ),
                              elevation: 3,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              await Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  duration: Duration(milliseconds: 300),
                                  reverseDuration: Duration(milliseconds: 300),
                                  child: ForgotPassPageWidget(),
                                ),
                              );
                            },
                            text: 'Forgot Password?',
                            options: FFButtonOptions(
                              width: 170,
                              height: 40,
                              color: Color(0x0039D2C0),
                              textStyle: FlutterFlowTheme.of(context).bodyText2,
                              elevation: 0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
