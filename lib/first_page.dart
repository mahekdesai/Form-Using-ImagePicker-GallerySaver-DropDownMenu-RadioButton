import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'constant.dart';
import 'second_page.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:gallery_saver/gallery_saver.dart';

String? selectedGender;
String? fname;
String? mobNum;
String? email;
File? _image;
String? selectedDesignation = 'Designation';
String buttonText = "Download";

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _FirstPageState extends State<FirstPage> {
  Future getImageCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) {
      return;
    }
    File imageTemporary = File(image.path);
    setState(() {
      _image = imageTemporary;
    });
  }

  Future getImageGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) {
      return;
    }

    final imageTemporary = File(image.path);
    setState(() {
      _image = imageTemporary;
    });
  }

  void _saveImage() {
    setState(() {
      buttonText = "in progress..";
    });
    try {
      GallerySaver.saveImage(_image!.path);
      setState(() {
        buttonText ='Saved!';
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    fname = null;
    mobNum = null;
    email = null;
  }

  @override
  Widget build(BuildContext context) {
    bool spinner = false;

    void validation() {
      final FormState? _form = _formKey.currentState;
      if (_form!.validate()) {
        setState(() {
          spinner = true;
        });
        try {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Welcome To The Second Page',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.greenAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: kPink,
              duration: Duration(seconds: 2),
            ),
          );
          setState(() {
            spinner = false;
          });
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return SecondPage(
                fname: fname,
                email: email,
                num: mobNum,
                desg: selectedDesignation,
                gender: selectedGender,
                image: _image,
              );
            }),
          );
        } on Exception catch (e) {
          setState(() {
            spinner = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                e.toString(),
                style: TextStyle(
                  color: kPink,
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: Colors.greenAccent,
              duration: Duration(seconds: 4),
            ),
          );
        }
      }
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: ModalProgressHUD(
        inAsyncCall: spinner,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 75),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          style: TextStyle(color: Colors.greenAccent),
                          keyboardType: TextInputType.name,
                          onChanged: (value) {
                            fname = value;
                          },
                          validator: (value) {
                            if (value == null) {
                              return "Please Enter Your Full Name";
                            }
                          },
                          decoration: kTextFieldDecoration.copyWith(
                            hintText: "Enter Your Full Name",
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          style: TextStyle(color: Colors.greenAccent),
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                            email = value;
                          },
                          validator: (value) {
                            if (value == null) {
                              return "Please Enter Your Email ID";
                            }
                          },
                          decoration: kTextFieldDecoration,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          style: TextStyle(color: Colors.greenAccent),
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            mobNum = value;
                          },
                          validator: (value) {
                            if (value == null) {
                              return "Please Enter Your Phone Number";
                            }
                          },
                          decoration: kTextFieldDecoration.copyWith(
                            hintText: "Enter Your Phone Number",
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 50.0,
                          width: double.infinity,
                          alignment: Alignment.center,
                          color: kPink,
                          child: DropdownButton<String>(
                            value: selectedDesignation,
                            items: [
                              DropdownMenuItem(
                                child: Text(
                                  "Designation",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                                value: "Designation",
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  "Doctor",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.greenAccent),
                                ),
                                value: "Doctor",
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  "Engineer",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.greenAccent),
                                ),
                                value: "Engineer",
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  "Teacher",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.greenAccent),
                                ),
                                value: "Teacher",
                              ),
                            ],
                            onChanged: (value) {
                              setState(() {
                                selectedDesignation = value;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: [
                            Text(
                              "Select Your Gender:",
                              style: TextStyle(
                                  color: Colors.greenAccent, fontSize: 18),
                            ),
                            Padding(
                                padding: EdgeInsets.only(bottom: 10),
                                child:
                                    GenderField(['Male', 'Female', 'Other'])),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Select Photo:",
                                  style: TextStyle(
                                      color: Colors.greenAccent, fontSize: 18),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.greenAccent),
                                  onPressed: () {
                                    getImageGallery();
                                    buttonText = "Download";
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(13.0),
                                    child: Text(
                                      "From Gallery",
                                      style: TextStyle(
                                          color: kPink,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.greenAccent),
                                  onPressed: () {
                                    getImageCamera();
                                    buttonText = "Download";
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(13.0),
                                    child: Text(
                                      "From Camera",
                                      style: TextStyle(
                                          color: kPink,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              children: [
                                _image != null
                                    ? Image.file(
                                        _image!,
                                        width: 130,
                                        height: 130,
                                        fit: BoxFit.cover,
                                      )
                                    : Image.network(
                                        'https://drm2ecjli5gr8.cloudfront.net/photofunny.net/efectos/grandes/foto-marco-gradiente-gris-efecto-borde.jpg',
                                        height: 130,
                                        width: 130,
                                        fit: BoxFit.cover,
                                      ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.greenAccent),
                                  onPressed: () {
                                    _saveImage();
                                  },
                                  child: Text(
                                    buttonText,
                                    style: TextStyle(
                                      color: kPink,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: kPink),
                      onPressed: () {
                        setState(() {
                          validation();
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Text(
                          "Submit",
                          style: TextStyle(
                              color: Colors.greenAccent, fontSize: 22),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: kPink),
                      onPressed: () {
                        _formKey.currentState!.reset();
                        setState(() {
                          _image = null;
                          selectedDesignation = 'Designation';
                          selectedGender = null;
                          buttonText = "Download";
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Text(
                          "Reset",
                          style: TextStyle(
                              color: Colors.greenAccent, fontSize: 22),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GenderField extends StatelessWidget {
  final List<String> genderList;

  GenderField(this.genderList);

  @override
  Widget build(BuildContext context) {
    Map<int, String> mappedGender = genderList.asMap();

    return StatefulBuilder(
      builder: (_, StateSetter setState) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          ...mappedGender.entries.map(
            (MapEntry<int, String> mapEntry) => Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio(
                    fillColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.disabled)) {
                        return Colors.greenAccent.withOpacity(.32);
                      }
                      return Colors.greenAccent;
                    }),
                    groupValue: selectedGender,
                    value: genderList[mapEntry.key],
                    onChanged: (value) =>
                        setState(() => selectedGender = value),
                  ),
                  Text(
                    mapEntry.value,
                    style: TextStyle(
                        fontSize: 18,
                        color: kPink,
                        fontWeight: FontWeight.bold),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
