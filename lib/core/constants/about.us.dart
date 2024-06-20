class AccordionItem {
  final String header;
  final String body;

  AccordionItem(this.header, this.body);
}

final List<AccordionItem> accordionData = [
  AccordionItem(
    'Account Settings',
    'Manage your account settings including password, email, and more.',
  ),
  AccordionItem(
    'Privacy Policy',
    'Read our privacy policy and understand how we handle your data.',
  ),
  AccordionItem(
    'Terms of Service',
    'Understand the terms and conditions for using our platform.',
  ),
  AccordionItem(
    'Help & Support',
    'Find answers to common questions and get support from our team.',
  ),
  AccordionItem(
    'About Us',
    'Learn more about our company and our mission.',
  ),
];

class AboutConstant {
  static const List<Map<String, dynamic>> data = [
    {
      'header': 'Introduction',
      'body': 'Welcome to BhutanHub, your ultimate destination for a seamless '
          'shopping experience in Bhutan. We are committed to bringing you a diverse range of products and services, '
          'including new and second-hand goods, electronics, clothing, and much more, all in one place.'
    },
    {
      'header': 'Value proposition',
      'body': 'At BhutanHub, we prioritize your convenience and satisfaction. Our platform offers personalized recommendations '
          'based on your preferences, ensuring that you find exactly what you need, faster. With easy-to-navigate categories and a user-friendly interface, shopping has never been more enjoyable.'
    },
    {
      'header': 'What We Offer',
      'body': 'At BhutanHub, we offer a comprehensive shopping experience with both new and second-hand goods across a wide range of categories, '
          'including electronics, fashion, home goods, and services. Our platform features products from trusted brands, ensuring quality and reliability for all your needs.',
    }
  ];
}
