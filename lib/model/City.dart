class City {

  final String name;
  final String image;
  final String link;



  City({this.name,this.image,this.link});


  static List<City> allCities()
  {
    var lstOfCities = new List<City>();

    lstOfCities.add(new City(name:"RichText ",image: "quebec_flag.jpg",link: "https://youtu.be/6U3x4_LkWWs"));
    lstOfCities.add(new City(name:"London",image: "london.png",link:"Made by https://cretezy2.com"));
    lstOfCities.add(new City(name:"Vancouver",image: "vancouver.png",link:""));
    lstOfCities.add(new City(name:"New York",image: "newyork.png",link:""));
    lstOfCities.add(new City(name:"Paris",image: "paris.png",link:""));
    lstOfCities.add(new City(name:"Berlin",image: "berlin.png",link:""));
    lstOfCities.add(new City(name:"Vancouver",image: "vancouver.png",link:""));
    lstOfCities.add(new City(name:"New York",image: "newyork.png",link:""));
    lstOfCities.add(new City(name:"Paris",image: "paris.png",link:""));
    lstOfCities.add(new City(name:"Berlin",image: "berlin.png",link:""));
    lstOfCities.add(new City(name:"Vancouver",image: "vancouver.png",link:""));
    lstOfCities.add(new City(name:"New York",image: "newyork.png",link:""));
    lstOfCities.add(new City(name:"Paris",image: "paris.png",link:""));
    lstOfCities.add(new City(name:"test",image: "berlin.png",link:""));
    lstOfCities.add(new City(name:"New York",image: "newyork.png",link:""));
    lstOfCities.add(new City(name:"Paris",image: "paris.png",link:""));
    lstOfCities.add(new City(name:"Berlin",image: "berlin.png",link:""));
    lstOfCities.add(new City(name:"Vancouver",image: "vancouver.png",link:""));
    lstOfCities.add(new City(name:"New York",image: "newyork.png",link:""));
    lstOfCities.add(new City(name:"Paris",image: "paris.png",link:""));
    lstOfCities.add(new City(name:"test",image: "berlin.png",link:""));
    return lstOfCities;
  }
}

