import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class HorizontalStepper extends StatelessWidget {
  HorizontalStepper({
    required int curStep,
    required List<String> titles,
    required double width,
    required Color color,
    required bool showTitle,
    super.key,
  })  : _titles = titles,
        _curStep = curStep,
        _width = width,
        _activeColor = color,
        _showTitle = showTitle,
        assert(width > 0);

  final double _width;
  final List<String> _titles;
  final int _curStep;
  final Color _activeColor;
  final Color _inactiveColor = HexColor("#E6EEF3");
  final double lineWidth = 3.0;
  final bool _showTitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: _width,
        child: Column(
          children: <Widget>[
            Row(
              children: _iconViews(),
            ),
            if (_showTitle) ...[
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: _titleViews(),
              ),
            ]
          ],
        ));
  }

  List<Widget> _iconViews() {
    var list = <Widget>[];
    _titles.asMap().forEach((i, icon) {
      var circleColor =
          (i == 0 || _curStep > i + 1) ? _activeColor : _inactiveColor;
      var lineColor = _curStep > i + 1 ? _activeColor : _inactiveColor;
      var iconColor =
          (i == 0 || _curStep > i + 1) ? _activeColor : _inactiveColor;

      list.add(
        Container(
          width: 20.0,
          height: 20.0,
          padding: const EdgeInsets.all(0),
          decoration: BoxDecoration(
            /* color: circleColor,*/
            borderRadius: const BorderRadius.all(Radius.circular(22.0)),
            border: Border.all(
              color: circleColor,
              width: 2.0,
            ),
          ),
          child: Icon(
            Icons.circle,
            color: iconColor,
            size: 12.0,
          ),
        ),
      );

      //line between icons
      if (i != _titles.length - 1) {
        list.add(Expanded(
            child: Container(
          height: lineWidth,
          color: lineColor,
        )));
      }
    });

    return list;
  }

  List<Widget> _titleViews() {
    var list = <Widget>[];
    _titles.asMap().forEach((i, text) {
      list.add(Text(text, style: TextStyle(color: HexColor("#000000"))));
    });
    return list;
  }
}
