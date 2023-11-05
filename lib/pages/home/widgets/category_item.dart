import 'package:cloud_storage_ui/pages/home/model/category_model.dart';
import 'package:flutter/material.dart';

class CategoryItems extends StatelessWidget {
  final CategoryModel category;

  const CategoryItems({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.black.withOpacity(.1),
          )
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 50,
            width: 50,
            child: Stack(
              children: [
                Image.asset("assets/images/plane_folder.png"),
                Positioned(
                  bottom: 7,
                  left: 3,
                  child: SizedBox(
                    height: 20,
                    width: 20,
                    child: Image.asset(
                      category.icon,
                      // color: Colors.blue,
                    ),
                  ),
                )
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                category.title,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                '${category.totalItems} Items',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 12,
                      color: Colors.grey[500],
                    ),
              )
            ],
          )
        ],
      ),
    );
  }
}
