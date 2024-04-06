// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:pikup_app/common/common_import.dart';
import 'package:sizer/sizer.dart';

import '../app_icon_button.dart';

class CustomSliderButton extends StatefulWidget {
  final VoidCallback onPressed;
  final Alignment alignLabel;
  final String? label;
  final String? icon;
  final double width;
  final double radius;
  final double buttonSize;
  final bool dismissible;
  final Color buttonColor;
  final Color backgroundColor;
  final Color highlightedColor;
  final Color baseColor;

  const CustomSliderButton({
    super.key,
    required this.onPressed,
    this.alignLabel = Alignment.center,
    this.label,
    this.icon,
    this.width = 100,
    this.radius = 30.0,
    this.buttonSize = 60.0,
    this.dismissible = true,
    this.buttonColor = Colors.white,
    this.backgroundColor = Colors.blue,
    this.highlightedColor = Colors.green,
    this.baseColor = Colors.grey,
  });

  @override
  _SliderButtonState createState() => _SliderButtonState();
}

class _SliderButtonState extends State<CustomSliderButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool _isButtonDragged = false;
  bool _isButtonPressed = false;
  double _buttonPosition = 0.0;
  Color _backgroundColor = Colors.black;
  String _icon = Assets.icons.alarmsvg;
  String _label = "Get on";

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleDragStart(DragStartDetails details) {
    setState(() {
      _isButtonDragged = true;
    });
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    if (_isButtonDragged) {
      setState(() {
        _buttonPosition += details.delta.dx;
      });
    }
  }

  void _handleDragEnd(DragEndDetails details) {
    setState(() {
      _isButtonDragged = false;
    });

    if (_buttonPosition >= (widget.width - widget.buttonSize)) {
      if (_label == 'Get Off') {
        Future.delayed(Duration(seconds: 1), () {
          setState(() {
            _buttonPosition = 0;
            _isButtonPressed = false;
            _backgroundColor = Colors.black;
            _icon = Assets.icons.alarmsvg;
            _label = "Get on";
          });
        });

        setState(() {
          _buttonPosition = widget.width -
              widget
                  .buttonSize; // Subtract a small value to adjust the position
          _isButtonPressed = true;
          _backgroundColor = AppColors.primary;
          _icon = Assets.icons.alarmsvg;
          _label = "Got Off";
        });
      } else if (_label == 'Get on') {
        Future.delayed(Duration(seconds: 1), () {
          setState(() {
            _buttonPosition = 0;
            _isButtonPressed = false;
            _backgroundColor = Colors.black;
            _icon = Assets.icons.alarmsvg;
            _label = "Get Off";
          });
        });

        setState(() {
          _buttonPosition = widget.width -
              widget
                  .buttonSize; // Subtract a small value to adjust the position
          _isButtonPressed = true;
          _backgroundColor = AppColors.primary;
          _icon = Assets.icons.alarmsvg;
          _label = "Got on";
        });
      } else if (_label == 'Got Off') {
        Future.delayed(Duration(seconds: 2), () {
          setState(() {
            _buttonPosition = 0;
            _isButtonPressed = false;
            _backgroundColor = Colors.black;
            _icon = Assets.icons.alarmsvg;
            _label = "Get Off";
          });
        });

        setState(() {
          _buttonPosition = widget.width -
              widget
                  .buttonSize; // Subtract a small value to adjust the position
          _isButtonPressed = true;
          _backgroundColor = AppColors.primary;
          _icon = Assets.icons.alarmsvg;
          _label = "Get on";
        });
      }

      widget.onPressed();
    } else {
      setState(() {
        _buttonPosition = 0;
        _isButtonPressed = false;
        _backgroundColor = Colors.black;
        _icon = Assets.icons.alarmsvg;
        _label = "Get on";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double buttonLeftPosition =
        _buttonPosition.clamp(0, widget.width - widget.buttonSize - 2);
    return GestureDetector(
      onHorizontalDragStart: _handleDragStart,
      onHorizontalDragUpdate: _handleDragUpdate,
      onHorizontalDragEnd: _handleDragEnd,
      child: Container(
        width: widget.width,
        height: 60,
        decoration: BoxDecoration(
          color: _backgroundColor,
          borderRadius: BorderRadius.circular(widget.radius),
        ),
        child: Stack(
          children: [
            Positioned(
              left: buttonLeftPosition,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    height: 10.w,
                    width: 10.w,
                    decoration: BoxDecoration(
                      color: _isButtonPressed
                          ? widget.highlightedColor
                          : widget.buttonColor,
                      borderRadius: BorderRadius.circular(widget.radius),
                    ),
                    child: AppSvgButton(
                      imagePath: _icon,
                      onPressed: () {},
                      iconColor:
                          _isButtonPressed ? widget.baseColor : Colors.black,
                      size: AppSizes.icon_size_6,
                    )),
              ),
            ),
            Align(
              alignment: widget.alignLabel,
              child: Text(_label,
                  style: AppTextStyles(context)
                      .bodySmallBold
                      .copyWith(color: AppColors.whiteOff)),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSliderButtonforOrder extends StatefulWidget {
  final VoidCallback onPressed;
  final Alignment alignLabel;
  final String? label;
  final String? icon;
  final double width;
  final double radius;
  final double buttonSize;
  final bool dismissible;
  final Color buttonColor;
  final Color backgroundColor;
  final Color highlightedColor;
  final Color baseColor;
  final Function updateMarkersCallback;
  final GetxController controller;

  const CustomSliderButtonforOrder({
    super.key,
    required this.onPressed,
    required this.controller,
    required this.updateMarkersCallback,
    this.alignLabel = Alignment.center,
    this.label,
    this.icon,
    this.width = 200.0,
    this.radius = 30.0,
    this.buttonSize = 60.0,
    this.dismissible = true,
    this.buttonColor = Colors.white,
    this.backgroundColor = Colors.blue,
    this.highlightedColor = Colors.green,
    this.baseColor = Colors.grey,
  });

  @override
  _SliderButtonStateforOrder createState() => _SliderButtonStateforOrder();
}

class _SliderButtonStateforOrder extends State<CustomSliderButtonforOrder>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool _isButtonDragged = false;
  bool _isButtonPressed = false;
  double _buttonPosition = 0.0;
  Color _backgroundColor = Colors.black;
  BoxDecoration _backgroundDecoration = BoxDecoration();
  String _icon = Assets.icons.alarmsvg;
  String _label = "Slide to Accept";
  double _textOpacity = 1.0;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      animationBehavior: AnimationBehavior.preserve,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleDragStart(DragStartDetails details) {
    setState(() {
      _isButtonDragged = true;
    });
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    if (_isButtonDragged) {
      setState(() {
        _buttonPosition += details.delta.dx;

        // Modify the background color and decoration based on the button position
        if (_buttonPosition >= widget.width - widget.buttonSize) {
          _backgroundColor = widget.highlightedColor;
          _backgroundDecoration = BoxDecoration(
            color: _backgroundColor,
            borderRadius: BorderRadius.circular(widget.radius),
          );
          _textOpacity = 1.0;
        } else {
          _backgroundColor = Colors.black; // Reset color to black
          _backgroundDecoration = BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.primary,
                AppColors.primary,
                Colors.black,
                Colors.black,
              ],
              stops: [
                0.0,
                (_buttonPosition - widget.buttonSize + 50) /
                    widget.width, // Adjust this value
                (_buttonPosition + 60) / widget.width, // Adjust this value
                (widget.width - _buttonPosition) / widget.width + 100,
              ],
              begin: Alignment
                  .centerLeft, // Change the gradient direction to the left
              end: Alignment
                  .centerRight, // Change the gradient direction to the left
            ),
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(widget.radius),
          );
          _textOpacity = 0.0;
        }
      });
    }
  }

  void _handleDragEnd(DragEndDetails details) {
    // widget.controller.isorderAccepted(true);
    widget.updateMarkersCallback();
    setState(() {
      _textOpacity = 1.0;
      _isButtonDragged = false;
    });

    if (_buttonPosition >= widget.width - widget.buttonSize) {
      print("Slide to Accept");
      if (_label == 'Slide to Accept') {
        _buttonPosition = 0;
        setState(() {
          _buttonPosition = widget.width -
              widget.buttonSize -
              8; // Subtract a small value to adjust the position
          _isButtonPressed = true;
          _backgroundColor = AppColors.primary;
          _icon = Assets.icons.alarmsvg;
          _label = "Accepted";
        });

        Future.delayed(Duration(seconds: 3), () {
          setState(() {
            _buttonPosition = 0;
            _isButtonPressed = false;
            _backgroundColor = Colors.black;
            _icon = Assets.icons.alarmsvg;
            _label = "Start Delivering";
          });
        });
      } else if (_label == "Start Delivering") {
        print("Start Delivering");
        setState(() {
          _buttonPosition = widget.width -
              widget.buttonSize -
              8; // Subtract a small value to adjust the position
          _isButtonPressed = true;
          _backgroundColor = AppColors.primary;
          _icon = Assets.icons.alarmsvg;
          _label = "Delivery Started";
        });
      } else if (_label == "Accepted") {
        setState(() {
          _buttonPosition = widget.width -
              widget.buttonSize -
              8; // Subtract a small value to adjust the position
          _isButtonPressed = true;
          _backgroundColor = AppColors.primary;
          _icon = Assets.icons.alarmsvg;
          _label = "Accepted";
        });
      } else if (_label == "Delivery Started") {
        setState(() {
          _buttonPosition = widget.width -
              widget.buttonSize -
              8; // Subtract a small value to adjust the position
          _isButtonPressed = true;
          _backgroundColor = AppColors.primary;
          _icon = Assets.icons.alarmsvg;
          _label = "Delivery Started";
        });
      }
      //  widget.controller.isorderStarted(true); // Add this line to indicate order started
      widget.onPressed();
    } else {
      setState(() {
        //  widget.controller.isorderAccepted(true);
        _backgroundDecoration = BoxDecoration(
          color: _backgroundColor,
          borderRadius: BorderRadius.circular(widget.radius),
        );
        _buttonPosition = 0;
        _isButtonPressed = false;
        _backgroundColor = Colors.black;
        _icon = Assets.icons.alarmsvg;
        _label = "Slide to Accept";
        _isButtonDragged = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double buttonLeftPosition =
        _buttonPosition.clamp(0, widget.width - widget.buttonSize);
    print(buttonLeftPosition);
    return GestureDetector(
      onHorizontalDragStart: _handleDragStart,
      onHorizontalDragUpdate: _handleDragUpdate,
      onHorizontalDragEnd: _handleDragEnd,
      child: Container(
        width: widget.width,
        height: 7.h,
        decoration: BoxDecoration(
            color: _backgroundColor,
            borderRadius: BorderRadius.circular(widget.radius),
            gradient: _backgroundDecoration.gradient),
        child: Stack(
          children: [
            Positioned(
              left: buttonLeftPosition,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    height: 10.w,
                    width: 10.w,
                    decoration: BoxDecoration(
                      color: _isButtonPressed
                          ? widget.highlightedColor
                          : widget.buttonColor,
                      borderRadius: BorderRadius.circular(widget.radius),
                    ),
                    child: AppSvgButton(
                      imagePath: _icon,
                      onPressed: () {},
                      iconColor:
                          _isButtonPressed ? widget.baseColor : Colors.black,
                      size: AppSizes.icon_size_4,
                    )),
              ),
            ),
            Align(
              alignment: widget.alignLabel,
              child: Opacity(
                opacity: _textOpacity,
                child: Text(
                  _label,
                  style: AppTextStyles(context)
                      .bodySmallBold
                      .copyWith(color: AppColors.whiteOff),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSliderButtonPickUp extends StatefulWidget {
  final VoidCallback onPressed;
  final Alignment alignLabel;
  final String? label;
  final String? icon;
  final double width;
  final double radius;
  final double buttonSize;
  final bool dismissible;
  final Color buttonColor;
  final Color backgroundColor;
  final Color highlightedColor;
  final Color baseColor;

  const CustomSliderButtonPickUp({
    super.key,
    required this.onPressed,
    this.alignLabel = Alignment.center,
    this.label,
    this.icon,
    this.width = 200.0,
    this.radius = 30.0,
    this.buttonSize = 60.0,
    this.dismissible = true,
    this.buttonColor = Colors.white,
    this.backgroundColor = Colors.blue,
    this.highlightedColor = Colors.green,
    this.baseColor = Colors.grey,
  });

  @override
  _SliderButtonStates createState() => _SliderButtonStates();
}

class _SliderButtonStates extends State<CustomSliderButtonPickUp>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool _isButtonDragged = false;
  bool _isButtonPressed = false;
  double _buttonPosition = 0.0;
  Color _backgroundColor = Colors.black;
  String _icon = Assets.icons.alarmsvg;
  String _label = "Pickup completed";

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleDragStart(DragStartDetails details) {
    setState(() {
      _isButtonDragged = true;
    });
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    if (_isButtonDragged) {
      setState(() {
        _buttonPosition += details.delta.dx;
      });
    }
  }

  void _handleDragEnd(DragEndDetails details) {
    setState(() {
      _isButtonDragged = false;
    });

    if (_buttonPosition >= widget.width - widget.buttonSize) {
      if (_label == 'Picked up') {
        Future.delayed(Duration(seconds: 1), () {
          setState(() {
            _buttonPosition = 0;
            _isButtonPressed = false;
            _backgroundColor = Colors.black;
            _icon = Assets.icons.alarmsvg;
            _label = "Pickup completed";
          });
        });

        setState(() {
          _buttonPosition = widget.width -
              widget.buttonSize -
              12; // Subtract a small value to adjust the position
          _isButtonPressed = true;
          _backgroundColor = AppColors.primary;
          _icon = Assets.icons.alarmsvg;
          _label = "Picked up";
        });
      } else if (_label == 'Pickup completed') {
        Future.delayed(Duration(seconds: 1), () {
          setState(() {
            _buttonPosition = 0;
            _isButtonPressed = false;
            _backgroundColor = Colors.black;
            _icon = Assets.icons.alarmsvg;
            _label = "Picked up";
          });
        });

        setState(() {
          _buttonPosition = widget.width -
              widget.buttonSize -
              12; // Subtract a small value to adjust the position
          _isButtonPressed = true;
          _backgroundColor = AppColors.primary;
          _icon = Assets.icons.alarmsvg;
          _label = "Pickup completed";
        });
      }

      widget.onPressed();
    } else {
      setState(() {
        _buttonPosition = 0;
        _isButtonPressed = false;
        _backgroundColor = Colors.black;
        _icon = Assets.icons.alarmsvg;
        _label = "Pickup completed";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: _handleDragStart,
      onHorizontalDragUpdate: _handleDragUpdate,
      onHorizontalDragEnd: _handleDragEnd,
      child: Container(
        width: widget.width,
        height: 7.h,
        decoration: BoxDecoration(
          color: _backgroundColor,
          borderRadius: BorderRadius.circular(widget.radius),
        ),
        child: Stack(
          children: [
            Positioned(
              left: _buttonPosition,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    height: 10.w,
                    width: 10.w,
                    decoration: BoxDecoration(
                      color: _isButtonPressed
                          ? widget.highlightedColor
                          : widget.buttonColor,
                      borderRadius: BorderRadius.circular(widget.radius),
                    ),
                    child: AppSvgButton(
                      imagePath: _icon,
                      onPressed: () {},
                      iconColor:
                          _isButtonPressed ? widget.baseColor : Colors.black,
                      size: AppSizes.icon_size_4,
                    )),
              ),
            ),
            Align(
              alignment: widget.alignLabel,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(_label,
                    style: AppTextStyles(context)
                        .bodyLargeBold
                        .copyWith(color: AppColors.whiteOff)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
