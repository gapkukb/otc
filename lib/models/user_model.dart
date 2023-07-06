class UserModel {
  int id;
  String username;
  String email;
  String phone;
  String regIp;
  String regServerName;
  String regReferer;
  String regDevice;
  bool emailValid;
  bool idValid;
  bool phoneValid;
  String nickname;
  String avatar;
  bool disabled;
  String type;
  String invitationCode;
  String lockedUntil;
  bool locked;
  String createdTime;
  bool payPass;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.phone,
    required this.regIp,
    required this.regServerName,
    required this.regReferer,
    required this.regDevice,
    required this.emailValid,
    required this.idValid,
    required this.phoneValid,
    required this.nickname,
    required this.avatar,
    required this.disabled,
    required this.type,
    required this.invitationCode,
    required this.lockedUntil,
    required this.locked,
    required this.createdTime,
    required this.payPass,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'] as int,
        username: json['username'] as String,
        email: json['email'] as String,
        phone: json['phone'] as String,
        regIp: json['regIp'] as String,
        regServerName: json['regServerName'] as String,
        regReferer: json['regReferer'] as String,
        regDevice: json['regDevice'] as String,
        emailValid: json['emailValid'] as bool,
        idValid: json['idValid'] as bool,
        phoneValid: json['phoneValid'] as bool,
        nickname: json['nickname'] as String,
        avatar: json['avatar'] as String,
        disabled: json['disabled'] as bool,
        type: json['type'] as String,
        invitationCode: json['invitationCode'] as String,
        lockedUntil: json['lockedUntil'] as String,
        locked: json['locked'] as bool,
        createdTime: json['createdTime'] as String,
        payPass: json['payPass'] as bool,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'email': email,
        'phone': phone,
        'regIp': regIp,
        'regServerName': regServerName,
        'regReferer': regReferer,
        'regDevice': regDevice,
        'emailValid': emailValid,
        'idValid': idValid,
        'phoneValid': phoneValid,
        'nickname': nickname,
        'avatar': avatar,
        'disabled': disabled,
        'type': type,
        'invitationCode': invitationCode,
        'lockedUntil': lockedUntil,
        'locked': locked,
        'createdTime': createdTime,
        'payPass': payPass,
      };
}
