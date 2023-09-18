// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:csc_picker/csc_picker.dart';

import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:skilldren/Provider/Student%20Info/student_info_provider.dart';
import 'package:skilldren/utils/color_utils.dart';
import 'package:skilldren/utils/string_utils.dart';
import 'package:skilldren/views/Login_SingUp/otpPage.dart';
import 'package:skilldren/views/NewUI/NewPage.dart';
import 'package:skilldren/views/pages/Widgets/Imagewidget.dart';
import 'package:skilldren/views/pages/Widgets/TextWidget.dart';

import '../../Provider/UpdateProfile/update_profile_provider.dart';
import '../../constant.dart';
import '../NewUI/NewBottomNavBar.dart';
import '../pricing Plans/pricingplans.dart';

class EditProfilePage extends StatefulWidget {
  final String name;
  final String lastname;
  final String email;
  final String? dob;

  final String address;
  final String? country;
  final String? state;
  final String? city;
  final String pincode;
  final String mobNumber;
  final String image;
  const EditProfilePage({
    Key? key,
    required this.name,
    required this.lastname,
    required this.email,
    this.dob,
    required this.address,
    this.country,
    this.state,
    this.city,
    required this.pincode,
    required this.mobNumber,
    required this.image,
  }) : super(key: key);

  @override
  State<EditProfilePage> createState() => _UpdateDetailsState();
}

class _UpdateDetailsState extends State<EditProfilePage> {
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController lastnamecontroller = TextEditingController();
  final TextEditingController updatePhonecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController dobcontroller = TextEditingController();
  final TextEditingController gendercontroller = TextEditingController();
  final TextEditingController addresscontroller = TextEditingController();
  final TextEditingController countrycontroller = TextEditingController();
  final TextEditingController statecontroller = TextEditingController();
  final TextEditingController citycontroller = TextEditingController();
  final TextEditingController pincontroller = TextEditingController();
  final TextEditingController agecontroller = TextEditingController();

  final TextEditingController gradecontroller = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final GlobalKey<AnimatorWidgetState> _key1 = GlobalKey<AnimatorWidgetState>();

  File? file;
  String? countryValue;
  String? stateValue;
  String? cityValue;
  String? address;
  String? gneder;
  String? profileImage;
  @override
  void initState() {
    super.initState();
    namecontroller.text = widget.name;
    lastnamecontroller.text = widget.lastname;
    emailcontroller.text = widget.email;
    dobcontroller.text = widget.dob ?? '';
    gendercontroller.text = 'Select Gender';
    addresscontroller.text = widget.address;
    countryValue = widget.country ?? '';
    cityValue = widget.city;
    stateValue = widget.state;
    pincontroller.text = widget.pincode;
    updatePhonecontroller.text = widget.mobNumber;
    profileImage = widget.image;
    pincontroller.text = widget.pincode;
  }

