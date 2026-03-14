import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {

  File? selectedImage;
  final ImagePicker picker = ImagePicker();

  Future pickImage() async {
    final XFile? image =
    await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }

  void removeImage() {
    setState(() {
      selectedImage = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, size: 24),
        ),
        backgroundColor: Color(0xFFF9F8F6),
        elevation: 0,
      ),

      body: Container(
        color: Color(0xFFF9F8F6),
        padding: EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// profile row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Row(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundImage: AssetImage("images/mypic.jpg"),
                    ),

                    SizedBox(width: 12),

                    Text(
                      "Steve Amgad",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                MaterialButton(
                  color: Color(0xFFC9B59C),
                  height: 45,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  onPressed: pickImage,
                  child: Row(
                    children: [
                      Text(
                        "Add Picture",
                        style: TextStyle(
                          color: Color(0xFF6B6B6B),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.photo_library_outlined,
                        color: Color(0xFF6B6B6B),
                        size: 24,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            /// post text field
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Color(0xFFF6F0EB),
                borderRadius: BorderRadius.circular(16),
              ),
              child: TextField(
                minLines: 5,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: "What's on your mind?",
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: Color(0xFF8B8987)
                  )
                ),
              ),
            ),

            SizedBox(height: 20),

            /// image preview
            if (selectedImage != null)
              Stack(
                children: [

                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.file(
                      selectedImage!,
                      width: double.infinity,
                      height: 220,
                      fit: BoxFit.cover,
                    ),
                  ),

                  Positioned(
                    right: 10,
                    top: 10,
                    child: GestureDetector(
                      onTap: removeImage,
                      child: CircleAvatar(
                        backgroundColor: Colors.black54,
                        child: Icon(Icons.close, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        color: Color(0xFFF9F8F6),
        child: SizedBox(
          width: double.infinity,
          height: 70,
          child: ElevatedButton(
            onPressed: () {
              // هنا هتبعت البوست للـ API
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFC9B59C),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
            ),
            child: Text(
              "Post",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w900,
                color: Color(0xFF6B6B6B),
              ),
            ),
          ),
        ),
      ),

    );
  }
}
