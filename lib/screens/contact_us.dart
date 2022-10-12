import 'package:attendly/color_constants.dart';
import 'package:attendly/custom_widgets.dart';
import 'package:flutter/material.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: customAppBar('Contact Us', contactusbgcolor));
  }
}
