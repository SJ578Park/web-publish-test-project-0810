import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../book_ask_page/book_ask_page_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class BookAsklistWidget extends StatefulWidget {
  const BookAsklistWidget({Key key}) : super(key: key);

  @override
  _BookAsklistWidgetState createState() => _BookAsklistWidgetState();
}

class _BookAsklistWidgetState extends State<BookAsklistWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
              MaterialPageRoute(
                builder: (context) => NavBarPage(initialPage: 'booksPage'),
              ),
            );
          },
        ),
        title: Text(
          '도서추천 목록',
          style: FlutterFlowTheme.of(context).title3,
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BookAskPageWidget(),
            ),
          );
        },
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        elevation: 8,
        child: Icon(
          FFIcons.kunion,
          color: Colors.white,
          size: 24,
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: Text(
                      '도서관에서 보유하고 있지 않은 책 중\n입고되면 좋겠다는 책을 추천해주세요 :)\n추천목록에 올라온 책이 마음에 들면 따봉도 눌러주세요. \n입고를 결정하는데 반영될 수 있습니다!',
                      style: FlutterFlowTheme.of(context).subtitle2,
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    StreamBuilder<List<BookAskRecord>>(
                      stream: queryBookAskRecord(
                        queryBuilder: (bookAskRecord) =>
                            bookAskRecord.orderBy('ask_at', descending: true),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: SpinKitWanderingCubes(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                size: 50,
                              ),
                            ),
                          );
                        }
                        List<BookAskRecord> listViewBookAskRecordList =
                            snapshot.data;
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewBookAskRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewBookAskRecord =
                                listViewBookAskRecordList[listViewIndex];
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 12, 20, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 8),
                                            child: Text(
                                              listViewBookAskRecord.title,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 12),
                                            child: Text(
                                              listViewBookAskRecord.author,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2
                                                      .override(
                                                        fontFamily:
                                                            'Spoqa Han Sans Neo',
                                                        fontSize: 12,
                                                        useGoogleFonts: false,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      StreamBuilder<UsersRecord>(
                                        stream: UsersRecord.getDocument(
                                            currentUserReference),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50,
                                                height: 50,
                                                child: SpinKitWanderingCubes(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  size: 50,
                                                ),
                                              ),
                                            );
                                          }
                                          final columnUsersRecord =
                                              snapshot.data;
                                          return InkWell(
                                            onTap: () async {
                                              if (listViewBookAskRecord.thumbBy
                                                  .toList()
                                                  .contains(columnUsersRecord
                                                      .reference)) {
                                                final bookAskUpdateData = {
                                                  'thumb_by':
                                                      FieldValue.arrayRemove([
                                                    columnUsersRecord.reference
                                                  ]),
                                                };
                                                await listViewBookAskRecord
                                                    .reference
                                                    .update(bookAskUpdateData);
                                              } else {
                                                final bookAskUpdateData = {
                                                  'thumb_by':
                                                      FieldValue.arrayUnion([
                                                    columnUsersRecord.reference
                                                  ]),
                                                };
                                                await listViewBookAskRecord
                                                    .reference
                                                    .update(bookAskUpdateData);
                                              }
                                            },
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (!listViewBookAskRecord
                                                    .thumbBy
                                                    .toList()
                                                    .contains(columnUsersRecord
                                                        .reference))
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 8),
                                                    child: Icon(
                                                      Icons.thumb_up_outlined,
                                                      color: Color(0xFF8D8D95),
                                                      size: 16,
                                                    ),
                                                  ),
                                                if (listViewBookAskRecord
                                                    .thumbBy
                                                    .toList()
                                                    .contains(columnUsersRecord
                                                        .reference))
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 8),
                                                    child: Icon(
                                                      Icons.thumb_up,
                                                      color: Color(0xFF8D8D95),
                                                      size: 16,
                                                    ),
                                                  ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 12),
                                                  child: Text(
                                                    formatNumber(
                                                      listViewBookAskRecord
                                                          .thumbBy
                                                          .toList()
                                                          .length,
                                                      formatType:
                                                          FormatType.decimal,
                                                      decimalType:
                                                          DecimalType.automatic,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText2
                                                        .override(
                                                          fontFamily:
                                                              'Spoqa Han Sans Neo',
                                                          fontSize: 12,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  color: Color(0xFF8D8D95),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
