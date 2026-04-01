import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MyWidgetSpace();
}

class _MyWidgetSpace extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Mohamed Aziz Karoui"),
            accountEmail: Text("mohamed.aziz.karoui@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnSA1zygA3rubv-VK0DrVcQ02Po79kJhXo_A&s",
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Accueil"),
            onTap: () {
              Navigator.pushNamed(context, "home");
            },
          ),
          ListTile(
            leading: Icon(Icons.list_alt),
            title: Text("Liste Produit"),
            onTap: () {
              Navigator.pushNamed(context, "ListeProduits");
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text("Panier"),
            onTap: () {
              Navigator.pushNamed(context, "PanierPage");
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text("Mes Favoris"),
            onTap: () {
              Navigator.pushNamed(context, "FavoritePage");
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Profil"),
            onTap: () {
              Navigator.pushNamed(context, "UserInfoPage");
            },
          ),
        ],
      ),
    );
  }
}
