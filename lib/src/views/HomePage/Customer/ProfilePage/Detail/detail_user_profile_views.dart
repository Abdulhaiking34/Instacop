import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:instacop/src/helpers/TextStyle.dart';
import 'package:instacop/src/helpers/colors_constant.dart';
import 'package:instacop/src/helpers/screen.dart';
import 'package:instacop/src/widgets/button_raised.dart';
import 'package:instacop/src/widgets/input_text.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class DetailProfileView extends StatefulWidget {
  @override
  _DetailProfileViewState createState() => _DetailProfileViewState();
}

class _DetailProfileViewState extends State<DetailProfileView> {
  DateTime _birthDay;
  bool _isBirthdayConfirm = false;
  List<String> gender = ['Male', 'Female'];
  String genderData = 'Choose Gender';
  @override
  Widget build(BuildContext context) {
    ConstScreen.setScreen(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Detail',
          style: kBoldTextStyle.copyWith(
            fontSize: FontSize.setTextSize(32),
          ),
        ),
        backgroundColor: kColorWhite,
        iconTheme: IconThemeData.fallback(),
      ),
      body: Container(
        color: kColorWhite,
        child: Padding(
          padding: EdgeInsets.only(
              left: ConstScreen.setSizeWidth(20),
              right: ConstScreen.setSizeWidth(20),
              top: ConstScreen.setSizeWidth(50)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              //TODO: First & Last Name
              Row(
                children: <Widget>[
                  //TODO: First Name
                  Expanded(
                    child: InputText(
                      title: 'First Name*',
                      onValueChange: (value) {},
                    ),
                  ),
                  SizedBox(
                    width: ConstScreen.setSizeWidth(15),
                  ),
                  //TODO: Last Name
                  Expanded(
                    child: InputText(
                      title: 'Last Name*',
                      onValueChange: (value) {},
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: ConstScreen.setSizeHeight(20),
              ),
              //TODO: Mobile Phone and Gender picker
              Row(
                children: <Widget>[
                  //TODO: Mobile Phone
                  Expanded(
                    flex: 2,
                    child: InputText(
                      title: 'Mobile',
                      inputType: TextInputType.number,
                      onValueChange: () {},
                    ),
                  ),
                  SizedBox(
                    width: ConstScreen.setSizeWidth(15),
                  ),
                  //TODO: Gender picker
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black54)),
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: ConstScreen.setSizeHeight(6),
                          bottom: ConstScreen.setSizeHeight(6),
                          left: ConstScreen.setSizeHeight(6),
                        ),
                        child: Center(
                          child: DropdownButton(
                            isExpanded: true,
                            hint: AutoSizeText(
                              genderData,
                              style: kBoldTextStyle.copyWith(
                                  fontSize: FontSize.s30),
                              minFontSize: 10,
                              maxLines: 1,
                            ),
                            onChanged: (value) {
                              setState(() {
                                genderData = value;
                              });
                            },
                            items: gender.map((String value) {
                              return DropdownMenuItem(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: kBoldTextStyle.copyWith(
                                        fontSize: FontSize.s30),
                                  ));
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: ConstScreen.setSizeHeight(20),
              ),
              //TODO: Date Picker
              GestureDetector(
                onTap: () {
                  DatePicker.showDatePicker(context,
                      showTitleActions: true,
                      minTime: DateTime(1950, 12, 31),
                      maxTime: DateTime(DateTime.now().year, 12, 31),
                      onChanged: (date) {
                    print('change $date');
                    _birthDay = date;
                  }, onConfirm: (date) {
                    print('confirm $date');
                    _birthDay = date;
                    setState(() {
                      _isBirthdayConfirm = true;
                    });
                  }, currentTime: DateTime.now(), locale: LocaleType.vi);
                },
                child: Container(
                  height: ConstScreen.setSizeHeight(100),
                  decoration: BoxDecoration(
                      border: Border.all(color: kColorBlack.withOpacity(0.7))),
                  child: Center(
                    child: Text(
                      _isBirthdayConfirm
                          ? ('Birthday: ' +
                              _birthDay.day.toString() +
                              '/' +
                              _birthDay.month.toString() +
                              '/' +
                              _birthDay.year.toString())
                          : 'Birthday Picker',
                      style: TextStyle(
                          color: kColorBlack,
                          fontSize: FontSize.s30,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: ConstScreen.setSizeHeight(20),
              ),
              CusRaisedButton(
                height: 90,
                title: 'Save',
                backgroundColor: kColorBlack,
                onPress: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
