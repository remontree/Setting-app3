
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/settings_model.dart';

class EditUsagePage extends StatefulWidget {
  const EditUsagePage({super.key});

  @override
  State<EditUsagePage> createState() => _EditUsagePageState();
}

class _EditUsagePageState extends State<EditUsagePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('사용량 데이터 편집'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: '모바일 데이터'),
            Tab(text: '핫스팟'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          _Editor(kind: _EditorKind.mobile),
          _Editor(kind: _EditorKind.hotspot),
        ],
      ),
    );
  }
}

enum _EditorKind { mobile, hotspot }

class _Editor extends StatefulWidget {
  const _Editor({required this.kind});
  final _EditorKind kind;

  @override
  State<_Editor> createState() => _EditorState();
}

class _EditorState extends State<_Editor> {
  late List<UsageEntry> editing;

  @override
  void initState() {
    super.initState();
    final model = context.read<SettingsModel>();
    editing = [
      for (final e in (widget.kind == _EditorKind.mobile ? model.mobileData : model.hotspotData))
        UsageEntry(appName: e.appName, megabytes: e.megabytes),
    ];
  }

  void _save() {
    final model = context.read<SettingsModel>();
    if (widget.kind == _EditorKind.mobile) {
      model.setMobileData(editing);
    } else {
      model.setHotspotData(editing);
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: editing.length,
            itemBuilder: (context, index) {
              final controllerName = TextEditingController(text: editing[index].appName);
              final controllerMb = TextEditingController(text: editing[index].megabytes.toStringAsFixed(0));
              return Column(
                children: [
                  ListTile(
                    title: TextField(
                      controller: controllerName,
                      decoration: const InputDecoration(labelText: '앱/기기 이름'),
                      onChanged: (v) => editing[index].appName = v,
                    ),
                    subtitle: TextField(
                      controller: controllerMb,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: '사용량 (MB)'),
                      onChanged: (v) {
                        final parsed = double.tryParse(v) ?? editing[index].megabytes;
                        editing[index].megabytes = parsed;
                      },
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_outline_rounded),
                      onPressed: () {
                        setState(() {
                          editing.removeAt(index);
                        });
                      },
                    ),
                  ),
                  const Divider(height: 1),
                ],
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  icon: const Icon(Icons.add_rounded),
                  label: const Text('항목 추가'),
                  onPressed: () {
                    setState(() {
                      editing.add(UsageEntry(appName: '새 항목', megabytes: 0));
                    });
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: FilledButton.icon(
                  icon: const Icon(Icons.save_rounded),
                  label: const Text('저장'),
                  onPressed: _save,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
