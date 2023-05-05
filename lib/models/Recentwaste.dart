// ignore_for_file: file_names

class Recentwaste{
  final String title, date , quantity ;
  Recentwaste({

    required this.date,
    required this.quantity ,
    required this.title,
});
}
List demoRecentwaste =[
   Recentwaste(

     title: "plastic",
     date: "16/04/2023",
     quantity: "1 kg",
   ),
  Recentwaste(

    title: "paper",
    date: "16/04/2023",
    quantity: " 0.5 kg",
  ),
  Recentwaste(

    title: "organic ",
    date: "16/04/2023",
    quantity: "1 kg",
  ),
];