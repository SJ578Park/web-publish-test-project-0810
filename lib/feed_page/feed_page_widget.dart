import '../add_contents/add_contents_widget.dart';
import '../auth/auth_util.dart';
import '../auth/firebase_user_provider.dart';
import '../backend/backend.dart';
import '../contents_detail_page/contents_detail_page_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../login_page/login_page_widget.dart';
import '../notice_page/notice_page_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class FeedPageWidget extends StatefulWidget {
  const FeedPageWidget({Key key}) : super(key: key);

  @override
  _FeedPageWidgetState createState() => _FeedPageWidgetState();
}

class _FeedPageWidgetState extends State<FeedPageWidget> {
  PagingController<DocumentSnapshot, PostsRecord> _pagingController;
  Query _pagingQuery;
  List<StreamSubscription> _streamSubscriptions = [];

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _streamSubscriptions.forEach((s) => s?.cancel());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          '서교동 청년주택 해링턴',
          style: FlutterFlowTheme.of(context).title1,
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
            child: InkWell(
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NoticePageWidget(),
                  ),
                );
              },
              child: Icon(
                FFIcons.knoticeoff1,
                color: Colors.black,
                size: 24,
              ),
            ),
          ),
        ],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (loggedIn) {
            await Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                duration: Duration(milliseconds: 300),
                reverseDuration: Duration(milliseconds: 300),
                child: AddContentsWidget(),
              ),
            );
          } else {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginPageWidget(),
              ),
            );
          }
        },
        backgroundColor: Color(0xFF9870ED),
        elevation: 0,
        child: Icon(
          FFIcons.kunion,
          color: Colors.white,
          size: 24,
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (valueOrDefault(currentUserDocument?.role, 0) > 3)
                  AuthUserStreamWidget(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                            child: Text(
                              '로그인을 해야 글을 볼 수 있습니다 .\n로그인을 해주세요 :)\n* 회원가입하셨어도 관리자의 승인 후 사용이 가능합니다',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context).bodyText2,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginPageWidget(),
                                  ),
                                );
                              },
                              text: '로그인 페이지로 가기',
                              options: FFButtonOptions(
                                width: 200,
                                height: 40,
                                color: Color(0xFF7342FF),
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Spoqa Han Sans Neo',
                                      color: Colors.white,
                                      useGoogleFonts: false,
                                    ),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                if (valueOrDefault(currentUserDocument?.role, 0) < 4)
                  AuthUserStreamWidget(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Visibility(
                        visible:
                            valueOrDefault(currentUserDocument?.role, 0) < 4,
                        child: PagedListView<DocumentSnapshot<Object>,
                            PostsRecord>(
                          pagingController: () {
                            final Query<Object> Function(Query<Object>)
                                queryBuilder = (postsRecord) => postsRecord
                                    .orderBy('created_at', descending: true);
                            if (_pagingController != null) {
                              final query =
                                  queryBuilder(PostsRecord.collection);
                              if (query != _pagingQuery) {
                                // The query has changed
                                _pagingQuery = query;
                                _streamSubscriptions
                                    .forEach((s) => s?.cancel());
                                _streamSubscriptions.clear();
                                _pagingController.refresh();
                              }
                              return _pagingController;
                            }

                            _pagingController =
                                PagingController(firstPageKey: null);
                            _pagingQuery = queryBuilder(PostsRecord.collection);
                            _pagingController
                                .addPageRequestListener((nextPageMarker) {
                              queryPostsRecordPage(
                                queryBuilder: (postsRecord) => postsRecord
                                    .orderBy('created_at', descending: true),
                                nextPageMarker: nextPageMarker,
                                pageSize: 25,
                                isStream: true,
                              ).then((page) {
                                _pagingController.appendPage(
                                  page.data,
                                  page.nextPageMarker,
                                );
                                final streamSubscription =
                                    page.dataStream?.listen((data) {
                                  final itemIndexes = _pagingController.itemList
                                      .asMap()
                                      .map((k, v) =>
                                          MapEntry(v.reference.id, k));
                                  data.forEach((item) {
                                    final index =
                                        itemIndexes[item.reference.id];
                                    final items = _pagingController.itemList;
                                    if (index != null) {
                                      items.replaceRange(
                                          index, index + 1, [item]);
                                      _pagingController.itemList = {
                                        for (var item in items)
                                          item.reference: item
                                      }.values.toList();
                                    }
                                  });
                                  setState(() {});
                                });
                                _streamSubscriptions.add(streamSubscription);
                              });
                            });
                            return _pagingController;
                          }(),
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          builderDelegate:
                              PagedChildBuilderDelegate<PostsRecord>(
                            // Customize what your widget looks like when it's loading the first page.
                            firstPageProgressIndicatorBuilder: (_) => Center(
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: SpinKitWanderingCubes(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  size: 50,
                                ),
                              ),
                            ),

                            itemBuilder: (context, _, listViewIndex) {
                              final listViewPostsRecord =
                                  _pagingController.itemList[listViewIndex];
                              return Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                child: FutureBuilder<UsersRecord>(
                                  future: UsersRecord.getDocumentOnce(
                                      listViewPostsRecord.createdBy),
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
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20, 0, 20, 0),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(0),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 12, 0, 8),
                                                  child: InkWell(
                                                    onTap: () async {
                                                      await Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              ContentsDetailPageWidget(
                                                            detailsP:
                                                                listViewPostsRecord,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
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
                                                                  .fromSTEB(0,
                                                                      0, 8, 0),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                            child:
                                                                Image.network(
                                                              columnUsersRecord
                                                                  .photoUrl,
                                                              width: 48,
                                                              height: 48,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.6,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0),
                                                          ),
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
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            8),
                                                                    child: Text(
                                                                      columnUsersRecord
                                                                          .displayName,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .title3
                                                                          .override(
                                                                            fontFamily:
                                                                                'IM_Hyemin',
                                                                            fontSize:
                                                                                16,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  if (columnUsersRecord
                                                                          .role <
                                                                      3)
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              4,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .verified_outlined,
                                                                        color: Color(
                                                                            0xFFCE395F),
                                                                        size:
                                                                            16,
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            8),
                                                                child: Text(
                                                                  listViewPostsRecord
                                                                      .contents,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 12, 0, 0),
                                                  child: Icon(
                                                    FFIcons.kiconmore,
                                                    color: Color(0xFF8D8D95),
                                                    size: 24,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  68, 0, 0, 0),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (listViewPostsRecord
                                                        .hasPhoto ==
                                                    true)
                                                  Container(
                                                    width: double.infinity,
                                                    height: 200,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                    ),
                                                    child: Builder(
                                                      builder: (context) {
                                                        final listImages =
                                                            listViewPostsRecord
                                                                .images
                                                                .toList();
                                                        return ListView.builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          primary: false,
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          itemCount:
                                                              listImages.length,
                                                          itemBuilder: (context,
                                                              listImagesIndex) {
                                                            final listImagesItem =
                                                                listImages[
                                                                    listImagesIndex];
                                                            return Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child:
                                                                  Image.network(
                                                                listImagesItem,
                                                                fit: BoxFit
                                                                    .fitHeight,
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20, 0, 20, 0),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 28,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(16),
                                                bottomRight:
                                                    Radius.circular(16),
                                                topLeft: Radius.circular(0),
                                                topRight: Radius.circular(0),
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    if (listViewPostsRecord
                                                            .likedBy
                                                            .toList()
                                                            .contains(
                                                                columnUsersRecord
                                                                    .reference) !=
                                                        null)
                                                      Icon(
                                                        FFIcons.kreplyoff,
                                                        color: Colors.black,
                                                        size: 24,
                                                      ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 4, 0),
                                                      child: Text(
                                                        formatNumber(
                                                          listViewPostsRecord
                                                              .noOfReply,
                                                          formatType: FormatType
                                                              .decimal,
                                                          decimalType:
                                                              DecimalType
                                                                  .automatic,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText2
                                                                .override(
                                                                  fontFamily:
                                                                      'Spoqa Han Sans Neo',
                                                                  fontSize: 12,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(4, 0, 0, 0),
                                                  child: InkWell(
                                                    onTap: () async {
                                                      if (listViewPostsRecord
                                                          .likedBy
                                                          .toList()
                                                          .contains(
                                                              currentUserReference)) {
                                                        final postsUpdateData =
                                                            {
                                                          'liked_by': FieldValue
                                                              .arrayRemove([
                                                            currentUserReference
                                                          ]),
                                                        };
                                                        await listViewPostsRecord
                                                            .reference
                                                            .update(
                                                                postsUpdateData);
                                                      } else {
                                                        final postsUpdateData =
                                                            {
                                                          'liked_by': FieldValue
                                                              .arrayUnion([
                                                            currentUserReference
                                                          ]),
                                                        };
                                                        await listViewPostsRecord
                                                            .reference
                                                            .update(
                                                                postsUpdateData);
                                                      }
                                                    },
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        if (!listViewPostsRecord
                                                            .likedBy
                                                            .toList()
                                                            .contains(
                                                                currentUserReference))
                                                          Icon(
                                                            FFIcons.klikeoff1,
                                                            color: Color(
                                                                0xFF8D8D95),
                                                            size: 24,
                                                          ),
                                                        if (listViewPostsRecord
                                                            .likedBy
                                                            .toList()
                                                            .contains(
                                                                currentUserReference))
                                                          Icon(
                                                            FFIcons.klikeon,
                                                            color: Color(
                                                                0xFFCE395F),
                                                            size: 24,
                                                          ),
                                                        Text(
                                                          formatNumber(
                                                            listViewPostsRecord
                                                                .likedBy
                                                                .toList()
                                                                .length,
                                                            formatType:
                                                                FormatType
                                                                    .decimal,
                                                            decimalType:
                                                                DecimalType
                                                                    .automatic,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText2
                                                              .override(
                                                                fontFamily:
                                                                    'Spoqa Han Sans Neo',
                                                                color: Color(
                                                                    0xFFCE395F),
                                                                fontSize: 12,
                                                                useGoogleFonts:
                                                                    false,
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
                                        Divider(
                                          thickness: 4,
                                          color: Color(0xFFE9EBF5),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              );
                            },
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
  }
}
