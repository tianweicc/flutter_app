import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';
import 'dart:async';
import 'package:flutter/services.dart';

//import 'package:multi_image_picker/asset.dart';
//import 'package:multi_image_picker/multi_image_picker.dart';

class HomeScreen extends StatefulWidget {
  @override
  _LoadImageDemoState createState() => _LoadImageDemoState();
}

class _LoadImageDemoState extends State<HomeScreen> {
  // 声明一个list，存放image Widget
  List<Widget> imageList = List();
  List<String> list = List.generate(20, (index) => "This is number $index");

  @override
  void initState() {
    imageList
      ..add(Image.network(
        'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2726034926,4129010873&fm=26&gp=0.jpg',
        fit: BoxFit.fill,
      ))
      ..add(Image.network(
        'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3485348007,2192172119&fm=26&gp=0.jpg',
        fit: BoxFit.fill,
      ))
      ..add(Image.network(
        'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2594792439,969125047&fm=26&gp=0.jpg',
        fit: BoxFit.fill,
      ))
      ..add(Image.network(
        'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=190488632,3936347730&fm=26&gp=0.jpg',
        fit: BoxFit.fill,
      ));
    super.initState();
  }

//  List<Asset> images = List<Asset>();
//  String _error;
//
//
//  Future<void> loadAssets() async {
//    setState(() {
//      images = List<Asset>();
//    });
//    List resultList;
//    try {
//      resultList = await MultiImagePicker.pickImages(maxImages: 300);
//    } on PlatformException catch (e) {
//      _error = e.message;
//    }
//    if (!mounted);
//
//    setState(() {
//      images = resultList;
//      if (_error == null) {
//        _error = 'No Error Dectected';
//      }
//    });
//  }
//
//  Widget builtImage(Asset asset){
//    if (asset.thumbData != null) {
//      return Image.memory(
//        asset.thumbData.buffer.asUint8List(),
//        fit: BoxFit.cover,
//        gaplessPlayback: true,
//      );
//    }
//    return Container();
//  }
//
//  void _loadImage(Asset asset) async {
//    await asset.requestThumbnail(300, 300);
//    setState(() {});
//  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onBackPressed(context),
      child: new Scaffold(
          appBar: new AppBar(
            title: Text('首页'),
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.search, size: 30.0),
                  onPressed: () => showSearch(
                      context: context, delegate: SearchBarDelegate())),
            ],
          ),
          body: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 180.0,
                child: Swiper(
                  itemCount: 4,
                  itemBuilder: _swiperBuilder,
                  pagination: SwiperPagination(
                      // 远点位置控制
//                        alignment: Alignment.bottomRight,
//                        margin: const EdgeInsets.fromLTRB(0, 0, 20, 10),
                      builder: DotSwiperPaginationBuilder(
                          color: Colors.black54,
                          activeColor: ColorUtil.color('#FF5E00'))),
                  controller: SwiperController(),
                  scrollDirection: Axis.horizontal,
                  autoplay: true,
                  onTap: (index) => print('点击了第$index'),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        key: Key(list[index]),
                        direction: DismissDirection.endToStart,
                        child: ListTile(
                          title: Text('${list[index]}'),
                        ),
                        background: Container(
                          color: ColorUtil.color('#FF5E00'),
                        ),
                        onDismissed: (direction) {
                          setState(() {
                            Scaffold.of(context).showSnackBar(
                                SnackBar(content: Text("${list[index]}")));
                            list.removeAt(index);
                          });
                        },
                      );
                    }),
              )
            ],
          )

//        body: ListView.builder(
//            itemCount: images.length,
//            itemBuilder: (context, index){
//              _loadImage(images[index]);
//              return builtImage(images[index]);
//            }),
//        floatingActionButton: FloatingActionButton(
//          onPressed: loadAssets,
//          child: Icon(Icons.image),
//        ),
          ),
    );
  }

  //ListView的Item
//  Widget buildItem(BuildContext context, int index) {
//    return new Text("xhu_ww");
//  }

  Widget _swiperBuilder(BuildContext context, int index) {
    return (imageList[index]);
  }

  // 退出登录做提示警告
  Future<bool> _onBackPressed(context) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('你确定要退出app吗?'),
              actions: <Widget>[
                FlatButton(
                  child: Text('No'),
                  onPressed: () => Navigator.pop(context, false),
                ),
                FlatButton(
                  child: Text('Yes'),
                  onPressed: () => Navigator.pop(context, true),
                ),
              ],
            ));
  }
}

class SearchBarDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear), onPressed: () => query = "")];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () => close(context, null));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: Container(
        width: 400.0,
        height: 100.0,
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: Text(
            query,
            style: TextStyle(color: Colors.deepOrange, fontSize: 20.0),
          ),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Container();
  }
}
