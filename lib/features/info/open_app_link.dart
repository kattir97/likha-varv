import 'package:url_launcher/url_launcher.dart';

void openAppLikn({required String url}) async {
  final appUri = Uri.parse(url);

  if (await canLaunchUrl(appUri)) {
    await launchUrl(appUri);
  } else {
    throw 'Could not launch $appUri';
  }
}
