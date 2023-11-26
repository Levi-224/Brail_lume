import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'welcome_widget.dart' show WelcomeWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';

class WelcomeModel extends FlutterFlowModel<WelcomeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  AudioPlayer? soundPlayer1;
  // Stores action output result for [Custom Action - getBeaconMajorValue] action in Welcome widget.
  String? character;
  AudioPlayer? soundPlayer2;
  // Stores action output result for [Custom Action - checkcharacter] action in Welcome widget.
  String? result;
  // Stores action output result for [Custom Action - retrieveRandomSentence] action in Welcome widget.
  String? letterinfo;
  // Stores action output result for [Custom Action - retrieveRandomSentence] action in Welcome widget.
  String? intro;
  // Stores action output result for [Custom Action - retrieveRandomSentence] action in Welcome widget.
  String? wordsent;
  AudioPlayer? soundPlayer3;
  AudioPlayer? soundPlayer4;
  AudioPlayer? soundPlayer5;
  // Stores action output result for [Custom Action - numericAction] action in Welcome widget.
  String? digitInfo;
  // Stores action output result for [Custom Action - numericAction] action in Welcome widget.
  String? digitIntro;
  AudioPlayer? soundPlayer6;
  AudioPlayer? soundPlayer7;
  AudioPlayer? soundPlayer8;
  AudioPlayer? soundPlayer9;
  // Stores action output result for [Custom Action - retrieveRandomSentence] action in Column widget.
  String? shortstory;
  AudioPlayer? soundPlayer10;
  // Stores action output result for [Custom Action - numericAction] action in Column widget.
  String? fact1;
  AudioPlayer? soundPlayer11;
  AudioPlayer? soundPlayer12;
  // Stores action output result for [Custom Action - retrieveRandomSentence] action in Column widget.
  String? rhyme;
  AudioPlayer? soundPlayer13;
  // Stores action output result for [Custom Action - numericAction] action in Column widget.
  String? fact2;
  // State field(s) for Timer1 widget.
  int timer1Milliseconds = 0;
  String timer1Value = StopWatchTimer.getDisplayTime(
    0,
    hours: false,
    minute: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timer1Controller =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countUp));

  // State field(s) for Timer2 widget.
  int timer2Milliseconds = 10000;
  String timer2Value = StopWatchTimer.getDisplayTime(
    10000,
    hours: false,
    minute: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timer2Controller =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    timer1Controller.dispose();
    timer2Controller.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
