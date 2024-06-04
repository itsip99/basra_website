import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_grid/simple_grid.dart';
import 'package:stsj/global/widget/app_bar.dart';
import 'package:stsj/static/screenConstant.dart' as screenHeight;

import 'package:stsj/core/views/components/home_menu.dart';

class HomePages extends StatefulWidget {
  @override
  _HomePagesState createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages>
    with AutomaticKeepAliveClientMixin<HomePages> {
  bool isLoading = false; // Initialize with a default value

  late String NamaUserID;
  late String EntryLevelID;
  late String EntryLevelName;
  late String Password;

  // String getGreeting(String currentTime) {
  //   final hour = int.parse(currentTime.split(":")[0]);

  //   if (hour >= 6 && hour < 12) {
  //     return "Selamat Pagi";
  //   } else if (hour >= 12 && hour < 16) {
  //     return "Selamat Siang";
  //   } else if (hour >= 16 && hour < 18) {
  //     return "Selamat Sore";
  //   } else {
  //     return "Selamat Malam";
  //   }
  // }

  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
    });
    try {
      SharedPreferences NamaLoginPref = await SharedPreferences.getInstance();

      bool status = NamaLoginPref.getBool("Status") ?? false;

      if (status == true) {
        NamaUserID = NamaLoginPref.getString("UserID") ?? '';
        EntryLevelID = NamaLoginPref.getString("EntryLevelID") ?? '';
        EntryLevelName = NamaLoginPref.getString("EntryLevelName") ?? '';
        Password = NamaLoginPref.getString("Password") ?? '';

        // Check for null values and provide default values if needed
      } else {
        // Handle the case where "Status" is not true or data is missing
        print("Data di SharedPreferences kosong atau Status tidak benar.");
      }
    } catch (e) {
      // Handle any exceptions here
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    double screenWidth = MediaQuery.of(context).size.width;
    bool screen = screenWidth >= screenHeight.screen;

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: CustomAppBar(),
        ),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : Center(
                child: SingleChildScrollView(
                  child: SpGrid(
                    spacing: 50,
                    runSpacing: 50,
                    alignment: WrapAlignment.center,
                    width: MediaQuery.of(context).size.width,
                    children: [
                      SpGridItem(
                        xs: 12,
                        sm: 5,
                        md: 5,
                        lg: 3,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          height: screen ? 400 : 250,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: screen ? 100 : 80,
                                  backgroundImage: NetworkImage(
                                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  child: Text(
                                    '${NamaUserID}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 25,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text('$EntryLevelName'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SpGridItem(
                        xs: 12,
                        sm: 7,
                        md: 7,
                        lg: 8,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          height: screen ? 400 : 250,
                          child: HomeMenuComponent(),
                        ),
                      ),
                    ],
                  ),
                ),
              ));
  }

  @override
  bool get wantKeepAlive => true;
}
