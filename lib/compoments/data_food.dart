import 'package:food_app/compoments/model_food.dart';

/*
List<Category> listfood = [
  // ******************** Petit Déjeuner ****************
  Category(
    name: "Petit Déjeuner",
    items: [
      Food(
        title: "Beef Burger",
        description:
            "Un hamburger, ou par aphérèse burger, est un sandwich d'origine allemande, composé de deux pains de forme ronde généralement garnis d'une galette de steak haché et de crudités, salade, tomate, oignon, cornichon ainsi que de sauce.",
        price: 2500,
        image: "assets/images/food1.jpg",
      ),
      Food(
        title: "Beef Burger",
        description:
            "Un hamburger, ou par aphérèse burger, est un sandwich d'origine allemande, composé de deux pains de forme ronde généralement garnis d'une galette de steak haché et de crudités, salade, tomate, oignon, cornichon ainsi que de sauce.",
        price: 4500,
        image: "assets/images/food3.jpg",
      ),
      Food(
        title: "pizza",
        description:
            "La pizza est une recette de cuisine traditionnelle de la cuisine italienne, originaire de Naples à base de galette de pâte à pain, garnie principalement d'huile d'olive, de sauce tomate, de mozzarella et d'autres ingrédients et cuite au four",
        price: 5500,
        image: "assets/images/pizza1.jpg",
      ),
      Food(
        title: "Beef Burger",
        description:
            "Un hamburger, ou par aphérèse burger, est un sandwich d'origine allemande, composé de deux pains de forme ronde généralement garnis d'une galette de steak haché et de crudités, salade, tomate, oignon, cornichon ainsi que de sauce.",
        price: 300,
        image: "assets/images/food6.jpg",
      ),
    ],
  ),

  // *********************** Déjeuner *************
  Category(
    name: "Déjeuner",
    items: [
      Food(
        title: "pizza",
        description:
            "La pizza est une recette de cuisine traditionnelle de la cuisine italienne, originaire de Naples à base de galette de pâte à pain, garnie principalement d'huile d'olive, de sauce tomate, de mozzarella et d'autres ingrédients et cuite au four",
        price: 500,
        image: "assets/images/pizza2.jpg",
      ),
      Food(
        title: "Beef Burger",
        description:
            "Un hamburger, ou par aphérèse burger, est un sandwich d'origine allemande, composé de deux pains de forme ronde généralement garnis d'une galette de steak haché et de crudités, salade, tomate, oignon, cornichon ainsi que de sauce.",
        price: 2500,
        image: "assets/images/food7.jpg",
      ),
    ],
  ),

  // **************** Diner ***************
  Category(
    name: "Diner",
    items: [
      Food(
        title: "pizza",
        description:
            "La pizza est une recette de cuisine traditionnelle de la cuisine italienne, originaire de Naples à base de galette de pâte à pain, garnie principalement d'huile d'olive, de sauce tomate, de mozzarella et d'autres ingrédients et cuite au four",
        price: 500,
        image: "assets/images/pizza3.jpg",
      ),
      Food(
        title: "Beef Burger",
        description:
            "Un hamburger, ou par aphérèse burger, est un sandwich d'origine allemande, composé de deux pains de forme ronde généralement garnis d'une galette de steak haché et de crudités, salade, tomate, oignon, cornichon ainsi que de sauce.",
        price: 1500,
        image: "assets/images/food10.jpg",
      ),
    ],
  ),

  // ******************* Fast Food ******************

  Category(
    name: "Fast Food",
    items: [
      Food(
        title: "Beef Burger",
        description:
            "Un hamburger, ou par aphérèse burger, est un sandwich d'origine allemande, composé de deux pains de forme ronde généralement garnis d'une galette de steak haché et de crudités, salade, tomate, oignon, cornichon ainsi que de sauce.",
        price: 2000,
        image: "assets/images/food8.jpg",
      ),
      Food(
        title: "Beef Burger",
        description:
            "Un hamburger, ou par aphérèse burger, est un sandwich d'origine allemande, composé de deux pains de forme ronde généralement garnis d'une galette de steak haché et de crudités, salade, tomate, oignon, cornichon ainsi que de sauce.",
        price: 1000,
        image: "assets/images/food4.jpg",
      ),
      Food(
        title: "Beef Burger",
        description:
            "Un hamburger, ou par aphérèse burger, est un sandwich d'origine allemande, composé de deux pains de forme ronde généralement garnis d'une galette de steak haché et de crudités, salade, tomate, oignon, cornichon ainsi que de sauce.",
        price: 4000,
        image: "assets/images/food6.jpg",
      ),
    ],
  ),
];


*/

List<Category> categoryList = [
  Category(name: "Petit Déjeuner"),
  Category(name: "Déjeuner"),
  Category(name: "Diner"),
  Category(name: "Fast Food"),
];

