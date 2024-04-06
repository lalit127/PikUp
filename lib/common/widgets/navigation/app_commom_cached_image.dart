import 'package:pikup_app/common/common_import.dart';

class AppCommonCachedImage extends StatelessWidget {
  const AppCommonCachedImage({Key? key, required this.imageUrl})
      : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
      progressIndicatorBuilder: (context, url, downloadProgress) => Padding(
        padding: EdgeInsets.all(AppSizes.mp_w_2),
        child: CircularProgressIndicator(
          value: downloadProgress.progress,
          color: AppColors.whiteOff,
          strokeWidth: 1.0,
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
