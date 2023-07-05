import 'package:flutter_openim_widget/flutter_openim_widget.dart';

class RedPacket {
  int? id;
  String? recordId; // 红包流水号
  int? totalPoint; // 总球币
  int? point; //单个红包球币
  int? count; //实时剩余数量（如果为0，说明红包已经被领完）
  int? realCount; // 红包个数
  String? valtime; //过期时间
  String? createtime; //创建时间
  String? updatetime; // 更新时间
  String? remark; // 红包标题
  String? userId; //用户id
  String? userName;
  List<RedItem>? redList;
  String? avatar;
  UserInfo? createUserInfo;
  UserInfo? receiveUserInfo;

  RedPacket({
    this.realCount,
    this.userId,
    this.recordId,
    this.totalPoint,
    this.point,
    this.count,
    this.redList,
    this.avatar,
    this.createtime,
    this.id,
    this.createUserInfo,
    this.receiveUserInfo,
    this.remark,
    this.userName,
    this.updatetime,
    this.valtime,
  });

  RedPacket.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    recordId = map['record_id'];
    userId = map['user_id'];
    totalPoint = map['total_point'];
    point = map['point'];
    count = map['count'];
    realCount = map['real_count'];
    valtime = map['val_time'];
    createtime = map['create_time'];
    updatetime = map['update_time'];
    remark = map['remark'];
    userName = map['username'];
    avatar = map['avatar'];
    redList = (map['red_list'] as List<dynamic>?)
            ?.map((e) => RedItem.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [];
    // money = map['money'];
    // status = map['status'] ?? 0;
    // title = map['title'];
    // createTime = map['createTime'];
    // updateTime = map['updateTime'];
    // receiveTime = map['receiveTime'];
    // overdueTime = map['overdueTime'];
    if (map['createUserInfo'] != null) {
      createUserInfo = UserInfo.fromJson(map['createUserInfo']);
    }
    if (map['receiveUserInfo'] != null) {
      receiveUserInfo = UserInfo.fromJson(map['receiveUserInfo']);
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['record_id'] = recordId;
    data['user_id'] = userId;
    data['total_point'] = totalPoint;
    data['point'] = point;
    data['count'] = count;
    data['real_count'] = realCount;
    data['val_time'] = valtime;
    data['create_time'] = createtime;
    data['update_time'] = updatetime;
    data['remark'] = remark;
    data['username'] = userName;
    data['avatar'] = avatar;
    data['red_list'] = redList?.map((e) => e.toJson()).toList();
    // data['updateTime'] = updateTime;
    // data['money'] = money;
    // data['status'] = status;
    // data['title'] = title;
    // data['createTime'] = createTime;
    // data['receiveTime'] = receiveTime;
    // data['overdueTime'] = overdueTime;
    if (createUserInfo != null) {
      data['createUserInfo'] = createUserInfo!.toJson();
    }
    if (receiveUserInfo != null) {
      data['receiveUserInfo'] = receiveUserInfo!.toJson();
    }
    return data;
  }
}

class RedItem {
  int? id;
  String? userId;
  String? title;
  String? createtime; //创建时间
  String? updatetime; // 更新时间
  String? exchangetime; //领取时间
  int? point; //球币
  int? sort;
  String? redpacketid;
  String? clientid;
  String? username;
  String? avatar;

  RedItem(
      {this.id,
      this.userId,
      this.title,
      this.createtime,
      this.updatetime,
      this.exchangetime,
      this.point,
      this.sort,
      this.redpacketid,
      this.clientid,
      this.username,
      this.avatar});

  RedItem.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    userId = map['user_id'];
    title = map['title'];
    createtime = map['create_time'];
    updatetime = map['update_time'];
    exchangetime = map['exchange_time'];
    point = map['point'];
    sort = map['sort'];
    redpacketid = map['red_packet_id'];
    clientid = map['client_id'];
    username = map['username'];
    avatar = map['avatar'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['title'] = title;
    data['create_time'] = createtime;
    data['update_time'] = updatetime;
    data['exchange_time'] = exchangetime;
    data['point'] = point;
    data['sort'] = sort;
    data['red_packet_id'] = redpacketid;
    data['client_id'] = clientid;
    data['username'] = username;
    data['avatar'] = avatar;
    return data;
  }
}
