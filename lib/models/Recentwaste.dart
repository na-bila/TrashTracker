// ignore_for_file: file_names

class Recentwaste{
  String title;
  String date;
  int quantity ;
  Recentwaste({

    required this.date,
    required this.quantity ,
    required this.title,
});



  String get getTitle{
    return title;
  }
  void setTitle(title){
    this.title = title;
  }


  int get getQuantity{
    return quantity;
  }
  void setQuantity(int quantity){
    this.quantity = quantity;
  }
  String get getDate{
    return date;
  }
  void setDate(String date){
    this.date = date;
  }
}
List demoRecentwaste =[
   Recentwaste(
     title: "plastic",
     date: "",
     quantity: 0,
   ),
  Recentwaste(

    title: "paper",
    date: "",
    quantity: 0,
  ),
  Recentwaste(

    title: "organic ",
    date: "",
    quantity: 0,
  ),
];