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
  static const merchant = "/merchant";
  static const setting = "/setting";
  static const updateNickname = "/update_nickname";
  static const updateAvatar = "/update_avatar";
  static const terms = "/terms";
  // 钱包
  static const wallet = "/wallet";
  static const walletMethodBanks = "/wallet_method_banks";
  static const walletMethod = "/wallet_method";
  static const walletMethodBankAddition = "/wallet_method_bank_addition";
  static const walletMethodQRcodeAddition = "/wallet_method_QRcode_addition";
  static const walletMethodCryptoAddition = "/wallet_method_crypto_addition";
  static const walletFunds = "/wallet_funds";
  static const walletSpot = "/wallet_spot";
  static const walletFutures = "/wallet_futures";
  static const walletHistory = "/wallet_history";
  static const recharge = "/recharge";
  static const withdrawal = "/withdrawal";
  static const transfer = "/transfer";
  static const walletDetail = "/wallet_detail/:id";

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

  // 代理系统
  static const agentDashboard = "/agent_system_dashboard";
  static const agentIncome = "/agent_system_income";
  static const agentHierarchy = "/agent_system_hierarchy";
  static const agentSetting = "/agent_system_setting";

  // 广告
  static const adBuying = "/ad_buying";
  static const adSelling = "/ad_selling";
  static const adOwn = "/ad_own";
  static const adPost = "/ad_post";
  static const adPostPayment = "/ad_payment";

  //kyc
  static const authPrimary = "/auth_primary";
  static const authSenior = "/auth_senior";
  static const authJunior = "/auth_junior";
}
