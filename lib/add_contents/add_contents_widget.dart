import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../login_page/login_page_widget.dart';
import '../main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AddContentsWidget extends StatefulWidget {
  const AddContentsWidget({Key key}) : super(key: key);

  @override
  _AddContentsWidgetState createState() => _AddContentsWidgetState();
}

class _AddContentsWidgetState extends State<AddContentsWidget> {
  String uploadedFileUrl = '';
  TextEditingController contentsController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    contentsController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 18, 0, 0),
          child: InkWell(
            onTap: () async {
              await Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.fade,
                  duration: Duration(milliseconds: 300),
                  reverseDuration: Duration(milliseconds: 300),
                  child: NavBarPage(initialPage: 'feedPage'),
                ),
              );
            },
            child: Text(
              '취소',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyText2.override(
                    fontFamily: 'Spoqa Han Sans Neo',
                    color: Color(0xFFA168EB),
                    useGoogleFonts: false,
                  ),
            ),
          ),
        ),
        title: Text(
          '새로운 글쓰기',
          textAlign: TextAlign.start,
          style: FlutterFlowTheme.of(context).title1,
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 10, 16, 10),
            child: InkWell(
              onTap: () async {
                if (contentsController.text == null ||
                    contentsController.text == '') {
                  await showDialog(
                    context: context,
                    builder: (alertDialogContext) {
                      return AlertDialog(
                        content: Text('글을 작성해주세요!'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(alertDialogContext),
                            child: Text('Ok'),
                          ),
                        ],
                      );
                    },
                  );
                }
                if (FFAppState().tempImages.contains(uploadedFileUrl)) {
                  final postsCreateData = {
                    ...createPostsRecordData(
                      contents: contentsController.text,
                      createdBy: currentUserReference,
                      createdAt: getCurrentTimestamp,
                      noOfReply: 0,
                      hasPhoto: true,
                    ),
                    'images': FFAppState().tempImages,
                  };
                  await PostsRecord.collection.doc().set(postsCreateData);
                } else {
                  final postsCreateData = createPostsRecordData(
                    contents: contentsController.text,
                    createdBy: currentUserReference,
                    createdAt: getCurrentTimestamp,
                    noOfReply: 0,
                    hasPhoto: false,
                  );
                  await PostsRecord.collection.doc().set(postsCreateData);
                }

                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NavBarPage(initialPage: 'feedPage'),
                  ),
                );
              },
              child: Container(
                width: 60,
                height: 20,
                decoration: BoxDecoration(
                  color: Color(0xFFA168EB),
                  borderRadius: BorderRadius.circular(100),
                  shape: BoxShape.rectangle,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                  child: Text(
                    '올리기',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyText2.override(
                          fontFamily: 'Spoqa Han Sans Neo',
                          color: Colors.white,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
              ),
            ),
          ),
        ],
        centerTitle: false,
        elevation: 1,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (valueOrDefault(currentUserDocument?.role, 0) < 4)
                AuthUserStreamWidget(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  currentUserPhoto,
                                  width: 48,
                                  height: 48,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: TextFormField(
                                  controller: contentsController,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    'contentsController',
                                    Duration(milliseconds: 2000),
                                    () => setState(() {}),
                                  ),
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    hintText: '내용을 입력해주세요!',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText2
                                      .override(
                                        fontFamily: 'Spoqa Han Sans Neo',
                                        color: Color(0xFF8D8D95),
                                        useGoogleFonts: false,
                                      ),
                                  textAlign: TextAlign.start,
                                  maxLines: 20,
                                  keyboardType: TextInputType.multiline,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    final selectedMedia =
                                        await selectMediaWithSourceBottomSheet(
                                      context: context,
                                      allowPhoto: true,
                                      allowVideo: true,
                                    );
                                    if (selectedMedia != null &&
                                        selectedMedia.every((m) =>
                                            validateFileFormat(
                                                m.storagePath, context))) {
                                      showUploadMessage(
                                        context,
                                        'Uploading file...',
                                        showLoading: true,
                                      );
                                      final downloadUrls = (await Future.wait(
                                              selectedMedia.map((m) async =>
                                                  await uploadData(
                                                      m.storagePath, m.bytes))))
                                          .where((u) => u != null)
                                          .toList();
                                      ScaffoldMessenger.of(context)
                                          .hideCurrentSnackBar();
                                      if (downloadUrls != null &&
                                          downloadUrls.length ==
                                              selectedMedia.length) {
                                        setState(() => uploadedFileUrl =
                                            downloadUrls.first);
                                        showUploadMessage(
                                          context,
                                          'Success!',
                                        );
                                      } else {
                                        showUploadMessage(
                                          context,
                                          'Failed to upload media',
                                        );
                                        return;
                                      }
                                    }

                                    setState(() => FFAppState()
                                        .tempImages
                                        .add(uploadedFileUrl));
                                  },
                                  child: Icon(
                                    FFIcons.kaddPhotooff,
                                    color: Colors.black,
                                    size: 40,
                                  ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    setState(
                                        () => FFAppState().tempImages = []);
                                  },
                                  child: Icon(
                                    Icons.delete_forever,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    size: 36,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Builder(
                            builder: (context) {
                              final uploadedimages =
                                  FFAppState().tempImages.toList();
                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: List.generate(uploadedimages.length,
                                      (uploadedimagesIndex) {
                                    final uploadedimagesItem =
                                        uploadedimages[uploadedimagesIndex];
                                    return Stack(
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 8, 0),
                                          child: Image.network(
                                            uploadedimagesItem,
                                            width: 80,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ],
                                    );
                                  }),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              if (valueOrDefault(currentUserDocument?.role, 0) > 3)
                AuthUserStreamWidget(
                  child: Container(
                    width: double.infinity,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE),
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
            ],
          ),
        ),
      ),
    );
  }
}
