import 'package:flutter/material.dart';
import 'constants/text_style.dart';
import 'data/animated_bottom_nav_bar_item.dart';
import 'widgets/custom_paint.dart';

class TopNotchBottomBar extends StatefulWidget {
  final List<TopNotchItem> items;
  final bool? showLabel;
  final double? height;
  final double? iconSize;
  final Color? activeColor;
  final Color? inActiveColor;
  final int? initialIndex;
  final ValueChanged<int> onTap;
  final bool? showElevation;
  final Color? backgroundColor;
  final Duration? animationDuration;

  const TopNotchBottomBar({
    Key? key,
    required this.items,
    required this.onTap,
    this.initialIndex = 0,
    this.height = 50,
    this.animationDuration = const Duration(milliseconds: 400),
    this.iconSize,
    this.backgroundColor = Colors.white,
    this.showElevation = true,
    this.activeColor = const Color.fromARGB(255, 39, 153, 247),
    this.inActiveColor = const Color.fromARGB(255, 150, 150, 150),
    this.showLabel = true,
  }) : super(key: key);

  @override
  State<TopNotchBottomBar> createState() => _TopNotchBottomBarState();
}

class _TopNotchBottomBarState extends State<TopNotchBottomBar> {
  int? index = 0;

  @override
  void initState() {
    super.initState();
    index = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: widget.height,
      duration: widget.animationDuration!,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        boxShadow: [
          if (widget.showElevation!)
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(index == 0 ? 0.0 : 20.0),
          topRight:
              Radius.circular(index == widget.items.length - 1 ? 0.0 : 20.0),
        ),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        for (int i = 0; i < widget.items.length; i++)
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() => index = i);
                widget.onTap(index!);
              },
              child: iconBtn(i),
            ),
          ),
      ]),
    );
  }

  Container iconBtn(int i) {
    bool isActive = index == i;
    var height = isActive ? 10.0 : 0.0;
    var width = isActive ? 60.0 : 0.0;
    return Container(
      color: Colors.transparent,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: AnimatedContainer(
              height: height,
              width: width,
              duration: widget.animationDuration!,
              curve: Curves.easeIn,
              child: isActive
                  ? CustomPaint(
                      painter: ButtonNotch(activeColor: widget.activeColor!),
                    )
                  : const SizedBox(),
            ),
          ),
          Positioned.fill(
              child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  widget.items[i].icon.icon,
                  color: isActive
                      ? widget.activeColor
                      : widget.items[i].color ?? widget.inActiveColor,
                  size: widget.iconSize,
                ),
                if (widget.showLabel!)
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: AnimatedDefaultTextStyle(
                      duration: widget.animationDuration!,
                      style: isActive
                          ? textStyle.copyWith(color: widget.activeColor)
                          : textStyle.copyWith(
                              color: widget.items[i].color ??
                                  widget.inActiveColor),
                      child: Text(
                        widget.items[i].name,
                      ),
                    ),
                  ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
