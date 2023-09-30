

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Image.asset(
              "assets/images/cat.png",
              height: 300,
              width: 300,
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              title: Text("2".tr,
                  style:
                  TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              trailing: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  Get.offNamedUntil("home", (route) => false);
                },
                icon: Icon(
                  Icons.home,
                  color: Colors.purple,
                  size: 30,
                ),
              ),
            ),
            SizedBox(height: 10,),
            ListTile(
              title: Text("6".tr,
                  style:
                  TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              trailing: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, "setting");
                },
                icon: Icon(
                  Icons.settings,
                  color: Colors.purple,
                  size: 30,
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
