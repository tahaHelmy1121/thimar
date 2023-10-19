import 'package:app_dialog/app_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/datalayer/repostory/getaddressrepo.dart';
import 'package:untitled1/datalayer/repostory/removeaddress.dart';
import 'package:untitled1/helper/massage.dart';
import 'package:untitled1/presntionlayer/auth/loginview.dart';

import '../../datalayer/model/add_address_model.dart';
import '../../datalayer/model/get_address_model.dart';
import '../../datalayer/model/removeaddress.dart';
import '../../datalayer/repostory/addaddressrepo.dart';
import '../../presntionlayer/home/home.dart';

class AddressViewModel extends ChangeNotifier {
  Locator? reader;
 // BuildContext? context;

  AddressViewModel({this.reader}) {
    getAddress();
    addAddress();
//getAddAddress();
  }

  GetAddressModel addressModel = GetAddressModel(data: []);
  AddAdressModel addAddressModel = AddAdressModel();
  bool address = false;

  Position? _currentLocation;

  Position? get currentLocation => this._currentLocation;

  Future<Position?> getCurrentLocationPermission() async {
    LocationPermission? permission;
    try {
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          Fluttertoast.showToast(msg: "Location permission is denied.");
          return null;
        }
      }
      if (permission == LocationPermission.deniedForever) {
        Fluttertoast.showToast(msg: "Location permission is denied Forever.");
        return null;
      }
      _currentLocation = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
    } catch (error) {
      return null;
    }

    return _currentLocation;
  }

  SharedPreferences? sharedPreferences;

  getAddress({context}) async {
    sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences!.getString("token");
    //  address = false;
    if (addressModel.data == null) {
      return AppDialog(
        context: context,
        dialogType: DialogType.INFO,
        animType: AnimType.BOTTOM_SLIDE,
        title: "انت غير مسجل بتطبيق ثمرة",
        desc: 'الرجاء تسجيل الدخول ةالانتثال لتسجيل الدخول',
        btnCancelOnPress: () {},
        btnOkOnPress: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, _) {
                return FadeTransition(
                  opacity: animation,
                  child: const LoginView(),
                );
              },
            ),
          );
        },
      ).show();
    } else {
      addressModel = await AddressRepo.getAddressRepo(token: token);
    }
    address = true;
    notifyListeners();
  } //

  TextEditingController phoneController = TextEditingController();
  TextEditingController describtionController = TextEditingController();

//
  RemoveAdressModel removeAdressModel = RemoveAdressModel();


  addAddress({lat, lng, loc, type, phone, desc, context}) async {
    sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences!.getString("token");
    if (token == 0 || token == null) {
      AppDialog(
        context: context,
        dialogType: DialogType.INFO,
        animType: AnimType.BOTTOM_SLIDE,
        title: "انت غير مسجل بتطبيق ثمرة",
        desc: 'الرجاء تسجيل الدخول ةالانتثال لتسجيل الدخول',
        btnCancelOnPress: () {},
        btnOkOnPress: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, _) {
                return FadeTransition(
                  opacity: animation,
                  child: const LoginView(),
                );
              },
            ),
          );
        },
      ).show();
    } else {
      AddAdressModel walletModel = AddAdressModel();
      AddAddressRepo.getRegisterRepo(
        lat: lat,
        lng: lng,
        loc: loc,
        phone: phone,
        token: token,
        isDefault:1,
        type: type,
        desc: desc,
      ).then((value) {
        walletModel = value;
        notifyListeners();
        getAddress();
      });
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(
          content: Text(
            "تمت الاضافة العنوان بنجاح",
            style: TextStyle(
                fontSize: 15, color: Colors.red, fontWeight: FontWeight.bold),
          ),
          duration: const Duration(milliseconds: 35),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          elevation: 10,
          onVisible: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => HomeView()));
          },
        ));
    }

    notifyListeners();
    getAddress();
  } //

  reoveAddress({id, context}) async {
    SharedPreferences? sharedPreferences =
        await SharedPreferences.getInstance();
    var customer = sharedPreferences.getString("token");
    removeAdressModel = await RemoveAddressRepo.getRemoveAddressRepo(
        token: customer, type: "index", addresstemId: id);
    notifyListeners();
    getAddress();
    if (removeAdressModel.status == "success") {
      MassageApp.flusherBarErrorMassage(
          context, removeAdressModel.message.toString(), "", (flushbar) {});
      // notifyListeners();
      notifyListeners();
      getAddress();
    } else {
      MassageApp.flusherBarErrorMassage(
          context, removeAdressModel.message.toString(), "", (flushbar) {});
    }
    notifyListeners();
    print("&%^&@#&@^#%@&^#%&^#%@&&&&&&&&&&&&&&&&&&&&&^#%&@^%@#&&^@#");
  } //
}
//
