import { AuthGuard } from './services/auth.guard';
import {  } from '@angular/core';
import {  } from '@angular/router';

const routes: Routes = [
  { path: '', loadChildren: './user/signin/signin.module#SigninPageModule' },
  // { path: 'tabs', loadChildren: './tabs/tabs.module#TabsPageModule', canLoad: [AuthGuard] },
  { path: 'tabs', loadChildren: './tabs/tabs.module#TabsPageModule' },
  { path: 'home', loadChildren: './home/home.module#HomePageModule' },
  { path: 'about', loadChildren: './about/about.module#AboutPageModule' },
  { path: 'cart', loadChildren: './cart/cart.module#CartPageModule' },
  { path: 'products/:name', loadChildren: './products/products/products.module#ProductsPageModule' },
  { path: 'product/:id', loadChildren: './products/product/product.module#ProductPageModule' },
  { path: 'products',  loadChildren: './products/products/products.module#ProductsPageModule' },
  { path: 'signin', loadChildren: './user/signin/signin.module#SigninPageModule' },
  { path: 'signup', loadChildren: './user/signup/signup.module#SignupPageModule' },
  { path: 'profile', loadChildren: './user/profile/profile.module#ProfilePageModule', canLoad: [AuthGuard] },
  { path: '', redirectTo: 'signin', pathMatch: 'full'  }
];
@NgModule({
  imports: [
    RouterModule.forRoot(routes, { preloadingStrategy: PreloadAllModules })
  ],
  exports: [RouterModule]
})
export class AppRoutingModule {}
