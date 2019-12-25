import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_task/Account.dart';
import 'package:flutter_task/Colors.dart';
import 'package:flutter_task/Homepage.dart';
import 'package:flutter_task/dialog.dart';
import 'package:flutter_task/tabProvider.dart';
import 'package:provider/provider.dart';
import 'floatPosition.dart';

void main() => runApp(ChangeNotifierProvider<AppState>(
    child: MyApp(),
    create: (context) {
      return AppState();
    }));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(initialIndex: 0, length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: Locale("ar"),
      supportedLocales: [Locale('ar')],
      theme: ThemeData(
          primaryColor: primary_color,
          appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(color: Colors.white),
              textTheme: TextTheme(
                  subtitle: TextStyle(color: Colors.white),
                  title: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: "Almarai",
                      fontWeight: FontWeight.w900))),
          textTheme: TextTheme(
              body1: TextStyle(
            fontFamily: 'Almarai',
          ))),
      home: Builder(builder: (
        context,
      ) {
        return Scaffold(
          floatingActionButtonLocation:
              StartFloatFloatingActionButtonLocation(),
          floatingActionButton: Builder(builder: (
            context,
          ) {
            return Consumer<AppState>(builder: (context, model, _) {
              if (model.currentPage == 1) {
                return SizedBox();
              }
              return FloatingActionButton(
                backgroundColor: secondary_color,
                isExtended: false,
                onPressed: () {
                  showDialog(context: context, child: CustomDialog());
                },
                child: Icon(Icons.add),
              );
            });
          }),
          drawer: Drawer(),
          appBar: AppBar(
            title: Consumer<AppState>(builder: (context, model, _) {
              if (model.currentPage == 0) {
                return Text("الرئيسية");
              }
              return Text("حسابي");
            }),
            bottom: PreferredSize(
              preferredSize: Size(MediaQuery.of(context).size.width, 56),
              child: Consumer<AppState>(builder: (context, model, _) {
                return TabBar(
                  indicatorColor: Colors.white,
                  onTap: (index) {
                    //  AppState appState = Provider.of<AppState>(context);
                    model.changePage(_tabController.index);
                  },
                  controller: _tabController,
                  tabs: <Widget>[
                    Container(
                      height: 48,
                      child: Text(
                        "الرئيسية",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Almarai',
                            fontWeight: FontWeight.w900),
                      ),
                      alignment: Alignment.center,
                    ),
                    Text("حسابي",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Almarai',
                            fontWeight: FontWeight.w900))
                  ],
                );
              }),
            ),
          ),
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: <Widget>[HomePage(), Account()],
          ),
        );
      }),
    );
  }
}
