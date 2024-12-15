import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:suraj/core/route_handler/router_name.dart';
import 'package:suraj/core/utils/colors.dart';
import 'package:suraj/core/utils/strings.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int index = 0;
  final TextEditingController _searchController = TextEditingController();

  void _onSearchChanged() {
    setState(() {
      String searchQuery = _searchController.text.toLowerCase();
      // Add your search logic here
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        foregroundColor: ColorConstants.white,
        backgroundColor: ColorConstants.primaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              CommonConstants.appTitle,
              style: GoogleFonts.inter(
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.start,
            ),
            const SizedBox(width: 5),
          ],
        ),
        actions: [
          PopupMenuButton(
            color: ColorConstants.primaryColor,
            icon: Icon(Icons.more_vert),
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: ListTile(
                    leading: const Icon(Icons.logout, color: ColorConstants.white),
                    title: Text(
                      DashboardConstant.logoutButtonText,
                      style: TextStyle(color: ColorConstants.white),
                    ),
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed(RouterName.loginRoute);
                    },
                  ),
                ),
                PopupMenuItem(
                  child: ListTile(
                    leading: const Icon(Icons.account_circle_rounded, color: ColorConstants.white),
                    title: Text(
                      DashboardConstant.profileButtonText,
                      style: TextStyle(color: ColorConstants.white),
                    ),
                    onTap: () {
                      // Navigate to ProfileScreen if needed
                    },
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Card(
                color: Colors.white.withOpacity(0.7),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: _searchController,
                  cursorRadius: const Radius.circular(10.0),
                  cursorWidth: 2.0,
                  decoration: InputDecoration(
                    hintText: "Search OFS Number",
                    prefixIcon: const Icon(Icons.search, size: 25, color: ColorConstants.primaryColor),
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          _searchController.clear();
                        });
                      },
                      child: const Icon(Icons.clear, size: 25, color: ColorConstants.primaryColor),
                    ),
                    contentPadding: const EdgeInsets.only(bottom: 5),
                    isDense: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              // Tab bar
              Card(
                elevation: 5,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TabBar(
                  onTap: (value){
                    setState(() {
                      index = value;
                    });
                    // if(index  != 0){
                    //
                    // }
                    // else{
                    //
                    // }

                  },
                  controller: _tabController,
                  indicatorColor: Colors.transparent,
                  labelColor: ColorConstants.white,
                  unselectedLabelColor: Colors.black,
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelStyle: const TextStyle(fontSize: 16),
                  unselectedLabelStyle: const TextStyle(fontSize: 16),
                  indicator: BoxDecoration(
                    color: ColorConstants.primaryColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  tabs: const <Widget>[
                    Tab(
                      child: Text('INWARD', style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                    ),
                    Tab(
                      child: Text('OUTWARD', style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                    ),
                  ],
                ),
              ),
              // Tab bar view
              SizedBox(
                height: 400, // Adjust the height as needed
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    // Inward Tab Content
                    customInwardWidget(),
                    // Outward Tab Content
                    customOutwardWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget customInwardWidget(){
    return Container(
      height: 100,
      child: Card(
        child: Column(
          children: [
            Center(child: Text("Inward Data"))
          ],
        ),
      ),
    );
  }

  Widget customOutwardWidget(){
    return Container(
      height: 100,
      child: Card(
        child: Column(
          children: [
            Center(child: Text("Outward Data")),
          ],
        ),
      ),
    );
  }

}
