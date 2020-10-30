import { CategoryModule } from './../modules/category.module';
import { Injectable } from '@angular/core';
import { Subject } from '../../../node_modules/rxjs';
import { AngularFireDatabase } from '../../../node_modules/angularfire2/database';

@Injectable({
  providedIn: 'root'
})
export class CategoriesService {

  // categories: CategoryModule[] = [
  //   { id: '6asd854', name: 'clothes',  description: 'this is cate 222222', creator: 'ali',    addedDate:     new Date(1, 5, 2018),  },
  //   { id: '65476g5', name: 'tools',    description: 'this is cate 333333', creator: 'Salem',  addedDate:     new Date(1, 5, 2018),  }
  // ];

  categoriesUpdated   = new Subject<CategoryModule[]>();
  categoriesEditIndex = new Subject<number>();

  constructor(private db: AngularFireDatabase) { }

  // get All Categories
  getAllCates() {
    // return [...this.categories];
    console.log(this.db.list('/categories'), ' =>this.db.list ');
    return this.db.list('/categories');
    // return this.db.list('/categories')
    // .subscribe( res => {
    //   console.log(res, ' => console.log res');
    //   return res;
    // });
  }

  // get new value for All Cateories on thing Upate Listener
  getAllCatesUpateListener() {
    return this.categoriesUpdated.asObservable();
  }

  // // get only one category
  // getCate(categoryId: string) {
  //   const index = this.categories.findIndex(categories => categories.id === categoryId);
  //   if (index !== -1) {
  //     return this.categories[index];
  //   }
  // }

  // // get only one category id returned from categories list or category
  // getCateIndex(categoryId: string) {
  //   const index = this.categories.findIndex(categories => categories.id === categoryId);
  //   if (index !== -1) {
  //     console.log(index, ' => index');
  //     return index;
  //   }
  // }


  // add and save new  Category
  addCate( cateData: CategoryModule ) {
    console.log(cateData, ' => S addCate');
    // this.categories.push(cateData);
    // this.categoriesUpdated.next([...this.categories]);
    this.db.list('/categories/').push(cateData);
  }

  // isCateExist() {}

  // // find Category Index By Id to use every time
  // findCateIndexById(categoryId: string) {
  //   const index = this.categories.findIndex(categories => categories.id === categoryId);
  //   if (index !== -1) {
  //     this.categoriesEditIndex.next(index);
  //   }
  // }

  // // find and return category from categories Index
  // editCate(id: number) {
  //   return this.categories[id];
  // }
  // editeCategory(index: number) {
  //   return this.categories[index];
  // }

// //  after updates to save
//   updateCate(index: number, newCategory: CategoryModule) {
//     this.categories[index] = newCategory;
//     this.categoriesUpdated.next([...this.categories]);
//   }

// // delet category by id
//   deleteCate(categoryId: string)  {
//     const index = this.categories.findIndex(categories => categories.id === categoryId);
//     if (index !== -1) {
//         this.categories.splice(index, 1);
//     }
//     this.categoriesUpdated.next([...this.categories]);
//   }

}
