import 'package:getx_distil/get.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutController extends GetxController {
  Future<void> launchUrlString(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }
}
