import 'package:url_launcher/url_launcher_string.dart';

Future<void> launchUrl({
  required String url,
}) async {
  if (await canLaunchUrlString(url)) {
    launchUrlString(url);
  }
}
