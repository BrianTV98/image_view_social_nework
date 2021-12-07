import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_social_network/self.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ImagePicker _picker = ImagePicker();

  List<XFile> images = [];

  @override
  Widget build(BuildContext context) {
    List<List<String>> urls = [
      [
        "https://scontent.fsgn3-1.fna.fbcdn.net/v/t31.18172-8/28238554_1551260238261341_7261728157656577302_o.jpg?_nc_cat=104&ccb=1-5&_nc_sid=730e14&_nc_ohc=Th9dfwQfX10AX_TDdAC&_nc_ht=scontent.fsgn3-1.fna&oh=e502e9d7767f9d7a1cd0adc58c9068fb&oe=618A2295"
      ],
      [
        "https://scontent.fsgn3-1.fna.fbcdn.net/v/t31.18172-8/28238554_1551260238261341_7261728157656577302_o.jpg?_nc_cat=104&ccb=1-5&_nc_sid=730e14&_nc_ohc=Th9dfwQfX10AX_TDdAC&_nc_ht=scontent.fsgn3-1.fna&oh=e502e9d7767f9d7a1cd0adc58c9068fb&oe=618A2295",
        "https://scontent.fsgn13-2.fna.fbcdn.net/v/t31.18172-8/19983498_1388385114582536_2133733639948065904_o.jpg?_nc_cat=109&ccb=1-5&_nc_sid=8bfeb9&_nc_ohc=sRVriOwV3ZcAX-LwjKI&_nc_ht=scontent.fsgn13-2.fna&oh=1bc03a4ca339e68eae7272943ce6ebb7&oe=618C55D2",
      ],
      [
        "https://scontent.fsgn3-1.fna.fbcdn.net/v/t31.18172-8/28238554_1551260238261341_7261728157656577302_o.jpg?_nc_cat=104&ccb=1-5&_nc_sid=730e14&_nc_ohc=Th9dfwQfX10AX_TDdAC&_nc_ht=scontent.fsgn3-1.fna&oh=e502e9d7767f9d7a1cd0adc58c9068fb&oe=618A2295",
        "https://scontent.fsgn13-2.fna.fbcdn.net/v/t31.18172-8/19983498_1388385114582536_2133733639948065904_o.jpg?_nc_cat=109&ccb=1-5&_nc_sid=8bfeb9&_nc_ohc=sRVriOwV3ZcAX-LwjKI&_nc_ht=scontent.fsgn13-2.fna&oh=1bc03a4ca339e68eae7272943ce6ebb7&oe=618C55D2",
        "https://scontent.fsgn13-2.fna.fbcdn.net/v/t31.18172-8/19250717_795356747293856_4839342811091720692_o.jpg?_nc_cat=109&ccb=1-5&_nc_sid=730e14&_nc_ohc=2Elbpwt96CIAX8um4eh&_nc_ht=scontent.fsgn13-2.fna&oh=b7042ce4bace2128d40a46bf0f104ed5&oe=618BC547"
      ],
      [
        "https://scontent.fsgn3-1.fna.fbcdn.net/v/t31.18172-8/28238554_1551260238261341_7261728157656577302_o.jpg?_nc_cat=104&ccb=1-5&_nc_sid=730e14&_nc_ohc=Th9dfwQfX10AX_TDdAC&_nc_ht=scontent.fsgn3-1.fna&oh=e502e9d7767f9d7a1cd0adc58c9068fb&oe=618A2295",
        "https://scontent.fsgn13-2.fna.fbcdn.net/v/t31.18172-8/19983498_1388385114582536_2133733639948065904_o.jpg?_nc_cat=109&ccb=1-5&_nc_sid=8bfeb9&_nc_ohc=sRVriOwV3ZcAX-LwjKI&_nc_ht=scontent.fsgn13-2.fna&oh=1bc03a4ca339e68eae7272943ce6ebb7&oe=618C55D2",
        "https://scontent.fsgn13-2.fna.fbcdn.net/v/t31.18172-8/19250717_795356747293856_4839342811091720692_o.jpg?_nc_cat=109&ccb=1-5&_nc_sid=730e14&_nc_ohc=2Elbpwt96CIAX8um4eh&_nc_ht=scontent.fsgn13-2.fna&oh=b7042ce4bace2128d40a46bf0f104ed5&oe=618BC547",
        "https://scontent.fsgn13-2.fna.fbcdn.net/v/t1.18169-9/17800242_796323540519849_3142022980555939240_n.jpg?_nc_cat=106&ccb=1-5&_nc_sid=8bfeb9&_nc_ohc=utnZO3n21aQAX_PdWMC&_nc_ht=scontent.fsgn13-2.fna&oh=ec206cd5f68098b2e3b9b867f736f2f9&oe=618BE8CF"
      ],
      [
        "https://scontent.fsgn3-1.fna.fbcdn.net/v/t31.18172-8/28238554_1551260238261341_7261728157656577302_o.jpg?_nc_cat=104&ccb=1-5&_nc_sid=730e14&_nc_ohc=Th9dfwQfX10AX_TDdAC&_nc_ht=scontent.fsgn3-1.fna&oh=e502e9d7767f9d7a1cd0adc58c9068fb&oe=618A2295",
        "https://scontent.fsgn13-2.fna.fbcdn.net/v/t31.18172-8/19983498_1388385114582536_2133733639948065904_o.jpg?_nc_cat=109&ccb=1-5&_nc_sid=8bfeb9&_nc_ohc=sRVriOwV3ZcAX-LwjKI&_nc_ht=scontent.fsgn13-2.fna&oh=1bc03a4ca339e68eae7272943ce6ebb7&oe=618C55D2",
        "https://scontent.fsgn13-2.fna.fbcdn.net/v/t31.18172-8/19250717_795356747293856_4839342811091720692_o.jpg?_nc_cat=109&ccb=1-5&_nc_sid=730e14&_nc_ohc=2Elbpwt96CIAX8um4eh&_nc_ht=scontent.fsgn13-2.fna&oh=b7042ce4bace2128d40a46bf0f104ed5&oe=618BC547",
        "https://scontent.fsgn13-2.fna.fbcdn.net/v/t1.18169-9/17800242_796323540519849_3142022980555939240_n.jpg?_nc_cat=106&ccb=1-5&_nc_sid=8bfeb9&_nc_ohc=utnZO3n21aQAX_PdWMC&_nc_ht=scontent.fsgn13-2.fna&oh=ec206cd5f68098b2e3b9b867f736f2f9&oe=618BE8CF",
        "https://scontent.fsgn8-2.fna.fbcdn.net/v/t31.18172-8/17218423_739007036262161_564737661620454405_o.jpg?_nc_cat=110&ccb=1-5&_nc_sid=730e14&_nc_ohc=3XRBlj49OR4AX_NC8Tq&_nc_ht=scontent.fsgn8-2.fna&oh=1eaa373c2dd52d9e21f08f1b61f8683f&oe=618A7DE0"
      ],
      [
        "https://scontent.fsgn3-1.fna.fbcdn.net/v/t31.18172-8/28238554_1551260238261341_7261728157656577302_o.jpg?_nc_cat=104&ccb=1-5&_nc_sid=730e14&_nc_ohc=Th9dfwQfX10AX_TDdAC&_nc_ht=scontent.fsgn3-1.fna&oh=e502e9d7767f9d7a1cd0adc58c9068fb&oe=618A2295",
        "https://scontent.fsgn13-2.fna.fbcdn.net/v/t31.18172-8/19983498_1388385114582536_2133733639948065904_o.jpg?_nc_cat=109&ccb=1-5&_nc_sid=8bfeb9&_nc_ohc=sRVriOwV3ZcAX-LwjKI&_nc_ht=scontent.fsgn13-2.fna&oh=1bc03a4ca339e68eae7272943ce6ebb7&oe=618C55D2",
        "https://scontent.fsgn13-2.fna.fbcdn.net/v/t31.18172-8/19250717_795356747293856_4839342811091720692_o.jpg?_nc_cat=109&ccb=1-5&_nc_sid=730e14&_nc_ohc=2Elbpwt96CIAX8um4eh&_nc_ht=scontent.fsgn13-2.fna&oh=b7042ce4bace2128d40a46bf0f104ed5&oe=618BC547",
        "https://scontent.fsgn13-2.fna.fbcdn.net/v/t1.18169-9/17800242_796323540519849_3142022980555939240_n.jpg?_nc_cat=106&ccb=1-5&_nc_sid=8bfeb9&_nc_ohc=utnZO3n21aQAX_PdWMC&_nc_ht=scontent.fsgn13-2.fna&oh=ec206cd5f68098b2e3b9b867f736f2f9&oe=618BE8CF",
        "https://scontent.fsgn8-2.fna.fbcdn.net/v/t31.18172-8/17218423_739007036262161_564737661620454405_o.jpg?_nc_cat=110&ccb=1-5&_nc_sid=730e14&_nc_ohc=3XRBlj49OR4AX_NC8Tq&_nc_ht=scontent.fsgn8-2.fna&oh=1eaa373c2dd52d9e21f08f1b61f8683f&oe=618A7DE0",
        "https://scontent.fsgn8-1.fna.fbcdn.net/v/t31.18172-8/16299782_714952955334236_1415676766591471954_o.jpg?_nc_cat=102&ccb=1-5&_nc_sid=730e14&_nc_ohc=ZkMUTfrhbwgAX8kIn6-&tn=PPoQqcazfWPNTNjE&_nc_ht=scontent.fsgn8-1.fna&oh=e88e7aea693fdb30ce86bf944b99b6a3&oe=618CAE5E"
      ],
    ];

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                    itemCount: urls.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ImageSocialNetwork(
                        urls: urls[index],
                      );
                    }),
                ImageLocal(
                  files: images,
                  onDelete: (index) {
                    images.removeAt(index);
                    setState(() {});
                  },
                ),
                IconButton(onPressed: () => pickImage(), icon: Icon(Icons.add))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void pickImage() async {
    List<File>? files = await _picker.pickMultiImage();
    if (files != null) images.addAll(files);
    debugPrint(files?.length.toString());
    setState(() {});
  }
}
