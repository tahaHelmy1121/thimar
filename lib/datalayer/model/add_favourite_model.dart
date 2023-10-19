class AddFavouriteModel {
  AddFavouriteModel({
    this.status,
    this.message,
    this.data,
  });

  var status;
  var message;
  var data;

  AddFavouriteModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = null;
  }
}
