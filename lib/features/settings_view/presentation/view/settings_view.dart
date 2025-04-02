import 'package:flutter/material.dart';
import 'package:wallpaper_app/features/settings_view/presentation/view/widgets/settings_view_body.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SettingsViewBody());
  }
}
