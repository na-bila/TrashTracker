// ignore_for_file: prefer_const_constructors, camel_case_types
import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/responsive.dart';
import 'package:untitled/controllers/menuAppController.dart';
import 'package:untitled/screens/dashboard/components/profile.dart';
//import 'package:flutter/src/material/menu_anchor.dart';


class  Header extends StatelessWidget {
  const Header({
   Key? key ,
  }) : super ( key:key);
  @override
  Widget build(BuildContext context){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (!Responsive.isDesktop(context) )
        IconButton(icon : Icon(Icons.menu),
          onPressed: context.read<MenuAppController>().controlMenu,
        ),
       // if (!Responsive.isMobile(context))
        Text (
          "Trash Tracker",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        if (!Responsive.isMobile(context))
        Spacer( flex:Responsive.isDesktop(context) ? 2:1,),
        ProfileCard(),

      ],
    );
  }
}
class ProfileCard extends StatelessWidget{
  const ProfileCard({
    Key?  key ,
  }) : super ( key:key);
  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.only(left: defaultPadding),
      padding: EdgeInsets.symmetric(horizontal: defaultPadding/2),
      decoration: BoxDecoration(color: secondaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Colors.white10)),
      child: Row(

        children: [

          if ( !Responsive.isMobile(context))
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding/2),

          ),
          IconButton(icon : Icon(Icons.person),
            onPressed:  () {
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) =>
    profile()));
    },
          ),

        ],
      ),
    );
  }}

//class  SearchField extends StatelessWidget {
//  const SearchField({
//   Key?  key ,
//  }) : super ( key:key);
//  @override
//  Widget build(BuildContext context){
//    return TextField (
//      decoration: InputDecoration(
//        hintText:"search",
//        fillColor: secondaryColor,
//        filled: true,
//        border: OutlineInputBorder (
//          borderSide: BorderSide.none,
//          borderRadius:
//          const BorderRadius.all(Radius.circular(10)),
//
//        ),
//        suffixIcon: InkWell(
//          onTap: () {} ,
//          child: Container(
//            padding: EdgeInsets.all(defaultPadding*0.75),
//            margin: EdgeInsets.symmetric(horizontal: defaultPadding/2),
//            decoration: BoxDecoration(
//              color: primaryColor,
//              borderRadius:
//              const BorderRadius.all(Radius.circular(10)),
//            ),
//            child: Icon(Icons.search),
//            // SvgPicture.asset ("assets/icons/search-right-1507-svgrepo-com.svg"),
//          ),
//        ),
//
//      ),
//    );
//  }
//}
