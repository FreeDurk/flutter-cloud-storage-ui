import 'package:cloud_storage_ui/pages/home/model/storage_type_model.dart';
import 'package:cloud_storage_ui/pages/storage/arguments/storage_arguments.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:slide_to_act/slide_to_act.dart';

class StorageType extends StatefulWidget {
  final StorageTypeModel type;
  const StorageType({
    super.key,
    required this.type,
  });

  @override
  State<StorageType> createState() => _StorageTypeState();
}

class _StorageTypeState extends State<StorageType> {
  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/storage',
          arguments: StorageArguments(widget.type),
        );
      },
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          color: widget.type.color,
          borderRadius: BorderRadius.circular(
            45,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
                        tag: widget.type.storageType,
                        child: Image.asset(
                          widget.type.icon,
                        ),
                      ),
                    ),
                    imageAsset()
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
              child: Text(
                widget.type.storageType,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            storageIndicator(),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${widget.type.useSpace} GB"),
                  Text("${widget.type.maxSpace} GB"),
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
    );
  }

  LinearPercentIndicator storageIndicator() {
    return LinearPercentIndicator(
      lineHeight: 10.0,
      percent: calculatePercentate(widget.type.useSpace, widget.type.maxSpace),
      backgroundColor: Colors.grey,
      progressColor: Colors.amber,
      barRadius: const Radius.circular(20),
    );
  }

  Padding slideButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13),
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

  InkWell imageAsset() {
    return InkWell(
      onTap: () {
        print(widget.type.storageType);
      },
      child: SizedBox(
        height: 50,
        width: 50,
        child: Image.asset(
          "assets/images/menu.png",
          color: Colors.white,
        ),
      ),
    );
  }

  double calculatePercentate(start, max) {
    return start / max * 100 / 100;
  }
}
