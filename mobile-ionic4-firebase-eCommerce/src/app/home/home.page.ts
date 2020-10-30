import { CartService } from './../services/cart.service';
import { Component, OnInit } from '@angular/core';
import { ProductInfo } from './../data/product.interface';
import { Observable } from '../../../node_modules/rxjs';
import { HttpClient, HttpHeaders, HttpErrorResponse } from '@angular/common/http';
import productes from '../data/categories';
import { AngularFireDatabase } from '../../../node_modules/angularfire2/database';
import { LoadingController } from '../../../node_modules/@ionic/angular';


@Component({
  selector: 'app-home',
  templateUrl: './home.page.html',
  styleUrls: ['./home.page.scss'],
})
export class HomePage implements OnInit {


  categories;
  results: any = [];
  getDataDone = false;
  data: Observable<any>;
  isLoading = false;
  products;
  cart;
  // pages link
  categoresCollection: {category: string, productes: ProductInfo[],  icon: string }[];


  constructor( private http: HttpClient,
               private db: AngularFireDatabase,
               private loadingCtlr: LoadingController,
               private cartService: CartService ) {}


  slideOpts = {
    effect: 'flip',
    slidesPerView: 1.6,
    spaceBetween: 10,
    centeredSlides: true
  };

  ngOnInit() {
    this.cart = this.cartService.getCartItems();

    this.loadingCtlr
    .create({
      keyboardClose: true,
      message: 'Loading.....'
      })
    .then(loadingEl => {
      loadingEl.present();

      this.isLoading = true;
      this.categoresCollection = productes;

      this.db.list('/categories')
      .subscribe(
        categories => {
          this.isLoading = false;
          loadingEl.dismiss();
          console.log(categories);
          this.categories = categories;
        });

    // get All products in productsM
      this.db.list('/products')
      .subscribe(
        products => {
          this.isLoading = false;
          loadingEl.dismiss();
          console.log(products);
          this.products = products;
        });


    });
  }


  // onGetData() {
  //   console.log('onGetData clicked');
  //   this.loadingCtlr
  //   .create({
  //     keyboardClose: true,
  //     message: 'HTTP Data Loading.....'
  //     })
  //   .then(loadingEl => {
  //     loadingEl.present();
  //     this.isLoading2 = true;
  //       this.http.get('https://jsonplaceholder.typicode.com/photos' )
  //       .subscribe(data => {
  //         this.isLoading2 = false;
  //         console.log(' => data data', data);
  //         this.results = data;
  //         this.getDataDone = true;
  //       }, err => {
  //         console.log(err);
  //       });
  //     });
  // }



}
