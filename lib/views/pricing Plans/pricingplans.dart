import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:skilldren/Provider/Transactions/transaction_history_provider.dart';
import 'package:skilldren/utils/color_utils.dart';
import 'package:skilldren/views/pages/Widgets/TextWidget.dart';

import '../../Provider/PricingPlansProvider/pricing_plans_privder.dart';
import '../NewUI/NewBottomNavBar.dart';
import '../NewUI/NewPage.dart';
import '../pages/Widgets/Imagewidget.dart';

class PricingPalns extends StatefulWidget {
  final String planId;
  const PricingPalns({Key? key, required this.planId}) : super(key: key);

  @override
  State<PricingPalns> createState() => _PricingPalnsState();
}

class _PricingPalnsState extends State<PricingPalns> {
  int selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    final palnProvider =
        Provider.of<PricingPlansProvider>(context, listen: false);
    final transationProvider =
        Provider.of<TransactionProvider>(context, listen: false);
    return Scaffold(
        bottomNavigationBar: const NewBottomnavbar(selectedIndex: 2),
        drawer: const NewPage(),
        body: SingleChildScrollView(
          child: FutureBuilder(
            future: palnProvider.fetchAip(widget.planId),
            builder: ((context, snapshot) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 30.w,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(),
                        child: SvgPicture.asset(
                          "assets/svg images/tutorialparts/my profile asset without notch.svg",
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.w, horizontal: 5.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Scaffold.of(context).openDrawer();
                              },
                              child: const SizedBox(
                                height: 40,
                                width: 40,
                                child: ImageWidget(
                                    assetName:
                                        'assets/images/rank1/menuicon.png'),
                              ),
                            ),
                            TextWidget(
                              text: 'PRICING PLANS',
                              textSize: 20.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  RedTitleBar(
                    left: widget.planId == "1" ? 40.w : 30.w,
                    title: widget.planId == "2"
                        ? "App + Live classes"
                        : "App Only",
                  ),
                  SizedBox(
                    height: 170.w,
                    width: MediaQuery.of(context).size.width,
                    child: PageView(
                      onPageChanged: (val) {
                        setState(() {
                          selectedindex = val;
                        });
                      },
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                          palnProvider.myadata == null
                              ? 0
                              : palnProvider.myadata.response.length,
                          (index) => Padding(
                                padding: EdgeInsets.all(10.0.w),
                                child: priceCard(
                                  context,
                                  index: index,
                                  ontap: () async {
                                    await transationProvider.fetchAip();
                                  },
                                  month: palnProvider.myadata.response[index]
                                          .subscriptionPlan.duration ??
                                      "",
                                  offerprice: palnProvider
                                          .myadata
                                          .response[index]
                                          .subscriptionPlan
                                          .offeredPrice ??
                                      "",
                                  disc: palnProvider.myadata.response[index]
                                          .subscriptionPlan.discount ??
                                      "",
                                  featurelist: palnProvider
                                          .myadata
                                          .response[index]
                                          .subscriptionPlanFeatures ??
                                      [],
                                  perdayprice: palnProvider
                                          .myadata
                                          .response[index]
                                          .subscriptionPlan
                                          .perDayPrice ??
                                      "",
                                  price: palnProvider.myadata.response[index]
                                          .subscriptionPlan.price ??
                                      "",
                                ),
                              )),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 10.w,
                        height: 10.w,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: palnProvider.myadata == null
                                ? 0
                                : palnProvider.myadata.response.length,
                            itemBuilder: ((context, dotindex) {
                              return Container(
                                margin: EdgeInsets.all(0.2.w),
                                height: 2.w,
                                width: 2.w,
                                decoration: BoxDecoration(
                                    color: dotindex == selectedindex
                                        ? Colors.grey.shade500
                                        : Colors.grey.shade200,
                                    shape: BoxShape.circle),
                              );
                            })),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                ],
              );
            }),
          ),
        ));
  }

  Stack priceCard(BuildContext context,
      {month,
      offerprice,
      disc,
      ontap,
      featurelist,
      perdayprice,
      price,
      index}) {
    return Stack(
      alignment: Alignment.topCenter,
      clipBehavior: Clip.none,
      children: [
        Container(
          //padding: const EdgeInsets.all(20),
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width - 100,
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(index == 0
                    ? 'assets/PricingPalns/completeyellow.png'
                    : index == 1
                        ? 'assets/PricingPalns/CompleteImagegreen.png'
                        : 'assets/PricingPalns/completeBlue.png')),
            //border: Border.all(color: Colors.grey)
          ),
          child: Padding(
            padding: EdgeInsets.all(8.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 8.h,
                ),
                widget.planId == '1'
                    ? Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                              height: 10.w,
                              child: const ImageWidget(
                                  assetName: 'assets/PricingPalns/offer.png')),
                          TextWidget(
                            text: "$disc % OFF",
                            textSize: 15.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          )
                        ],
                      )
                    : TextWidget(text: ''),
                TextWidget(
                  text: widget.planId == '2'
                      ? "INTRODUCTORY\n        OFFER"
                      : 'Limited Tiime Deal',
                  color: const Color(0xFFb15be1),
                  fontWeight: FontWeight.bold,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        TextWidget(
                          text: '₹ ' + price,

                          // '10499',
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          textSize: 20,
                        ),
                        SizedBox(
                          height: 12.w,
                          width: 7.w,
                          child: const ImageWidget(
                              assetName: 'assets/PricingPalns/cutPrice.png'),
                        )
                      ],
                    ),
                    TextWidget(
                      text: '₹ ' + offerprice,
                      //'59999',
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      textSize: 25,
                    ),
                  ],
                ),
                TextWidget(
                  text: widget.planId == '2'
                      ? ""
                      : '₹ ' '${perdayprice.toString()} Per Day!',
                  //'59999',
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  textSize: 12.sp,
                ),
                SizedBox(
                  height: 2.h,
                ),
                TextWidget(
                  text: '36 Live Sessions',
                  color: ColorUtils.text1,
                  fontWeight: FontWeight.bold,
                  textSize: 12.sp,
                ),
                TextWidget(
                  text: 'Free App Subscription',
                  color: ColorUtils.text1,
                  fontWeight: FontWeight.bold,
                  textSize: 12.sp,
                ),
                SizedBox(
                  height: 2.h,
                ),
                Column(
                  children: List.generate(featurelist.length,
                      (index) => rowwidget(featurelist[index].toString())),
                ),
                SizedBox(
                  height: 2.h,
                ),
                TextWidget(
                  text: 'And Much More!!!!',
                  color: ColorUtils.text1,
                  fontWeight: FontWeight.bold,
                  textSize: 12.sp,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: -3.5.h,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Visibility(
                visible: (widget.planId == '1' && index == 0) ? true : false,
                child: const ImageWidget(
                  assetName: 'assets/PricingPalns/topking.png',
                ),
              ),
              Positioned(
                top: 13.w,
                child: TextWidget(
                  text: month,
                  fontWeight: FontWeight.bold,
                  textSize: 20.sp,
                ),
              )
            ],
          ),
        ),
        Positioned(
          bottom: -6.w,
          child: widget.planId == '2'
              ? GestureDetector(
                  onTap: ontap,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                        index == 0
                            ? 'assets/PricingPalns/EnrollYellow.png'
                            : index == 1
                                ? 'assets/PricingPalns/Enrollgreen.png'
                                : 'assets/PricingPalns/Enrollbule.png',
                      )),
                    ),
                    height: 13.w,
                    width: 50.w,
                  ),
                )
              : Container(
                  alignment: Alignment.center,
                  height: 13.w,
                  width: 50.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.w),
                      color: index == 0
                          ? const Color(0xfffddb00)
                          : index == 1
                              ? const Color(0xffadd600)
                              : Colors.blue),
                  child: TextWidget(
                    text: "SUBSCRIBE NOW",
                    fontWeight: FontWeight.bold,
                    textSize: 12.sp,
                  ),
                ),
        ),
      ],
    );
  }

  Widget rowwidget(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              SvgPicture.asset("assets/PricingPalns/Right-optimized.svg"),
              SizedBox(
                width: 3.w,
              ),
              TextWidget(
                text: title,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                textSize: 10.sp,
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 200,
          child: Divider(
            height: 2,
            color: Colors.grey,
          ),
        )
      ],
    );
  }
}

class RedTitleBar extends StatelessWidget {
  final String title;
  final double? left;
  const RedTitleBar({
    Key? key,
    required this.title,
    this.left,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          'assets/svg images/tutorialparts/Redline-optimized.svg',
          width: MediaQuery.of(context).size.width,
        ),
        Positioned(
          left: left ?? 5.w,
          child: TextWidget(
            text: title,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            textSize: 15.sp,
          ),
        )
      ],
    );
  }
}
