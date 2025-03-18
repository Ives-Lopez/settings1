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
            SizedBox(height: 100,),
            Column(
              children: [
                Image.asset('images/ives.jpg', scale: 5,),
                Text('Ives G. Lopez', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,),),
                Image.asset('images/ivan.jpg', scale: 5,),
                Text('Ivan G. Lopez', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,),),
              ],
            ),


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





class WifiPage extends StatefulWidget {
  @override
  _WifiPageState createState() => _WifiPageState();
}

class _WifiPageState extends State<WifiPage> {
  bool wifiMode = false; // State for WiFi mode
  final List<String> wifiNetworks = [
    "SMS Free Wifi",
    "ARDUINO WiFi",
    "Samsung Free Internet",
    "HCC Free WiFi",
  ];

  void _toggleWifiMode(bool value) {
    setState(() {
      wifiMode = value; // Update the wifiMode state
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('WiFi Settings'),
        previousPageTitle: 'Back',
      ),
      child: SafeArea(
        child: Column(
          children: [
            CupertinoListTile(
              title: Text('WiFi'),
              trailing: CupertinoSwitch(
                value: wifiMode,
                onChanged: _toggleWifiMode, // Toggle WiFi mode
              ),
            ),
            if (wifiMode)
              Expanded(
                child: ListView(
                  children: wifiNetworks
                      .map((network) => CupertinoListTile(
                    title: Text(network),
                    leading: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Icon(CupertinoIcons.wifi, color: CupertinoColors.systemGrey,),
                    ),
                  ))
                      .toList(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}



class BluetoothPage extends StatefulWidget {
  @override
  _BluetoothPageState createState() => _BluetoothPageState();
}

class _BluetoothPageState extends State<BluetoothPage> {
  bool bluetoothMode = false; // State for Bluetooth mode
  final List<String> bluetoothDevices = [
    "Itel RS4",
    "Galaxy A10s",
    "Laptop-GLJDCK",
    "SoundboxM80",
  ];

  void _toggleBluetoothMode(bool value) {
    setState(() {
      bluetoothMode = value; // Update the bluetoothMode state
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Bluetooth Settings'),
        previousPageTitle: 'Back',
      ),
      child: SafeArea(
        child: Column(
          children: [
            CupertinoListTile(
              title: Text('Bluetooth'),
              trailing: CupertinoSwitch(
                value: bluetoothMode,
                onChanged: _toggleBluetoothMode, // Toggle Bluetooth mode
              ),
            ),
            if (bluetoothMode)
              Expanded(
                child: ListView(
                  children: bluetoothDevices
                      .map((device) => CupertinoListTile(
                    title: Text(device),
                    leading: Container(

                      child: Icon(CupertinoIcons.bluetooth, color: CupertinoColors.systemGrey,),
                    ),
                  ))
                      .toList(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}