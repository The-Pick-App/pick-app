import 'package:flutter/material.dart';
import 'package:pickapp/core/get_screen_size_ext.dart';

class DemoScreen extends StatefulWidget {
  const DemoScreen({super.key});

  @override
  State<DemoScreen> createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  bool isSwitched = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: buildBody(),
        bottomNavigationBar: buildBottomNavigationBar(),
      ),
    );
  }

  // Widgets

  Widget buildBottomNavigationBar() {
    return Container(
        padding: EdgeInsets.all(context.dynamicWidth(0.05)),
        width: context.dynamicWidth(1),
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, -5),
            ),
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(
              Icons.circle,
              color: Color.fromARGB(255, 185, 173, 255),
              size: 32.0,
            ),
            const Icon(
              Icons.circle,
              color: Color.fromARGB(255, 185, 173, 255),
              size: 32.0,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 185, 173, 255),
              ),
              child: const Icon(Icons.add, color: Colors.white, size: 48),
            ),
            const Icon(
              Icons.circle,
              color: Color.fromARGB(255, 185, 173, 255),
              size: 32.0,
            ),
            const Icon(
              Icons.circle,
              color: Color.fromARGB(255, 185, 173, 255),
              size: 32.0,
            ),
          ],
        )

        // BottomNavigationBar(
        //   items: const [
        //     BottomNavigationBarItem(
        //       icon: Icon(
        //         Icons.circle,
        //         color: Color.fromARGB(255, 185, 173, 255),
        //         size: 32.0,
        //       ),
        //       label: '',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(
        //         Icons.circle,
        //         color: Color.fromARGB(255, 185, 173, 255),
        //         size: 32.0,
        //       ),
        //       label: 'sa',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(
        //         Icons.add,
        //         color: Color.fromARGB(255, 146, 127, 255),
        //         size: 64.0,
        //       ),
        //       label: 'asdas',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(
        //         Icons.circle,
        //         color: Color.fromARGB(255, 185, 173, 255),
        //         size: 32.0,
        //       ),
        //       label: '',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(
        //         Icons.circle,
        //         color: Color.fromARGB(255, 185, 173, 255),
        //         size: 32.0,
        //       ),
        //       label: '',
        //     ),
        //   ],
        // ),

        );
  }

  Widget buildBody() {
    return Column(children: [
      Expanded(
        child: Stack(
          children: [
            SizedBox(
                width: context.dynamicWidth(1),
                child: Image.asset('assets/images/map.jpg', fit: BoxFit.fill)),
            Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [buildSwitch(), buildInfo()]),
          ],
        ),
      ),
    ]);
  }

  Widget buildSwitch() {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 70.0,
      width: context.dynamicWidth(0.5),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 234, 234, 234),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          children: [
            Expanded(
                child: InkWell(
              onTap: () => setState(() => isSwitched = true),
              child: Container(
                height: context.dynamicWidth(0.2),
                decoration: BoxDecoration(
                  color: isSwitched
                      ? const Color.fromARGB(255, 146, 127, 255)
                      : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Icon(Icons.map),
              ),
            )),
            Expanded(
                child: InkWell(
              onTap: () => setState(() => isSwitched = false),
              child: Container(
                height: context.dynamicWidth(0.2),
                decoration: BoxDecoration(
                  color: isSwitched
                      ? Colors.grey.shade300
                      : const Color.fromARGB(255, 146, 127, 255),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Icon(Icons.dangerous),
              ),
            ))
          ],
        ),
      ),
    );
  }

  Widget buildInfo() {
    return Container(
      height: context.dynamicWidth(0.35),
      padding: EdgeInsets.symmetric(
          vertical: context.dynamicWidth(0.05),
          horizontal: context.dynamicWidth(0.075)),
      width: context.dynamicWidth(1),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: Colors.white),
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SizedBox(
          width: context.dynamicWidth(0.1),
          height: context.dynamicWidth(0.1),
          child: Image.asset('assets/images/home_icon.png', fit: BoxFit.fill),
        ),
        SizedBox(width: context.dynamicWidth(0.05)),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('İSTANBUL/PENDİK',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: context.dynamicWidth(0.02)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Row(
                        children: const [
                          Expanded(
                              child:
                                  Text('● Karaağaç caddesi Karaağaç caddesi')),
                          SizedBox(width: 10),
                          Expanded(child: Text('● Alvin sokak')),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: const [
                          Expanded(child: Text('● No: 7')),
                          SizedBox(width: 10),
                          Expanded(child: Text('● Daire : 6')),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
/*


   Container(
          height: 120.0,
          width: MediaQuery.of(context).size.width * 100,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 234, 234, 234),
            border: Border.all(
                color: const Color.fromARGB(255, 234, 234, 234),
                width: 5.0,
                style: BorderStyle.solid),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(children: [
                    Container(
                      color: const Color.fromARGB(255, 234, 234, 234),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.home,
                          color: Color.fromARGB(255, 146, 127, 255),
                          size: 32.0,
                        ),
                      ),
                    ),
                  ]),
                  Column(children: [
                    Column(children: [
                      Row(children: [
                        Column(children: const [
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              'İSTANBUL / PENDİK',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                        ]),
                      ]),
                      Row(children: [
                        Container(
                          color: const Color.fromARGB(255, 234, 234, 234),
                          child: const Align(
                            alignment: Alignment.center,
                            child: Text(
                              '• Karaağaç caddesi',
                              style: TextStyle(
                                  fontSize: 10.0,
                                  color: Color.fromARGB(255, 153, 153, 153)),
                            ),
                          ),
                        ),
                        Container(
                          color: const Color.fromARGB(255, 234, 234, 234),
                          child: const Align(
                            alignment: Alignment.center,
                            child: Text(
                              '• Alpin Sokak',
                              style: TextStyle(
                                  fontSize: 10.0,
                                  color: Color.fromARGB(255, 153, 153, 153)),
                            ),
                          ),
                        ),
                      ]),
                      Row(children: [
                        Container(
                          color: const Color.fromARGB(255, 234, 234, 234),
                          child: const Align(
                            alignment: Alignment.center,
                            child: Text(
                              '• No : 7 ',
                              style: TextStyle(
                                  fontSize: 10.0,
                                  color: Color.fromARGB(255, 153, 153, 153)),
                            ),
                          ),
                        ),
                        Container(
                          color: const Color.fromARGB(255, 234, 234, 234),
                          child: const Align(
                            alignment: Alignment.center,
                            child: Text(
                              '• Daire : 6 ',
                              style: TextStyle(
                                  fontSize: 10.0,
                                  color: Color.fromARGB(255, 153, 153, 153)),
                            ),
                          ),
                        ),
                      ]),
                    ]),
                  ]),
                ],
              ),
            ],
          ),
        ),
        Container(
          height: 120.0,
          width: MediaQuery.of(context).size.width * 100,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 234, 234, 234),
            border: Border.all(
                color: const Color.fromARGB(255, 234, 234, 234),
                width: 5.0,
                style: BorderStyle.solid),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
          ),
        ),
     


*/
