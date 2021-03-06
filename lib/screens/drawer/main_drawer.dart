import 'package:erobot_app/config/palette.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({Key key}) : super(key: key);

  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  bool isSwitched = false;
  bool isConnected = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: ListView(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    color: Palette.bigstone,
                    width: double.infinity,
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/erobot-logo/erobotlogo.png',
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "E-Robot",
                          style: TextStyle(
                              fontFamily: 'Raleway',
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "erobotappdev@gmail.com",
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w100,
                          ),
                        )
                      ],
                    ),
                  ),
                  // ListTile(
                  //   leading: Icon(
                  //     Icons.bluetooth,
                  //     color: Colors.white,
                  //   ),
                  //   title: Text(
                  //     "Bluetooth",
                  //     style: TextStyle(color: Colors.white),
                  //   ),
                  //   onTap: () => Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (c) => BluetoothList(),
                  //     ),
                  //   ),
                  // ),
                  ListTile(
                    leading: Icon(
                      Icons.feedback,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Feedback',
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: () => Navigator.pushNamed(context, '/feedback'),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.exit_to_app,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Exit',
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/');
                      //exit(0);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
