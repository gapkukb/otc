part of router;

class Routes {
  static const register = '/register';
  static const login = '/login';
  static const home = '/home';
  static const user = '/user';
  static const c2c = '/c2c';
  static const rebate = '/rebate';
  static const tasks = '/tasks';
  static const security = '/security';
  static const auth = '/auth';
  static const authPrimary = "/auth_primary";
  static const authJunior = "/auth_junior";
  static const authSenior = "/auth_senior";
  static const merchant = "/merchant";
  static const setting = "/setting";
  static const settingNickname = "/setting_nickname";
  static const settingAvatar = "/setting_avatar";
  // 钱包
  static const wallet = "/wallet";
  static const walletMethodBanks = "/wallet_method_banks";
  static const walletMethod = "/wallet_method";
  static const walletMethodBankAddition = "/wallet_method_bank_addition";
  static const walletMethodQRcodeAddition = "/wallet_method_QRcode_addition";
  static const walletFunds = "/wallet_funds";
  static const walletSpot = "/wallet_spot";
  static const walletFutures = "/wallet_futures";
  static const walletHistory = "/wallet_history";

  static const udpatePwd = "/update_pwd";
  static const updateEmail = "/update_email";
  static const bindEmail = "/bind_Email";
  static const captcha = "/captcha";
  static const f2a = "/f2a";
  static const updatePhone = "/update_phone";
  static const updateFundsPwd = "/update_funds_pwd";
  static const resetPwd = "/reset_pwd";
  // 订单
  static const order = "/order";
  static const pendingSpotOrder = "/pending_spot_order";
  static const historySpotOrder = "/history_spot_order";
  static const doneSpotOrder = "/done_spot_order";
  static const pendingFutureOrder = "/pending_future_order";
  static const historyFutureOrder = "/history_future_order";
  static const doneFutureOrder = "/done_future_order";
}
