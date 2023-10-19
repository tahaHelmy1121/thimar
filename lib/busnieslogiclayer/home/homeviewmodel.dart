import 'package:app_dialog/app_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/datalayer/model/slider.dart';
import 'package:untitled1/datalayer/repostory/searchrepo.dart';
import 'package:untitled1/presntionlayer/subdetails.dart';

import '../../datalayer/model/categoriesmodel.dart';
import '../../datalayer/model/get_notifications_model.dart';
import '../../datalayer/model/product_rate.dart';
import '../../datalayer/model/productsmodel.dart';
import '../../datalayer/model/search.dart';
import '../../datalayer/repostory/catgoryrepo.dart';
import '../../datalayer/repostory/getproductcategory.dart';
import '../../datalayer/repostory/getproductrate.dart';
import '../../datalayer/repostory/notificationrepo.dart';
import '../../datalayer/repostory/productsrepo.dart';
import '../../datalayer/repostory/sliderrepo.dart';
import '../../presntionlayer/auth/loginview.dart';

class HomePageProvider extends ChangeNotifier {
  final Locator reader;

  BuildContext? context;

  HomePageProvider({required this.reader, this.context}) {
    getCategory();
    getSlider();
    getProductHome();
    checkUser();
    getSearchData();
    getSubProductCategory();
    getProductRate();
    getNotificationUser();
  }

  List<CategoriesModel>? _myCategoryData = [];
  CategoriesModel categoriesModel = CategoriesModel(data: []);

  List<CategoriesModel>? get myCategoryData => _myCategoryData;

  set myCategory(List<CategoriesModel>? value) {
    _myCategoryData = value;
  }

  bool? _catLoading = false;

  bool? get catLoading => _catLoading;

  set catLoading(bool? value) {
    _catLoading = value;
  }

  SharedPreferences? _sharedPreferences;
  SliderModel sliderModel = SliderModel(data: []);

  getCategory() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    var customer = _sharedPreferences!.getString("token");
    categoriesModel = await Category.getCategoryRepo();

    _catLoading = true;

    notifyListeners();
  }

  var _customer;

  get customer => _customer;

  set customer(value) {
    _customer = value;
  }

  String? _name = "";

  String? get name => _name;

  set name(String? value) {
    _name = value;
  }

  String? _email = "";

  String? get email => _email;

  set email(String? value) {
    _email = value;
  }

  checkUser() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _customer = _sharedPreferences!.getString("customerId");
    _name = _sharedPreferences!.getString("token");
    _email = _sharedPreferences!.getString("phone");
    notifyListeners();
  }

  getSlider() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    var customer = _sharedPreferences!.getString("token");
    sliderModel = await SliderRepo.getSliderRepo();

    _catLoading = true;

    notifyListeners();
  }

  ProductRateModel productRateModel = ProductRateModel(data: []);

  getProductRate() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    var customer = _sharedPreferences!.getString("token");
    productRateModel = await GetProductRateRepo.getRateRepo(token: customer);

    _catLoading = true;

    notifyListeners();
  }

  ProductsModel categoriesProductModel = ProductsModel(data: []);

  getProductHome() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    var customer = _sharedPreferences!.getString("token");
    categoriesProductModel = await ProductsRepo.getProductsRepo();

    _catLoading = true;

    notifyListeners();
  }

  ProductsModel pro = ProductsModel(data: []);

  getSubProductCategory({index, id, cId, context, name}) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    var customer = _sharedPreferences!.getString("token");
    if (customer != null || customer != 0) {
      pro = await GetProductCategoryRepo.getSubProductCategory(
          token: customer,
          //   name: categoriesModel.data[index].id,
          category_id: categoriesProductModel.data[index].categoryId,
          id: categoriesModel.data[index].id);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => SubDetailsCategory(
                    name: categoriesModel.data[index].name,
                  )));
    } else {
      if (customer == null || customer == 0) {
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
      }
    }

    _catLoading = true;

    notifyListeners();
  }

  TextEditingController searchController = TextEditingController();

  SearchModel searchmodel = SearchModel();
  bool isSearch = false;
  bool searchLoading = false;

  checkSearch(val) {
    if (val == "") {
      isSearch = false;
    }
    notifyListeners();
  }

  onSearchItems() {
    isSearch = true;
    getSearchData();
    //  notifyListeners();
  }

  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  getSearchData() async {
    searchLoading = true;
    searchmodel =
        await SearchRepo.getSearchRepo(keyword: searchController.text);

    notifyListeners();
  }

  NotificationModel notificationModel = NotificationModel();

  getNotificationUser() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    var customer = _sharedPreferences!.getString("token");
    notificationModel =
        await NotificationRepo.getNotificationRepo(token: customer);
    notifyListeners();
  }
}
