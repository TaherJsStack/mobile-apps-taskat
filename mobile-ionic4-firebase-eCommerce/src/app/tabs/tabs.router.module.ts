import { AuthGuard } from './../services/auth.guard';
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { TabsPage } from './tabs.page';

const routes: Routes = [
  {
    path: 'tabs',
    component: TabsPage,
    children: [
      { path: 'home',
        children: [ { path: '', loadChildren: '../home/home.module#HomePageModule' } ]
      },
      { path: 'products',
        children: [
          { path: 'products/:name' , loadChildren: '../products/products/products.module#ProductsPageModule' },
          { path: 'product/:id',  loadChildren: '../products/product/product.module#ProductPageModule' },
        ]
      },
      { path: 'user',
        children: [
          { path: '', loadChildren: '../user/profile/profile.module#ProfilePageModule', canLoad: [AuthGuard] },
          { path: 'signin', loadChildren: '../user/signin/signin.module#SigninPageModule' },
        ]
      },
      { path: 'about',
        children: [ { path: '', loadChildren: '../about/about.module#AboutPageModule' } ]
      },
      { path: 'cart',
        children: [ { path: '', loadChildren: '../cart/cart.module#CartPageModule'  } ]
      },
      { path: '',
        redirectTo: '/tabs/home',
        pathMatch: 'full'
      }
    ]
  },
  { path: '',
    redirectTo: '/tabs/home',
    pathMatch: 'full'
  }
];

@NgModule({
  imports: [
    RouterModule.forChild(routes)
  ],
  exports: [RouterModule]
})
export class TabsPageRoutingModule {}
