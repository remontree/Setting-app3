
import 'package:flutter/material.dart';

class UsageEntry {
  UsageEntry({required this.appName, required this.megabytes});
  String appName;
  double megabytes;
}

class SettingsModel extends ChangeNotifier {
  // Mobile data usage per app (MB) for the current cycle
  final List<UsageEntry> _mobileData = [
    UsageEntry(appName: 'YouTube', megabytes: 820.0),
    UsageEntry(appName: 'Instagram', megabytes: 460.0),
    UsageEntry(appName: 'Chrome', megabytes: 280.0),
    UsageEntry(appName: 'KakaoTalk', megabytes: 120.0),
    UsageEntry(appName: 'Maps', megabytes: 90.0),
  ];

  // Hotspot usage per client/app (MB) for "today shared mobile data"
  final List<UsageEntry> _hotspot = [
    UsageEntry(appName: '노트북', megabytes: 650.0),
    UsageEntry(appName: '태블릿', megabytes: 240.0),
    UsageEntry(appName: '친구폰', megabytes: 110.0),
  ];

  List<UsageEntry> get mobileData => List.unmodifiable(_mobileData);
  List<UsageEntry> get hotspotData => List.unmodifiable(_hotspot);

  double get mobileDataTotal =>
      _mobileData.fold(0.0, (prev, e) => prev + e.megabytes);
  double get hotspotTotal =>
      _hotspot.fold(0.0, (prev, e) => prev + e.megabytes);

  void addMobileData(UsageEntry e) {
    _mobileData.add(e);
    notifyListeners();
  }

  void addHotspotData(UsageEntry e) {
    _hotspot.add(e);
    notifyListeners();
  }

  void updateMobileData(int index, {String? name, double? mb}) {
    if (index < 0 || index >= _mobileData.length) return;
    _mobileData[index].appName = name ?? _mobileData[index].appName;
    _mobileData[index].megabytes = mb ?? _mobileData[index].megabytes;
    notifyListeners();
  }

  void updateHotspotData(int index, {String? name, double? mb}) {
    if (index < 0 || index >= _hotspot.length) return;
    _hotspot[index].appName = name ?? _hotspot[index].appName;
    _hotspot[index].megabytes = mb ?? _hotspot[index].megabytes;
    notifyListeners();
  }

  void removeMobileDataAt(int index) {
    if (index < 0 || index >= _mobileData.length) return;
    _mobileData.removeAt(index);
    notifyListeners();
  }

  void removeHotspotDataAt(int index) {
    if (index < 0 || index >= _hotspot.length) return;
    _hotspot.removeAt(index);
    notifyListeners();
  }

  // Replace all entries (used by editor "저장")
  void setMobileData(List<UsageEntry> list) {
    _mobileData
      ..clear()
      ..addAll(list);
    notifyListeners();
  }

  void setHotspotData(List<UsageEntry> list) {
    _hotspot
      ..clear()
      ..addAll(list);
    notifyListeners();
  }
}
