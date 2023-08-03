import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_internet_speed_test/flutter_internet_speed_test.dart';

class SpeedTest extends StatefulWidget {
  const SpeedTest({super.key});

  @override
  State<SpeedTest> createState() => _SpeedTestState();
}

class _SpeedTestState extends State<SpeedTest> {
  final internetSpeedTest = FlutterInternetSpeedTest()..enableLog();
  bool _testInProgress = false;
  double _uploadRate = 0;

  bool _isServerSelectionInProgress = false;
  String _unitText = 'Mbps';

  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('FlutterInternetSpeedTest example'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Upload Speed',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('Upload Rate: $_uploadRate $_unitText'),
                ],
              ),
              const SizedBox(
                height: 32.0,
              ),
              if (!_testInProgress) ...{
                ElevatedButton(
                  child: const Text('Start Testing'),
                  onPressed: () async {
                    await internetSpeedTest.startTesting(
                      onStarted: () {
                        setState(() => _testInProgress = true);
                      },
                      onCompleted: (TestResult download, TestResult upload) {
                        setState(() {
                          _uploadRate = upload.transferRate;
                          _unitText =
                              upload.unit == SpeedUnit.kbps ? 'Kbps' : 'Mbps';

                          _testInProgress = false;
                        });
                      },
                      onProgress: (double percent, TestResult data) {
                        if (kDebugMode) {
                          print(
                              'the transfer rate $data.transferRate, the percent $percent');
                        }
                        setState(() {
                          _unitText =
                              data.unit == SpeedUnit.kbps ? 'Kbps' : 'Mbps';

                          _uploadRate = data.transferRate;
                        });
                      },
                      onError: (String errorMessage, String speedTestError) {
                        if (kDebugMode) {
                          print(
                              'the errorMessage $errorMessage, the speedTestError $speedTestError');
                        }
                      },
                      onDefaultServerSelectionInProgress: () {
                        setState(() {
                          _isServerSelectionInProgress = true;
                        });
                      },
                      onDefaultServerSelectionDone: (Client? client) {
                        setState(() {
                          _isServerSelectionInProgress = false;
                        });
                      },
                      onUploadComplete: (TestResult data) {
                        setState(() {
                          _uploadRate = data.transferRate;
                          _unitText =
                              data.unit == SpeedUnit.kbps ? 'Kbps' : 'Mbps';
                        });
                      },
                    );
                  },
                )
              } else ...{
                const CircularProgressIndicator(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton.icon(
                    onPressed: () => internetSpeedTest.cancelTest(),
                    icon: const Icon(Icons.cancel_rounded),
                    label: const Text('Cancel'),
                  ),
                )
              },
            ],
          ),
        ),
      ),
    );
  }
}