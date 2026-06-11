import 'package:flutter/material.dart';
import 'package:getx_distil/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/app_theme.dart';
import '../core/widgets/nav_bar.dart';
import '../core/widgets/glass_card.dart';
import '../core/widgets/app_drawer.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  static void _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 800;

    return Scaffold(
      backgroundColor: AppTheme.bg,
      endDrawer: isMobile ? const AppDrawer() : null,
      appBar: const NavBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                width: 900.0,
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Developer Avatar
                    Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppTheme.googleBlue.withOpacity(0.15),
                            blurRadius: 20.0,
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/image/mypicture.png',
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.high,
                          errorBuilder: (context, error, stackTrace) {
                            debugPrint('Image load error: $error');
                            return Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: AppTheme.primaryGradient,
                              ),
                              child: const Icon(
                                Icons.person_rounded,
                                size: 50.0,
                                color: Colors.white,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 24.0),

                    // Name
                    Text(
                      'about.name'.tr,
                      style: const TextStyle(
                        fontFamily: 'Google Sans Flex',
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.textPrimary,
                        letterSpacing: -1.0,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'about.role'.tr,
                      style: const TextStyle(
                        fontFamily: 'Google Sans Flex',
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                        color: AppTheme.googleBlue,
                      ),
                    ),
                    const SizedBox(height: 32.0),

                    // Profile summary Card
                    GlassCard(
                      glowColor: AppTheme.googleBlue,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'about.section_title'.tr,
                            style: const TextStyle(
                              fontFamily: 'Google Sans Flex',
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                              color: AppTheme.googleBlue,
                              letterSpacing: 2.0,
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          Text(
                            'about.intro_1'.tr,
                            style: const TextStyle(
                              color: AppTheme.textSecondary,
                              fontSize: 14.5,
                              height: 1.6,
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          Text(
                            'about.intro_2'.tr,
                            style: const TextStyle(
                              color: AppTheme.textSecondary,
                              fontSize: 14.5,
                              height: 1.6,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24.0),

                    // Contributions & Links
                    isMobile
                        ? Column(
                            children: [
                              _buildGitHubCard(),
                              const SizedBox(height: 16.0),
                              _buildPubDevCard(),
                            ],
                          )
                        : Row(
                            children: [
                              Expanded(child: _buildGitHubCard()),
                              const SizedBox(width: 20.0),
                              Expanded(child: _buildPubDevCard()),
                            ],
                          ),

                    const SizedBox(height: 60.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGitHubCard() {
    return GlassCard(
      glowColor: AppTheme.googleGreen,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.code_rounded,
            color: AppTheme.googleGreen,
            size: 28.0,
          ),
          const SizedBox(height: 12.0),
          Text(
            'about.github_title'.tr,
            style: const TextStyle(
              color: AppTheme.textPrimary,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            'about.github_desc'.tr,
            style: const TextStyle(
              color: AppTheme.textSecondary,
              fontSize: 13.0,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 16.0),
          TextButton(
            onPressed: () => _launchUrl('https://github.com/keros79'),
            child: Text(
              'about.github_link'.tr,
              style: const TextStyle(
                color: AppTheme.googleGreen,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPubDevCard() {
    return GlassCard(
      glowColor: AppTheme.googleYellow,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.layers_outlined,
            color: AppTheme.googleYellow,
            size: 28.0,
          ),
          const SizedBox(height: 12.0),
          Text(
            'about.pub_title'.tr,
            style: const TextStyle(
              color: AppTheme.textPrimary,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            'about.pub_desc'.tr,
            style: const TextStyle(
              color: AppTheme.textSecondary,
              fontSize: 13.0,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 16.0),
          TextButton(
            onPressed: () => _launchUrl('https://pub.dev/packages/getx_distil'),
            child: Text(
              'about.pub_link'.tr,
              style: const TextStyle(
                color: AppTheme.googleYellow,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
