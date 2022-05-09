import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';

class PhoneAuth extends StatefulWidget {
  const PhoneAuth({Key? key}) : super(key: key);

  @override
  _PhoneAuthState createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return // Generated code for this HomePage Widget...
      Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFFF5F5F5),
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFEEEEEE),
              ),
              alignment: const AlignmentDirectional(0, 0),
              child: Wrap(
                spacing: 0,
                runSpacing: 0,
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                direction: Axis.horizontal,
                runAlignment: WrapAlignment.center,
                verticalDirection: VerticalDirection.up,
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 400,
                    height: 400,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x3600000F),
                          offset: Offset(0, -1),
                        )
                      ],
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding:
                                const EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                                child: IconButton(
                                  color: const Color(0xFFE0E3E7),
                                  splashRadius: 30,
                                  // borderWidth: 1,
                                  iconSize: 44,
                                  icon: const Icon(
                                    Icons.arrow_back_rounded,
                                    color: Color(0xFF57636C),
                                    size: 24,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                              ),
                              const Text(
                                'Phone Sign In',
                                style: TextStyle(
                                  fontFamily: 'Outfit',
                                  color: Color(0xFF0F1113),
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: textController,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    'textController',
                                    const Duration(milliseconds: 2000),
                                        () => setState(() {}),
                                  ),
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: const InputDecoration(
                                    hintText: 'Enter Phone Number',
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                  ),
                                  style: Theme.of(context).inputDecorationTheme.counterStyle,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(20, 12, 20, 12),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MaterialButton(
                                onPressed: () {
                                  print('Button pressed ...');
                                },
                                child: Text("Button"),
                                minWidth: 130,
                                height: 40,
                                color: Theme.of(context).primaryColor,
                                shape: Border.all(style: BorderStyle.solid,width: 1,color: Colors.transparent),
                                // options: FFButtonOptions(
                                //   width: 130,
                                //   height: 40,
                                //   color: Theme.of(context).primaryColor,
                                //   // textStyle: FlutterFlowTheme.of(context)
                                //   //     .subtitle2
                                //   //     .override(
                                //   //   fontFamily: 'Poppins',
                                //   //   color: Colors.white,
                                //   // ),
                                //   borderSide: const BorderSide(
                                //     color: Colors.transparent,
                                //     width: 1,
                                //   ),
                                //   borderRadius: 12,
                                // ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 400,
                    decoration: const BoxDecoration(
                      color: Color(0xFFEEEEEE),
                    ),
                    alignment: const AlignmentDirectional(0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 70, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (Theme.of(context).brightness == Brightness.dark ??
                                  true)
                                Image.asset(
                                  'assets/images/uiLogo_robinLight@3x.png',
                                  width: 240,
                                  height: 60,
                                  fit: BoxFit.fitWidth,
                                ),
                              if (!(Theme.of(context).brightness ==
                                  Brightness.dark) ??
                                  true)
                                Image.asset(
                                  'assets/images/wellcome_workers.png',
                                  width: 240,
                                  height: 60,
                                  fit: BoxFit.fitWidth,
                                ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                          child: Image.asset(
                            'assets/images/illi_2@2x.png',
                            width: 300,
                            height: 300,
                            fit: BoxFit.cover,
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
      );
  }
}
