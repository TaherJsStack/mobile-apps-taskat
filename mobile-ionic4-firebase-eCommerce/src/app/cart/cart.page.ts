import { CartService } from './../services/cart.service';
import { Component, OnInit } from '@angular/core';
import { ProductModule } from '../modules/product.module';

@Component({
  selector: 'app-cart',
  templateUrl: './cart.page.html',
  styleUrls: ['./cart.page.scss'],
})
export class CartPage implements OnInit {

  items;

  constructor( private cartService: CartService ) { }

  ngOnInit() {
    this.items = this.cartService.getCartItems();
    console.log(this.items, ' => this.items');
  }

  onAdd(product: ProductModule) {
    product.clientItems += 1;
  }

  onRemove(product: ProductModule, productID: string) {
      product.clientItems -= 1;
    if ( product.clientItems <= 0 ) {
      this.cartService.deleteProduct(productID);
    }
  }

  onRemoveFromCart(productID) {
    this.cartService.deleteProduct(productID);
  }

  onSendOrder() {
    this.cartService.sendOrder();
  }


}
