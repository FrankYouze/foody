import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyDialogBox extends StatelessWidget {
  const MyDialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    final Reference FoodImageRef =
        FirebaseStorage.instance.ref().child("FoodImages");
    final DatabaseReference foodDB =
        FirebaseDatabase.instance.ref().child("AddedFoods");
    final DatabaseReference drinksDB =
        FirebaseDatabase.instance.ref().child("AddedDrinks");

    final FoodNameCon = TextEditingController();
    final FoodPriceCon = TextEditingController();
    String ImageUrl = "";

    return AlertDialog(
      backgroundColor: Colors.green[100],
      content: Container(
        height: 340,
        width: 300,
        child: Column(
          children: [
            const Text(
              "ADD FOOD ITEM",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
              ),
              child: Center(
                child: IconButton(
                  onPressed: () async {
                    ImagePicker picker = ImagePicker();
                    XFile? imageFile =
                        await picker.pickImage(source: ImageSource.gallery);
                    print('${imageFile?.path}');
                    if (imageFile == null) return;

                    String uniqueName =
                        DateTime.now().microsecondsSinceEpoch.toString();
                    Reference newImage = FoodImageRef.child(uniqueName);

                    try {
                      await newImage.putFile(File(imageFile.path));
                      ImageUrl = await newImage.getDownloadURL();
                      print(ImageUrl);
                    } catch (error) {
                      print(error);
                    }
                  },
                  icon: const Icon(
                    Icons.camera,
                    size: 60,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: FoodNameCon,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                border: OutlineInputBorder(),
                hintText: "Add food/drink Name",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: FoodPriceCon,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                border: OutlineInputBorder(),
                hintText: "Add food/drink price",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MaterialButton(
                  onPressed: () async {
                    await foodDB.child(FoodNameCon.text).set({
                      "FoodPrice": FoodPriceCon.text,
                      "FoodImage": ImageUrl
                    });
                    FoodPriceCon.clear();
                    FoodNameCon.clear();
                  },
                  color: Colors.green,
                  child: const Text(
                    "FOOD",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                MaterialButton(
                  onPressed: () async {
                    await drinksDB.child(FoodNameCon.text).set({
                      "FoodPrice": FoodPriceCon.text,
                      "FoodImage": ImageUrl
                    });

                    FoodPriceCon.clear();
                    FoodNameCon.clear();
                  },
                  color: Colors.green,
                  child: const Text(
                    "DRINK",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
