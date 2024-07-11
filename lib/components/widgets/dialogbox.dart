import 'dart:typed_data';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

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
     //Uint8List webFile = Uint8List(8);

    return AlertDialog(
      backgroundColor: Colors.grey[100],
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
                color: Colors.grey,
              ),
              child: Center(
                child: IconButton(
                  onPressed: () async {
                    ImagePicker picker = ImagePicker();
                    XFile? imageFile =
                        await picker.pickImage(source: ImageSource.gallery);

                    print('${imageFile?.path}');
                    if (imageFile == null) return;
                 var f = await imageFile.readAsBytes();
              //   var g = imageFile.fileBytes;
               //final html.File webFile = html.File(await imageFile.readAsBytes(), imageFile.name);

                    String uniqueName =
                        DateTime.now().microsecondsSinceEpoch.toString();
                    Reference newImage = FoodImageRef.child(uniqueName);


try{

await newImage.putData(f);
//await newImage.putFile(Image.memory(webFile));
 ImageUrl = await newImage.getDownloadURL();

}catch(e){


}






  //   try {
  //     String uniqueName = DateTime.now().microsecondsSinceEpoch.toString();
  //     Reference storageRef = FirebaseStorage.instance.ref().child('food_images').child(uniqueName);

  //     UploadTask uploadTask;
  //     if (kIsWeb) {
  //  // html.File webFile = await ImagePicker.platform.getImageFromSource(source: ImageSource.gallery) as html.File;
  //   Uint8List fileBytes = await imageFile.readAsBytes();
  //   uploadTask = storageRef.putData(fileBytes);
  //     } else {
  //     //  uploadTask = storageRef.putFile(File(imageFile.path));
  //     }

  //   //  await uploadTask.whenComplete(() async {
  //      // imageUrl = await storageRef.getDownloadURL();
  //      // print('Download URL: $imageUrl');
  // //    });
  //   } catch (error) {
  //     print('Error uploading file: $error');
  //   }








                   

                    // try {
                       
                    //   await newImage.putFile(Image.memory(webFile));
                    //   ImageUrl = await newImage.getDownloadURL();
                    //   print(ImageUrl);
                    // } catch (error) {
                    //   print(error);
                    // }
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
                    borderSide: BorderSide(color: Colors.grey)),
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
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                border: OutlineInputBorder(),
                hintText: "Add food/drink price (1000 /=)",
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
                    if (FoodNameCon.text == "" || FoodPriceCon.text == "")
                      return;
                    try {
                      await foodDB.child(FoodNameCon.text).set({
                        // "FoodName":FoodNameCon.text,
                        "FoodPrice": FoodPriceCon.text,
                        "FoodImage": ImageUrl
                      });
                    } catch (e) {
                      print(e);
                    }

                    FoodPriceCon.clear();
                    FoodNameCon.clear();
                  },
                  color: Colors.grey[700],
                  child: const Text(
                    "FOOD",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                MaterialButton(
                  onPressed: () async {
                    if (FoodNameCon.text == "" || FoodPriceCon.text == "")
                      return;
                    try {
                      await drinksDB.child(FoodNameCon.text).set({
                        "FoodPrice": FoodPriceCon.text,
                        "FoodImage": ImageUrl
                      });
                    } catch (e) {}

                    FoodPriceCon.clear();
                    FoodNameCon.clear();
                  },
                  color: Colors.grey[700],
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
