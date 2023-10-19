import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/presntionlayer/favourite/favouriteview.dart';

import '../../datalayer/model/add_favourite_model.dart';
import '../../datalayer/model/getfavouritemodel.dart';
import '../../datalayer/model/removefavmodel.dart';
import '../../datalayer/repostory/addfavrepo.dart';
import '../../datalayer/repostory/getfavourite.dart';
import '../../datalayer/repostory/removefavrepo.dart';
import '../../helper/massage.dart';
import '../../helper/resultprocess.dart';
import '../../presntionlayer/auth/loginview.dart';

class FavouriteViewModel extends ChangeNotifier {
  FavouriteViewModel() {
    getProductFavourite();
  }

  bool? favLoading = false;


  FavouriteModel fav = FavouriteModel(data: []);
  SharedPreferences? _sharedPreferences;

  getProductFavourite() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    var customer = _sharedPreferences!.getString("token");
    fav = await FavouriteRepo.getFavRepo(token: customer);

    //   _FavLoading = true;

    notifyListeners();
  }

  addFav({
    required context,
    itemIndex,
    productId,
    //  remove,
    //  qun,
  }) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    var token = _sharedPreferences!.getString("token");
    if (token == 0 || token == null) {
      AwesomeDialog(
          btnOkColor: Colors.black54,
          btnOkOnPress: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
                  return const LoginView();
                }));
          },
          btnOkText: "تسجيل الدخول",
          context: context,
          width: double.infinity,
          dismissOnTouchOutside: false,
          buttonsBorderRadius: const BorderRadius.all(Radius.circular(20)),
          animType: AnimType.LEFTSLIDE,
          dialogType: DialogType.ERROR,
          buttonsTextStyle: const TextStyle(
            fontSize: 12,
            fontFamily: "BigVesta",
          ),
          body: const Text(
            "انت غير مسجل بمتجر سلة ثمرة",
            style: TextStyle(
              fontSize: 16,
              fontFamily: "BigVesta",
            ),
          ),
          showCloseIcon: true,
          btnCancelColor: Colors.black54,
          btnCancelText: "إلغاء",
          btnCancelOnPress: () {})
          .show();
    } else {
      AddFavouriteModel favModel = AddFavouriteModel();
      AddToFavRepo.getAddFavRepo(
        token: token,
        index: itemIndex,
        product_id: productId,
      ).then((value) {
        favModel = value;
        notifyListeners();
        getProductFavourite();
      });
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(
          content: const Text(
            "تمت الاضافة للمفضلة بنجاح",
            style: TextStyle(fontFamily: "BigVesta"),
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
                context, MaterialPageRoute(builder: (_) => Favouriteview()));
          },
        ));
    }

    notifyListeners();
    getProductFavourite();
  }

  RemoveFavouriteModel favouriteModel = RemoveFavouriteModel();

  getRemoveToFav({
    //   id,
    id,
    context,
    index,
  }) async {
    SharedPreferences? sharedPreferences =
        await SharedPreferences.getInstance();
    var customer = sharedPreferences.getString("token");
    favouriteModel = await RemoveFavRepo.getRemoveFavRepo(
        token: customer, id: fav.data[index].id);
    notifyListeners();
    getProductFavourite();
    if (favouriteModel.status == "success") {
      ResultProcess.drewResultProcess(
        context: context,
        reson: favouriteModel.message.toString(),
        status: true,
        nav: const Favouriteview(),
      );
      // notifyListeners();
      notifyListeners();
      getProductFavourite();
    } else {
      MassageApp.flusherBarErrorMassage(
          context, favouriteModel.message.toString(), "", (flushbar) {});
    }
    notifyListeners();
    print("&%^&@#&@^#%@&^#%&^#%@&&&&&&&&&&&&&&&&&&&&&^#%&@^%@#&&^@#");
  }
}