  @override
  Widget build(BuildContext context) {
    final updateProfileProvider =
        Provider.of<UpdateProfileProvider>(context, listen: false);
    final info = Provider.of<StudentInfoProvider>(context, listen: false);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: const NewBottomnavbar(selectedIndex: 2),
      drawer: const NewPage(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                const SizedBox(
                  width: double.infinity,
                  child: ImageWidget(
                      assetName: 'assets/EditProfile/path40puplebg.png'),
                ),
                const ImageWidget(assetName: 'assets/EditProfile/EditBg.png'),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.w, horizontal: 5.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Builder(builder: (context) {
                        return GestureDetector(
                          onTap: () {
                            Scaffold.of(context).openDrawer();
                          },
                          child: SizedBox(
                            height: 10.w,
                            width: 10.w,
                            child: const ImageWidget(
                                assetName: 'assets/images/rank1/menuicon.png'),
                          ),
                        );
                      }),
                      SizedBox(
                          width: 50.w,
                          child: FittedBox(
                              child: Text('edit profile'.toUpperCase(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      shadows: <Shadow>[
                                        Shadow(
                                          offset: Offset(1.0, 1.0),
                                          blurRadius: 3.0,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                        ),
                                      ])))),
                    ],
                  ),
                ),
                Positioned(
                  right: 20.w,
                  bottom: -25.w,
                  child: Stack(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          await showPicker(context);
                        },
                        child: SizedBox(
                          width: 55.w,
                          child: const ImageWidget(
                              assetName: 'assets/EditProfile/Circlebg.png'),
                        ),
                      ),
                    ],
                  ),
                ),
                file == null
                    ? Positioned(
                        right: 28.7.w,
                        bottom: -16.2.w,
                        child: GestureDetector(
                          onTap: () async {
                            await showPicker(context);
                          },
                          child: ClipOval(
                            child: SizedBox(
                                height: 39.w,
                                width: 39.w,
                                child: NetworkImageWidget(image: widget.image)),
                          ),
                        ),
                      )
                    : Positioned(
                        right: 28.7.w,
                        bottom: -16.2.w,
                        child: GestureDetector(
                          onTap: () async {
                            await showPicker(context);
                          },
                          child: Container(
                            height: 39.w,
                            width: 39.w,
                            //margin: EdgeInsets.all(5.w),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: FileImage(
                                      file!,
                                    )),
                                shape: BoxShape.circle),
                          ),
                        ),
                      ),
                Positioned(
                    right: 24.w,
                    top: 24.w,
                    child: GestureDetector(
                      onTap: () async {
                        await showPicker(context);
                      },
                      child: SizedBox(
                        height: 15.w,
                        width: 15.w,
                        child: const ImageWidget(
                            assetName: 'assets/images/editIcon.png'),
                      ),
                    )),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            TextWidget(
              text: "Profile Picture",
              textSize: 15.sp,
            ),
            TextWidget(
              text: "(Max 4MB, 1:1 Aspect Ratio)",
              color: Colors.grey,
            ),
            SizedBox(
              height: 3.h,
            ),
            const RedTitleBar(title: "General Information"),
            SizedBox(
              height: 3.h,
            ),
            Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 50.w,
                        child: textfield(namecontroller, "First Name",
                            valdidate: true,
                            errortext: 'Enter Your Name',
                            lettersonly: true,
                            requiredtext: '*'),
                      ),
                      SizedBox(
                        width: 50.w,
                        child: textfield(lastnamecontroller, "Last Name",
                            valdidate: true,
                            errortext: 'Enter Last Name',
                            lettersonly: true,
                            requiredtext: '*'),
                      )
                    ],
                  ),
                  textfield(emailcontroller, "Email Address", width: 85.w),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 50.w,
                        child: textfield(dobcontroller, "Date of Birth",
                            valdidate: true,
                            requiredtext: '*',
                            errortext: 'Enter DOB',
                            readOnly: true, ontap: () async {
                          final DateTime? pickeddate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1990),
                              lastDate: DateTime(2070),
                              builder: (BuildContext context, Widget? child) {
                                return Theme(
                                  data: ThemeData(
                                    colorScheme:
                                        Theme.of(context).colorScheme.copyWith(
                                              primary: ColorUtils.apppink,
                                            ),
                                    primaryColor: ColorUtils.apppink,
                                    primaryColorDark: ColorUtils.apppink,
                                  ),
                                  child: child!,
                                );
                              });

                          dobcontroller.text =
                              '${pickeddate!.day}/${pickeddate.month}/${pickeddate.year}';
                        }),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: 'Gender',
                            color: Colors.grey,
                            textSize: 13.sp,
                          ),
                          SizedBox(
                            width: 50.w,
                            height: 8.w,
                            child: Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(right: 5.w),
                              padding: EdgeInsets.only(left: 5.w, top: 1.w),
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(5.sp)),
                              child: PopupMenuButton(
                                padding: EdgeInsets.only(left: 2.w),
                                child: SizedBox(
                                  width: 50.w,
                                  height: 8.w,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextWidget(
                                        text: gneder ?? 'Select Gender',
                                        textSize: 10.sp,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 2.w),
                                        child: const Icon(
                                            Icons.arrow_drop_down_sharp),
                                      ),
                                    ],
                                  ),
                                ),
                                itemBuilder: (context) {
                                  return List.generate(
                                      2,
                                      (index) => PopupMenuItem(
                                          onTap: () {
                                            setState(() {
                                              gneder = index == 0
                                                  ? 'Male'
                                                  : 'Female';
                                            });
                                          },
                                          value: index == 0 ? 'Male' : 'Female',
                                          child: TextWidget(
                                            text:
                                                index == 0 ? 'Male' : 'Female',
                                          )));
                                },
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  textfield(addresscontroller, "Complete Address", width: 85.w),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Row(
                      children: [
                        TextWidget(
                          text: 'Country',
                          color: Colors.grey,
                          textSize: 13.sp,
                        ),
                        SizedBox(
                          width: 33.w,
                        ),
                        TextWidget(
                          text: 'State',
                          color: Colors.grey,
                          textSize: 13.sp,
                        ),
                      ],
                    ),
                  ),
                  cscPicker(),
                  SizedBox(height: 3.w),
                  SizedBox(
                    // width: 50.w,
                    child: textfield(pincontroller, "Pin Code", width: 88.w),
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  const RedTitleBar(title: "Security"),
                  SizedBox(
                    height: 5.w,
                  ),
                  textfield(
                    updatePhonecontroller, "Update Phone",
                    width: 85.w,
                    // mobile: true,
                    // errortext: 'Enter Valid Mobile Number'
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  Center(
                    child: SizedBox(
                        width: size.width - 45.w,
                        child: GestureDetector(
                            onTap: () async {
                              _key1.currentState!.forward();
                              await Sound.play(Audio.waterDrop);
                              Future.delayed(const Duration(seconds: 1),
                                  () async {
                                if (widget.mobNumber !=
                                    updatePhonecontroller.text) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => OtpPage(
                                          mobnumber: updatePhonecontroller.text,
                                          status: 'Update')));
                                } else if (formkey.currentState!.validate()) {
                                  await updateProfileProvider
                                      .fetchApi(
                                    fname: namecontroller.text,
                                    lname: lastnamecontroller.text,
                                    age: agecontroller.text,
                                    grade: "2",
                                    // gradecontroller.text,
                                    address: addresscontroller.text,
                                    dob: dobcontroller.text,
                                    email: emailcontroller.text,
                                    image: file?.path,

                                    // image: file?.path
                                  )
                                      .then((value) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            duration:
                                                const Duration(seconds: 1),
                                            content:
                                                Consumer<UpdateProfileProvider>(
                                                    builder: ((context, value,
                                                        child) {
                                              return Text(
                                                  value.mydata?.response ?? '');
                                            }))));

                                    info.fetchApi();
                                  });
                                }
                              });
                            },
                            child: Jello(
                              key: _key1,
                              child: const ImageWidget(
                                  assetName:
                                      'assets/EditProfile/svaeChangesButton.png'),
                            ))),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5.w,
            ),
          ],
        ),
      ),
    );
  }

  Widget textfield(TextEditingController controller, String hint,
      {valdidate,
      errortext,
      width,
      lettersonly,
      mobile,
      readOnly,
      ontap,
      requiredtext}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              TextWidget(
                text: hint,
                color: Colors.grey,
                textSize: 13.sp,
              ),
              TextWidget(
                text: requiredtext ?? "",
                color: ColorUtils.apppink,
                textSize: 12.sp,
              ),
            ],
          ),
          Stack(
            alignment: Alignment.topCenter,
            children: [
              SizedBox(
                  height: 8.w,
                  width: double.infinity,
                  child: const ImageWidget(
                      assetName: 'assets/EditProfile/g194star.png')),
              Padding(
                padding: EdgeInsets.only(left: 2.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                        height: 13.w,
                        width: width ?? 37.w,
                        child: TextFormField(
                          onTap: ontap,
                          readOnly: readOnly ?? false,
                          keyboardType: mobile == null
                              ? TextInputType.name
                              : TextInputType.number,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (val) {
                            final nonLettersRegExp = RegExp(r'[^a-zA-Z]');
                            if (val!.isEmpty) {
                              return errortext;
                            } else if (lettersonly != null &&
                                nonLettersRegExp.hasMatch(val)) {
                              return errortext;
                            } else if (mobile != null && val.length != 10) {
                              return errortext;
                            }

                            return null;
                          },
                          controller: controller,
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(left: 2.w, bottom: 3.5.w),
                              hintStyle: const TextStyle(
                                  fontFamily: FontFamily.josefinSans_Itallic,
                                  fontWeight: FontWeight.w200),
                              // hintText: hint,
                              border: InputBorder.none),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  showPicker(BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: SizedBox(
              height: 30.w,
              width: 25.w,
              child: Column(
                // shrinkWrap: true,
                children: [
                  SizedBox(
                    height: 15.w,
                    child: Card(
                      child: ListTile(
                        onTap: () async {
                          final pickedfile = await ImagePicker()
                              .pickImage(source: ImageSource.gallery);
                          if (pickedfile != null) {
                            setState(() {
                              file = File(pickedfile.path);
                            });

                            Navigator.of(context).pop(true);
                          }
                        },
                        title: TextWidget(text: "Gallary"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.w,
                    child: Card(
                      child: ListTile(
                        onTap: () async {
                          final pickedfile = await ImagePicker()
                              .pickImage(source: ImageSource.camera);
                          if (pickedfile != null) {
                            setState(() {
                              file = File(pickedfile.path);
                            });

                            Navigator.of(context).pop(true);
                          }
                        },
                        title: TextWidget(text: "Camera"),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  Widget cscPicker() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: CSCPicker(
        showCities: true,
        countrySearchPlaceholder: "Country",
        stateSearchPlaceholder: "State",
        citySearchPlaceholder: "City",
        dropdownDecoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(6.sp)),
        disabledDropdownDecoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(6.sp)),
        countryDropdownLabel: countryValue ?? 'Select Country',
        stateDropdownLabel: stateValue ?? 'Select State',
        cityDropdownLabel: cityValue ?? 'Select City',
        onCountryChanged: (value) {
          setState(() {
            countryValue = value;
          });
        },
        onStateChanged: (value) {
          setState(() {
            stateValue = value;
          });
        },
        onCityChanged: (value) {
          setState(() {
            cityValue = value;
          });
        },
      ),
    );
  }
}