List<Food> listfood = [
  // *************** Petit Déjeuner  **************
  Food(
    category: "Petit Déjeuner",
    title: "Beef Burger",
    description:
        "Un hamburger, ou par aphérèse burger, est un sandwich d'origine allemande, composé de deux pains de forme ronde généralement garnis d'une galette de steak haché et de crudités, salade, tomate, oignon, cornichon ainsi que de sauce.",
    price: 2500,
    image: "assets/images/food1.jpg",
    isFavorite: false,
  ),
  Food(
    category: "Petit Déjeuner",
    title: "Beef Burger",
    description:
        "Un hamburger, ou par aphérèse burger, est un sandwich d'origine allemande, composé de deux pains de forme ronde généralement garnis d'une galette de steak haché et de crudités, salade, tomate, oignon, cornichon ainsi que de sauce.",
    price: 4500,
    image: "assets/images/food3.jpg",
    isFavorite: false,
  ),
  Food(
    category: "Petit Déjeuner",
    title: "pizza",
    description:
        "La pizza est une recette de cuisine traditionnelle de la cuisine italienne, originaire de Naples à base de galette de pâte à pain, garnie principalement d'huile d'olive, de sauce tomate, de mozzarella et d'autres ingrédients et cuite au four",
    price: 5500,
    image: "assets/images/pizza1.jpg",
    isFavorite: false,
  ),
  Food(
    category: "Petit Déjeuner",
    title: "Beef Burger",
    description:
        "Un hamburger, ou par aphérèse burger, est un sandwich d'origine allemande, composé de deux pains de forme ronde généralement garnis d'une galette de steak haché et de crudités, salade, tomate, oignon, cornichon ainsi que de sauce.",
    price: 300,
    image: "assets/images/food4.jpg",
    isFavorite: false,
  ),

// ************************ listDéjeuner ******************

  Food(
    category: "Déjeuner",
    title: "pizza",
    description:
        "La pizza est une recette de cuisine traditionnelle de la cuisine italienne, originaire de Naples à base de galette de pâte à pain, garnie principalement d'huile d'olive, de sauce tomate, de mozzarella et d'autres ingrédients et cuite au four",
    price: 500,
    image: "assets/images/pizza2.jpg",
    isFavorite: false,
  ),
  Food(
    category: "Déjeuner",
    title: "Beef Burger",
    description:
        "Un hamburger, ou par aphérèse burger, est un sandwich d'origine allemande, composé de deux pains de forme ronde généralement garnis d'une galette de steak haché et de crudités, salade, tomate, oignon, cornichon ainsi que de sauce.",
    price: 2500,
    image: "assets/images/food7.jpg",
    isFavorite: false,
  ),

// *********************** List Diner

  Food(
    category: "Diner",
    title: "pizza",
    description:
        "La pizza est une recette de cuisine traditionnelle de la cuisine italienne, originaire de Naples à base de galette de pâte à pain, garnie principalement d'huile d'olive, de sauce tomate, de mozzarella et d'autres ingrédients et cuite au four",
    price: 500,
    image: "assets/images/pizza3.jpg",
    isFavorite: false,
  ),
  Food(
    category: "Diner",
    title: "Beef Burger",
    description:
        "Un hamburger, ou par aphérèse burger, est un sandwich d'origine allemande, composé de deux pains de forme ronde généralement garnis d'une galette de steak haché et de crudités, salade, tomate, oignon, cornichon ainsi que de sauce.",
    price: 1500,
    image: "assets/images/food10.jpg",
    isFavorite: false,
  ),

// ******************* List Fast Food *****************

  Food(
    category: "Fast Food",
    title: "Beef Burger",
    description:
        "Un hamburger, ou par aphérèse burger, est un sandwich d'origine allemande, composé de deux pains de forme ronde généralement garnis d'une galette de steak haché et de crudités, salade, tomate, oignon, cornichon ainsi que de sauce.",
    price: 2000,
    image: "assets/images/food8.jpg",
    isFavorite: false,
  ),
  Food(
    category: "Fast Food",
    title: "Beef Burger",
    description:
        "Un hamburger, ou par aphérèse burger, est un sandwich d'origine allemande, composé de deux pains de forme ronde généralement garnis d'une galette de steak haché et de crudités, salade, tomate, oignon, cornichon ainsi que de sauce.",
    price: 1000,
    image: "assets/images/food4.jpg",
    isFavorite: false,
  ),
  Food(
    category: "Fast Food",
    title: "Beef Burger",
    description:
        "Un hamburger, ou par aphérèse burger, est un sandwich d'origine allemande, composé de deux pains de forme ronde généralement garnis d'une galette de steak haché et de crudités, salade, tomate, oignon, cornichon ainsi que de sauce.",
    price: 4000,
    image: "assets/images/food4.jpg",
    isFavorite: false,
  ),
];
