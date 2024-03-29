// ignore_for_file:constant_identifier_names
enum Banks {
  CMB("招商银行"),
  ICBC("中国工商银行"),
  BOCOM("交通银行"),
  CCB("中国建设银行"),
  ABC("中国农业银行"),
  CEB("中国光大银行"),
  CMBC("中国民生银行"),
  PAB("平安银行"),
  SPDB("上海浦东发展银行"),
  CIB("兴业银行"),
  BOCSH("中国银行"),
  CITIC("中信银行"),
  BOB("北京银行"),
  NJCB("南京银行"),
  GDB("广东发展银行"),
  HXBC("华夏银行"),
  PSBC("中国邮政储蓄银行"),
  SDB("深圳发展银行"),
  BEA("东亚银行"),
  BOS("上海银行"),
  HSB("恒生银行"),
  ZSB("浙商银行"),
  BJAB("北京农村商业银行"),
  HZBC("杭州银行"),
  NBBC("宁波银行"),
  HBNNX("河北农村信用社"),
  HKBC("汉口银行"),
  NEBC("东北农村信用社"),
  GDNX("广东农村信用社"),
  GXNX("广西农村信用社"),
  GZNX("贵州农村信用社"),
  HANNX("湖北农村信用社"),
  HENNX("河南农村信用社"),
  HLJNX("黑龙江农村信用社"),
  EBCL("北京恒丰银行"),
  HBNX("湖北农信社"),
  HNNX("湖南农信社"),
  ZJNX("浙江农信社"),
  CQSB("重庆农村商业银行"),
  QLSB("青岛农村商业银行"),
  QHNX("青海农信社"),
  SDNX("山东农信社"),
  YKSB("营口银行"),
  YNNX("云南农信社"),
  CSBC("长沙银行"),
  SXNX("山西农信社"),
  SHXNX("陕西农信社"),
  SRCB("上海农村商业银行"),
  JSBC("江苏银行"),
  JXNX("江西农信社"),
  JJBC("九江银行"),
  NYSBC("南阳市商业银行"),
  NMNX("内蒙古农信社"),
  LNNX("辽宁农信社"),
  SCNX("四川农信社"),
  BRCB("北京农商银行"),
  FJNX("福建农信社"),
  GSNX("甘肃农信社"),
  BSBC("北京顺义银行");

  const Banks(this.chinese);

  final String chinese;

  static Banks? getByName(String name) {
    return Banks.values.firstWhere((element) => element.name == name);
  }
}
