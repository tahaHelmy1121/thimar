import 'package:app_dialog/app_dialog.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/const/url.dart';
import 'package:untitled1/datalayer/model/addtocart.dart';
import 'package:untitled1/datalayer/model/cartmodel.dart';
import 'package:untitled1/datalayer/model/deletecartmodel.dart';
import 'package:untitled1/datalayer/repostory/addtocartrepo.dart';
import 'package:untitled1/datalayer/repostory/removetocartrepo.dart';
import 'package:untitled1/helper/extenstion.dart';
import 'package:untitled1/helper/massage.dart';
import 'package:untitled1/presntionlayer/auth/loginview.dart';
import 'package:untitled1/presntionlayer/cart/cartview.dart';
import 'package:http/http.dart' as http;
import '../../datalayer/model/putquantitycart.dart';
import '../../datalayer/repostory/cartrepo.dart';
import '../../datalayer/repostory/putcart.dart';
import '../../helper/resultprocess.dart';

class CartViewModel extends ChangeNotifier {

  final Locator reader;

  BuildContext? context;

  CartViewModel({required this.reader, this.context}) {
    getCart(context);
  }

  CartModel _cartModel = CartModel(data: []);
  AddToCartModel _addToCartModel = AddToCartModel();
  DeleteCartModel _deleteCartModel = DeleteCartModel();
  SharedPreferences? _sharedPreferences;

  AddToCartModel get addToCartModel => _addToCartModel;

  set addToCartModel(AddToCartModel value) {
    _addToCartModel = value;
  }

  CartModel get cartModel => _cartModel;

  set cartModel(CartModel value) {
    _cartModel = value;
  }

  bool _load = false;

  bool get load => _load;

  set load(bool value) {
    _load = value;
    notifyListeners();
  }

  SharedPreferences? get sharedPreferences => _sharedPreferences;

  set sharedPreferences(SharedPreferences? value) {
    _sharedPreferences = value;
  }

  DeleteCartModel get deleteCartModel => _deleteCartModel;

  set deleteCartModel(DeleteCartModel value) {
    _deleteCartModel = value;
  }

  addCart({
    required context,
    itemIndex,
    productId,
    remove,
    qun,
  }) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    var token = _sharedPreferences!.getString("token");
    if (token == 0 || token == null) {
      AppDialog(
        context: context,
        dialogType: DialogType.INFO,
        animType: AnimType.BOTTOM_SLIDE,
        title:"انت غير مسجل بتطبيق ثمرة" ,
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
      AddToCartModel cartModel = AddToCartModel();
      AddToCartRepo.getAddCartRepo(
        token: token,
        amount:qun,
        product_id: productId,
        index: itemIndex,
      ).then((value) {
        cartModel = value;
        notifyListeners();
        getCart(context);
      });
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(
          content: const Text(
            "تمت الاضافة للسله بنجاح",
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
                context, MaterialPageRoute(builder: (_) => CartScreen()));
          },
        ));
    }

    notifyListeners();
    getCart(context);
  }//

  getCart(context) async {
    SharedPreferences? sharedPreferences =
    await SharedPreferences.getInstance();
    var customer = sharedPreferences.getString("token");
    _cartModel = await CartRepo.getCartRepo(token: customer);
    load = true;
    notifyListeners();
  }

  tapIcon(context) async {
    SharedPreferences? sharedPreferences =
        await SharedPreferences.getInstance();
    var customer = sharedPreferences.getString("customerId");
    if (customer == null) {
      return AppDialog(
        context: context,
        dialogType: DialogType.INFO,
        animType: AnimType.BOTTOM_SLIDE,
        title:"انت غير مسجل بتطبيق ثمرة" ,
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
      )..show();
    } else {
      return Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, widget) {
            return FadeTransition(
              opacity: animation,
              child: CartScreen(),
            );
          },
        ),
      );
    }
  }

  getRemoveToCart({
    id,
    cartItemId,
    context,
    index,
  }) async {
    SharedPreferences? sharedPreferences =
    await SharedPreferences.getInstance();
    var customer = sharedPreferences.getString("token");
    deleteCartModel = await RemoveCartRepo.getRemoveCartRepo(
        token: customer, index: index, cartItemId: cartItemId);
    notifyListeners();
    getCart(context);
    if (deleteCartModel.status == "success") {
      ResultProcess.drewResultProcess(
        context: context,
        reson: deleteCartModel.message.toString(),
        status: true,
        nav: const Text("home"),
      );
      // notifyListeners();
      notifyListeners();
      getCart(context);
    } else {
      MassageApp.flusherBarErrorMassage(
          context, deleteCartModel.message.toString(), "", (flushbar) {});
    }
    notifyListeners();
    print("&%^&@#&@^#%@&^#%&^#%@&&&&&&&&&&&&&&&&&&&&&^#%&@^%@#&&^@#");
  }

  PutCartModel p = PutCartModel();

  changeAmountCart({required context, index, amount, remove}) async {
    SharedPreferences? sharedPreferences =
        await SharedPreferences.getInstance();
    var customer = sharedPreferences.getString("token");
    p = await PutToCartRepo.getChangeCartRepo(amount: amount, token: customer);
    if (customer == null || customer == 0) {
      print("@&((@&!!!!!!!!!!!!!(*null emptu&&&&(@&@#@&(Y#&(");
    } else {
      var qun = _cartModel.data[index].amount;
      if (remove) {
        _cartModel.data[index].amount++;
        qun = _cartModel.data[index].amount;
        //  notifyListeners();
        notifyListeners();
       // getCart(context);
        //
      } else {
        if (_cartModel.data[index].amount > 0) {
          _cartModel.data[index].amount--;
          qun = _cartModel.data[index].amount;
          notifyListeners();
      //    getCart(context);
          print("@@^&#%#&^@%^#@&#%&@^#%@&^%&@!!&@");
        }
      }
      //  getCart(context);
    }
  }
}
