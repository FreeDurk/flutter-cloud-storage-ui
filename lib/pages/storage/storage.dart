import 'package:cloud_storage_ui/pages/home/widgets/header.dart';
import 'package:cloud_storage_ui/pages/storage/arguments/storage_arguments.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:slide_to_act/slide_to_act.dart';

class Storage extends StatefulWidget {
  const Storage({
    super.key,
  });

  @override
  State<Storage> createState() => _StorageState();
}

class _StorageState extends State<Storage> {
  @override
  Widget build(BuildContext context) {
    // print(widget.storageArguments.storageType.storageType);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final args = ModalRoute.of(context)!.settings.arguments as StorageArguments;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            // fit: StackFit.loose,
            children: [
              Container(
                height: height * 0.50,
                // color: Colors.blue,
              ),
              Container(
                height: height * 0.30,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(45),
                    bottomRight: Radius.circular(45),
                  ),
                  color: Colors.black,
                ),
              ),
              const Header(isHomePage: true),
              Positioned(
                bottom: 60,
                left: 45,
                child: Container(
                  height: height * 0.25,
                  width: width * 0.8,
                  decoration: BoxDecoration(
                    color: args.storageType.color,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Container(
                    width: 200,
                    decoration: BoxDecoration(
                      color: args.storageType.color,
                      borderRadius: BorderRadius.circular(
                        45,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          child: SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(15),
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(60),
                                    color: Colors.white.withOpacity(0.2),
                                  ),
                                  child: Hero(
                                    tag: args.storageType.storageType,
                                    child: Image.asset(
                                      args.storageType.icon,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 13, vertical: 10),
                                  child: Text(
                                    args.storageType.storageType,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25,
                                        ),
                                  ),
                                ),
                                imageAsset()
                              ],
                            ),
                          ),
                        ),
                        storageIndicator(args.storageType.useSpace,
                            args.storageType.maxSpace),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 13),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("${args.storageType.useSpace} GB"),
                              Text("${args.storageType.maxSpace} GB"),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        slideButton()
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "My Files",
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  "View All",
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(10),
                  height: 100,
                  width: width * 0.8,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 20,
                        color: Colors.black.withOpacity(0.1),
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          "assets/images/plane_folder.png",
                          height: 50,
                          width: 50,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Course Video",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: Colors.black,
                                    ),
                              ),
                              Text(
                                "1GB Junk file",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        color: Colors.grey[500], fontSize: 12),
                              ),
                              Text(
                                "Folder: 20 Items, Used: 20GB",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        color: Colors.grey[500], fontSize: 12),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  LinearPercentIndicator storageIndicator(double min, double max) {
    return LinearPercentIndicator(
      lineHeight: 10.0,
      percent: calculatePercentate(min, max),
      backgroundColor: Colors.grey,
      progressColor: Colors.amber,
      barRadius: const Radius.circular(20),
    );
  }

  Padding slideButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 13,
      ),
      child: SlideAction(
        outerColor: Colors.black.withOpacity(0.2),
        elevation: 0,
        sliderRotate: false,
        height: 50,
        text: '        Slide to clean',
        textStyle: const TextStyle(fontSize: 12),
        sliderButtonIconPadding: 10,
        sliderButtonIcon: Image.asset(
          "assets/images/delete.png",
          height: 20,
          width: 20,
        ),
      ),
    );
  }

  SizedBox imageAsset() {
    return SizedBox(
      height: 50,
      width: 50,
      child: Image.asset(
        "assets/images/menu.png",
        color: Colors.white,
      ),
    );
  }

  double calculatePercentate(start, max) {
    return start / max * 100 / 100;
  }
}
