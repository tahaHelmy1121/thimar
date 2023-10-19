class NotificationModel {
  NotificationModel({
     this.data,
  });

   Data? data;

  NotificationModel.fromJson(Map<String, dynamic> json) {
    data = Data.fromJson(json['data']);
  }
}

class Data {
  Data({
    required this.unreadnotificationsCount,
    required this.notifications,
  });

  late final int unreadnotificationsCount;
  late final List<Notifications> notifications;

  Data.fromJson(Map<String, dynamic> json) {
    unreadnotificationsCount = json['unreadnotifications_count'];
    notifications = List.from(json['notifications'])
        .map((e) => Notifications.fromJson(e))
        .toList();
  }
}

class Notifications {
  Notifications({
    required this.id,
    required this.title,
    required this.body,
    required this.notifyType,
    this.order,
    this.offer,
    this.chat,
    required this.createdAt,
    required this.readAt,
    required this.image,
  });

  late final String id;
  late final String title;
  late final String body;
  late final String notifyType;
  late final void order;
  late final void offer;
  late final void chat;
  late final String createdAt;
  late final String readAt;
  late final String image;

  Notifications.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    notifyType = json['notify_type'];
    order = null;
    offer = null;
    chat = null;
    createdAt = json['created_at'];
    readAt = json['read_at'];
    image = json['image'];
  }
}

class Links {
  Links({
    required this.first,
    required this.last,
    this.prev,
    this.next,
  });

  late final String first;
  late final String last;
  late final void prev;
  late final void next;

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = null;
    next = null;
  }
}

class Meta {
  Meta({
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.links,
    required this.path,
    required this.perPage,
    required this.to,
    required this.total,
  });

  late final int currentPage;
  late final int from;
  late final int lastPage;
  late final List<Links> links;
  late final String path;
  late final int perPage;
  late final int to;
  late final int total;

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    links = List.from(json['links']).map((e) => Links.fromJson(e)).toList();
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }
}
