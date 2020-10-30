import { Router } from '@angular/router';
import { Injectable, OnInit } from '@angular/core';
import { AngularFireDatabase } from '../../../node_modules/angularfire2/database';
import { ProductModule } from '../modules/product.module';
import { AngularFireAuth } from '../../../node_modules/angularfire2/auth';
import { AlertController } from '@ionic/angular';

@Injectable({
  providedIn: 'root'
})
export class CartService implements OnInit {

  private cartItems = [];
  userEmail;

  constructor(private db: AngularFireDatabase,
              private afAuth: AngularFireAuth,
              private router: Router,
              private alertCtler: AlertController) {

                this.afAuth.authState.subscribe( res => {
                  if ( res ) {
                    if (res.uid) {
                      console.log(res.uid, ' => res.uid');
                      console.log(this.db.object(`users/${res.uid}`), ' => db object');
                      this.db.object(`users/${res.uid}`)
                        .subscribe(
                          userdata =>  {
                            this.userEmail = userdata.email;
                            console.log( userdata.email, ' => user data' ); }
                        );
                    }
                  }
                });

              }

  ngOnInit() {
    // this.getTotalAmount();

    this.afAuth.authState
      .subscribe( res => {
        this.userEmail = res.email;
        console.log(this.userEmail);
    });

  }

  getProducts() {
    return this.db.list('/products');
  }

  getCartItems() {
    return this.cartItems;
  }

  addProduct(product) {
    this.cartItems.push(product);
  }

  // getTotalAmount() {
  //   let i   = 0,
  //       sum = 0;
  //   for (; i < this.cartItems.length; i++) {
  //       sum += (+this.cartItems[i].price);
  //   }
  //    const amount = sum;
  //    console.log(amount, ' => amount');
  //    return sum;
  // }

  isProductOnCart(product: ProductModule) {
    return this.cartItems.find( (producEl: ProductModule) => {
        return producEl.id === product.id;
    });
  }

  addItemsQun( product: ProductModule ) {
    product.clientItems += 1;
  }

  addRemoveQun( product: ProductModule, productID: string ) {
    product.clientItems -= 1;
    if (product.clientItems <= 0) {
      this.deleteProduct(productID);
    }
  }

  deleteProduct(productID: string) {
    console.log(productID, ' => product id');
    const index = this.cartItems.findIndex(producs => producs.id === productID);
    console.log(index, productID, ' Deleted Done...');
    if (index !== -1) {
        this.cartItems.splice(index, 1);
    }
  }

  sendOrder() {

    if (this.userEmail) {

      const orderData = {
        id:         Math.round( Math.random() * 1000 ).toString(),
        creator:    this.userEmail,
        products:   this.cartItems,
        active:     false,
        addedDate:  Date(),
        };
        console.log( orderData );
        return this.db.list('/orders')
          .push(orderData)
          .then( () => {
            this.alertCtler.create({
              header: 'Order Done...',
              animated: true,
              buttons: [
                {
                  text: 'Ok',
                  cssClass: 'secondary',
                  handler: () => {
                    this.cartItems.length = 0;
                    console.log('Confirm Cancel');
                  }
                }
            ]}).then( forgetAlertEl => {
              forgetAlertEl.present();
            });

          });

    } else {
      this.router.navigateByUrl('/signin');

    }
  }






}
