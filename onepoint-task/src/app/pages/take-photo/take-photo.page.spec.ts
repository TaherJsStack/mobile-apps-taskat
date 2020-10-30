import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { IonicModule } from '@ionic/angular';

import { TakePhotoPage } from './take-photo.page';

describe('TakePhotoPage', () => {
  let component: TakePhotoPage;
  let fixture: ComponentFixture<TakePhotoPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ TakePhotoPage ],
      imports: [IonicModule.forRoot()]
    }).compileComponents();

    fixture = TestBed.createComponent(TakePhotoPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  }));

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
