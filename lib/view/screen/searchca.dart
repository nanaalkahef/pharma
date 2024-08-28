
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:pharma_mvc/controller/homepage_controller.dart';
import 'package:pharma_mvc/main.dart';
import 'package:pharma_mvc/view/screen/showproudect.dart';


class categorySearch extends SearchDelegate{
    controller_homepage controll = Get.find();
  @override
  List<Widget>? buildActions(BuildContext context) {
    return[ IconButton(onPressed:(){
      query="";
    }, icon:Icon(Icons.clear)) ,
   
    
     ] ;
    
  }

  @override
  Widget? buildLeading(BuildContext context) {
    
    return IconButton(onPressed: (){
      close(context, null);
    }, icon: Icon(Icons.arrow_back,color: Colors.green[700],size: 30,weight: 30,));
  }



  @override
  Widget buildSuggestions(BuildContext context) {
     var to=shardpre!.getString('token');
  if(query==""){
    return
    
    Center(child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("36".tr,style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,color:Colors.green.shade700),),
        SizedBox(height: 20,),
        Image.asset('lib/images/wibe.jpg',width: 300,height: 300,),

     
      ],
    ));}
    else{
       return  Obx(() {
              if (controll.category.isNotEmpty) {
            List fl=controll.category.where((element) {
              return element.name.toString().startsWith(query[0].toLowerCase())|| 
              element.name.toString().startsWith(query[0].toUpperCase());
            }).toList();
        
          
         
            print("////////////////////////////////////////");
        
           return ListView
            
            
            .builder(
          
           itemCount: fl.length,
           itemBuilder: (context, index) =>InkWell(
            onTap: () {
            
                          Get.to( showproduect(category: controll.category[index],)
                         );
             
            },
           
              child: Stack(
            children: [Container(margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            height: 130,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
          color:Colors.white,boxShadow: [BoxShadow(
            offset: Offset(0, 25),
            blurRadius: 25,
            color: Colors.black12,
          )])
          ),
             Container(height: 110,
              width:  110,
              margin: EdgeInsets.only(left:25,right: 0,top: 19,bottom: 0),
        
                child: Image.network(fl[index].photo.toString(),
                height: 5,width:5,),),
              
              Container(width: 350,height:160,
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
                children: [
              
                Text(fl[index].name.toString() ,style: const TextStyle(fontWeight: FontWeight.bold, fontSize:21,
                color: Colors.black),),
                  ],),
            )
              
           
            ]
            ),
        )
          
       );
 
       

          }
        
    
         
         else{
        return  Center(child: CircularProgressIndicator(),);
       
       }
       
         }
       );

    }

}

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    var to=shardpre!.getString('token');
  if(query==""){
    return
    
    Center(child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("36".tr,style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,color:Colors.green.shade700),),
        SizedBox(height: 20,),
        Image.asset('lib/images/wibe.jpg',width: 300,height: 300,),

      //  Text("Pleas search heer about your product" ,style: TextStyle(color: Colors.green[700],fontSize:20),)
      ],
    ));}
    else{
       return 
      Obx(() {
              if (controll.category.isNotEmpty) {
            List fl=controll.category.where((element) {
              return element.name.toString().startsWith(query[0].toLowerCase())||element.name.toString().startsWith(query[0].toUpperCase());
            }).toList();
         //   fl=p.where((element) {
           //   return element.scientificName.toString().startsWith(query);
         //   }).toList();
          
         
            print("////////////////////////////////////////");
        
           return ListView
            
            
            .builder(
          
           itemCount: fl.length,
           itemBuilder: (context, index) =>InkWell(
            onTap: () {
            
                        Get.to( showproduect(category: controll.category[index],)
                         );
             
            },
           
              child: Stack(
            children: [Container(margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            height: 130,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
          color:Colors.white,boxShadow: [BoxShadow(
            offset: Offset(0, 25),
            blurRadius: 25,
            color: Colors.black12,
          )])
          ),
             Container(height: 110,
              width:  110,
              margin: EdgeInsets.only(left:25,right: 0,top: 19,bottom: 0),
        
                child: Image.network(fl[index].photo.toString(),
                height: 5,width:5,),),
              
              Container(width: 350,height:160,
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
                children: [
              
                Text(fl[index].name.toString() ,style: const TextStyle(fontWeight: FontWeight.bold, fontSize:21,
                color: Colors.black),),
                  ],),
            )
              
           
            ]
            ),
        )
          
       );
 
       

          }
        
    
         
         else{
        return  Center(child: CircularProgressIndicator(),);
       
       }
       
         }
       );

    }


  }
  }