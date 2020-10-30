import { ProductModule } from './product.module';

export interface OrderModule {
  id:          string;
  creator:     string;
  products:    ProductModule[];
  active:      boolean;
  addedDate:   Date;
}

