import { ProductModule } from './../../modules/product.module';
import { CartService } from './../../services/cart.service';
import { ProductInfoComponent } from './../product-info/product-info.component';
import { NavController, ModalController } from '@ionic/angular';
// import { ProductPageModule } from './product.module';
import { ProductService } from './../../services/product.service';
import { ActivatedRoute } from '@angular/router';
import { Component, OnInit, OnDestroy } from '@angular/core';
import { Subscription } from '../../../../node_modules/rxjs';



@Component({
  selector: 'app-product',
  templateUrl: './product.page.html',
  styleUrls: ['./product.page.scss'],
})
export class ProductPage implements OnInit, OnDestroy {


  produSub: Subscription;
  product: ProductModule;
  cart;
  constructor( private route: ActivatedRoute,
               private proService: ProductService,
               private NavCtlr: NavController,
               private ModalCtlr: ModalController,
               private cartService: CartService
              ) { }

  ngOnInit() {

    this.cart = this.cartService.getCartItems();

    const Id = this.route.snapshot.params['id'];
    this.produSub = this.proService.getPro(Id)
      .subscribe( p => {
        if (!Id) {
          this.NavCtlr.pop();
          return;
        }
        this.product = p;
        });

  } // ngOnInit()


  onProductInfo() {
    this.ModalCtlr
      .create({ component: ProductInfoComponent })
      .then( productEl => {
        productEl.present();
      });
  }

  isBought(product: ProductModule) {
    return this.cartService.isProductOnCart(product);
  }

  addToCart(product) {
    this.cartService.addProduct(product);
  }

  onAdd(product: ProductModule) {
    product.clientItems += 1;
  }

  onRemove(product, productID) {
    product.clientItems -= 1;
    if ( product.clientItems <= 0 ) {
      this.cartService.deleteProduct(productID);
    }
  }

  ngOnDestroy() {
    this.produSub.unsubscribe();
  }

}
