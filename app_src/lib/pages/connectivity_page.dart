
import 'package:flutter/material.dart';
import '../widgets/oneui_list_tile.dart';
import 'data_usage_page.dart';
import 'tethering_page.dart';
import 'placeholder_page.dart';

class ConnectivityPage extends StatefulWidget {
  const ConnectivityPage({super.key, this.initialToDataUsage = false, this.initialToHotspot = false});

  final bool initialToDataUsage;
  final bool initialToHotspot;

  @override
  State<ConnectivityPage> createState() => _ConnectivityPageState();
}

class _ConnectivityPageState extends State<ConnectivityPage> {
  @override
  void initState() {
    super.initState();
    // Deep links as requested
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.initialToDataUsage) {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => const DataUsagePage()));
      } else if (widget.initialToHotspot) {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => const TetheringPage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('연결')),
      body: ListView(
        children: [
          const SizedBox(height: 8),
          Card(
            child: Column(
              children: [
                OneUIListTile(title: 'Wi‑Fi', leading: const Icon(Icons.wifi_rounded), onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const PlaceholderPage(title: 'Wi‑Fi')));
                }),
                OneUIListTile(title: '블루투스', leading: const Icon(Icons.bluetooth_rounded), onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const PlaceholderPage(title: '블루투스')));
                }),
                OneUIListTile(title: '비행기 탑승 모드', leading: const Icon(Icons.flight_rounded), onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const PlaceholderPage(title: '비행기 탑승 모드')));
                }),
                OneUIListTile(title: '모바일 네트워크', leading: const Icon(Icons.cell_tower_rounded), onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const PlaceholderPage(title: '모바일 네트워크')));
                }),
                OneUIListTile(title: '데이터 사용', leading: const Icon(Icons.data_usage_rounded), onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const DataUsagePage()));
                }),
                OneUIListTile(title: 'SIM 관리자', leading: const Icon(Icons.sim_card_rounded), onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const PlaceholderPage(title: 'SIM 관리자')));
                }),
                OneUIListTile(title: '모바일 핫스팟 및 테더링', leading: const Icon(Icons.wifi_tethering_rounded), onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const TetheringPage()));
                }),
                OneUIListTile(title: '기타 연결 설정', leading: const Icon(Icons.cable_rounded), onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const PlaceholderPage(title: '기타 연결 설정')));
                }),
              ],
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
