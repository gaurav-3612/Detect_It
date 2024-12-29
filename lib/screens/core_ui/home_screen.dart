import 'dart:io';
import 'package:detect_it/components/curved_bar.dart';
import 'package:detect_it/components/my_drawer.dart';
import 'package:detect_it/main.dart';
import 'package:detect_it/screens/gallery_and_camera/album_screen.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:transparent_image/transparent_image.dart';

/*

Home Screen
-----------

This is the file where all the Albums will be shown.

It contains a Drawer in the app bar for some stuff like logout and all.

And will contain a navigation bar to navigate between different screens.


*/

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    requestPermission();
  }

  requestPermission() async {
    if (Platform.isIOS) {
      if (await Permission.photos.request().isGranted ||
          await Permission.storage.request().isGranted) {
        loadAllAlbum();
      }
    } else if (Platform.isAndroid) {
      if (await Permission.photos.request().isGranted ||
          await Permission.storage.request().isGranted &&
              await Permission.videos.request().isGranted) {
        loadAllAlbum();
      }
    }
  }

  List<Album> album = [];
  loadAllAlbum() async {
    album = await PhotoGallery.listAlbums();

    setState(() {
      album;
    });
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      drawer: MyDrawer(),
      appBar: AppBar(
        title: const Text(
          "Gallery",
          style: TextStyle(
            fontSize: 22,
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
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xfffad0c4),
                  Color(0xffffd1ff),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: mq.height * .015,
            ),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: .75,
              ),
              itemBuilder: (BuildContext context, int index) {
                Album albumName = album[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => AlbumScreen(album: albumName),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: SizedBox(
                          width: mq.width * .3,
                          height: mq.width * .3,
                          child: FadeInImage(
                            placeholder: MemoryImage(kTransparentImage),
                            image: AlbumThumbnailProvider(
                              album: albumName,
                              highQuality: true,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          albumName.name.toString(),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Count: ${albumName.count.toString()}",
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: album.length,
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CurvedBar(i: 0),
    );
  }
}
