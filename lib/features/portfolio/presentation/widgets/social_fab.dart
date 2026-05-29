import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialFab extends StatelessWidget {
  const SocialFab({
    super.key,
    required this.githubUrl,
    required this.linkedInUrl,
    required this.telegramUrl,
    required this.whatsappUrl,
  });

  final String githubUrl;
  final String linkedInUrl;
  final String telegramUrl;
  final String whatsappUrl;

  Future<void> _open(String url) async {
    final uri = Uri.parse(url);
    if (!await canLaunchUrl(uri)) return;
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      heroTag: 'socialFab',
      onPressed: () async {
        // Simple contact menu keeps the page clean while still giving quick access.
        final chosen = await showModalBottomSheet<String>(
          context: context,
          builder: (context) => SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: const Icon(Icons.code_outlined),
                  title: const Text('GitHub'),
                  onTap: () => Navigator.pop(context, githubUrl),
                ),
                ListTile(
                  leading: const Icon(Icons.business_center_outlined),
                  title: const Text('LinkedIn'),
                  onTap: () => Navigator.pop(context, linkedInUrl),
                ),
                ListTile(
                  leading: const Icon(Icons.chat_bubble_outline),
                  title: const Text('Telegram'),
                  onTap: () => Navigator.pop(context, telegramUrl),
                ),
                ListTile(
                  leading: const Icon(Icons.chat_outlined),
                  title: const Text('WhatsApp'),
                  onTap: () => Navigator.pop(context, whatsappUrl),
                ),
              ],
            ),
          ),
        );

        if (chosen == null) return;
        await _open(chosen);
      },
      icon: const Icon(Icons.link),
      label: const Text('Social'),
    );
  }
}

