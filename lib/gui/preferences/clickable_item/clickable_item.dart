import 'package:flutter/material.dart';

class ClickablePreferenceItem extends StatelessWidget {
  const ClickablePreferenceItem({
    Key? key,
    this.leading = const SizedBox.shrink(),
    this.tail = const SizedBox.shrink(),
    this.onClick,
  }) : super(key: key);

  final Widget leading;
  final Widget tail;
  final Function? onClick;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          onClick?.call();
        },
        child: Container(
          height: 54,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                leading,
                tail,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
