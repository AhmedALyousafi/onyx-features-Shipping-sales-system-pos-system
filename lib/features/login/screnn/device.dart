import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:dartz/dartz.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:onyx/features/login/screnn/faiuler.dart';
import 'package:onyx/features/login/screnn/logs.dart';

class DeviceInfoService {
  static final DeviceInfoService _instance = DeviceInfoService._internal();
  factory DeviceInfoService() => _instance;

  final DeviceInfoPlugin _deviceInfoPlugin = DeviceInfoPlugin();

  DeviceInfoService._internal();

  Future<Map<String, dynamic>> getDeviceInfo() async {
    try {
      final platformActions = {
        'web': _getWebDeviceInfo,
        'android': _getAndroidDeviceInfo,
        'ios': _getIOSDeviceInfo,
        'macos': _getMacOSDeviceInfo,
        'linux': _getLinuxDeviceInfo,
        'windows': _getWindowsDeviceInfo,
      };

      if (kIsWeb) {
        return platformActions['web']!();
      }

      switch (Platform.operatingSystem) {
        case 'android':
          return platformActions['android']!();
        case 'ios':
          return platformActions['ios']!();
        case 'macos':
          return platformActions['macos']!();
        case 'linux':
          return platformActions['linux']!();
        case 'windows':
          return platformActions['windows']!();
        default:
          return {'error': 'Unsupported platform'};
      }
    } catch (e, stacktrace) {
      return {
        'error': e.toString(),
        'stacktrace': stacktrace.toString(),
      };
    }
  }

  Future<Map<String, dynamic>> _getWebDeviceInfo() async {
    WebBrowserInfo webInfo = await _deviceInfoPlugin.webBrowserInfo;
    String deviceSerial = await _generateDeviceSerial();

    return {
      'deviceType': 1, // Define your logic for the device type if needed
      'deviceName': webInfo.product,
      'deviceSerial': deviceSerial,
      'deviceVersion': 1, // Define logic if applicable
      'deviceMacAddress': 'testMacAddressWeb', // Placeholder for web
      'deviceImei': 'testImeiWeb', // Placeholder for web
      'osName': webInfo.platform,
      'osVersion': 'N/A', // Web browsers don't have OS versions
      'browserName': webInfo.browserName.name,
      'browserVersion': webInfo.appVersion,
    };
  }

  Future<Map<String, dynamic>> _getAndroidDeviceInfo() async {
    AndroidDeviceInfo androidInfo = await _deviceInfoPlugin.androidInfo;
    String deviceSerial = await _generateDeviceSerial();

    debugPrint('xxxxxxxx : ${androidInfo.toString()}');

    return {
      'deviceType': 1, // Define logic for device type
      'deviceName': androidInfo.model,
      'deviceSerial': deviceSerial,
      'deviceVersion': androidInfo.version.sdkInt,
      'deviceMacAddress': 'testAndroidMac', // Replace with actual if possible
      'deviceImei':
          'testAndroidImei', // Placeholder as getting IMEI needs permission
      'osName': 'Android',
      'osVersion': androidInfo.version.release,
      'browserName': 'N/A', // Not applicable on Android
      'browserVersion': 'N/A', // Not applicable on Android
    };
  }

  Future<Map<String, dynamic>> _getIOSDeviceInfo() async {
    IosDeviceInfo iosInfo = await _deviceInfoPlugin.iosInfo;
    String deviceSerial = await _generateDeviceSerial();

    return {
      'deviceType': 1, // Define logic for device type
      'deviceName': iosInfo.name,
      'deviceSerial': deviceSerial,
      'deviceVersion':
          int.tryParse(iosInfo.systemVersion.split('.').first) ?? 1,
      'deviceMacAddress': 'testIosMac', // Placeholder for iOS
      'deviceImei': 'testIosImei', // Not accessible on iOS
      'osName': iosInfo.systemName,
      'osVersion': iosInfo.systemVersion,
      'browserName': 'Safari', // Default for iOS browsers
      'browserVersion': '16.0', // You can programmatically fetch this if needed
    };
  }

  Future<Map<String, dynamic>> _getMacOSDeviceInfo() async {
    MacOsDeviceInfo macInfo = await _deviceInfoPlugin.macOsInfo;
    String deviceSerial = await _generateDeviceSerial();

    return {
      'deviceType': 1, // Define logic for device type
      'deviceName': macInfo.computerName,
      'deviceSerial': deviceSerial,
      'deviceVersion': int.tryParse(macInfo.osRelease.split('.').first) ?? 1,
      'deviceMacAddress': 'testMacMac', // Placeholder for macOS
      'deviceImei': 'testMacImei', // Placeholder as it's a desktop device
      'osName': 'macOS',
      'osVersion': macInfo.osRelease,
      'browserName': 'Safari', // Default for macOS browsers
      'browserVersion': '16.0', // You can programmatically fetch this if needed
    };
  }

