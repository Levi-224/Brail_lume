import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/permissions_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'setup_model.dart';
export 'setup_model.dart';

class SetupWidget extends StatefulWidget {
  const SetupWidget({Key? key}) : super(key: key);

  @override
  _SetupWidgetState createState() => _SetupWidgetState();
}

class _SetupWidgetState extends State<SetupWidget> {
  late SetupModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SetupModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFF1EFE7),
        body: SafeArea(
          top: true,
          child: Container(
            width: 443.0,
            height: 808.0,
            decoration: BoxDecoration(
              color: Color(0xFFF1EFE7),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1.00, -1.00),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 60.0, 0.0, 0.0),
                        child: Text(
                          'Setup your profile',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.00, -1.00),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 30.0, 8.0, 0.0),
                        child: FlutterFlowDropDown<String>(
                          controller: _model.agegroupValueController ??=
                              FormFieldController<String>(
                            _model.agegroupValue ??= '',
                          ),
                          options: List<String>.from(['3 to 6', '7 to 12']),
                          optionLabels: ['3 to 6 years', '7 to 12 years'],
                          onChanged: (val) =>
                              setState(() => _model.agegroupValue = val),
                          width: 343.0,
                          height: 50.0,
                          textStyle: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .labelMediumFamily,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .labelMediumFamily),
                              ),
                          hintText: 'Select your age group',
                          icon: FaIcon(
                            FontAwesomeIcons.angleDown,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          fillColor: Color(0xFFF1EFE7),
                          elevation: 2.0,
                          borderColor: FlutterFlowTheme.of(context).alternate,
                          borderWidth: 2.0,
                          borderRadius: 8.0,
                          margin: EdgeInsetsDirectional.fromSTEB(
                              16.0, 4.0, 16.0, 4.0),
                          hidesUnderline: true,
                          isSearchable: false,
                          isMultiSelect: false,
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: 0.7,
                      child: Align(
                        alignment: AlignmentDirectional(-1.00, -1.00),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Makes our outputs tailored for your age group. Default is 3 to 6  years old.',
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelSmallFamily,
                                  color: Color(0xFF7A7C83),
                                  fontSize: 9.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .labelSmallFamily),
                                ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.00, -1.00),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 30.0, 8.0, 0.0),
                        child: FlutterFlowDropDown<String>(
                          controller: _model.countryValueController ??=
                              FormFieldController<String>(
                            _model.countryValue ??= '',
                          ),
                          options: List<String>.from(['UK', 'India']),
                          optionLabels: ['United Kingdom(UK)', 'India'],
                          onChanged: (val) =>
                              setState(() => _model.countryValue = val),
                          width: 343.0,
                          height: 50.0,
                          textStyle: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .labelMediumFamily,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .labelMediumFamily),
                              ),
                          hintText: 'Select your country',
                          icon: FaIcon(
                            FontAwesomeIcons.angleDown,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          fillColor: Color(0xFFF1EFE7),
                          elevation: 2.0,
                          borderColor: FlutterFlowTheme.of(context).alternate,
                          borderWidth: 2.0,
                          borderRadius: 8.0,
                          margin: EdgeInsetsDirectional.fromSTEB(
                              16.0, 4.0, 16.0, 4.0),
                          hidesUnderline: true,
                          isSearchable: false,
                          isMultiSelect: false,
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: 0.7,
                      child: Align(
                        alignment: AlignmentDirectional(-1.00, -1.00),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Makes our outputs more regional so that you can easily understand',
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelSmallFamily,
                                  color: Color(0xFF7A7C83),
                                  fontSize: 9.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .labelSmallFamily),
                                ),
                          ),
                        ),
                      ),
                    ),
                    if (_model.countryValue == 'India')
                      Align(
                        alignment: AlignmentDirectional(-1.00, -1.00),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 30.0, 8.0, 0.0),
                          child: FlutterFlowDropDown<String>(
                            controller:
                                _model.countryLanguageValueController ??=
                                    FormFieldController<String>(
                              _model.countryLanguageValue ??= '',
                            ),
                            options: List<String>.from(
                                ['English', 'Hindi', 'Tamil', 'Malayalam']),
                            optionLabels: [
                              'English (EN)',
                              'Hindi (HI)',
                              'Tamil (TM)',
                              'Malayalam (ML)'
                            ],
                            onChanged: (val) => setState(
                                () => _model.countryLanguageValue = val),
                            width: 343.0,
                            height: 50.0,
                            textStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelMediumFamily,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .labelMediumFamily),
                                ),
                            hintText: 'Select the indian language',
                            icon: FaIcon(
                              FontAwesomeIcons.angleDown,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            fillColor: Color(0xFFF1EFE7),
                            elevation: 2.0,
                            borderColor: FlutterFlowTheme.of(context).alternate,
                            borderWidth: 2.0,
                            borderRadius: 8.0,
                            margin: EdgeInsetsDirectional.fromSTEB(
                                16.0, 4.0, 16.0, 4.0),
                            hidesUnderline: true,
                            disabled: _model.countryValue == 'India',
                            isSearchable: false,
                            isMultiSelect: false,
                          ),
                        ),
                      ),
                    if (_model.countryValue == 'India')
                      Opacity(
                        opacity: 0.7,
                        child: Align(
                          alignment: AlignmentDirectional(-1.00, -1.00),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Select the Indian language you want to learn. Default is English',
                              style: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .labelSmallFamily,
                                    color: Color(0xFF7A7C83),
                                    fontSize: 9.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .labelSmallFamily),
                                  ),
                            ),
                          ),
                        ),
                      ),
                    Align(
                      alignment: AlignmentDirectional(-1.00, -1.00),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 30.0, 8.0, 0.0),
                        child: FlutterFlowDropDown<int>(
                          controller: _model.voiceoversoundValueController ??=
                              FormFieldController<int>(null),
                          options: List<int>.from([0, 1]),
                          optionLabels: ['Male', 'Female'],
                          onChanged: (val) =>
                              setState(() => _model.voiceoversoundValue = val),
                          width: 343.0,
                          height: 50.0,
                          textStyle: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .labelMediumFamily,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .labelMediumFamily),
                              ),
                          hintText: 'Select your voice-over sound',
                          icon: FaIcon(
                            FontAwesomeIcons.angleDown,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          fillColor: Color(0xFFF1EFE7),
                          elevation: 2.0,
                          borderColor: FlutterFlowTheme.of(context).alternate,
                          borderWidth: 2.0,
                          borderRadius: 8.0,
                          margin: EdgeInsetsDirectional.fromSTEB(
                              16.0, 4.0, 16.0, 4.0),
                          hidesUnderline: true,
                          isSearchable: false,
                          isMultiSelect: false,
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: 0.7,
                      child: Align(
                        alignment: AlignmentDirectional(-1.00, -1.00),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Select the voice over sound you prefer. Male or Female',
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelSmallFamily,
                                  color: Color(0xFF7A7C83),
                                  fontSize: 9.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .labelSmallFamily),
                                ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.00, -1.00),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 30.0, 8.0, 0.0),
                        child: FlutterFlowDropDown<double>(
                          controller: _model.speedValueController ??=
                              FormFieldController<double>(null),
                          options: List<double>.from([0.3, 0.5, 0.8, 1.0]),
                          optionLabels: ['Very Slow', 'Slow', 'Normal', 'Fast'],
                          onChanged: (val) =>
                              setState(() => _model.speedValue = val),
                          width: 343.0,
                          height: 50.0,
                          textStyle: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .labelMediumFamily,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .labelMediumFamily),
                              ),
                          hintText: 'Voice-over speed',
                          icon: FaIcon(
                            FontAwesomeIcons.angleDown,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          fillColor: Color(0xFFF1EFE7),
                          elevation: 2.0,
                          borderColor: FlutterFlowTheme.of(context).alternate,
                          borderWidth: 2.0,
                          borderRadius: 8.0,
                          margin: EdgeInsetsDirectional.fromSTEB(
                              16.0, 4.0, 16.0, 4.0),
                          hidesUnderline: true,
                          isSearchable: false,
                          isMultiSelect: false,
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: 0.7,
                      child: Align(
                        alignment: AlignmentDirectional(-1.00, -1.00),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Select the speed for your voice over. Default is slow.',
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelSmallFamily,
                                  color: Color(0xFF7A7C83),
                                  fontSize: 9.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .labelSmallFamily),
                                ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.00, -1.00),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 30.0, 8.0, 0.0),
                        child: SwitchListTile.adaptive(
                          value: _model.repetitionchoiceValue ??= false,
                          onChanged: (newValue) async {
                            setState(
                                () => _model.repetitionchoiceValue = newValue!);
                          },
                          title: Text(
                            'Repetition of voice-over',
                            style: FlutterFlowTheme.of(context).labelMedium,
                          ),
                          subtitle: Text(
                            'Switch on if repetition of voice over is required.',
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelSmallFamily,
                                  color: Color(0xFF7A7C83),
                                  fontSize: 9.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .labelSmallFamily),
                                ),
                          ),
                          tileColor: Color(0xFFF1EFE7),
                          activeColor: Colors.black,
                          activeTrackColor: Color(0xFFF1EFE7),
                          dense: true,
                          controlAffinity: ListTileControlAffinity.trailing,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                    if (_model.repetitionchoiceValue == true)
                      Align(
                        alignment: AlignmentDirectional(-1.00, -1.00),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 30.0, 8.0, 0.0),
                          child: FlutterFlowDropDown<int>(
                            controller: _model.numrepValueController ??=
                                FormFieldController<int>(null),
                            options: List<int>.from([2, 3]),
                            optionLabels: ['1', '2'],
                            onChanged: (val) =>
                                setState(() => _model.numrepValue = val),
                            width: 343.0,
                            height: 50.0,
                            textStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelMediumFamily,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .labelMediumFamily),
                                ),
                            hintText: 'Number of repetitions. ',
                            icon: FaIcon(
                              FontAwesomeIcons.angleDown,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            fillColor: Color(0xFFF1EFE7),
                            elevation: 2.0,
                            borderColor: FlutterFlowTheme.of(context).alternate,
                            borderWidth: 2.0,
                            borderRadius: 8.0,
                            margin: EdgeInsetsDirectional.fromSTEB(
                                16.0, 4.0, 16.0, 4.0),
                            hidesUnderline: true,
                            isSearchable: false,
                            isMultiSelect: false,
                          ),
                        ),
                      ),
                    if (_model.repetitionchoiceValue == true)
                      Opacity(
                        opacity: 0.7,
                        child: Align(
                          alignment: AlignmentDirectional(-1.00, -1.00),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Select how many times you want the voice over to be repeated (Default - 1)',
                              style: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .labelSmallFamily,
                                    color: Color(0xFF7A7C83),
                                    fontSize: 9.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .labelSmallFamily),
                                  ),
                            ),
                          ),
                        ),
                      ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          await requestPermission(bluetoothPermission);
                          await requestPermission(locationPermission);
                          await requestPermission(microphonePermission);
                          if ((await getPermissionStatus(
                                  bluetoothPermission)) &&
                              (await getPermissionStatus(locationPermission)) &&
                              (await getPermissionStatus(
                                  microphonePermission))) {
                            context.pushNamed(
                              'Welcome',
                              queryParameters: {
                                'country': serializeParam(
                                  _model.countryValue,
                                  ParamType.String,
                                ),
                                'agegroup': serializeParam(
                                  _model.agegroupValue,
                                  ParamType.String,
                                ),
                                'repCount': serializeParam(
                                  _model.numrepValue,
                                  ParamType.int,
                                ),
                                'speed': serializeParam(
                                  _model.speedValue,
                                  ParamType.double,
                                ),
                                'voicegender': serializeParam(
                                  _model.voiceoversoundValue,
                                  ParamType.int,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                ),
                              },
                            );
                          } else {
                            await actions.tts(
                              _model.countryValue!,
                              'Please grant access to the permissions asked',
                              _model.speedValue!,
                              _model.numrepValue!,
                              _model.voiceoversoundValue!,
                            );

                            context.pushNamed('setup');
                          }
                        },
                        text: 'Proceed to learn',
                        options: FFButtonOptions(
                          width: 200.0,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Colors.black,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleSmallFamily,
                                color: Colors.white,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .titleSmallFamily),
                              ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
