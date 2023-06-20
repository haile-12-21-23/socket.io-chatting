import 'dart:io';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';

class TwoContainersComponent extends StatefulWidget {
  @override
  _TwoContainersComponentState createState() => _TwoContainersComponentState();
}

class _TwoContainersComponentState extends State<TwoContainersComponent>
    with WidgetsBindingObserver {
  bool isMerged = false;
  TextEditingController textEditingController = TextEditingController();
  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  String deviceName = '';
  double x = 0;
  double y = 0;
  getDeviceInfo() async {
    try {
      if (Platform.isAndroid) {
        AndroidDeviceInfo deviceAndroid = await deviceInfoPlugin.androidInfo;
        print('allInfo:$deviceAndroid');
        deviceName = deviceAndroid.brand;
      } else if (Platform.isIOS) {
        IosDeviceInfo deviceIos = await (deviceInfoPlugin.iosInfo);
        // deviceInfoPlugin = deviceIos as DeviceInfoPlugin;
        deviceName = deviceIos.name;

        print('allInfo:$deviceIos');
      } else if (Platform.isWindows) {
        WindowsDeviceInfo deviceWin = await (deviceInfoPlugin.windowsInfo);
        // deviceInfoPlugin = deviceWin as DeviceInfoPlugin;
        deviceName = deviceWin.computerName;

        print('device name:$deviceName');
        print('allInfo:${deviceWin.data}');
      }
    } catch (e) {
      print('Error:${e.toString()}');
    }
    // return deviceAndroid;
  }

  GlobalKey _widgetKey = GlobalKey();
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);

    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  // void _onWidgetTap() {
  //   RenderBox renderBox =
  //       _widgetKey.currentContext!.findRenderObject() as RenderBox;
  //   Offset tapPosition = renderBox.localToGlobal(Offset.zero);
  //   setState(() {
  //     x = tapPosition.dx;
  //     y = tapPosition.dy;
  //   });

  //   print('x:$x');
  //   print('y:$y');
  //   print('Tapped position: $tapPosition');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.pink,
      body: GestureDetector(
        onDoubleTapDown: (details) {
          late Offset doubleTapPosition;

          final RenderBox box = context.findRenderObject() as RenderBox;
          doubleTapPosition = box.globalToLocal(details.globalPosition);
          setState(() {
            x = doubleTapPosition.dx;
            y = doubleTapPosition.dy;
          });

          print('x:$x');
          print('y:$y');
          print('position:$doubleTapPosition');
          _buildSeparateContainers(x, y);
        },
        onTap: () {},
        //  () {
        //   TapDownDetails details = TapDownDetails();
        //   RenderBox renderBox =
        //       myWidgetKey.currentContext!.findRenderObject() as RenderBox;
        //   Offset position = renderBox.localToGlobal(Offset.zero);
        //   double x = position.dx;
        //   double y = position.dy;
        //   double width = renderBox.size.width;
        //   double height = renderBox.size.height;

        //   print('position:$position');
        //   print('x:$x');
        //   print('y:$y');
        //   print('width:$width');
        //   print('height:$height');
        // },
        child: Column(
          // key: _widgetKey,
          children: [
            Expanded(
              flex: 2,
              child: ListView(
                children: [
                  const Center(child: Text('List View')),
                  const Center(child: Text('List View')),
                  const Center(child: Text('List View')),
                  const Center(child: Text('List View')),
                  const Center(child: Text('List View')),
                  Center(child: Text(deviceName)),
                  Center(
                    child: TextButton(
                      onPressed: getDeviceInfo,
                      child: const Text(' View'),
                    ),
                  ),
                  Center(
                    child: InkWell(
                      key: _widgetKey,

                      // onTap: _onWidgetTap,
                      // () {
                      //   RenderBox renderBox = myWidgetKey.currentContext!
                      //       .findRenderObject() as RenderBox;
                      //   Offset position = renderBox.localToGlobal(Offset.zero);
                      //   var p = renderBox.localToGlobal(Offset.zero).direction;
                      //   double x = position.dx.sign;
                      //   double y = position.dy;
                      //   double width = renderBox.size.width;
                      //   double height = renderBox.size.height;

                      //   print('p:$p');
                      //   print('position:$position');
                      //   print('x:$x');
                      //   print('y:$y');
                      //   print('width:$width');
                      //   print('height:$height');
                      // },
                      child: const Text(' position'),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isMerged = !isMerged;
                });
              },
              child: Container(
                width: 300,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.cyan,
                ),
                child: TextButton(
                    onPressed: () {
                      print('is merged:$isMerged');
                      // _buildSeparateContainers();
                    },
                    child: const Text(
                      'Show Reaction',
                      style: TextStyle(color: Colors.indigo),
                    )),
              ),
            ),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }

  final reactions = [
    '😀',
    '😍',
    '👍',
    '👎',
    '😲',
    '😢',
    '😠',
    '😂',
  ];
  _buildSeparateContainers(double px, double py) {
    showDialog(
      barrierColor: Colors.transparent,
      useSafeArea: true,
      useRootNavigator: true,
      context: context,
      builder: (context) {
        print('px:$px,py:$py');
        return Align(
          alignment: Alignment(px, py),
          child: AlertDialog(
            elevation: 0,
            insetPadding: EdgeInsets.only(left: px + 10 - px, top: 10),
            backgroundColor: Colors.black.withOpacity(0.01),
            contentPadding: EdgeInsets.zero,
            content: Align(
              // alignment: Alignment(px, py),
              child: StatefulBuilder(
                builder: (context, setState) {
                  return isMerged
                      ? Container(
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10)),
                          child: SizedBox(
                              height: 400,
                              width: 400,
                              child: EmojiPicker(
                                config: Config(
                                  columns: 7,
                                  emojiSizeMax: 32 *
                                      (foundation.defaultTargetPlatform ==
                                              TargetPlatform.iOS
                                          ? 1.30
                                          : 1.0),
                                  verticalSpacing: 0,
                                  horizontalSpacing: 0,
                                  gridPadding: EdgeInsets.zero,
                                  initCategory: Category.RECENT,
                                  enableSkinTones: true,
                                  showRecentsTab: true,
                                  recentsLimit: 28,
                                  replaceEmojiOnLimitExceed: false,
                                  noRecents: const Text(
                                    'noRecentEmoji',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                onEmojiSelected: (category, emoji) {
                                  reactions.insert(0, emoji.emoji.toString());
                                  setState(
                                    () {
                                      isMerged = false;
                                    },
                                  );
                                  Navigator.pop(context);
                                  print('emoji:$emoji');
                                  print('emoji name:${emoji.emoji}');
                                  print('emoji name:${emoji.name}');
                                },
                                textEditingController: textEditingController,
                              )),
                        )
                      : SizedBox(
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(10)),
                                // height: 100,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.zero,
                                      alignment: Alignment.center,
                                      height: 40,
                                      width: 280,
                                      child: GridView.count(
                                        crossAxisCount: 4,
                                        crossAxisSpacing: 1,
                                        shrinkWrap: true,
                                        mainAxisSpacing: 1,
                                        padding: EdgeInsets.zero,
                                        children: reactions.map((reaction) {
                                          return GestureDetector(
                                            onTap: () {
                                              print('Reaction:$reaction');
                                              Navigator.pop(context, reaction);
                                            },
                                            child: Text(
                                              reaction,
                                              style:
                                                  const TextStyle(fontSize: 32),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              isMerged = !isMerged;
                                            });
                                            print(
                                                'is merged in icon $isMerged');
                                          },
                                          child: const Icon(
                                              FeatherIcons.chevronDown)),
                                    ),
                                  ],
                                ),
                                // Add your content for the first container
                              ),
                              Container(
                                color: Colors.transparent,
                                child: const SizedBox(
                                  height: 10,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(8)),
                                  height: 100,
                                  // Add your content for the second container
                                ),
                              ),
                            ],
                          ),
                        );
                },
              ),
            ),
          ),
        );
      },
    );
  }

  _buildMergedContainer() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Container(
              color: Colors.purple,
              height: 200,
              // Add your content for the merged container
            ),
          );
        });
  }
}
