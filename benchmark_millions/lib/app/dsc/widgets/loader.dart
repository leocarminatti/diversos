import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class LoadingOverlay {
  BuildContext _context;

  void hide() {
    if (Navigator.of(_context).canPop()) Navigator.of(_context).pop();
  }

  show() {
    return showDialog(
      barrierColor: Colors.white,
      context: _context,
      barrierDismissible: false,
      builder: (context) {
        return _FullScreenLoader();
      },
    );
  }

  Future<T> during<T>(Future<T> future) {
    show();
    return future.whenComplete(() => hide());
  }

  LoadingOverlay._create(this._context);

  factory LoadingOverlay.of(BuildContext context) {
    return LoadingOverlay._create(context);
  }
}

class _FullScreenLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Material(
        type: MaterialType.transparency,
        child: Container(
          color: Color(0xFFFAF2E3),
          child: const RiveAnimation.asset('assets/animation/simple-loader.riv'),
        ),
      ),
    );
  }
}
