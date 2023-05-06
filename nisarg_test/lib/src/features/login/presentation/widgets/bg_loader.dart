import 'package:flutter/material.dart';
import 'package:nisarg_test/src/core/extensions/context_extension.dart';
import 'package:nisarg_test/src/core/theme/dimensions.dart';

///bg loader
class BgLoader extends StatelessWidget {
  ///init
  const BgLoader({
    required this.widget,
    required this.isLoading,
    this.color = Colors.white,
    Key? key,
  }) : super(
          key: key,
        );

  ///widget
  final Widget widget;

  ///isLoading
  final bool isLoading;

  ///color of loading
  final Color color;

  @override
  Widget build(BuildContext context) {
    if (!isLoading) {
      return widget;
    } else {
      return IgnorePointer(
        ignoring: isLoading,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned.fill(
                child: Container(
              foregroundDecoration:
                  BoxDecoration(color: Colors.black.withOpacity(0.4)),
              child: widget,
            )),
            Center(
              child: Container(
                width: 2 * Dimensions.xxl4,
                height: 2 * Dimensions.xxl4,
                decoration: BoxDecoration(
                  color: context.colorScheme.background,
                  borderRadius: BorderRadius.circular(
                    Dimensions.xs,
                  ),
                ),
                child: Center(
                  child: SizedBox(
                    width: Dimensions.xxl4,
                    height: Dimensions.xxl4,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        context.colorScheme.primary,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
