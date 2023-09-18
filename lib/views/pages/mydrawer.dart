import 'package:flutter/material.dart';
import 'package:skilldren/views/pages/Profile.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          title: const Text(
            "Menu",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 22),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        // height: MediaQuery.of(context).size.height,
                        child: const Image(
                            image: AssetImage(
                                'assets/images/Skilldren_Images__3_-removebg-preview.png')),
                      ),
                    ),
                    Column(
                      children: [
                        const SizedBox(
                          height: 90,
                        ),
                        Transform.rotate(
                            angle: -0.2,
                            child: _card('Home', Icons.home, () {
                              Navigator.of(context).pop();
                            })),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Transform.rotate(
                              angle: -0.09,
                              child: _card('My Profile', Icons.person, () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const MyProfilePage()));
                              })),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 70),
                          child: Transform.rotate(
                              angle: 0,
                              child: _card('SubsCribe Now',
                                  Icons.subscriptions_sharp, () {})),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 70),
                          child: Transform.rotate(
                              angle: 0.20,
                              child: _card('Support', Icons.settings, () {})),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 45),
                          child: Transform.rotate(
                              angle: 0.30,
                              child: _card(
                                  'Refers to a Friend', Icons.share, () {})),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Transform.rotate(
                          angle: 0.30,
                          child: _card('Setting', Icons.settings, () {}),
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                'Follow us for daily updates!',
                                style: TextStyle(fontSize: 18),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 15),
                                decoration: BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.circular(100)),
                                padding: const EdgeInsets.all(4),
                                child: const Icon(
                                  Icons.notifications_none_sharp,
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 15),
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(100)),
                                padding: const EdgeInsets.all(4),
                                child: const Icon(
                                  Icons.face,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Container(
                            alignment: Alignment.center,
                            height: 60,

                            // padding:
                            //     const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                            decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(6)),
                            child: const Text(
                              'Talk to our expert',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 21,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  Widget _card(String title, IconData icon, VoidCallback press) {
    return InkWell(
        onTap: press,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 40,
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 60,
                width: MediaQuery.of(context).size.width * 0.40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black)),
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.yellowAccent,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black)),
                      child: Icon(
                        icon,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(child: Text(title)),
                  ],
                ),
              ),
            ),
            Transform.rotate(
              angle: -0.7,
              child: const SizedBox(
                height: 60,
                width: 55,
                child: Image(image: AssetImage("assets/images/Link.png")),
              ),
            )
          ],
        ));
  }
}
