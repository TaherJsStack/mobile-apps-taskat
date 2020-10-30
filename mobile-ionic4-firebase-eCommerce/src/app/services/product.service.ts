import { ProductModule } from './../modules/product.module';
import { Injectable } from '@angular/core';
import { AngularFireDatabase } from '../../../node_modules/angularfire2/database';


@Injectable({
  providedIn: 'root'
})
export class ProductService {

  products: ProductModule;

  constructor(private db: AngularFireDatabase) { }

  // get All products
  getAllProducts() {
    console.log(this.db.list('/products'), ' => this.db.listproducts');
    return this.db.list('/products');
  }

  // get only one product
  getPro(productsId) {
    return this.db.object('/products/' + productsId);
  }

  // add and save new  product
  addPro( proData: ProductModule ) {
    console.log(proData, ' => S addCate');
    this.db.list('/products').push(proData);
  }

//  after updates to save
  updatePro(Id, newCategory) {
    return this.db.object('/products/' + Id).update(newCategory);
  }

// delet product by id
  deletePro(productId)  {
    return this.db.object('/products/' + productId).remove();
  }




}
