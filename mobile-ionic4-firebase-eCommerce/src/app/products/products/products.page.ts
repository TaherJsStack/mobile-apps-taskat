import { ProductModule } from './../../modules/product.module';
import { ProductService } from './../../services/product.service';
import { ActivatedRoute } from '@angular/router';
import { Component, OnInit, OnDestroy } from '@angular/core';
import { Subscription } from '../../../../node_modules/rxjs';
import { CartService } from '../../services/cart.service';


@Component({
  selector: 'app-products',
  templateUrl: './products.page.html',
  styleUrls: ['./products.page.scss'],
})
export class ProductsPage implements OnInit, OnDestroy {

  cart = [];
  items = [];

  produSub:        Subscription;
  filterdProducts: ProductModule[];
  products:        ProductModule[];
  categoryname;


  constructor( private route:       ActivatedRoute,
               private proService:  ProductService,
               private cartService: CartService) { }

  ngOnInit() {

    this.cartService.getProducts().subscribe( peoducts => this.items = peoducts );
    this.cart = this.cartService.getCartItems();

    this.categoryname = this.route.snapshot.paramMap.get('name');
    console.log(this.categoryname, ' => id');


    // get All products in productsM
    this.produSub = this.proService.getAllProducts()
    .subscribe( product => {
      this.filterdProducts = this.products = product;
      this.filterdProducts = (this.categoryname) ?
      this.products.filter(p => p.category === this.categoryname) :
      this.products;

    });

  } // end of ngOnInit()

  isBought(product: ProductModule) {
    return this.cartService.isProductOnCart(product);
  }


  addToCart(product) {
    this.cartService.addProduct(product);
  }

  onAdd(product: ProductModule) {
    product.clientItems += 1;
  }

  onRemove(product, productID: string) {
    product.clientItems -= 1;
    if ( product.clientItems <= 0 ) {
      this.cartService.deleteProduct(productID);
    }
  }

  ngOnDestroy() {
    this.produSub.unsubscribe();
  }

}
