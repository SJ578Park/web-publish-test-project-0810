import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ContentsDetailPageWidget extends StatefulWidget {
  const ContentsDetailPageWidget({
    Key key,
    this.detailsP,
  }) : super(key: key);

  final PostsRecord detailsP;

  @override
  _ContentsDetailPageWidgetState createState() =>
      _ContentsDetailPageWidgetState();
}

class _ContentsDetailPageWidgetState extends State<ContentsDetailPageWidget> {
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PostsRecord>(
      stream: PostsRecord.getDocument(widget.detailsP.reference),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: SpinKitWanderingCubes(
                color: FlutterFlowTheme.of(context).primaryColor,
                size: 50,
              ),
            ),
          );
        }
        final contentsDetailPagePostsRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            leading: InkWell(
              onTap: () async {
                await Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    duration: Duration(milliseconds: 0),
                    reverseDuration: Duration(milliseconds: 0),
                    child: NavBarPage(initialPage: 'feedPage'),
                  ),
                );
              },
              child: Icon(
                Icons.chevron_left_sharp,
                color: Color(0xFF35353F),
                size: 24,
              ),
            ),
            title: Text(
              'contents detail',
              style: FlutterFlowTheme.of(context).title2,
            ),
            actions: [],
            centerTitle: false,
            elevation: 1,
          ),
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: FutureBuilder<UsersRecord>(
                              future: UsersRecord.getDocumentOnce(
                                  contentsDetailPagePostsRecord.createdBy),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: SpinKitWanderingCubes(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        size: 50,
                                      ),
                                    ),
                                  );
                                }
                                final columnUsersRecord = snapshot.data;
                                return SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 0, 12, 8),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 8, 0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    child: Image.network(
                                                      columnUsersRecord
                                                          .photoUrl,
                                                      width: 50,
                                                      height: 50,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          columnUsersRecord
                                                              .displayName,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .title3,
                                                        ),
                                                        if (columnUsersRecord
                                                                .role <
                                                            3)
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        4,
                                                                        0,
                                                                        0,
                                                                        0),
                                                            child: Icon(
                                                              Icons
                                                                  .verified_outlined,
                                                              color: Color(
                                                                  0xFFCE395F),
                                                              size: 16,
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          dateTimeFormat(
                                                              'M/d H:mm',
                                                              contentsDetailPagePostsRecord
                                                                  .createdAt),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText2
                                                              .override(
                                                                fontFamily:
                                                                    'Spoqa Han Sans Neo',
                                                                color: Color(
                                                                    0xFFA0A0A0),
                                                                fontSize: 12,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            if (columnUsersRecord.kakaoUrl !=
                                                    null &&
                                                columnUsersRecord.kakaoUrl !=
                                                    '')
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 4, 0, 0),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 30,
                                                  borderWidth: 1,
                                                  buttonSize: 40,
                                                  icon: Icon(
                                                    Icons.send_sharp,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 25,
                                                  ),
                                                  onPressed: () async {
                                                    await launchURL(
                                                        columnUsersRecord
                                                            .kakaoUrl);
                                                  },
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 0, 12, 0),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Text(
                                            contentsDetailPagePostsRecord
                                                .contents,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText2
                                                .override(
                                                  fontFamily:
                                                      'Spoqa Han Sans Neo',
                                                  color: Color(0xFF202327),
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Builder(
                                        builder: (context) {
                                          final detailPageImages =
                                              contentsDetailPagePostsRecord
                                                  .images
                                                  .toList();
                                          return SingleChildScrollView(
                                            primary: false,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: List.generate(
                                                  detailPageImages.length,
                                                  (detailPageImagesIndex) {
                                                final detailPageImagesItem =
                                                    detailPageImages[
                                                        detailPageImagesIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(12, 0, 12, 8),
                                                  child: Image.network(
                                                    detailPageImagesItem,
                                                    width: double.infinity,
                                                    fit: BoxFit.cover,
                                                  ),
                                                );
                                              }),
                                            ),
                                          );
                                        },
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 0, 8, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  '댓글${contentsDetailPagePostsRecord.noOfReply?.toString()}개 · 좋아요${formatNumber(
                                                    contentsDetailPagePostsRecord
                                                        .likedBy
                                                        .toList()
                                                        .length,
                                                    formatType:
                                                        FormatType.decimal,
                                                    decimalType:
                                                        DecimalType.automatic,
                                                  )}개',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText2,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(
                                        color: Color(0xFFE0E3E7),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            78, 0, 78, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(
                                              FFIcons.kreplyoff,
                                              color: Color(0xFF787D96),
                                              size: 24,
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (contentsDetailPagePostsRecord
                                                    .likedBy
                                                    .toList()
                                                    .contains(
                                                        currentUserReference))
                                                  Icon(
                                                    FFIcons.klikeon,
                                                    color: Color(0xFFCE395F),
                                                    size: 24,
                                                  ),
                                                if (!contentsDetailPagePostsRecord
                                                    .likedBy
                                                    .toList()
                                                    .contains(
                                                        currentUserReference))
                                                  Icon(
                                                    FFIcons.klikeoff1,
                                                    color: Color(0xFFCE395F),
                                                    size: 24,
                                                  ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(
                                        thickness: 5,
                                        color: FlutterFlowTheme.of(context)
                                            .lineColor,
                                      ),
                                      Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFFBFBFE),
                                        ),
                                        child: StreamBuilder<List<ReplyRecord>>(
                                          stream: queryReplyRecord(
                                            queryBuilder: (replyRecord) =>
                                                replyRecord
                                                    .where('reply_for',
                                                        isEqualTo:
                                                            contentsDetailPagePostsRecord
                                                                .reference)
                                                    .orderBy('reply_at',
                                                        descending: true),
                                          ),
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
                                            List<ReplyRecord>
                                                listViewReplyRecordList =
                                                snapshot.data;
                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              primary: false,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: listViewReplyRecordList
                                                  .length,
                                              itemBuilder:
                                                  (context, listViewIndex) {
                                                final listViewReplyRecord =
                                                    listViewReplyRecordList[
                                                        listViewIndex];
                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10, 8, 10, 0),
                                                      child: StreamBuilder<
                                                          UsersRecord>(
                                                        stream: UsersRecord
                                                            .getDocument(
                                                                listViewReplyRecord
                                                                    .replyBy),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50,
                                                                height: 50,
                                                                child:
                                                                    SpinKitWanderingCubes(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  size: 50,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          final rowUsersRecord =
                                                              snapshot.data;
                                                          return Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            8,
                                                                            0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8),
                                                                      child: Image
                                                                          .network(
                                                                        rowUsersRecord
                                                                            .photoUrl,
                                                                        width:
                                                                            48,
                                                                        height:
                                                                            48,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              4,
                                                                              0),
                                                                          child:
                                                                              Text(
                                                                            rowUsersRecord.displayName,
                                                                            style:
                                                                                FlutterFlowTheme.of(context).subtitle1,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          dateTimeFormat(
                                                                              'M/d H:mm',
                                                                              listViewReplyRecord.replyAt),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText2
                                                                              .override(
                                                                                fontFamily: 'Spoqa Han Sans Neo',
                                                                                fontSize: 12,
                                                                                useGoogleFonts: false,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Text(
                                                                      listViewReplyRecord
                                                                          .replyContennts,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText2,
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        ToggleIcon(
                                                                          onPressed:
                                                                              () async {
                                                                            final likedByElement =
                                                                                rowUsersRecord.reference;
                                                                            final likedByUpdate = listViewReplyRecord.likedBy.toList().contains(likedByElement)
                                                                                ? FieldValue.arrayRemove([
                                                                                    likedByElement
                                                                                  ])
                                                                                : FieldValue.arrayUnion([
                                                                                    likedByElement
                                                                                  ]);
                                                                            final replyUpdateData =
                                                                                {
                                                                              'liked_by': likedByUpdate,
                                                                            };
                                                                            await listViewReplyRecord.reference.update(replyUpdateData);
                                                                          },
                                                                          value: listViewReplyRecord
                                                                              .likedBy
                                                                              .toList()
                                                                              .contains(rowUsersRecord.reference),
                                                                          onIcon:
                                                                              Icon(
                                                                            Icons.favorite_sharp,
                                                                            color:
                                                                                Color(0xFFCE395F),
                                                                            size:
                                                                                15,
                                                                          ),
                                                                          offIcon:
                                                                              Icon(
                                                                            Icons.favorite_border_sharp,
                                                                            color:
                                                                                Color(0xFFCE395F),
                                                                            size:
                                                                                15,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          formatNumber(
                                                                            listViewReplyRecord.likedBy.toList().length,
                                                                            formatType:
                                                                                FormatType.decimal,
                                                                            decimalType:
                                                                                DecimalType.automatic,
                                                                          ),
                                                                          style:
                                                                              FlutterFlowTheme.of(context).bodyText2,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    Divider(
                                                      color: Color(0xFFE9EBF5),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        height: 48,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, 1),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                        child: Container(
                          width: double.infinity,
                          height: 48,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0, 1),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 4, 0),
                                      child: TextFormField(
                                        controller: textController,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          'textController',
                                          Duration(milliseconds: 2000),
                                          () => setState(() {}),
                                        ),
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintText: '[Some hint text...]',
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFE9EBF5),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFE9EBF5),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                          filled: true,
                                          fillColor: Color(0xFFE9EBF5),
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4, 0, 0, 0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText2,
                                      ),
                                    ),
                                  ),
                                  FFButtonWidget(
                                    onPressed: () async {
                                      final replyCreateData =
                                          createReplyRecordData(
                                        replyContennts: textController.text,
                                        replyBy: currentUserReference,
                                        replyAt: getCurrentTimestamp,
                                        replyFor: widget.detailsP.reference,
                                      );
                                      await ReplyRecord.collection
                                          .doc()
                                          .set(replyCreateData);

                                      final postsUpdateData = {
                                        'noOfReply': FieldValue.increment(1),
                                      };
                                      await widget.detailsP.reference
                                          .update(postsUpdateData);
                                      setState(() {
                                        textController?.clear();
                                      });
                                    },
                                    text: 'Post',
                                    options: FFButtonOptions(
                                      width: 50,
                                      height: 40,
                                      color: Colors.white,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyText2,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 0,
                                      ),
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
