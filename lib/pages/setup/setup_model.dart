import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/permissions_util.dart';
import 'setup_widget.dart' show SetupWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SetupModel extends FlutterFlowModel<SetupWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Agegroup widget.
  String? agegroupValue;
  FormFieldController<String>? agegroupValueController;
  // State field(s) for country widget.
  String? countryValue;
  FormFieldController<String>? countryValueController;
  // State field(s) for country_language widget.
  String? countryLanguageValue;
  FormFieldController<String>? countryLanguageValueController;
  // State field(s) for voiceoversound widget.
  int? voiceoversoundValue;
  FormFieldController<int>? voiceoversoundValueController;
  // State field(s) for speed widget.
  double? speedValue;
  FormFieldController<double>? speedValueController;
  // State field(s) for repetitionchoice widget.
  bool? repetitionchoiceValue;
  // State field(s) for numrep widget.
  int? numrepValue;
  FormFieldController<int>? numrepValueController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
