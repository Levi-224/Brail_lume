import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'welcome_model.dart';
export 'welcome_model.dart';

class WelcomeWidget extends StatefulWidget {
  const WelcomeWidget({
    Key? key,
    String? country,
    required this.voicegender,
    required this.agegroup,
    int? repCount,
    double? speed,
  })  : this.country = country ?? 'UK',
        this.repCount = repCount ?? 1,
        this.speed = speed ?? 0.8,
        super(key: key);

  final String country;
  final int? voicegender;
  final String? agegroup;
  final int repCount;
  final double speed;

  @override
  _WelcomeWidgetState createState() => _WelcomeWidgetState();
}

class _WelcomeWidgetState extends State<WelcomeWidget>
    with TickerProviderStateMixin {
  late WelcomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'textOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.linear,
          delay: 0.ms,
          duration: 2000.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'timerOnActionTriggerAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        VisibilityEffect(duration: 2000.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 2000.ms,
          duration: 300.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'timerOnActionTriggerAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        VisibilityEffect(duration: 2000.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 2000.ms,
          duration: 300.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WelcomeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.soundPlayer1 ??= AudioPlayer();
      if (_model.soundPlayer1!.playing) {
        await _model.soundPlayer1!.stop();
      }
      _model.soundPlayer1!.setVolume(1.0);
      await _model.soundPlayer1!
          .setAsset('assets/audios/welcome_load.mp3')
          .then((_) => _model.soundPlayer1!.play());

      await actions.tts(
        widget.country,
        'Awesome. Braillume is now connected. Enter the character you want to learn about',
        widget.speed,
        widget.repCount,
        widget.voicegender!,
      );
      _model.character = await actions.getBeaconMajorValue();
      _model.soundPlayer2 ??= AudioPlayer();
      if (_model.soundPlayer2!.playing) {
        await _model.soundPlayer2!.stop();
      }
      _model.soundPlayer2!.setVolume(1.0);
      await _model.soundPlayer2!
          .setAsset('assets/audios/Enter_alphabet.mp3')
          .then((_) => _model.soundPlayer2!.play());

      _model.result = await actions.checkcharacter(
        _model.character!,
      );
      if (animationsMap['textOnActionTriggerAnimation'] != null) {
        await animationsMap['textOnActionTriggerAnimation']!
            .controller
            .forward(from: 0.0);
      }
      if (_model.result == 'Letter') {
        _model.letterinfo = await actions.retrieveRandomSentence(
          _model.character!,
          widget.agegroup!,
          widget.country,
          'Letterinfo',
        );
        if (_model.letterinfo == 'No matching sentence found') {
          await actions.tts(
            widget.country,
            'Sorry, the alphabet you created does not exist. Please try again',
            widget.speed,
            widget.repCount,
            widget.voicegender!,
          );

          context.pushNamed(
            'Welcome',
            queryParameters: {
              'country': serializeParam(
                '',
                ParamType.String,
              ),
              'voicegender': serializeParam(
                0,
                ParamType.int,
              ),
              'agegroup': serializeParam(
                '',
                ParamType.String,
              ),
              'repCount': serializeParam(
                0,
                ParamType.int,
              ),
              'speed': serializeParam(
                0.0,
                ParamType.double,
              ),
            }.withoutNulls,
          );
        } else {
          await actions.tts(
            widget.country,
            _model.letterinfo!,
            widget.speed,
            widget.repCount,
            widget.voicegender!,
          );
          _model.intro = await actions.retrieveRandomSentence(
            _model.character!,
            widget.agegroup!,
            widget.country,
            'InitialIntroduction',
          );
          await actions.tts(
            widget.country,
            _model.intro!,
            widget.speed,
            widget.repCount,
            widget.voicegender!,
          );
          await Future.delayed(const Duration(milliseconds: 1000));
          await actions.tts(
            widget.country,
            'Here is a sentence about the letter',
            widget.speed,
            widget.repCount,
            widget.voicegender!,
          );
          _model.wordsent = await actions.retrieveRandomSentence(
            _model.character!,
            widget.agegroup!,
            widget.country,
            'WordSentence',
          );
          await actions.tts(
            widget.country,
            _model.wordsent!,
            widget.speed,
            widget.repCount,
            widget.voicegender!,
          );
          await Future.delayed(const Duration(milliseconds: 1000));
          await actions.tts(
            widget.country,
            'If you want to hear a short story about the letter, click the screen within the next ten seconds after this sound',
            widget.speed,
            widget.repCount,
            widget.voicegender!,
          );
          if (animationsMap['timerOnActionTriggerAnimation1'] != null) {
            await animationsMap['timerOnActionTriggerAnimation1']!
                .controller
                .forward(from: 0.0);
          }
          _model.soundPlayer3 ??= AudioPlayer();
          if (_model.soundPlayer3!.playing) {
            await _model.soundPlayer3!.stop();
          }
          _model.soundPlayer3!.setVolume(1.0);
          await _model.soundPlayer3!
              .setAsset('assets/audios/Short_story_&_rhyme.mp3')
              .then((_) => _model.soundPlayer3!.play());

          _model.timer1Controller.onStartTimer();
          _model.timer2Controller.onStartTimer();
          await Future.delayed(const Duration(milliseconds: 1000));
          while (_model.timer1Milliseconds < 10000) {
            await actions.tts(
              widget.country,
              (String var1) {
                return var1[1];
              }(_model.timer2Value),
              widget.speed,
              widget.repCount,
              widget.voicegender!,
            );
          }
          if (_model.timer1Milliseconds > 10000) {
            _model.timer1Controller.onStopTimer();
            _model.timer1Controller.timer
                .setPresetTime(mSec: 10000, add: false);
            _model.timer1Controller.onResetTimer();

            _model.timer2Controller.onResetTimer();

            await actions.tts(
              widget.country,
              'If you want to hear a rhyme about  the letter, tap the screen within the next ten seconds after this sound',
              widget.speed,
              widget.repCount,
              widget.voicegender!,
            );
            _model.soundPlayer4 ??= AudioPlayer();
            if (_model.soundPlayer4!.playing) {
              await _model.soundPlayer4!.stop();
            }
            _model.soundPlayer4!.setVolume(1.0);
            await _model.soundPlayer4!
                .setAsset('assets/audios/Short_story_&_rhyme.mp3')
                .then((_) => _model.soundPlayer4!.play());

            _model.timer1Controller.onStartTimer();
            _model.timer2Controller.onStartTimer();
            await Future.delayed(const Duration(milliseconds: 1000));
            while (_model.timer1Milliseconds < 20000) {
              await actions.tts(
                widget.country,
                (String var1) {
                  return var1[1];
                }(_model.timer2Value),
                widget.speed,
                widget.repCount,
                widget.voicegender!,
              );
            }
            if (_model.timer1Milliseconds > 20000) {
              _model.timer1Controller.onStopTimer();
              _model.timer1Controller.onResetTimer();

              _model.soundPlayer5 ??= AudioPlayer();
              if (_model.soundPlayer5!.playing) {
                await _model.soundPlayer5!.stop();
              }
              _model.soundPlayer5!.setVolume(1.0);
              _model.soundPlayer5!
                  .setAsset('assets/audios/After_20_seconds.mp3')
                  .then((_) => _model.soundPlayer5!.play());

              await actions.tts(
                widget.country,
                'Happy to help you, I will wait for your next letter',
                widget.speed,
                widget.repCount,
                widget.voicegender!,
              );

              context.pushNamed(
                'Welcome',
                queryParameters: {
                  'country': serializeParam(
                    widget.country,
                    ParamType.String,
                  ),
                  'voicegender': serializeParam(
                    widget.voicegender,
                    ParamType.int,
                  ),
                  'agegroup': serializeParam(
                    widget.agegroup,
                    ParamType.String,
                  ),
                  'repCount': serializeParam(
                    widget.repCount,
                    ParamType.int,
                  ),
                  'speed': serializeParam(
                    widget.speed,
                    ParamType.double,
                  ),
                }.withoutNulls,
              );
            }
          }
        }
      } else {
        if (_model.result == 'Number') {
          _model.digitInfo = await actions.numericAction(
            _model.character!,
            'Letterinfo',
          );
          if (_model.digitInfo == 'No matching sentence found') {
            await actions.tts(
              widget.country,
              'Sorry, the number you created does not exist. Please try again',
              widget.speed,
              widget.repCount,
              widget.voicegender!,
            );

            context.pushNamed(
              'Welcome',
              queryParameters: {
                'country': serializeParam(
                  '',
                  ParamType.String,
                ),
                'voicegender': serializeParam(
                  0,
                  ParamType.int,
                ),
                'agegroup': serializeParam(
                  '',
                  ParamType.String,
                ),
                'repCount': serializeParam(
                  0,
                  ParamType.int,
                ),
                'speed': serializeParam(
                  0.0,
                  ParamType.double,
                ),
              }.withoutNulls,
            );
          } else {
            await actions.tts(
              widget.country,
              _model.digitInfo!,
              widget.speed,
              widget.repCount,
              widget.voicegender!,
            );
            _model.digitIntro = await actions.numericAction(
              _model.character!,
              'Introduction',
            );
            await actions.tts(
              widget.country,
              _model.digitIntro!,
              widget.speed,
              widget.repCount,
              widget.voicegender!,
            );
            await Future.delayed(const Duration(milliseconds: 1000));
            await actions.tts(
              widget.country,
              'If you want to hear a fact about the digit, click the screen within the next ten seconds after this sound',
              widget.speed,
              widget.repCount,
              widget.voicegender!,
            );
            if (animationsMap['timerOnActionTriggerAnimation1'] != null) {
              await animationsMap['timerOnActionTriggerAnimation1']!
                  .controller
                  .forward(from: 0.0);
            }
            _model.soundPlayer6 ??= AudioPlayer();
            if (_model.soundPlayer6!.playing) {
              await _model.soundPlayer6!.stop();
            }
            _model.soundPlayer6!.setVolume(1.0);
            await _model.soundPlayer6!
                .setAsset('assets/audios/Short_story_&_rhyme.mp3')
                .then((_) => _model.soundPlayer6!.play());

            _model.timer1Controller.onStartTimer();
            _model.timer2Controller.onStartTimer();
            await Future.delayed(const Duration(milliseconds: 1000));
            while (_model.timer1Milliseconds < 10000) {
              await actions.tts(
                widget.country,
                (String var1) {
                  return var1[1];
                }(_model.timer2Value),
                widget.speed,
                widget.repCount,
                widget.voicegender!,
              );
            }
            if (_model.timer1Milliseconds > 10000) {
              _model.timer1Controller.onStopTimer();
              _model.timer1Controller.timer
                  .setPresetTime(mSec: 10000, add: false);
              _model.timer1Controller.onResetTimer();

              _model.timer2Controller.onResetTimer();

              await actions.tts(
                widget.country,
                'If you want to hear another fact about  the digit, tap the screen within the next ten seconds after this sound',
                widget.speed,
                widget.repCount,
                widget.voicegender!,
              );
              _model.soundPlayer7 ??= AudioPlayer();
              if (_model.soundPlayer7!.playing) {
                await _model.soundPlayer7!.stop();
              }
              _model.soundPlayer7!.setVolume(1.0);
              await _model.soundPlayer7!
                  .setAsset('assets/audios/chime.mp3')
                  .then((_) => _model.soundPlayer7!.play());

              _model.timer1Controller.onStartTimer();
              _model.timer2Controller.onStartTimer();
              await Future.delayed(const Duration(milliseconds: 1000));
              while (_model.timer1Milliseconds < 20000) {
                await actions.tts(
                  widget.country,
                  (String var1) {
                    return var1[1];
                  }(_model.timer2Value),
                  widget.speed,
                  widget.repCount,
                  widget.voicegender!,
                );
              }
              if (_model.timer1Milliseconds > 20000) {
                _model.timer1Controller.onStopTimer();
                _model.timer1Controller.onResetTimer();

                _model.soundPlayer8 ??= AudioPlayer();
                if (_model.soundPlayer8!.playing) {
                  await _model.soundPlayer8!.stop();
                }
                _model.soundPlayer8!.setVolume(1.0);
                _model.soundPlayer8!
                    .setAsset('assets/audios/After_20_seconds.mp3')
                    .then((_) => _model.soundPlayer8!.play());

                await actions.tts(
                  widget.country,
                  'Happy to help you, I will wait for your next letter',
                  widget.speed,
                  widget.repCount,
                  widget.voicegender!,
                );

                context.pushNamed(
                  'Welcome',
                  queryParameters: {
                    'country': serializeParam(
                      widget.country,
                      ParamType.String,
                    ),
                    'voicegender': serializeParam(
                      widget.voicegender,
                      ParamType.int,
                    ),
                    'agegroup': serializeParam(
                      widget.agegroup,
                      ParamType.String,
                    ),
                    'repCount': serializeParam(
                      widget.repCount,
                      ParamType.int,
                    ),
                    'speed': serializeParam(
                      widget.speed,
                      ParamType.double,
                    ),
                  }.withoutNulls,
                );
              }
            }
          }
        } else {
          await actions.tts(
            widget.country,
            'You have created a special symbol using BraillumeThe symbol you have created is${_model.character}',
            widget.speed,
            widget.repCount,
            widget.voicegender!,
          );

          context.pushNamed(
            'Welcome',
            queryParameters: {
              'country': serializeParam(
                '',
                ParamType.String,
              ),
              'voicegender': serializeParam(
                0,
                ParamType.int,
              ),
              'agegroup': serializeParam(
                '',
                ParamType.String,
              ),
              'repCount': serializeParam(
                0,
                ParamType.int,
              ),
              'speed': serializeParam(
                0.0,
                ParamType.double,
              ),
            }.withoutNulls,
          );
        }
      }
    });

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              if (_model.timer1Milliseconds > 0) {
                if (_model.timer1Milliseconds < 10000) {
                  if (_model.result == 'Letter') {
                    _model.timer1Controller.timer
                        .setPresetTime(mSec: 10000, add: false);
                    _model.timer1Controller.onResetTimer();

                    _model.timer2Controller.onStopTimer();
                    _model.soundPlayer9 ??= AudioPlayer();
                    if (_model.soundPlayer9!.playing) {
                      await _model.soundPlayer9!.stop();
                    }
                    _model.soundPlayer9!.setVolume(1.0);
                    await _model.soundPlayer9!
                        .setAsset('assets/audios/Short_story_&_rhyme.mp3')
                        .then((_) => _model.soundPlayer9!.play());

                    await actions.tts(
                      widget.country,
                      'Good, I will now tell you a short story about the letter you have created',
                      widget.speed,
                      widget.repCount,
                      widget.voicegender!,
                    );
                    _model.shortstory = await actions.retrieveRandomSentence(
                      _model.character!,
                      widget.agegroup!,
                      widget.country,
                      'ShortStory',
                    );
                    await actions.tts(
                      widget.country,
                      _model.shortstory!,
                      widget.speed,
                      widget.repCount,
                      widget.voicegender!,
                    );
                    await Future.delayed(const Duration(milliseconds: 1000));
                    await actions.tts(
                      widget.country,
                      'If you want to hear a rhyme about the letter you have created,tap the screen within the next ten seconds after this sound',
                      widget.speed,
                      widget.repCount,
                      widget.voicegender!,
                    );
                    _model.timer2Controller.onResetTimer();

                    _model.timer1Controller.onStartTimer();
                  } else {
                    _model.timer1Controller.timer
                        .setPresetTime(mSec: 10000, add: false);
                    _model.timer1Controller.onResetTimer();

                    _model.timer2Controller.onStopTimer();
                    _model.soundPlayer10 ??= AudioPlayer();
                    if (_model.soundPlayer10!.playing) {
                      await _model.soundPlayer10!.stop();
                    }
                    _model.soundPlayer10!.setVolume(1.0);
                    await _model.soundPlayer10!
                        .setAsset('assets/audios/Short_story_&_rhyme.mp3')
                        .then((_) => _model.soundPlayer10!.play());

                    await actions.tts(
                      widget.country,
                      'Good, I will now tell you a fact about the number you have created',
                      widget.speed,
                      widget.repCount,
                      widget.voicegender!,
                    );
                    _model.fact1 = await actions.numericAction(
                      _model.character!,
                      'Fact1',
                    );
                    await actions.tts(
                      widget.country,
                      _model.fact1!,
                      widget.speed,
                      widget.repCount,
                      widget.voicegender!,
                    );
                    await Future.delayed(const Duration(milliseconds: 1000));
                    await actions.tts(
                      widget.country,
                      'If you want to hear another fact about the number you have created,tap the screen within the next ten seconds after this sound',
                      widget.speed,
                      widget.repCount,
                      widget.voicegender!,
                    );
                    _model.timer2Controller.onResetTimer();

                    _model.timer1Controller.onStartTimer();
                  }

                  _model.soundPlayer11 ??= AudioPlayer();
                  if (_model.soundPlayer11!.playing) {
                    await _model.soundPlayer11!.stop();
                  }
                  _model.soundPlayer11!.setVolume(1.0);
                  await _model.soundPlayer11!
                      .setAsset('assets/audios/Short_story_&_rhyme.mp3')
                      .then((_) => _model.soundPlayer11!.play());

                  await Future.delayed(const Duration(milliseconds: 1000));
                  _model.timer1Controller.onStartTimer();
                  _model.timer2Controller.onStartTimer();
                  while (_model.timer1Milliseconds < 20000) {
                    await actions.tts(
                      widget.country,
                      (String var1) {
                        return var1[1];
                      }(_model.timer2Value),
                      widget.speed,
                      widget.repCount,
                      widget.voicegender!,
                    );
                  }
                  _model.timer1Controller.onResetTimer();

                  _model.timer2Controller.onResetTimer();

                  await actions.tts(
                    widget.country,
                    'Happy to help you, I will wait for your next query',
                    widget.speed,
                    widget.repCount,
                    widget.voicegender!,
                  );

                  context.pushNamed(
                    'Welcome',
                    queryParameters: {
                      'country': serializeParam(
                        widget.country,
                        ParamType.String,
                      ),
                      'voicegender': serializeParam(
                        widget.voicegender,
                        ParamType.int,
                      ),
                      'agegroup': serializeParam(
                        widget.agegroup,
                        ParamType.String,
                      ),
                      'repCount': serializeParam(
                        widget.repCount,
                        ParamType.int,
                      ),
                      'speed': serializeParam(
                        widget.speed,
                        ParamType.double,
                      ),
                    }.withoutNulls,
                  );
                } else {
                  if (_model.timer1Milliseconds <= 20000) {
                    if (_model.result == 'Letter') {
                      _model.timer1Controller.timer
                          .setPresetTime(mSec: 20000, add: false);
                      _model.timer1Controller.onResetTimer();

                      _model.timer2Controller.onStopTimer();
                      _model.soundPlayer12 ??= AudioPlayer();
                      if (_model.soundPlayer12!.playing) {
                        await _model.soundPlayer12!.stop();
                      }
                      _model.soundPlayer12!.setVolume(1.0);
                      await _model.soundPlayer12!
                          .setAsset('assets/audios/Short_story_&_rhyme.mp3')
                          .then((_) => _model.soundPlayer12!.play());

                      await actions.tts(
                        widget.country,
                        'Good, I will now tell you a rhyme about the letter you have created',
                        widget.speed,
                        widget.repCount,
                        widget.voicegender!,
                      );
                      _model.rhyme = await actions.retrieveRandomSentence(
                        _model.character!,
                        widget.agegroup!,
                        widget.country,
                        'Rhyme',
                      );
                      await actions.tts(
                        widget.country,
                        _model.rhyme!,
                        widget.speed,
                        widget.repCount,
                        widget.voicegender!,
                      );
                      _model.timer2Controller.onResetTimer();

                      _model.timer1Controller.onStartTimer();
                    } else {
                      _model.timer1Controller.timer
                          .setPresetTime(mSec: 20000, add: false);
                      _model.timer1Controller.onResetTimer();

                      _model.timer2Controller.onStopTimer();
                      _model.soundPlayer13 ??= AudioPlayer();
                      if (_model.soundPlayer13!.playing) {
                        await _model.soundPlayer13!.stop();
                      }
                      _model.soundPlayer13!.setVolume(1.0);
                      await _model.soundPlayer13!
                          .setAsset('assets/audios/Short_story_&_rhyme.mp3')
                          .then((_) => _model.soundPlayer13!.play());

                      await actions.tts(
                        widget.country,
                        'Good, I will now tell you another fact about the number you have created',
                        widget.speed,
                        widget.repCount,
                        widget.voicegender!,
                      );
                      _model.fact2 = await actions.numericAction(
                        _model.character!,
                        'Fact2',
                      );
                      await actions.tts(
                        widget.country,
                        _model.fact2!,
                        widget.speed,
                        widget.repCount,
                        widget.voicegender!,
                      );
                      _model.timer2Controller.onResetTimer();

                      _model.timer1Controller.onStartTimer();
                    }

                    await actions.tts(
                      widget.country,
                      'Happy to help you, I will wait for your next query',
                      widget.speed,
                      widget.repCount,
                      widget.voicegender!,
                    );

                    context.pushNamed(
                      'Welcome',
                      queryParameters: {
                        'country': serializeParam(
                          widget.country,
                          ParamType.String,
                        ),
                        'voicegender': serializeParam(
                          widget.voicegender,
                          ParamType.int,
                        ),
                        'agegroup': serializeParam(
                          widget.agegroup,
                          ParamType.String,
                        ),
                        'repCount': serializeParam(
                          widget.repCount,
                          ParamType.int,
                        ),
                        'speed': serializeParam(
                          widget.speed,
                          ParamType.double,
                        ),
                      }.withoutNulls,
                    );
                  }
                }
              }

              setState(() {});
            },
            child: RefreshIndicator(
              onRefresh: () async {
                context.pushNamed(
                  'Welcome',
                  queryParameters: {
                    'country': serializeParam(
                      widget.country,
                      ParamType.String,
                    ),
                    'voicegender': serializeParam(
                      widget.voicegender,
                      ParamType.int,
                    ),
                    'agegroup': serializeParam(
                      widget.agegroup,
                      ParamType.String,
                    ),
                    'repCount': serializeParam(
                      widget.repCount,
                      ParamType.int,
                    ),
                    'speed': serializeParam(
                      widget.speed,
                      ParamType.double,
                    ),
                  }.withoutNulls,
                );
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 472.0,
                      height: 880.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFF1EFE7),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.00, -1.00),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.00, -1.00),
                                  child: Container(
                                    width: 57.0,
                                    height: 56.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF1EFE7),
                                    ),
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(-1.00, -1.00),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 8.0, 8.0, 8.0),
                                        child: FlutterFlowIconButton(
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          borderRadius: 20.0,
                                          borderWidth: 1.0,
                                          buttonSize: 40.0,
                                          fillColor: Colors.black,
                                          icon: Icon(
                                            Icons.person_2,
                                            color: Color(0xFFF1EFE7),
                                            size: 22.0,
                                          ),
                                          onPressed: () async {
                                            context.pushNamed('setup');
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.00, -1.00),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Welcome, ',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            fontSize: 24.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.00, 0.00),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 30.0, 0.0, 0.0),
                                    child: Text(
                                      'The text you have entered is ${_model.character}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: Colors.black,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ).animateOnActionTrigger(
                                      animationsMap[
                                          'textOnActionTriggerAnimation']!,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 40.0, 0.0, 0.0),
                                  child: FlutterFlowTimer(
                                    initialTime: _model.timer1Milliseconds,
                                    getDisplayTime: (value) =>
                                        StopWatchTimer.getDisplayTime(
                                      value,
                                      hours: false,
                                      minute: false,
                                      milliSecond: false,
                                    ),
                                    controller: _model.timer1Controller,
                                    updateStateInterval:
                                        Duration(milliseconds: 1000),
                                    onChanged:
                                        (value, displayTime, shouldUpdate) {
                                      _model.timer1Milliseconds = value;
                                      _model.timer1Value = displayTime;
                                      if (shouldUpdate) setState(() {});
                                    },
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall,
                                  ).animateOnActionTrigger(
                                    animationsMap[
                                        'timerOnActionTriggerAnimation1']!,
                                  ),
                                ),
                                Opacity(
                                  opacity: 0.0,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 40.0, 0.0, 0.0),
                                    child: FlutterFlowTimer(
                                      initialTime: _model.timer2Milliseconds,
                                      getDisplayTime: (value) =>
                                          StopWatchTimer.getDisplayTime(
                                        value,
                                        hours: false,
                                        minute: false,
                                        milliSecond: false,
                                      ),
                                      controller: _model.timer2Controller,
                                      updateStateInterval:
                                          Duration(milliseconds: 1000),
                                      onChanged:
                                          (value, displayTime, shouldUpdate) {
                                        _model.timer2Milliseconds = value;
                                        _model.timer2Value = displayTime;
                                        if (shouldUpdate) setState(() {});
                                      },
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall,
                                    ).animateOnActionTrigger(
                                      animationsMap[
                                          'timerOnActionTriggerAnimation2']!,
                                    ),
                                  ),
                                ),
                              ],
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
        ),
      ),
    );
  }
}
