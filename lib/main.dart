import 'package:flutter/cupertino.dart';

void main()=>runApp(CupertinoApp(
  theme: CupertinoThemeData(
      brightness: Brightness.light
  ),
  debugShowCheckedModeBanner: false,
  home: MyApp(),));

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool airplaneMode = false;
  bool wifiMode = false;
  bool bluetoothMode = false;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Settings', style: TextStyle(fontWeight: FontWeight.bold),),
        ),
        child: SafeArea(child: Column(
          children: [

            Expanded(child: ListView(
              children: [
                CupertinoListTile(
                  title: Text('Airplane Mode'),
                  leading: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: CupertinoColors.systemOrange
                      ),
                      child: Icon(CupertinoIcons.airplane, color: CupertinoColors.white,)
                  ),
                  leadingSize: 32,
                  trailing: CupertinoSwitch(value: airplaneMode, onChanged: (value){
                    setState(() {
                      airplaneMode = !airplaneMode;
                    });
                  }),

                ),


                CupertinoListTile(
                  title: Text('WiFi'),
                  leading: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: CupertinoColors.systemBlue,
                    ),
                    child: Icon(CupertinoIcons.wifi, color: CupertinoColors.white),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => WifiPage(),
                      ),
                    );
                  },
                ),



                CupertinoListTile(
                  title: Text('Bluetooth'),
                  leading: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: CupertinoColors.systemBlue,
                    ),
                    child: Icon(CupertinoIcons.bluetooth, color: CupertinoColors.white),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => BluetoothPage(),
                      ),
                    );
                  },
                ),


                CupertinoListTile(
                    title: Text('Cellular'),
                    leading: Container(
                        padding: EdgeInsets.all(5),

                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: CupertinoColors.systemGreen
                        ),
                        child: Icon(CupertinoIcons.antenna_radiowaves_left_right, color: CupertinoColors.white,)
                    ),
                    leadingSize: 32,
                    trailing: Icon(CupertinoIcons.chevron_forward, color: CupertinoColors.systemGrey2,)
                ),



                CupertinoListTile(
                    title: Text('Personal Hotspot'),
                    leading: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: CupertinoColors.systemGreen
                        ),
                        child: Icon(CupertinoIcons.personalhotspot, color: CupertinoColors.white,)
                    ),
                    leadingSize: 32,
                    additionalInfo: Text('Off'),
                    trailing: Icon(CupertinoIcons.chevron_forward, color: CupertinoColors.systemGrey2,)
                ),
              ],
            ))
          ],
        )));
  }
}

