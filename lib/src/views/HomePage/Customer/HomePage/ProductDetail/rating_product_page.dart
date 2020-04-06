import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:instacop/src/helpers/TextStyle.dart';
import 'package:instacop/src/helpers/colors_constant.dart';
import 'package:instacop/src/helpers/screen.dart';
import 'package:instacop/src/widgets/button_raised.dart';
import 'package:instacop/src/widgets/rating_comment_card.dart';

class RatingProductPage extends StatefulWidget {
  @override
  _RatingProductPageState createState() => _RatingProductPageState();
}

class _RatingProductPageState extends State<RatingProductPage> {
  @override
  Widget build(BuildContext context) {
    ConstScreen.setScreen(context);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // TOP
          Expanded(
            flex: 1,
            child: Container(
              color: kColorLightGrey.withOpacity(0.4),
              child: Stack(
                children: <Widget>[
                  //
                  Positioned(
                    child: IconButton(
                      color: kColorBlack,
                      iconSize: ConstScreen.setSizeWidth(55),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: ConstScreen.setSizeWidth(40),
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      children: <Widget>[
                        // Rating Bar
                        RatingBar(
                          allowHalfRating: true,
                          initialRating: 5,
                          itemCount: 5,
                          minRating: 0,
                          itemSize: ConstScreen.setSizeHeight(55),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amberAccent,
                          ),
                        ),
                        SizedBox(
                          height: ConstScreen.setSizeHeight(5),
                        ),
                        Text(
                          '76 Reviews',
                          style: TextStyle(
                              fontSize: FontSize.s30,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  // Add Comment
                  Positioned(
                    top: 0,
                    right: ConstScreen.setSizeWidth(20),
                    child: IconButton(
                        icon: Icon(
                          Icons.add_comment,
                          size: ConstScreen.setSizeWidth(45),
                        ),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: ConstScreen.setSizeHeight(15),
                                      horizontal: ConstScreen.setSizeWidth(30)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      //Rating
                                      Expanded(
                                        flex: 2,
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              flex: 1,
                                              child: Text(
                                                'Rating:',
                                                style: TextStyle(
                                                    fontSize: FontSize.s36,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: Center(
                                                child: RatingBar(
                                                  itemCount: 5,
                                                  onRatingUpdate: (value) {},
                                                  minRating: 0,
                                                  maxRating: 5,
                                                  allowHalfRating: true,
                                                  itemSize:
                                                      ConstScreen.setSizeWidth(
                                                          70),
                                                  itemBuilder: (context, _) =>
                                                      Icon(
                                                    Icons.star,
                                                    color: Colors.amberAccent,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: ConstScreen.setSizeHeight(20),
                                      ),
                                      // Comment
                                      Text(
                                        'Comment:',
                                        style: TextStyle(
                                            fontSize: FontSize.s36,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Expanded(
                                        flex: 10,
                                        child: TextField(
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              labelStyle:
                                                  kBoldTextStyle.copyWith(
                                                      fontSize: FontSize.s30)),
                                          keyboardType: TextInputType.multiline,
                                          maxLines: null,
                                          onChanged: (description) {},
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Row(
                                          children: <Widget>[
                                            // Button Add
                                            Expanded(
                                              child: CusRaisedButton(
                                                title: 'ADD',
                                                onPress: () {
                                                  Navigator.pop(context);
                                                },
                                                backgroundColor: kColorBlack,
                                              ),
                                            ),
                                            SizedBox(
                                              width:
                                                  ConstScreen.setSizeWidth(20),
                                            ),
                                            // Button Add
                                            Expanded(
                                              child: CusRaisedButton(
                                                title: 'CANCEL',
                                                onPress: () {
                                                  Navigator.pop(context);
                                                },
                                                backgroundColor:
                                                    kColorLightGrey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              });
                        }),
                  )
                ],
              ),
            ),
          ),

          // BOTTOM
          Expanded(
            flex: 9,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: <Widget>[
                RatingComment(
                  username: 'Nam Nguyen',
                  comment: ' I like it',
                  ratingPoint: 4.5,
                ),
                RatingComment(
                  username: 'Truc Nhu',
                  comment:
                      ' I know no one will read this but... do you ever just lay down on your bed late at night and look up at the night time sky, looking and all the stars. But you cant sleep because the thought that everyone at some point has to die and you know there is nothing you can do about it and all your loved ones you grew up with will leave the world before you. And you know you will never get to see or speak to them again. And the fact the even tho life is a gift its also torture and you never got to choose if you wanted to exist you were forced to. And you have to go threw life until you are on you last moments and think about all the memories you build up just to die and possibly let go of them likes it all ment nothing. Then after thinking about that you get to tired and cant stay awake anymore so you fall asleep with a depressed feeling and wish you could hold on to everyone you love forever. Then realize that you cant control it and fall asleep with tears dripping down your face while you wished you could go back to elementary school when your were small, young, has no worries in the world and you had all your friends with you and you were out on a nice sun set when your mom took you to the beach and you would make a sand castle with your cousin. And the fear that when you die those memories start to slowly drip away.',
                  ratingPoint: 0.5,
                ),
                RatingComment(
                  username: 'David Nguyen',
                  comment: ' Great product and it fits the display.',
                  ratingPoint: 4,
                ),
                RatingComment(
                  username: 'Truc Nhu',
                  comment:
                      ' I know no one will read this but... do you ever just lay down on your bed late at night and look up at the night time sky, looking and all the stars. But you cant sleep because the thought that everyone at some point has to die and you know there is nothing you can do about it and all your loved ones you grew up with will leave the world before you. And you know you will never get to see or speak to them again. And the fact the even tho life is a gift its also torture and you never got to choose if you wanted to exist you were forced to. And you have to go threw life until you are on you last moments and think about all the memories you build up just to die and possibly let go of them likes it all ment nothing. Then after thinking about that you get to tired and cant stay awake anymore so you fall asleep with a depressed feeling and wish you could hold on to everyone you love forever. Then realize that you cant control it and fall asleep with tears dripping down your face while you wished you could go back to elementary school when your were small, young, has no worries in the world and you had all your friends with you and you were out on a nice sun set when your mom took you to the beach and you would make a sand castle with your cousin. And the fear that when you die those memories start to slowly drip away.',
                  ratingPoint: 0.5,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
