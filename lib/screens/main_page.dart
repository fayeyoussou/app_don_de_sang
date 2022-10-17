import 'package:bda_app/screens/article_over_view.dart';
import 'package:bda_app/screens/filtre_article.dart';
import 'package:bda_app/widget/nav_bar.dart';
import 'package:bda_app/widget/other_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../config/constante.dart';

import '../providers/list_article_provider.dart';
import '../widget/custom_circular_progress.dart';

///  Created by youssouphafaye on 10/12/22.
class MainPage extends StatefulWidget {
  static String route = "/";
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int _index = 0;

  @override
  Widget build(BuildContext context) {

    List<Widget> widgets = [
      ArticleOverView(key:UniqueKey()),
      FiltreArticle(key: UniqueKey(),),
      OtherScreen(key: UniqueKey(),)
    ];
    // _imageFromCamera () async {
    //   XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 50);
    //   if(image !=null){
    //     // print(image.path);
    //     setState(() {
    //       _image = File(image.path);
    //
    //
    //     });
    //     var request = http.MultipartRequest("POST",Uri.parse("http://127.0.0.1:8080/api/test/upload"));
    //     request.fields['prenom']="youssoupha";
    //     request.headers['Authorization']="eav4eyt24b6lkrdgegnwzz7finrrfskcaismplzdfn6le8r1klxoyx4o0smu";
    //     // var file = http.MultipartFile.fromBytes('file',_image!.readAsBytesSync(),filename: image.path);
    //     var file = await http.MultipartFile.fromPath("file", image.path);
    //     request.files.add(file);
    //     var response = await request.send();
    //     var responseData = await response.stream.toBytes();
    //     var res = String.fromCharCodes(responseData);
    //     print(res);
    //   }
    // }
    return Container(
      color: Constante.primary,
      child: SafeArea(
        top: false,
        child: ClipRect(
          child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              extendBody: true,
              extendBodyBehindAppBar: true,
              bottomNavigationBar: NavBar(icons:
              const [
                FaIcon(FontAwesomeIcons.newspaper),
                FaIcon(FontAwesomeIcons.searchengin),
                FaIcon(FontAwesomeIcons.message),
              ],
                  whenTap: (index){
                setState(() {
                  _index = index;
                });
              }),

              body: Consumer<ListArticleProvider>(
                builder: (conte,listArt,ch){
                  return AnimatedSwitcher(
                      transitionBuilder: (Widget child,Animation<double> animation)=>ScaleTransition(scale: animation,child: child,),
                      duration: const Duration(milliseconds: 500),
                      child: listArt.loaded ? widgets[_index]  : ch
                  );
                },
                child:  CustomCircularProgress(key: UniqueKey(),),
              ),drawer: const Drawer(),
          ),
        ),
      ),
    );
  }
}


