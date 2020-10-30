export interface ProductModule {
  id:          string;
  name:        string;
  price:       number;
  discount:    number;
  priceDisc:   number;
  image:       string;
  description: string;
  category:    string;
  clientItems: number;
  addedDate:   Date;
  creator:     string;
}
