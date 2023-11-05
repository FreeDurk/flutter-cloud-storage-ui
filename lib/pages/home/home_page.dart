import 'package:cloud_storage_ui/pages/home/model/category_model.dart';
import 'package:cloud_storage_ui/pages/home/model/storage_type_model.dart';
import 'package:cloud_storage_ui/pages/home/widgets/category_item.dart';
import 'package:cloud_storage_ui/pages/home/widgets/drawer.dart';
import 'package:cloud_storage_ui/pages/home/widgets/greetings.dart';
import 'package:cloud_storage_ui/pages/home/widgets/header.dart';
import 'package:cloud_storage_ui/pages/home/widgets/storage_type.dart';

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final panelController = PanelController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    List<CategoryModel> categoriesItems = [
      CategoryModel(
        title: 'Pictures',
        totalItems: 20,
        icon: "assets/images/jpeg.png",
      ),
      CategoryModel(
        title: 'Videos',
        totalItems: 13,
        icon: "assets/images/mp4.png",
      ),
      CategoryModel(
        title: 'My Files',
        totalItems: 32,
        icon: "assets/images/docs.png",
      ),
      CategoryModel(
        title: 'Apps',
        totalItems: 13,
        icon: "assets/images/apk.png",
      )
    ];

    List<StorageTypeModel> types = [
      StorageTypeModel(
        icon: 'assets/images/folder.png',
        maxSpace: 100,
        storageType: 'File Box',
        useSpace: 12.3,
        color: Colors.red.shade400,
      ),
      StorageTypeModel(
        icon: 'assets/images/google-drive.png',
        maxSpace: 100,
        storageType: 'G Drive',
        useSpace: 43.23,
        color: Colors.blue,
      ),
      StorageTypeModel(
        icon: 'assets/images/onedrive.png',
        maxSpace: 200,
        storageType: 'OneDrive',
        useSpace: 190,
        color: Colors.blue.shade200,
      ),
    ];

    return Scaffold(
      bottomNavigationBar: bottonNav(),
      drawer: Drawer(
        width: width * 0.75,
        child: const AppDrawer(),
      ),
      body: SlidingUpPanel(
        controller: panelController,
        backdropColor: Colors.transparent,
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.black.withOpacity(.1),
          )
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(
            25,
          ),
        ),
        parallaxEnabled: true,
        parallaxOffset: 0.9,
        minHeight: height * 0.13,
        maxHeight: height * 0.30,
        panelBuilder: (controller) => Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  panelController.isPanelClosed
                      ? panelController.close()
                      : panelController.open();
                },
                child: Container(
                  height: 5,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade300,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: categories(controller, categoriesItems),
              ),
            ],
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            stackWidget(height, types),
            Container(
              margin: const EdgeInsets.only(left: 30, right: 30, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Categories",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        "Total 22 files",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Colors.black.withOpacity(0.6), fontSize: 14),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "View All",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Colors.red.shade600,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded categories(ScrollController controller, categoriesItems) {
    return Expanded(
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
          childAspectRatio: 2 / 1,
        ),
        padding: const EdgeInsets.all(16),
        itemCount: categoriesItems.length,
        itemBuilder: (context, index) {
          CategoryModel category = categoriesItems[index];

          return CategoryItems(category: category);
        },
      ),
    );
  }

  Container bottonNav() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(36),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.black.withOpacity(.1),
          )
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(1),
          child: GNav(
            haptic: false,
            rippleColor: Colors.grey[300]!,
            hoverColor: Colors.grey[100]!,
            gap: 8,
            activeColor: Colors.black,
            iconSize: 23,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            duration: const Duration(milliseconds: 400),
            tabBackgroundColor: Colors.grey[100]!,
            color: Colors.black,
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.add,
                text: 'Add Storage',
              ),
              GButton(
                icon: Icons.folder,
                text: 'Private',
              ),
              GButton(
                icon: Icons.settings,
                text: 'Settings',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Stack stackWidget(double height, List<StorageTypeModel> types) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: height * 0.66,
          // decoration: BoxDecoration(
          //   color: Colors.black,
          // ),
        ),
        Container(
          height: height * 0.49,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(45),
              bottomRight: Radius.circular(45),
            ),
            color: Colors.black,
          ),
        ),
        const Header(isHomePage: false),
        const Positioned(
          top: 110,
          child: Greetings(),
        ),
        Positioned(
          top: 270,
          left: 0,
          right: 0,
          child: storageType(height, types),
        ),
      ],
    );
  }

  SizedBox storageType(double height, List<StorageTypeModel> types) {
    return SizedBox(
      height: height * 0.35,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: types.length,
        itemBuilder: (context, index) {
          StorageTypeModel currentType = types[index];

          return Padding(
            padding: const EdgeInsets.only(left: 25),
            child: StorageType(type: currentType),
          );
        },
      ),
    );
  }
}
