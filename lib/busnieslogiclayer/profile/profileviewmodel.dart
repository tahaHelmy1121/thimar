import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/datalayer/model/profilemodel.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled1/datalayer/repostory/editprofile.dart';
import 'package:untitled1/presntionlayer/home/home.dart';
import '../../datalayer/repostory/profilerepo.dart';
import '../../helper/massage.dart';
import '../../helper/resultprocess.dart';

class ProfileViewModel extends ChangeNotifier {
  ProfileViewModel() {
    getProfileFromRepo();
    // pickImage();
  }

  bool profileLoading = false;

  SharedPreferences? sharedPreferences;

  ProfileModel profileModel = ProfileModel();

  getProfileFromRepo() async {
    sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences!.getString("token");
    profileModel = await ProfileRepo.getProfileRepo(device_token: token);
    profileLoading = true;
    notifyListeners();
  }

  final picker = ImagePicker();
  File? _image;

  File? get image => _image;

  bool _isImageValid = true;

  bool get isImageValid => _isImageValid;

  selectImageFromGallery() async {
    final pickedFile = (await picker.pickImage(source: ImageSource.gallery));

    _image = File(pickedFile!.path);
    _isImageValid = true;
    notifyListeners();
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  editProfile({required context, password, city, image, name, phone}) async {
    sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences!.getString("token");
    profileModel = await EditProfileRepo.getPersonalRepo(
        password: password,
        city: city,
        device_token: token,
        //  image: image,
        name: name,
        phone: phone);
    if (profileModel.status == "success") {
      ResultProcess.drewResultProcess(
        context: context,
        reson: profileModel.message.toString(),
        status: "success",
        nav: const HomeView(),
      );
      notifyListeners();
    } else {
      ResultProcess.drewResultProcess(
          context: context,
          reson: profileModel.message.toString(),
          status: false);
    }
    notifyListeners();
  }

  TextEditingController confirmatonPassword = TextEditingController();


  @override
  void dispose() {
    nameController.moveCursorToEnd;
    phoneController.dispose();
    cityController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
