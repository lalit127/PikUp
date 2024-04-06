import 'package:pikup_app/common/common_import.dart';
import 'package:pikup_app/common/widgets/app_toasts.dart';

class SwipeButton extends StatefulWidget {
  @override
  _SwipeButtonState createState() => _SwipeButtonState();
}

class _SwipeButtonState extends State<SwipeButton> {
  double offsetX = 0.0;
  bool swiped = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.mp_w_3),
      child: GestureDetector(
        onHorizontalDragUpdate: (details) {
          setState(() {
            if (!swiped) {
              offsetX += details.delta.dx;
              offsetX = offsetX.clamp(0.0, 55.w); // Limit the swipe width
            }
          });
        },
        onHorizontalDragEnd: (details) {
          if (offsetX > 100.0 && !swiped) {
            // Handle the "Finish" action here
            swiped = true;
            AppToasts.showSuccess("Finish");
          }
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Card(
              color: AppColors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSizes.radius_12),
              ),
              child: Container(
                width: 100.w,
                height: 7.h,
                child: Center(
                  child: Text("Get off",
                      style: AppTextStyles(context)
                          .captionBold
                          .copyWith(color: AppColors.whiteOff)),
                ),
              ),
            ),
            Positioned(
              left: offsetX,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 1.h,
                ),
                child: Container(
                  width: 6.h,
                  height: 6.h,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: RotatedBox(
                            quarterTurns: 90,
                            child: SvgPicture.asset(Assets.icons.alarmsvg)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: Duration(seconds: 2),
    ));
  }
}
