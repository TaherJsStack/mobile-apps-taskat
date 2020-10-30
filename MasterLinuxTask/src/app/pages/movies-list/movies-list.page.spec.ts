import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { IonicModule } from '@ionic/angular';

import { MoviesListPage } from './movies-list.page';

describe('MoviesListPage', () => {
  let component: MoviesListPage;
  let fixture: ComponentFixture<MoviesListPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ MoviesListPage ],
      imports: [IonicModule.forRoot()]
    }).compileComponents();

    fixture = TestBed.createComponent(MoviesListPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  }));

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
