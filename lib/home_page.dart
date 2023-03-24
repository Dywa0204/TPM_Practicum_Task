import 'package:flutter/material.dart';
import 'package:praktpm_kuis/detail_page.dart';
import 'data/groceries.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xDADADAFF),
      child: ListView.builder(
        itemCount: groceryList.length,
        itemBuilder: (BuildContext context, int index){
          return GroceriesCard(groceries: groceryList[index]);
        },
      ),
    );
  }
}

class GroceriesCard extends StatelessWidget {
  final Groceries groceries;

  const GroceriesCard({Key? key, required this.groceries}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 0),
      child: GestureDetector(
        onTap: () => {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return DetailPage(groceries: groceries);
          }))
        },
        child: Card(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                children: [
                  Image.network(
                    groceries.productImageUrls[0],
                    fit: BoxFit.fitWidth,
                    height: 120,
                  ),
                  SizedBox(height: 8.0),
                  Container(
                    alignment: AlignmentDirectional.topStart,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          groceries.name,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          groceries.storeName,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Rp " + groceries.price,
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            Text(
                              "Rate : " + groceries.reviewAverage,
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ],
                        ),
                        SizedBox(height: 8.0),
                        Text("Stock : " + groceries.stock + " item"),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.0),
                ],
              ),
            )
        ),
      ),
    );
  }
}