  Future<Map<String, dynamic>> _getLinuxDeviceInfo() async {
    LinuxDeviceInfo linuxInfo = await _deviceInfoPlugin.linuxInfo;
    String deviceSerial = await _generateDeviceSerial();

    return {
      'deviceType': 1, // Define logic for device type
      'deviceName': linuxInfo.name,
      'deviceSerial': deviceSerial,
      'deviceVersion': 1, // Define logic if applicable
      'deviceMacAddress': 'testLinuxMac', // Placeholder for Linux
      'deviceImei': 'testLinuxImei', // Placeholder for Linux
      'osName': 'Linux',
      'osVersion': linuxInfo.version,
      'browserName': 'N/A', // Not applicable on Linux
      'browserVersion': 'N/A', // Not applicable on Linux
    };
  }

  Future<Map<String, dynamic>> _getWindowsDeviceInfo() async {
    WindowsDeviceInfo windowsInfo = await _deviceInfoPlugin.windowsInfo;
    String deviceSerial = await _generateDeviceSerial();

    return {
      'deviceType': 1, // Define logic for device type
      'deviceName': windowsInfo.computerName,
      'deviceSerial': deviceSerial,
      'deviceVersion': 1, // Define logic if applicable
      'deviceMacAddress': 'testWindowsMac', // Placeholder for Windows
      'deviceImei': 'testWindowsImei', // Placeholder for Windows
      'osName': 'Windows',
      'osVersion': 'N/A', // Windows OS version can be fetched if needed
      'browserName': 'N/A', // Not applicable on Windows
      'browserVersion': 'N/A', // Not applicable on Windows
    };
  }

  Future<String> _generateDeviceSerial() async {
    Either<Failure, String> serialEither = await generateDeviceSerial();
    return serialEither.fold(
      (failure) {
        // AppLogs.errorLog("Error generating serial: ${failure.errMsgEn}");
        return 'unknownSerial';
      },
      (serial) => serial,
    );
  }

  Future<Either<Failure, String>> generateDeviceSerial() async {
    try {
      String deviceInfoString;

      if (kIsWeb) {
        WebBrowserInfo webBrowserInfo = await _deviceInfoPlugin.webBrowserInfo;
        deviceInfoString =
            '${webBrowserInfo.platform}${webBrowserInfo.browserName.name}${webBrowserInfo.product}${webBrowserInfo.vendor}';
      } else {
        switch (Platform.operatingSystem) {
          case 'android':
            AndroidDeviceInfo androidInfo = await _deviceInfoPlugin.androidInfo;
            deviceInfoString =
                '${androidInfo.id}${androidInfo.model}${androidInfo.product}';
            break;
          case 'ios':
            IosDeviceInfo iosInfo = await _deviceInfoPlugin.iosInfo;
            deviceInfoString =
                '${iosInfo.identifierForVendor}${iosInfo.model}${iosInfo.utsname.machine}';
            break;
          case 'macos':
            MacOsDeviceInfo macInfo = await _deviceInfoPlugin.macOsInfo;
            deviceInfoString =
                '${macInfo.computerName}${macInfo.model}${macInfo.osRelease}';
            break;
          case 'linux':
            LinuxDeviceInfo linuxInfo = await _deviceInfoPlugin.linuxInfo;
            deviceInfoString =
                '${linuxInfo.name}${linuxInfo.id}${linuxInfo.machineId}';
            break;
          case 'windows':
            WindowsDeviceInfo windowsInfo = await _deviceInfoPlugin.windowsInfo;
            deviceInfoString =
                '${windowsInfo.computerName}${windowsInfo.numberOfCores}${windowsInfo.systemMemoryInMegabytes}';
            break;
          default:
            return const Left(Failure.notFound);
        }
      }

      String serialHash = sha256
          .convert(deviceInfoString.codeUnits)
          .toString()
          .substring(0, 32);

      return Right(serialHash);
    } catch (e) {
      return const Left(Failure.notFound);
    }
  }

  Future<void> saveTerminalData() async {
    Either<Failure, String> serialEither = await generateDeviceSerial();
    serialEither.fold(
      (failure) => AppLogs.errorLog("Error: ${failure.errMsgEn}"),
      (serial) {
        var serialToSave = serial;
        // Save the serial or perform some action
        AppLogs.infoLog("Serial to save: $serialToSave");
      },
    );
  }
}
