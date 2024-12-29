import 'package:detect_it/main.dart';
import 'package:detect_it/screens/gallery_and_camera/view_picture_screen.dart';
import 'package:flutter/material.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:transparent_image/transparent_image.dart';

/*

Album Screen
------------

This is the file inside the albums.
The navigation bar is removed from this screen and can navigate back to Home Screen.
And also on clicking on the image you can expand the image and find information about the image.


*/

class AlbumScreen extends StatefulWidget {
  final Album album;

  const AlbumScreen({super.key, required this.album});
  @override
  State<AlbumScreen> createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  @override
  void initState() {
    super.initState();

    loadMediaFiles();
  }

  List<Medium> mediaList = [];

  loadMediaFiles() async {
    MediaPage mediaPage = await widget.album.listMedia();

    mediaList = mediaPage.items;

    setState(() {
      mediaList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      appBar: AppBar(
        title: Text(
          widget.album.name.toString(),
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xfffad0c4),
                Color(0xffff9a9e),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (BuildContext context, int index) {
          Medium medium = mediaList[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ViewPictureScreen(
                    medium,
                  ),
                ),
              );
            },
            child: Padding(
              padding: EdgeInsets.only(top: mq.width * .03),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: SizedBox(
                      width: mq.width * .3,
                      height: mq.width * .3,
                      child: FadeInImage(
                        placeholder: MemoryImage(kTransparentImage),
                        image: ThumbnailProvider(
                          mediumId: medium.id,
                          mediumType: medium.mediumType,
                          highQuality: true,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: mediaList.length,
      ),
    );
  }
}
