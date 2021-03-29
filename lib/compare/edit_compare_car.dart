import 'package:flutter/material.dart';

class EditCompareCars extends StatefulWidget {
  @override
  _EditCompareCarsState createState() => _EditCompareCarsState();
}

class _EditCompareCarsState extends State<EditCompareCars> with SingleTickerProviderStateMixin {
  List<String> brandList = ['Ford','Maruthi','Kia'];
  List<String> modelList = ['Swift','Seltos','Ciaz'];
  List<String> versionList = ['LXI','VXI','Alpha'];

  List<String> tempList = List<String>();


  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this);
    super.initState();
  }

  _filterBrandList(String text) {
    if(text.isNotEmpty){
      setState(() {
        brandList = tempList;
      });
    }
    else{
      final List<String> filteredBrands = List<String>();
      tempList.map((breed){
        if(breed.contains(text.toString().toUpperCase())){
          filteredBrands.add(breed);
        }
      }).toList();
      setState(() {
        brandList.clear();
        brandList.addAll(filteredBrands);
      });
    }
  }

  _filterModelList(String text) {
    if(text.isNotEmpty){
      setState(() {
        modelList = tempList;
      });
    }
    else{
      final List<String> filteredModels = List<String>();
      tempList.map((breed){
        if(breed.contains(text.toString().toUpperCase())){
          filteredModels.add(breed);
        }
      }).toList();
      setState(() {
        modelList.clear();
        modelList.addAll(filteredModels);
      });
    }
  }

  _filterVersionList(String text) {
    if(text.isNotEmpty){
      setState(() {
        versionList = tempList;
      });
    }
    else{
      final List<String> filteredVersion = List<String>();
      tempList.map((breed){
        if(breed.contains(text.toString().toUpperCase())){
          filteredVersion.add(breed);
        }
      }).toList();
      setState(() {
        versionList.clear();
        versionList.addAll(filteredVersion);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Compare Cars",style:
          TextStyle(
            color: Colors.white
          ),),
      ),

      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.red[200],
                ),
                child: TabBar(
                  unselectedLabelColor:Colors.grey[600],
                  unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color:Colors.red
                  ),
                  labelStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  tabs: [
                    Tab(
                      child: Center(child: Text("SELECT BRAND",textAlign: TextAlign.center,)),
                    ),
                    Tab(
                      child: Center(child: Text("SELECT MODEL",textAlign: TextAlign.center,)),
                    ),
                    Tab(
                      child: Center(child: Text("SELECT VERSION",textAlign: TextAlign.center,)),
                    ),
                  ],
                  controller: _tabController,
                  indicatorSize: TabBarIndicatorSize.tab,
                ),
              ),
            ),

            Expanded(
              child: TabBarView(
                  controller: _tabController,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(bottom: 16.0),
                              child: TextField(
                                    decoration: InputDecoration(
                                    hintText: "Type to Select Brand eg:Ford",
                                    ),
                                    onChanged: (text){
                                      _filterBrandList(text);
                                        },),),
                          ListView.builder(
                            scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: brandList.length,
                              itemBuilder: (context,index){
                                return ListTile(
                                    title: Text(brandList[index],)
                                );
                              }),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(bottom: 16.0),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Type to Select Model eg:Swift",
                              ),
                              onChanged: (text){
                                _filterModelList(text);
                              },),),
                          ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: modelList.length,
                              itemBuilder: (context,index){
                                return ListTile(
                                    title: Text(modelList[index],)
                                );
                              }),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(bottom: 16.0),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Type to Select Version eg:LXI",
                              ),
                              onChanged: (text){
                                _filterVersionList(text);
                              },),),
                          ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: versionList.length,
                              itemBuilder: (context,index){
                                return ListTile(
                                    title: Text(versionList[index],)
                                );
                              }),
                        ],
                      ),
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
