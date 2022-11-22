import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<ImageModel> createdList = [];
  String searchData = "";
  int selectIndex = 0;
  @override
  void initState() {
    super.initState();
    createListMethod("All");
  }

  void createListMethod(String category) {
    switch (category) {
      case "All":
        setState(() {
          createdList = data;
        });
        break;
      case "Bird":
        setState(() {
          createdList =
              data.where((element) => element.category == "Bird").toList();
        });
        break;
      case "Food":
        setState(() {
          createdList =
              data.where((element) => element.category == "Food").toList();
        });
        break;
      case "River":
        setState(() {
          createdList =
              data.where((element) => element.category == "River").toList();
        });
        break;
      case "Flower":
        setState(() {
          createdList =
              data.where((element) => element.category == "Flower").toList();
        });
        break;
      case "Sky":
        setState(() {
          createdList =
              data.where((element) => element.category == "Sky").toList();
        });
        break;
      default:
        setState(() {
          createdList = [];
        });
    }
  }

  String capitalizeValue(String value) {
    var result = value[0].toUpperCase();
    if (value.length > 1) {
      result = result + value.substring(1).toLowerCase();
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            /****** Search filter *******/
            SizedBox(
              height: 56,
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    selectIndex = 0;
                    searchData = value;
                  });
                  if (value.isNotEmpty) {
                    String capitalizedValue = capitalizeValue(value);
                    createListMethod(capitalizedValue);
                  } else {
                    createListMethod("All");
                  }
                },
                decoration: InputDecoration(
                  hintText: "Search Category",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 80,
              child: searchData.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text("Search result for '$searchData'",
                          style: const TextStyle(
                              fontSize: 18, color: Colors.black)),
                    )
                  //Tab bar can be used here but the custom implementation better suits the requirement
                  : ListView.builder(
                      itemCount: categoryList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  selectIndex = index;
                                });
                                createListMethod(categoryList[index]);
                              },
                              child: Text(
                                categoryList[index],
                                style: const TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 4,
                              color: selectIndex == index
                                  ? Colors.black
                                  : Colors.white,
                              width: 50,
                            )
                          ],
                        );
                      }),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: createdList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: FittedBox(
                      child: Image.asset(createdList[index].image!),
                      fit: BoxFit.fill,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }

  List<String> categoryList = ["All", "Bird", "Food", "Flower", "River", "Sky"];

  List<ImageModel> data = [
    ImageModel(category: "Bird", image: "assets/images/bird1.jpeg"),
    ImageModel(category: "Food", image: "assets/images/food2.jpeg"),
    ImageModel(category: "River", image: "assets/images/river3.jpeg"),
    ImageModel(category: "Bird", image: "assets/images/bird3.jpeg"),
    ImageModel(category: "Flower", image: "assets/images/flower1.jpeg"),
    ImageModel(category: "Flower", image: "assets/images/flower2.jpeg"),
    ImageModel(category: "River", image: "assets/images/river2.jpeg"),
    ImageModel(category: "Flower", image: "assets/images/flower3.jpeg"),
    ImageModel(category: "Flower", image: "assets/images/flower5.jpeg"),
    ImageModel(category: "Food", image: "assets/images/food1.jpeg"),
    ImageModel(category: "Sky", image: "assets/images/sky2.jpeg"),
    ImageModel(category: "Food", image: "assets/images/food3.jpeg"),
    ImageModel(category: "Bird", image: "assets/images/bird2.jpeg"),
    ImageModel(category: "Bird", image: "assets/images/bird3.jpeg"),
    ImageModel(category: "Flower", image: "assets/images/flower2.jpeg"),
    ImageModel(category: "River", image: "assets/images/river1.jpeg"),
    ImageModel(category: "River", image: "assets/images/river4.jpeg"),
    ImageModel(category: "Sky", image: "assets/images/sky1.jpeg"),
    ImageModel(category: "Flower", image: "assets/images/flower4.jpeg"),
  ];
}

class ImageModel {
  ImageModel({
    this.category,
    this.image,
  });

  String? category;
  String? image;

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        category: json["category"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "image": image,
      };
}
