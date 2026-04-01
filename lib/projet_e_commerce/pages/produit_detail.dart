import 'package:flutter/material.dart';
import 'package:projet/projet_e_commerce/data/list_produits.dart';
import 'package:projet/projet_e_commerce/model/class_produit.dart';

class ProduitDetailPage extends StatefulWidget {
  const ProduitDetailPage({super.key});

  @override
  State<ProduitDetailPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ProduitDetailPage> {
  @override
  Widget build(BuildContext context) {
    final dynamic param = ModalRoute.of(context)?.settings.arguments;
    int indexProduit;

    if (param == null || param.toString() == "") {
      indexProduit = 0;
    } else {
      indexProduit = int.parse(param.toString());
    }

    if (indexProduit < 0 || indexProduit >= AllProductData.Produits.length) {
      indexProduit = 0;
    }

    Produit productInfo = AllProductData.Produits[indexProduit];

    return Scaffold(
      appBar: AppBar(title: Text(productInfo.title)),
      body: Stack(
        children: [
          Container(
            foregroundDecoration: BoxDecoration(color: Colors.black12),
            height: MediaQuery.of(context).size.height * 0.45,
            width: double.infinity,
            child: Image.network(productInfo.imageUrl, fit: BoxFit.cover),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.only(top: 16, bottom: 20),
            child: Column(
              children: [
                const SizedBox(height: 250.0),
                Container(
                  color: Colors.grey[300],
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          productInfo.description,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        '${productInfo.price} TND',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          productInfo.description,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Divider(),
                      infoProduct("Brand", productInfo.brand),
                      infoProduct("Quantity", productInfo.quantity.toString()),
                      infoProduct("Category", productInfo.produitCategoryName),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget infoProduct(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
          Flexible(child: Text(value, textAlign: TextAlign.end)),
        ],
      ),
    );
  }
}
