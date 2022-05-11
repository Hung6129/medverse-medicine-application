import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import '/widgets/awesome_dialog.dart';

class FlareHeader extends StatelessWidget {
  const FlareHeader({
    Key key,
    this.dialogType,
    this.loop,
  }) : super(key: key);

  final DialogType dialogType;
  final bool loop;

  @override
  Widget build(BuildContext context) {
    switch (dialogType) {
      case DialogType.INFO:
        return FlareActor(
          'packages/awesome_dialog/assets/flare/info2.flr',
          fit: BoxFit.cover,
          animation: loop ? 'appear_loop' : 'appear',
          callback: (String call) {},
        );
      case DialogType.INFO_REVERSED:
        return FlareActor(
          loop
              ? 'packages/awesome_dialog/assets/flare/info.flr'
              : 'packages/awesome_dialog/assets/flare/info_without_loop.flr',
          fit: BoxFit.cover,
          animation: 'appear',
        );
      case DialogType.QUESTION:
        return FlareActor(
          'packages/awesome_dialog/assets/flare/question.flr',
          fit: BoxFit.cover,
          animation: loop ? 'anim_loop' : 'anim',
          callback: (String call) {},
        );
      case DialogType.WARNING:
        return FlareActor(
          loop
              ? 'assets/flare/warning.flr'
              : 'assets/flare/warning_without_loop.flr',
          fit: BoxFit.cover,
          animation: 'appear',
        );
      case DialogType.ERROR:
        return FlareActor(
          'assets/flare/error.flr',
          fit: BoxFit.fill,
          animation: loop ? 'Error' : 'Error_no_loop',
        );
      case DialogType.SUCCES:
        return FlareActor(
          loop
              ? 'packages/awesome_dialog/assets/flare/succes.flr'
              : 'packages/awesome_dialog/assets/flare/succes_without_loop.flr',
          fit: BoxFit.fill,
          animation: 'Untitled',
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
