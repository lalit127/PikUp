import 'package:flutter/material.dart';

class CustomBottomSheet extends StatefulWidget {
  @override
  _CustomBottomSheetState createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  double _headerHeight = 200; // set the initial header height
// set the minimum header height
  double _maxHeaderHeight = 300; // set the maximum header height
  double _contentHeight = 500; // set the content height
  double _borderRadius = 20; // set the border radius
  double _position = 0; // set the initial position of the bottom sheet

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: _position,
      left: 0,
      right: 0,
      child: GestureDetector(
        onVerticalDragUpdate: (details) {
          setState(() {
            // update the position of the bottom sheet based on the drag gesture
            _position -= details.delta.dy;
            // limit the position to the minimum and maximum values
            _position = _position.clamp(-_maxHeaderHeight, 0.0);
            // update the header height based on the position
            _headerHeight = _maxHeaderHeight + _position;
          });
        },
        child: Container(
          height: _headerHeight + _contentHeight,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(_borderRadius),
              topRight: Radius.circular(_borderRadius),
            ),
          ),
          child: Expanded(
            child: Column(
              children: [
                Container(
                  height: _headerHeight,
                  child: Center(
                    child: Text('Header'),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 50, // set the number of items in the list
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text('Item $index'),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
