import 'package:cloud_me_v2/core/util/presentation/flutter_flow/flutter_flow_animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../tdd/presentaion/modules/notifier/error/error_notifier_container.dart';
import '../flutter_flow/flutter_flow_theme.dart';

class ProjectScafold extends StatefulWidget {
   const ProjectScafold({
    super.key,
    required this.child,  this.displayLogoHead = false,
     this.appBar,
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
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: Stack(
        // mainAxisSize: MainAxisSize.max,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    FlutterFlowTheme.of(context).primary,
                    FlutterFlowTheme.of(context).alternate,
                    Colors.transparent
                  ],
                  stops: const [0, 0.5, 1],
                  begin: const AlignmentDirectional(-0.1, -1),
                  end: const AlignmentDirectional(0.1, 1),
                ),
              ),
              child:Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  color: Color(0xD914181B),
                ),
                child:  widget.displayLogoHead?Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0x00616161),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/logo/logo.png',
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ).animateOnPageLoad(
                        ProjectScafold.animationsMap['containerOnPageLoadAnimation']!),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                      child: Text(
                        'Member Sign Up',
                        style: FlutterFlowTheme.of(context).headlineSmall,
                      ).animateOnPageLoad(ProjectScafold.animationsMap['textOnPageLoadAnimation1']!),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                      child: Text(
                        'Use the account below to sign in.',
                        style: FlutterFlowTheme.of(context).labelMedium,
                      ).animateOnPageLoad(ProjectScafold.animationsMap['textOnPageLoadAnimation2']!),
                    ),
                  ],
                ):SafeArea(child: Container()),
              ),
            ),
          ),
          CustomNotifier(child: Align(heightFactor:widget.displayLogoHead?300:1,child: SafeArea(child:  widget.child))),
        ],
      ),
    );
  }
}