import 'package:flutter/material.dart';
import 'package:pickapp/core/get_screen_size_ext.dart';
import 'package:pickapp/services/auth.services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  bool isSwitched = false;
  int selectedCar = 0;

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
            ElevatedButton(
              onPressed: () {
                authService.logout(context: context);
              },
              child: const Text("Logout"),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
      height: context.dynamicWidth(0.75),
      padding: EdgeInsets.symmetric(
          vertical: context.dynamicWidth(0.05),
          horizontal: context.dynamicWidth(0.075)),
      width: context.dynamicWidth(1),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: Colors.white),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text("Araç Seçiniz",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [for (int i = 0; i < 4; i++) buildCarIcon(i)],
        ),
        const SizedBox(height: 10),
        const Text(
          "Teslimat",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        const SizedBox(height: 5),
        buildTeslimatInfo(),
        const SizedBox(height: 10),
      ]),
    );
  }

  Widget buildTeslimatInfo() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: Colors.purple, borderRadius: BorderRadius.circular(10)),
      child: Row(children: [
        const Spacer(),
        Expanded(
          flex: 15,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Nereden", style: TextStyle(color: Colors.white)),
                SizedBox(height: 5),
                Text("Bursa caddesi bilmem ne adresi nedir bu",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
        const Spacer(),
        Expanded(
          flex: 15,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Nereye", style: TextStyle(color: Colors.white)),
                SizedBox(height: 5),
                Text("Bursa caddesi bilmem ne adresi nedir bu",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
        const Spacer(),
      ]),
    );
  }

  Widget buildCarIcon(int index) {
    return GestureDetector(
      onTap: () => setState(() => selectedCar = index),
      child: Container(
          width: context.dynamicWidth(0.15),
          height: context.dynamicWidth(0.15),
          decoration: BoxDecoration(
              color: selectedCar == index ? Colors.purple : Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color:
                      selectedCar == index ? Colors.transparent : Colors.grey)),
          child: const Icon(Icons.car_crash)),
    );
  }
}
