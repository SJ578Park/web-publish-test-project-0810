import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../login_page/login_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPassPageWidget extends StatefulWidget {
  const ForgotPassPageWidget({Key key}) : super(key: key);

  @override
  _ForgotPassPageWidgetState createState() => _ForgotPassPageWidgetState();
}

class _ForgotPassPageWidgetState extends State<ForgotPassPageWidget> {
  TextEditingController emailTextController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailTextController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.chevron_left_sharp,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 30,
          ),
          onPressed: () async {
            await Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.leftToRight,
                duration: Duration(milliseconds: 300),
                reverseDuration: Duration(milliseconds: 300),
                child: LoginPageWidget(),
              ),
            );
          },
        ),
        title: Text(
          '비밀번호 찾기',
          style: FlutterFlowTheme.of(context).title3,
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFFFBFBFE),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 100, 0, 8),
                  child: Text(
                    '아이디로 설정한 메일주소를 입력해주세요.',
                    style: FlutterFlowTheme.of(context).bodyText2,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                  child: TextFormField(
                    controller: emailTextController,
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'E-mail',
                      hintStyle: FlutterFlowTheme.of(context).bodyText2,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: Color(0xFFF3F2F4),
                    ),
                    style: FlutterFlowTheme.of(context).bodyText2,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 80),
                  child: FFButtonWidget(
                    onPressed: () async {
                      if (emailTextController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Email required!',
                            ),
                          ),
                        );
                        return;
                      }
                      await resetPassword(
                        email: emailTextController.text,
                        context: context,
                      );
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: Text('비밀번호 초기화'),
                            content: Text(
                                '입력한 메일주소로 발송된 비밀번호로 접속하고 비밀번호를 다시 변경해주세요 :)'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext),
                                child: Text('Ok'),
                              ),
                            ],
                          );
                        },
                      );
                      await Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          duration: Duration(milliseconds: 300),
                          reverseDuration: Duration(milliseconds: 300),
                          child: LoginPageWidget(),
                        ),
                      );
                    },
                    text: '비밀번호 초기화',
                    options: FFButtonOptions(
                      width: 160,
                      height: 40,
                      color: Colors.white,
                      textStyle: FlutterFlowTheme.of(context).title3.override(
                            fontFamily: 'IM_Hyemin',
                            color: Color(0xFF8D8D95),
                            useGoogleFonts: false,
                          ),
                      borderSide: BorderSide(
                        color: Color(0xFF8D8D95),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
                Text(
                  '가입한 이메일주소를 잊었거나,\n이메일을 통한 비밀번호 설정이 어려울 경우 \n관리자에게 연락해주세요.',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyText2,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 50),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await launchURL('https://open.kakao.com/o/sob8r5Qc');
                    },
                    text: '관리자에게 연락하기',
                    options: FFButtonOptions(
                      width: 160,
                      height: 40,
                      color: Colors.white,
                      textStyle: FlutterFlowTheme.of(context).title3.override(
                            fontFamily: 'IM_Hyemin',
                            color: Color(0xFF8D8D95),
                            useGoogleFonts: false,
                          ),
                      borderSide: BorderSide(
                        color: Color(0xFF8D8D95),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
