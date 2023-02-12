
import 'package:flutter/material.dart';

class FormTextFiled extends StatefulWidget {
  String labelText;
  TextEditingController controller;
  TextInputType? keyboardType;
  double? textsize;
  String? prfix;
  int? maxlines;

  FormTextFiled({Key? key, required this.labelText, required this.controller ,this.keyboardType,this.textsize,this.prfix,this.maxlines}) : super(key: key);

  @override
  _FormTextFiledState createState() => _FormTextFiledState();
}

class _FormTextFiledState extends State<FormTextFiled> {
  bool isVisible = true;


  // final TextEditingController userInput = TextEditingController();
  // Variation variationsobj = new Variation();

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(6.0),
      child: TextFormField(
        controller: widget.controller,
        maxLines: widget.maxlines??1,
        keyboardType:widget.keyboardType,
        style:  Theme.of(context).textTheme.bodyText1,
        obscureText: widget.keyboardType!=TextInputType.visiblePassword?false:isVisible,
        // onChanged: (value) {
        //   setState(() {
        //     widget.controller.text = value.toString();
        //     //I am  updating the model's value based on the passed id
        //     // if(widget.id == "iname"){
        //     //   AddProductController.item_name= userInput.text;
        //     //   debugPrint("product name"+AddProductController.item_name.toString());
        //     // }
        //     // if(widget.id == "iname"){
        //     //   AddProductController.item_name= userInput.text;
        //     //   debugPrint("product name"+AddProductController.item_name.toString());
        //     // }
        //     // if(widget.id == "s_notify"){
        //     //   AddProductController.stock_notify = userInput.text;
        //     //   debugPrint("stocktype"+AddProductController.stock_notify.toString());
        //     // }
        //     // if(widget.id == "tax"){
        //     //   AddProductController.tax = userInput.text;
        //     //   debugPrint("stocktype"+AddProductController.tax.toString());
        //     // }
        //     // if(widget.id == "i_desc"){
        //     //   AddProductController.item_description = userInput.text;
        //     //   debugPrint("stocktype"+AddProductController.item_description.toString());
        //     // }
        //     // if(widget.id == "m_desc"){
        //     //   AddProductController.manufacturer_description = userInput.text;
        //     //   debugPrint("stocktype"+AddProductController.manufacturer_description.toString());
        //     // }
        //     // if(widget.id == "i_priority"){
        //     //   AddProductController.item_priority = userInput.text;
        //     //   debugPrint("stocktype"+AddProductController.item_priority.toString());
        //     // }
        //     // if(widget.id == "country"){
        //     //   AddProductController.country_of_origin = userInput.text;
        //     //   debugPrint("stocktype"+AddProductController.country_of_origin.toString());
        //     // }
        //     // if(widget.id == "vname"){
        //     //   variationsobj.set_var_name = userInput.text;
        //     //   debugPrint("variationname"+VariationsList.variationname.toString());
        //     // }
        //     // if(widget.id == "unit"){
        //     //  // Variation.unit = userInput.text;
        //     //  // debugPrint("unit"+Variation.unit.toString());
        //     // }
        //     // if(widget.id == "priority"){
        //     //   //Variation.priority = userInput.text;
        //     //  // debugPrint("priority"+Variation.priority.toString());
        //     // }
        //     // if(widget.id == "SKU"){
        //     //  // Variation.sku = userInput.text;
        //     //  // debugPrint("SKU"+Variation.sku.toString());
        //     // }
        //     // if(widget.id == "hsn"){
        //     //   //Variation.hsn = userInput.text;
        //     //   //debugPrint("hsn"+Variation.hsn.toString());
        //     // }
        //     // if(widget.id == "barcode"){
        //     //  // Variation.barcode = userInput.text;
        //     //   //debugPrint("barcode"+Variation.barcode.toString());
        //     // }
        //     // if(widget.id == "loyalty"){
        //     //  // Variation.loyalty_points = userInput.text;
        //     // //  debugPrint("loyalty"+Variation.loyalty_points.toString());
        //     // }
        //     // if(widget.id == "gweight"){
        //     // //  Variation.gross_weight = userInput.text;
        //     //  // debugPrint("gweight"+Variation.gross_weight.toString());
        //     // }
        //     // if(widget.id == "min_qty"){
        //     //  // Variation.min_order_qty = userInput.text;
        //     //  // debugPrint("minqty"+Variation.min_order_qty.toString());
        //     // }
        //     // if(widget.id == "max_qty"){
        //     // //  Variation.max_order_qty = userInput.text;
        //     //  // debugPrint("maxqty"+Variation.max_order_qty.toString());
        //     // }
        //     // if(widget.id == "price_per_unit"){
        //     //  // Variation.price_per_unit = userInput.text;
        //     //  // debugPrint("price_per_unit"+Variation.price_per_unit.toString());
        //     // }
        //     // if(widget.id == "act_price"){
        //     //  // Variation.actual_price = userInput.text;
        //     //  // debugPrint("act_price"+Variation.actual_price.toString());
        //     // }
        //     // if(widget.id == "dis_price"){
        //     //  // Variation.discounted_price = userInput.text;
        //     //  // debugPrint("disprice"+Variation.discounted_price.toString());
        //     // }
        //     // if(widget.id == "mem_price"){
        //     //  // Variation.membership_price = userInput.text;
        //     //  // debugPrint("memprice"+Variation.membership_price.toString());
        //     // }
        //     // if(widget.id == "stock"){
        //     //  // Variation.stock = userInput.text;
        //     //  // debugPrint("stock"+Variation.stock.toString());
        //     // }
        //   });
        // },
        decoration: InputDecoration(
          focusColor: Colors.white,
          suffixIcon: widget.keyboardType!=TextInputType.visiblePassword? widget.controller.text.isEmpty
              ? null // Show nothing if the text field is empty
              :  Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.prfix??'',style:  TextStyle(color:Theme.of(context).iconTheme.color,fontSize: 20)),
              ):InkWell(
              onTap: toggleLogin,
              child: isVisible?Icon(
                Icons.remove_red_eye,
                color: Theme.of(context).textTheme.subtitle1?.color,):const Icon(Icons.remove_red_eye_outlined)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
            const BorderSide(color: Colors.grey, width: 1.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          fillColor: Colors.grey,

          hintText: this.widget.labelText.toString(),

          //make hint text
          hintStyle:  TextStyle(
            color: Colors.grey,
            fontSize: widget.textsize,
            fontWeight: FontWeight.w400,
          ),

          //create lable
          labelText: this.widget.labelText.toString(),
          //lable style
          labelStyle:  TextStyle(
            color: Colors.grey,
            fontSize: widget.textsize,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  void toggleLogin() {
    setState(() {
      isVisible  = !isVisible;
    });
  }
}
