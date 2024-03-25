import 'package:admin_securechat/home/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:admin_securechat/constants/constants_exports.dart';
import 'package:admin_securechat/home/issues/issue_service.dart';

class Issues extends StatefulWidget {
  const Issues({Key? key}) : super(key: key);

  @override
  State<Issues> createState() => _IssuesState();
}

class _IssuesState extends State<Issues> {
  final colorTheme = SCColorTheme();
  final textTheme = SCTextTheme();

  List<Map<String, dynamic>> issueData = []; // List to store issue data

  @override
  void initState() {
    super.initState();
    // Call the fetchIssueData method when the widget is initialized
    fetchIssueData();
  }

  // Method to fetch issue data
  Future<void> fetchIssueData() async {
    try {
      List<Map<String, dynamic>> data = await IssueService.getIssueData();
      setState(() {
        issueData = data;
      });
    } catch (e) {
      print('Error fetching issue data: $e');
      // Handle error if needed
    }
  }

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
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email of Users who reported issues in app:',
                          style: SCTextTheme()
                              .heading3
                              .copyWith(color: SCColorTheme().white),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(height: 8),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10.0, top: 10, right: 10),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.green),
                                borderRadius: BorderRadius.circular(20),
                                color: SCColorTheme().transparent,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: ListView.builder(
                                  itemCount: issueData.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        Container(
                                          color: SCColorTheme().primaryColorBlue600,
                                          child: ListTile(
                                            title: Text(
                                             'Email: ${issueData[index]['userEmail']}',
                                              style: TextStyle(color: Colors.white),
                                            ),
                                            subtitle: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Description: ${issueData[index]['description']}',
                                                  style: TextStyle(color: Colors.white),
                                                ),
                                                Text(
                                                  'Timestamp: ${issueData[index]['timestamp']}',
                                                  style: TextStyle(color: Colors.white),
                                                ),
                                                Text(
                                                  'Screenshot URL: ${issueData[index]['screenshotUrl']}',
                                                  style: TextStyle(color: Colors.white),
                                                ),
                                              ],
                                            ),
                                            trailing: Transform.rotate(
                                              angle: 180 * 3.1415926535 / 180,
                                              child: Icon(Icons.arrow_back_ios_outlined, color: Colors.white),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
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


