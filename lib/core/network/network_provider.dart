import 'dart:async';
import 'package:flutter/material.dart';
import 'package:circle/core/network/network_info.dart';

enum NetworkStatus { online, offline }

class NetworkProvider extends ChangeNotifier {
  final NetworkInfo networkInfo;
  NetworkStatus _status = NetworkStatus.online;
  StreamSubscription<bool>? _subscription;

  NetworkProvider({required this.networkInfo}) {
    _initialize();
  }

  NetworkStatus get status => _status;
  bool get isOffline => _status == NetworkStatus.offline;

  void _initialize() async {
    // Check initial network status
    final isConnected = await networkInfo.isConnected;
    _updateStatus(isConnected);

    // Subscribe to connectivity changes
    _subscription = networkInfo.onConnectivityChanged.listen(_updateStatus);
  }

  void _updateStatus(bool isConnected) {
    final newStatus =
        isConnected ? NetworkStatus.online : NetworkStatus.offline;

    if (_status != newStatus) {
      _status = newStatus;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
