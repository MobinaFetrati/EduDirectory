import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactActions extends StatelessWidget {
  const ContactActions({
    super.key,
    this.phone,
    this.mobile,
    this.latitude,
    this.longitude,
  });

  final String? phone;
  final String? mobile;
  final double? latitude;
  final double? longitude;

  Future<void> _call(String number) async {
    if (number.isEmpty) return;

    final uri = Uri.parse("tel:$number");

    await launchUrl(uri);
  }

  Future<void> _copy(BuildContext context, String value) async {
    if (value.isEmpty) return;

    await Clipboard.setData(ClipboardData(text: value));

    if (context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("شماره کپی شد")));
    }
  }

  Future<void> _map() async {
    if (latitude == null || longitude == null) {
      return;
    }

    final uri = Uri.parse(
      "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude",
    );

    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    final number = mobile ?? phone ?? "";

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FilledButton.icon(
          onPressed: () {
            _call(number);
          },
          icon: const Icon(Icons.call),
          label: const Text("تماس"),
        ),

        FilledButton.icon(
          onPressed: () {
            _copy(context, number);
          },
          icon: const Icon(Icons.copy),
          label: const Text("کپی"),
        ),

        FilledButton.icon(
          onPressed: _map,
          icon: const Icon(Icons.location_on),
          label: const Text("نقشه"),
        ),
      ],
    );
  }
}
