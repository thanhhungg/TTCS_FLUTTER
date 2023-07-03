import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'create_medicine.dart';
import 'list_image.dart';
import 'request_album_assets.dart';
import 'request_albums.dart';

class PickVideoPhoto extends StatefulWidget {
  PickVideoPhoto({super.key});

  @override
  State<PickVideoPhoto> createState() => _PickVideoPhotoState();
}

class _PickVideoPhotoState extends State<PickVideoPhoto> {
  final _controller2 = PageController(viewportFraction: 0.9);
//CHECK LOADING STATUS
  bool isLoading = false;

  @override
  void initState() {
    //RETRIEVE MEDIA WHEN THIS SCREEN IS OPENED
    getVideoPhoto(RequestType.common);
    super.initState();
  }

  //RETRIEVE MEDIA FOR THE FIRST ALBUM
  AssetPathEntity? currentAlbum;

  //HOLD RETRIEVED ASSETS
  List<AssetEntity> assets = [];

  //STORE SELECTED ASSETS
  // final List<AssetEntity> selectedAssets = [];

  List<AssetPathEntity> albums = [];
  getVideoPhoto(RequestType type) async {
    setState(() {
      isLoading = true;
    });
    //CHECK IF STORAGE PERMISSION IS GRANTED
    final PermissionState ps = await PhotoManager.requestPermissionExtend();
    if (ps.isAuth == false) {
      await PhotoManager.openSetting();
    } else {
      //NOW GET ALBUMS THAT HAVE MEDIA IN THEM THEN GET ALL MEDIA IN THEM
      await requestAlbums(type).then(
        (allAlbums) async {
          setState(() {
            albums = allAlbums;
            currentAlbum = allAlbums.first;
          });
          //GET MEDIA FOR THE FIRST ALBUM
          if (currentAlbum != null) {
            await requestAlbumAssets(currentAlbum!).then(
              (allAssets) {
                setState(() {
                  assets = allAssets;
                  //STOP LOADING
                  if (assets.isNotEmpty) {
                    isLoading = false;
                  }
                });
              },
            );
          }
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(

      //   toolbarHeight: 10,
      //   centerTitle: true,
      //   //REDUCE APPBAR ELEVATION
      //   elevation: 0,
      //   backgroundColor: Colors.white,
      //   title: Container(
      //     height: 3,
      //     width: 40,
      //     color: Colors.grey,
      //   ),
      // ),
      //DISPLAY THE ASSETS OF THE CURRENT ALBUM
      body: Column(
        children: [
          Container(
            height: 3,
            width: 40,
            color: Colors.grey,
          ),
          SizedBox(
            height: 5,
          ),
          if (assets.isEmpty && isLoading == false)
            const Flexible(
              child: Center(
                child: Text("Album is empty"),
              ),
            ),
          if (isLoading == true)
            const Flexible(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          if (assets.isNotEmpty)
            Flexible(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: GridView.custom(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  childrenDelegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final entity = assets[index];
                      return GestureDetector(
                        onTap: () {
                          if (selectedAssets.contains(entity)) {
                            setState(() {
                              selectedAssets.remove(entity);
                            });
                          } else {
                            setState(() {
                              selectedAssets.add(entity);
                            });
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(1),
                          child: assetMediaWidget(entity, selectedAssets),
                        ),
                      );
                    },
                    childCount: assets.length,
                  ),
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    // width: 92,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: Color.fromRGBO(242, 242, 242, 1),
                    ),
                    child: Text(
                      'Đóng',
                      style: TextStyle(
                          fontFamily: 'SFPRODISPLAYBOLD', fontSize: 15),
                    ),
                  ),
                ),
                SizedBox(
                  width: 160,
                ),
                InkWell(
                  onTap: () {
                    if (selectedAssets.isNotEmpty) {
                      Navigator.pop(context);
                      showDialog(
                          context: context,
                          builder: (context) => DialogPage(
                                h: MediaQuery.of(context).size.height,
                                controller2: _controller2,
                                w: MediaQuery.of(context).size.width,
                              ));
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                    // width: 120,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: Colors.deepOrange[400],
                    ),
                    child: Text(
                      'Tiếp tục (${selectedAssets.length})',
                      style: TextStyle(
                          fontFamily: 'SFPRODISPLAYBOLD',
                          fontSize: 15,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  //ASSET MEDIA DISPLAY WIDGET
  Widget assetMediaWidget(entity, selectedAssets) => Stack(
        children: [
          Positioned.fill(
            child: AssetEntityImage(
              entity,
              isOriginal: false,
              thumbnailSize: const ThumbnailSize.square(250),
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  child: Icon(
                    Icons.error,
                    color: Colors.black38,
                  ),
                );
              },
            ),
          ),
          if (entity.type == AssetType.video)
            const Positioned.fill(
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Icon(
                    Icons.video_call,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          //ADD AN ICON FOR SELECTED ASSETS
          if (selectedAssets.contains(entity))
            Positioned.fill(
              child: Container(
                color: Colors.blueAccent.withOpacity(0.3),
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                ),
              ),
            ),
        ],
      );
}
