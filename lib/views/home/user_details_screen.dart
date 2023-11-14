import 'package:brainwired/model/product_model.dart';
import 'package:brainwired/views/constant.dart';
import 'package:brainwired/views/widgets/appbar.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: AppbarWidget(title: 'User Details')),
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 10, right: 10),
          child: Column(
            children: [
              Image.asset('assets/download (1).png'),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  widget.product.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ' Users Details',
                  style: fontStyle,
                ),
                const Divider(
                  thickness: 2,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Name: ${widget.product.name}',
                  style: subStyle,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'UserName: ${widget.product.username}',
                  style: subStyle,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Website: ${widget.product.email}',
                  style: subStyle,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Phone: ${widget.product.phone}',
                  style: subStyle,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Website: ${widget.product.website}',
                  style: subStyle,
                ),
                const SizedBox(
                  height: 5,
                ),
                RichText(
                  overflow: TextOverflow.clip,
                  textAlign: TextAlign.end,
                  textDirection: TextDirection.rtl,
                  softWrap: true,
                  maxLines: 6,
                  textScaleFactor: 1,
                  text: TextSpan(
                    text: ': Address\n',
                    style: addressStyle,
                    children: <TextSpan>[
                      const TextSpan(text: "Street:  "),
                      TextSpan(
                          text: widget.product.address.street,
                          style: subAddressStyle),
                      const TextSpan(text: '\n'),
                      const TextSpan(text: "suite:  "),
                      TextSpan(
                        text: widget.product.address.suite,
                        style: subAddressStyle,
                      ),
                      const TextSpan(text: '\n'),
                      const TextSpan(text: "City:  "),
                      TextSpan(
                        text: widget.product.address.city,
                        style: subAddressStyle,
                      ),
                      const TextSpan(text: '\n'),
                      const TextSpan(text: "ZipCode:  "),
                      TextSpan(
                        text: widget.product.address.zipcode,
                        style: subAddressStyle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
