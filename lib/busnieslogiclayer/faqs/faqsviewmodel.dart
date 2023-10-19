import 'package:flutter/cupertino.dart';
import 'package:untitled1/datalayer/repostory/faqsrepo.dart';

import '../../datalayer/model/faqsmodel.dart';

class FaqsViewModel extends ChangeNotifier {
  FaqsViewModel() {
    getFaqsFromRepo();
  }
  FaqsModel faqsModel = FaqsModel(data: []);
  bool _faqsLoading = false;

  bool get faqsLoading => _faqsLoading;

  set faqsLoading(bool value) {
    _faqsLoading = value;
  }

  getFaqsFromRepo() async {
    faqsModel = await FaqsRepo.getFaqsRepo();
    faqsLoading = true;
    notifyListeners();
  }
}
