import 'package:admin_securechat/home/issues/issues.dart';
import 'package:flutter/material.dart';
import 'package:admin_securechat/constants/constants_exports.dart';
import 'package:admin_securechat/constants/widgets/data_containers.dart';
import 'package:admin_securechat/home/dashboard_service.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int totalUsers = 0;
  int totalReports =0;

  @override
  void initState() {
    super.initState();
    fetchTotalUsers();
    fetchTotalReports(); }

  Future<void> fetchTotalUsers() async {
    try {
      int total = await DashboardService.getTotalUsers();
      setState(() {
        totalUsers = total;
      });
    } catch (e) {
      print('Error fetching total users: $e');
    }
  }

  Future<void> fetchTotalReports() async {
    try {
      int total = await DashboardService.getTotalReports();
      setState(() {
        totalReports = total;
      });
    } catch (e) {
      print('Error fetching total Reports: $e');
    }
  }
  final colorTheme = SCColorTheme();
  final textTheme = SCTextTheme();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorTheme.primaryColorBlue800,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  width: 300,
                  height: 100,
                  color: colorTheme.primaryColorBlue600,
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/SecureChatlogo.png',
                        width: 50,
                        height: 50,
                      ),
                      const SizedBox(width: 10),
                      Text('SecureChat',
                          style: TextStyle(
                            color: SCColorTheme().white,
                          )),
                      SizedBoxes.horizontalEExtraGargangua,
                      Text(
                        'Overview',
                        style: SCTextTheme().heading3.copyWith(
                              color: SCColorTheme().white,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  color: colorTheme.primaryColorBlue600,
                  width: 200,
                  child: Column(children: [
                    Expanded(
                      child: ListView(
                        children: <Widget>[
                          ListTile(
                            leading: Icon(
                              Icons.dashboard_customize_outlined,
                              color: colorTheme.white,
                            ),
                            title: Text(
                              'Dashboard',
                              style: TextStyle(color: colorTheme.white),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Dashboard()),
                              );
                            },
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.analytics_outlined,
                              color: colorTheme.white,
                            ),
                            title: Text(
                              'Analytics',
                              style: TextStyle(color: colorTheme.white),
                            ),
                            onTap: () {},
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.manage_accounts_outlined,
                              color: colorTheme.white,
                            ),
                            title: Text(
                              'User Issues',
                              style: TextStyle(color: colorTheme.white),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Issues()),
                              );
                            },
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.feedback_outlined,
                              color: colorTheme.white,
                            ),
                            title: Text(
                              'Feedbacks',
                              style: TextStyle(color: colorTheme.white),
                            ),
                            onTap: () {},
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.settings,
                              color: colorTheme.white,
                            ),
                            title: Text(
                              'Settings',
                              style: TextStyle(color: colorTheme.white),
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                    ListTile(
                        leading: Icon(
                          Icons.logout,
                          color: colorTheme.white,
                        ),
                        title: Text(
                          'Logout',
                          style: TextStyle(color: colorTheme.white),
                        ),
                        onTap: () {})
                  ]),
                ),
               Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                         Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //user info container
                              DataContainer(
                                title: 'Total Users',
                                iconData: Icons.supervised_user_circle_outlined,
                                imagePath: 'assets/images/totnousers.png',
                                subTitle1: '+2% Since last week',
                                subTitle2: 'Total number of users: $totalUsers',
                              ),

                              //new registrations
                              DataContainer(
                                title: 'New Users Registered',
                                iconData: Icons.supervised_user_circle_outlined,
                                imagePath: 'assets/images/newuser.png',
                                subTitle1: '+6% Since last week',
                                subTitle2: 'Total number of new users registered: 11',
                              ),

                               //number of reports
                               DataContainer(
                                title: 'Total Report Received',
                                iconData: Icons.supervised_user_circle_outlined,
                                imagePath: 'assets/images/reports.png',
                                subTitle1: '+1% Since last week',
                                 subTitle2: 'Total number of reports: $totalReports',
                              ),
                            ],
                          ),
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                               DataContainer(
                                title: 'Active Users',
                                iconData: Icons.supervised_user_circle_outlined,
                                imagePath: 'assets/images/analytics.jpg',
                                subTitle1: 'Total number of Active Users: 11',
                                 subTitle2: 'Total number of users: $totalUsers',
                              ),
                               DataContainer(
                                title: 'Feedbacks',
                                iconData: Icons.supervised_user_circle_outlined,
                                imagePath: 'assets/images/feedbacks.png',
                                subTitle1: '+2% Since last week',
                                subTitle2: 'Total number of Feedbacks received: 2',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
