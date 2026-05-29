import 'package:flutter/material.dart';
import 'package:portfolio_app/core/utils/breakpoints.dart';
import 'package:portfolio_app/core/widgets/fade_in_up.dart';
import 'package:portfolio_app/core/widgets/glass_container.dart';
import 'package:portfolio_app/core/widgets/primary_button.dart';
import 'package:portfolio_app/features/portfolio/data/portfolio_data.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key, required this.width});

  final double width;

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _open(String url) async {
    final uri = Uri.parse(url);
    if (!await canLaunchUrl(uri)) return;
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  void _submit() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) return;

    // Portfolio demo: no backend wired. Replace with your email/API logic.
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
            'Message prepared! You can connect this form to your backend.'),
      ),
    );

    _nameController.clear();
    _emailController.clear();
    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = Breakpoints.isDesktop(widget.width);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 44),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1120),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FadeInUp(
                delay: Duration(milliseconds: 40),
                child: Text(
                  'Contact',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                      letterSpacing: -0.4),
                ),
              ),
              const SizedBox(height: 8),
              FadeInUp(
                delay: const Duration(milliseconds: 90),
                child: Text(
                  'Let’s build something clean, fast, and user-friendly.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        height: 1.7,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              const SizedBox(height: 22),
              FadeInUp(
                delay: const Duration(milliseconds: 120),
                child: GlassContainer(
                  padding: const EdgeInsets.all(18),
                  borderRadius: 22,
                  child: isDesktop
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: _contactDetails(open: _open)),
                            const SizedBox(width: 18),
                            Expanded(
                                child: _contactForm(
                                    formKey: _formKey, onSubmit: _submit)),
                          ],
                        )
                      : Column(
                          children: [
                            _contactDetails(open: _open),
                            const SizedBox(height: 14),
                            _contactForm(formKey: _formKey, onSubmit: _submit),
                          ],
                        ),
                ),
              ),
              const SizedBox(height: 26),
              Center(
                child: Text(
                  'Tip: Replace the placeholder links in `portfolio_data.dart` with your real profiles.',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        height: 1.6,
                        fontWeight: FontWeight.w600,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: Text(
                  '© ${DateTime.now().year} Portfolio. Built with Flutter.',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurfaceVariant
                            .withValues(alpha: 0.9),
                      ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _contactDetails({required Future<void> Function(String url) open}) {
    final theme = Theme.of(context);

    Widget contactRow(IconData icon, String label, String value,
        {void Function()? onTap}) {
      return InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, size: 18, color: theme.colorScheme.primary),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(label,
                        style: theme.textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.w900,
                          color: theme.colorScheme.onSurfaceVariant,
                        )),
                    const SizedBox(height: 3),
                    Text(
                      value,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick links',
          style: theme.textTheme.titleMedium
              ?.copyWith(fontWeight: FontWeight.w900, letterSpacing: -0.2),
        ),
        const SizedBox(height: 12),
        contactRow(Icons.email_outlined, 'Email', PortfolioData.email,
            onTap: () {
          final uri = Uri(
            scheme: 'mailto',
            path: PortfolioData.email,
          );
          canLaunchUrl(uri).then((ok) {
            if (ok) launchUrl(uri);
          });
        }),
        contactRow(Icons.code_outlined, 'GitHub', PortfolioData.github,
            onTap: () {
          open(PortfolioData.github);
        }),
        contactRow(
            Icons.business_center_outlined, 'LinkedIn', PortfolioData.linkedIn,
            onTap: () {
          open(PortfolioData.linkedIn);
        }),
        contactRow(
            Icons.chat_bubble_outline, 'Telegram', PortfolioData.telegram,
            onTap: () {
          open(PortfolioData.telegram);
        }),
        contactRow(Icons.chat_outlined, 'WhatsApp', PortfolioData.whatsapp,
            onTap: () {
          open(PortfolioData.whatsapp);
        }),
      ],
    );
  }

  Widget _contactForm({
    required GlobalKey<FormState> formKey,
    required VoidCallback onSubmit,
  }) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Send a message',
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Your name',
              border: OutlineInputBorder(),
            ),
            validator: (v) {
              if (v == null || v.trim().isEmpty) {
                return 'Please enter your name.';
              }
              return null;
            },
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.emailAddress,
            validator: (v) {
              final value = v?.trim() ?? '';
              final emailOk =
                  RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(value);
              if (!emailOk) return 'Enter a valid email.';
              return null;
            },
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _messageController,
            minLines: 5,
            maxLines: 7,
            decoration: const InputDecoration(
              labelText: 'Message',
              border: OutlineInputBorder(),
            ),
            validator: (v) {
              final value = v?.trim() ?? '';
              if (value.length < 10) {
                return 'Message should be at least 10 characters.';
              }
              return null;
            },
          ),
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            child: PrimaryButton(
              label: 'Submit',
              icon: Icons.send_rounded,
              onPressed: onSubmit,
            ),
          ),
        ],
      ),
    );
  }
}
