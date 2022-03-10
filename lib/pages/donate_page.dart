import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/components.dart';
import '../components/components_app/app_components.dart';
import '../widgets/info/bank_donat_info.dart';

class DonatePage extends StatefulWidget {
  const DonatePage({Key? key}) : super(key: key);

  @override
  _DonatePageState createState() => _DonatePageState();
}

class _DonatePageState extends State<DonatePage> {
  final divider = AppComponents().divider;
  var launched = AppComponents().launched;
  final launchURL = AppComponents().launchURL;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(30, 10, 10, 10),
                child: Text(
                  'donate'.tr,
                  style: AppTextStyle.kHeadingTextStyle,
                ),
              ),
              divider,
              Container(
                margin: const EdgeInsets.fromLTRB(30, 10, 10, 10),
                child: Text(
                  'donateText'.tr,
                  style: AppTextStyle.kCurrentTextStyle,
                ),
              ),
              divider,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () => setState(() {
                      launched = launchURL(AppLinks.urlPayPal);}),
                    icon: Image.asset('assets/icons/Paypal.png'),
                    iconSize: MediaQuery.of(context).size.width * 0.2,
                  ),
                  const SizedBox(width: 30,),
                  IconButton(
                    onPressed: () => setState(() {
                      launched = launchURL(AppLinks.urlYooMoney);}),
                    icon: Image.asset('assets/icons/iomoney.png'),
                    iconSize: MediaQuery.of(context).size.width * 0.3,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BankDonatInfo(
                    nameBank: 'tinkoff'.tr,
                    numCardBank: '5536 9138 5194 5549',
                    pathIconBank: 'assets/icons/tinkoff.png',
                  ),
                  const SizedBox(width: 30,),
                  BankDonatInfo(
                    nameBank: 'sberBank'.tr,
                    numCardBank: '4274 3200 6899 8403',
                    pathIconBank: 'assets/icons/sber.png',
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}

