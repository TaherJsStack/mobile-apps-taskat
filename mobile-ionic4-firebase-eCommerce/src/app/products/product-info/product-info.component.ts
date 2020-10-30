import { Component, OnInit, OnDestroy } from '@angular/core';
import { NavController, ModalController } from '@ionic/angular';
import { ProductService } from './../../services/product.service';
import { ActivatedRoute } from '@angular/router';
import { Subscription } from '../../../../node_modules/rxjs';
import { ProductModule } from '../../modules/product.module';


@Component({
  selector: 'app-product-info',
  templateUrl: './product-info.component.html',
  styleUrls: ['./product-info.component.scss'],
})
export class ProductInfoComponent implements OnInit, OnDestroy {

  produSub: Subscription;
  product: ProductModule;

  constructor(
    private route: ActivatedRoute,
    private proService: ProductService,
    private NavCtlr: NavController,
    private ModalCtlr: ModalController
  ) {}

  ngOnInit() {
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

  ngOnDestroy() {
    this.produSub.unsubscribe();
  }

}


