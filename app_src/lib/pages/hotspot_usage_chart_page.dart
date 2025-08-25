
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/settings_model.dart';
import '../widgets/usage_bar.dart';

class HotspotUsageChartPage extends StatelessWidget {
  const HotspotUsageChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final entries = context.watch<SettingsModel>().hotspotData;
    final total = context.watch<SettingsModel>().hotspotTotal;
    return Scaffold(
      appBar: AppBar(title: const Text('핫스팟 사용량')),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 24),
        children: [
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('총 ${total.toStringAsFixed(0)} MB', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 12),
                  UsageBarChart(entries: entries),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Card(
            child: Column(
              children: [
                for (final e in entries)
                  ListTile(
                    title: Text(e.appName),
                    subtitle: Text('${e.megabytes.toStringAsFixed(0)} MB'),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
