import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:instacop/src/helpers/TextStyle.dart';
import 'package:instacop/src/model/categogy.dart';
import 'package:instacop/src/helpers/colors_constant.dart';
import 'package:instacop/src/helpers/screen.dart';
import 'package:instacop/src/model/clothingSize.dart';
import 'package:instacop/src/widgets/button_raised.dart';
import 'package:instacop/src/widgets/input_text.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class ProductManager extends StatefulWidget {
  @override
  _ProductManagerState createState() => _ProductManagerState();
}

class _ProductManagerState extends State<ProductManager> {
  List<Asset> images = List<Asset>();
  String _error = 'No Error Dectected';
  List<String> category = ['Clothings', 'Shoes', 'Accessories'];
  List<String> sizeType = ['None', 'Top', 'Bottom', 'Shoes'];
  String mainCategory = 'Main Category';
  String subCategory = 'Sub Category';
  String sizeTypeValue = 'Choosing type';
  int indexSubCategory = 1;
  int indexSizeType = 0;

  //TODO: Image product holder
  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return Padding(
          padding: EdgeInsets.all(ConstScreen.sizeDefault),
          child: AssetThumb(
            asset: asset,
            width: 300,
            height: 300,
          ),
        );
      }),
    );
  }

  //TODO: load multi image
  Future<void> loadAssets() async {
    List<Asset> resultList = List<Asset>();
    String error = 'No Error Dectected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Example App",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }
    if (!mounted) return;

    setState(() {
      images = resultList;
      _error = error;
    });
  }

  //TODO: get sub category
  List getSubCategory(int index) {
    List subCategoryList = [];
    switch (index) {
      case 0:
        break;
      case 1:
        subCategoryList = Category.Clothing;
        break;
      case 2:
        subCategoryList = Category.Shoes;
        break;
      case 3:
        subCategoryList = Category.Accessories;
        break;
    }
    return subCategoryList.map((value) {
      return DropdownMenuItem(
        value: value,
        child: Text(
          value,
          style: kNormalTextStyle.copyWith(fontSize: FontSize.s28),
        ),
      );
    }).toList();
  }

  //TODO: get size type
  List<String> getSizeType(int index) {
    List<String> sizeTypeList = [];
    switch (index) {
      case 0:
        break;
      case 1:
        sizeTypeList = ClothingPickingList.TeeSize;
        break;
      case 2:
        sizeTypeList = ClothingPickingList.PantSize;
        break;
      case 3:
        sizeTypeList = ClothingPickingList.ShoesSize;
        break;
    }
    return sizeTypeList;
  }

  @override
  Widget build(BuildContext context) {
    ConstScreen.setScreen(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Product Manager',
          style: kBoldTextStyle.copyWith(
            fontSize: FontSize.setTextSize(32),
          ),
        ),
        backgroundColor: kColorWhite,
        iconTheme: IconThemeData.fallback(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: ConstScreen.setSizeHeight(30),
            horizontal: ConstScreen.setSizeWidth(20)),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            //TODO: Product name
            InputText(
              title: 'Product Name',
              inputType: TextInputType.text,
              onValueChange: (value) {},
            ),
            SizedBox(
              height: ConstScreen.sizeMedium,
            ),
            //TODO: Image product
            Text(
              'Image Product:',
              style:
                  kBoldTextStyle.copyWith(fontSize: FontSize.setTextSize(34)),
            ),
            SizedBox(
              height: ConstScreen.sizeMedium,
            ),
            buildGridView(),
            RaisedButton(
              child: Text(
                "Pick images",
                style: kBoldTextStyle.copyWith(fontSize: FontSize.s25),
              ),
              onPressed: loadAssets,
            ),
            Center(
                child: Text(
              'Error: $_error',
              style: kBoldTextStyle.copyWith(
                  fontSize: FontSize.s28, color: kColorRed),
            )),

            //TODO: Category
            Row(
              children: <Widget>[
                //TODO: main category
                Expanded(
                  flex: 1,
                  child: DropdownButton(
                    isExpanded: true,
                    hint: AutoSizeText(
                      mainCategory,
                      style: kBoldTextStyle.copyWith(fontSize: FontSize.s28),
                      minFontSize: 10,
                      maxLines: 1,
                    ),
                    items: category.map((value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(
                          value,
                          style:
                              kNormalTextStyle.copyWith(fontSize: FontSize.s28),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        mainCategory = value;
                        subCategory = 'SubCategory Chossing';
                        switch (mainCategory) {
                          case 'Main Category':
                            indexSubCategory = 0;
                            break;
                          case 'Clothings':
                            indexSubCategory = 1;
                            break;
                          case 'Shoes':
                            indexSubCategory = 2;
                            break;
                          case 'Accessories':
                            indexSubCategory = 3;
                            break;
                        }
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: ConstScreen.sizeMedium,
                ),
                //TODO: sub category
                Expanded(
                  flex: 1,
                  child: DropdownButton(
                    isExpanded: true,
                    hint: AutoSizeText(
                      subCategory,
                      style: kBoldTextStyle.copyWith(fontSize: FontSize.s28),
                      minFontSize: 10,
                      maxLines: 1,
                    ),
                    items: getSubCategory(indexSubCategory),
                    onChanged: (value) {
                      setState(() {
                        subCategory = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: ConstScreen.setSizeHeight(20),
            ),
            //TODO: Size type
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Text(
                    'Size Type Picker:',
                    style: kBoldTextStyle.copyWith(fontSize: FontSize.s30),
                  ),
                ),
                //TODO: picker size type
                Expanded(
                  flex: 1,
                  child: DropdownButton(
                    isExpanded: true,
                    hint: AutoSizeText(
                      sizeTypeValue,
                      style: kBoldTextStyle.copyWith(fontSize: FontSize.s28),
                      minFontSize: 10,
                      maxLines: 1,
                    ),
                    items: sizeType.map((value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(
                          value,
                          style:
                              kNormalTextStyle.copyWith(fontSize: FontSize.s28),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        sizeTypeValue = value;
                        switch (sizeTypeValue) {
                          case 'None':
                            indexSizeType = 0;
                            break;
                          case 'Top':
                            indexSizeType = 1;
                            break;
                          case 'Bottom':
                            indexSizeType = 2;
                            break;
                          case 'Shoes':
                            indexSizeType = 3;
                            break;
                        }
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: ConstScreen.setSizeHeight(20),
            ),
            //TODO Size & Color Group check
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // TODO: Size
                Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Size Picker',
                        style: kBoldTextStyle.copyWith(fontSize: FontSize.s30),
                      ),
                      CheckboxGroup(
                          labelStyle:
                              kNormalTextStyle.copyWith(fontSize: FontSize.s28),
                          labels: getSizeType(indexSizeType),
                          onSelected: (List<String> checked) =>
                              print(checked.toString())),
                    ],
                  ),
                ),
                // TODO: Color
                Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Color Picker',
                        style: kBoldTextStyle.copyWith(fontSize: FontSize.s30),
                      ),
                      CheckboxGroup(
                          labelStyle:
                              kNormalTextStyle.copyWith(fontSize: FontSize.s28),
                          labels: ClothingPickingList.ColorList,
                          onSelected: (List<String> checked) =>
                              print(checked.toString())),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: ConstScreen.sizeMedium,
            ),
            // TODO: Brand
            InputText(
              title: 'Brand',
              inputType: TextInputType.text,
              onValueChange: (value) {},
            ),
            SizedBox(
              height: ConstScreen.sizeMedium,
            ),
            //TODO: Made In
            InputText(
              title: 'Made In',
              inputType: TextInputType.text,
              onValueChange: (value) {},
            ),
            SizedBox(
              height: ConstScreen.sizeMedium,
            ),
            //TODO: Made In
            InputText(
              title: 'Quantity',
              inputType: TextInputType.number,
              onValueChange: (value) {},
            ),
            SizedBox(
              height: ConstScreen.sizeMedium,
            ),
            //TODO: Description
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Description',
                  focusColor: Colors.black,
                  labelStyle: kBoldTextStyle.copyWith(fontSize: FontSize.s30)),
              keyboardType: TextInputType.multiline,
              maxLines: null,
              onChanged: (comment) {},
            ),
          ],
        ),
      ),
      //TODO Add product
      bottomNavigationBar: SizedBox(
        height: ConstScreen.setSizeHeight(130),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ConstScreen.setSizeWidth(20),
              vertical: ConstScreen.setSizeHeight(20)),
          child: CusRaisedButton(
            title: 'Add Product',
            backgroundColor: kColorBlack,
            onPress: () {},
          ),
        ),
      ),
    );
  }
}
