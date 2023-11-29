import 'package:rising_gym/core/util/presentation/flutter_flow/flutter_flow_animations.dart';
import 'package:rising_gym/tdd/presentaion/view/widgets/drawer/end_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import '../../../../tdd/presentaion/modules/notifier/error/error_notifier_container.dart';
import '../flutter_flow/flutter_flow_theme.dart';

class ProjectScafold extends StatefulWidget {
  final EndDrawer? endDrawer;

  final BottomNavigationBar? bottomNavigationBar;

  const ProjectScafold({
    super.key,
    required this.child,  this.displayLogoHead = false,
    this.appBar,  this. endDrawer,  this.bottomNavigationBar,
  });

  final Widget child;
  final bool displayLogoHead;
  final AppBar? appBar;
  static Map<String,AnimationInfo> animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: 0,
          end: 1,
        ),
        ScaleEffect(
          curve: Curves.bounceOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: const Offset(0.6, 0.6),
          end: const Offset(1, 1),
        ),
      ],
    ),
    'textOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 100.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
          duration: 400.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
          duration: 400.ms,
          begin: const Offset(0, 30),
          end: const Offset(0, 0),
        ),
      ],
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 150.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 150.ms,
          duration: 400.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 150.ms,
          duration: 400.ms,
          begin: const Offset(0, 30),
          end: const Offset(0, 0),
        ),
      ],
    ),
    'containerFadeOut': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      effects: [
        VisibilityEffect(duration: 150.ms),
        FadeEffect(
          curve: Curves.easeOut,
          delay: 150.ms,
          duration: 400.ms,
          begin: 1,
          end: 0,
        ),
        MoveEffect(
          curve: Curves.easeOut,
          delay: 150.ms,
          duration: 400.ms,
          begin: const Offset(0, 30),
          end: const Offset(0, 0),
        ),
      ],
    ),
  };
  @override
  State<ProjectScafold> createState() => _ProjectScafoldState();
}

class _ProjectScafoldState extends State<ProjectScafold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: widget.appBar,
        endDrawer:widget.endDrawer,
        bottomNavigationBar: widget.bottomNavigationBar,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: CustomNotifier(
            child: FlutterSizer(builder: (context , oriantation , type ) {
              return CustomNotifier(child: SafeArea(child:  widget.child));
            })));
  }
}