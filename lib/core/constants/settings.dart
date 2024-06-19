import 'package:iconsax/iconsax.dart';

class Settings {
  Settings._();

  static const List<Map<String, dynamic>> accountSettings = [
    {
      'icon': Iconsax.add_square,
      'title': 'Product & Service',
      'subTitle': 'Post your products & services on the BhutanHub',
      'route': '/manage-addresses',
      'isSwitch': false,
    },
    {
      'icon': Iconsax.safe_home,
      'title': 'Address',
      'subTitle': 'Manage shipping addresses',
      'route': '/manage-addresses',
      'isSwitch': false,
    },
    {
      'icon': Iconsax.shopping_cart,
      'title': 'My Cart',
      'subTitle': 'Add, remove products and move to checkout',
      'route': null,
      'isSwitch': false,
    },
    {
      'icon': Iconsax.bag_tick,
      'title': 'Order History',
      'subTitle': 'View your order history',
      'route': '/order-history',
      'isSwitch': false,
    },
    {
      'icon': Iconsax.discount_shape,
      'title': 'My Coupons',
      'subTitle': 'List of all the discounted coupons',
      'route': null,
      'isSwitch': false,
    },
    // {
    //   'icon': Iconsax.card,
    //   'title': 'Payment Methods',
    //   'subTitle': 'Manage your payment methods',
    //   'route': '/payment-methods',
    //   'isSwitch': false,
    // },
  ];

  static const List<Map<String, dynamic>> appSettings = [
    {
      'icon': Iconsax.global,
      'title': 'Language',
      'subTitle': 'Select your preferred language',
      'route': '/language',
      'isSwitch': false,
    },
    {
      'icon': Iconsax.moon,
      'title': 'Dark Mode',
      'subTitle': 'Enable dark mode',
      'isSwitch': true,
      'value': true,
    },
    {
      'icon': Iconsax.location,
      'title': 'Geolocation',
      'subTitle': 'Set recommendation based on location',
      'isSwitch': true,
      'value': true,
    },
    {
      'icon': Iconsax.notification,
      'title': 'Notifications',
      'subTitle': 'Enable push notification',
      'isSwitch': true,
      'value': false,
    },
    {
      'icon': Iconsax.trash,
      'title': 'Delete Account',
      'subTitle': 'Delete your account associated to BhutanHub',
      'route': '/delete-account',
      'isSwitch': false,
    },
  ];

  static const List<Map<String, dynamic>> privacySettings = [
    {
      'icon': Iconsax.notification,
      'title': 'Notifications',
      'subTitle': 'Manage notification preferences',
      'route': '/notifications',
      'isSwitch': false,
    },
    {
      'icon': Iconsax.lock,
      'title': 'Login & Security',
      'subTitle': 'Manage your security settings',
      'route': '/security',
      'isSwitch': false,
    },
    {
      'icon': Iconsax.security_user,
      'title': 'Account Privacy',
      'subTitle': 'Manage data usage and connected accounts',
      'route': '/account-privacy',
      'isSwitch': false,
    },
  ];

  static const List<Map<String, dynamic>> supportSettings = [
    {
      'icon': Iconsax.message_question,
      'title': 'Help Center',
      'subTitle': 'Get help and support',
      'route': '/help-center',
      'isSwitch': false,
    },
    {
      'icon': Iconsax.note,
      'title': 'Feedback',
      'subTitle': 'Give us your feedback',
      'route': '/feedback',
      'isSwitch': false,
    },
    {
      'icon': Iconsax.info_circle,
      'title': 'About Us',
      'subTitle': 'Learn more about our company',
      'route': '/about',
      'isSwitch': false,
    },
  ];
}
