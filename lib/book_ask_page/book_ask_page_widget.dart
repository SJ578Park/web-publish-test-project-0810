import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../book_asklist/book_asklist_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class BookAskPageWidget extends StatefulWidget {
  const BookAskPageWidget({Key key}) : super(key: key);

  @override
  _BookAskPageWidgetState createState() => _BookAskPageWidgetState();
}

class _BookAskPageWidgetState extends State<BookAskPageWidget> {
  TextEditingController authorInputController;
  TextEditingController titleInputController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    authorInputController = TextEditingController();
    titleInputController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.chevron_left_sharp,
            color: Color(0xFF35353F),
            size: 24,
          ),
        ),
        title: Text(
          '희망 도서 신청란',
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
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                  child: TextFormField(
                    controller: titleInputController,
                    onChanged: (_) => EasyDebounce.debounce(
                      'titleInputController',
                      Duration(milliseconds: 2000),
                      () => setState(() {}),
                    ),
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: '희망도서명을 입력해주세요.',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFE9EBF5),
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFE9EBF5),
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyText2,
                    textAlign: TextAlign.end,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                  child: TextFormField(
                    controller: authorInputController,
                    onChanged: (_) => EasyDebounce.debounce(
                      'authorInputController',
                      Duration(milliseconds: 2000),
                      () => setState(() {}),
                    ),
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: '도서의 저자명을 입력해주세요.',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFE9EBF5),
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFE9EBF5),
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyText2,
                    textAlign: TextAlign.end,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 80),
                  child: FFButtonWidget(
                    onPressed: () async {
                      final bookAskCreateData = createBookAskRecordData(
                        title: titleInputController.text,
                        author: authorInputController.text,
                        askAt: getCurrentTimestamp,
                        askBy: currentUserReference,
                      );
                      await BookAskRecord.collection
                          .doc()
                          .set(bookAskCreateData);
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookAsklistWidget(),
                        ),
                      );
                    },
                    text: '희망도서 신청',
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
