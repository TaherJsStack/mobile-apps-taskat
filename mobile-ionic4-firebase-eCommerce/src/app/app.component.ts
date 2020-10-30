import {  } from './modules/user.module';
import { AngularFireAuth } from 'angularfire2/auth';
import {  } from '@angular/router';
import {  } from './services/users.service';
import {  } from './modules/category.module';
import { Component, OnInit, OnDestroy } from '@angular/core';

import {  } from '@ionic/angular';
import { SplashScreen } from '@ionic-native/splash-screen/ngx';
import { StatusBar } from '@ionic-native/status-bar/ngx';
import { AngularFireDatabase, FirebaseObjectObservable } from '../../node_modules/angularfire2/database';
import {  } from '../../node_modules/rxjs';



@Component({
  selector: 'app-root',
  templateUrl: 'app.component.html',
  styleUrls: ['app.component.scss'],
})
export class AppComponent implements OnInit, OnDestroy {

  public appMenu = [
    { title: 'Test1', url: '/Test1', icon: 'home' },
    { title: 'Test2', url: '/Test2', icon: 'home' },
    { title: 'Test3', url: '/Test3', icon: 'home' },
  ];

  categories: CategoryModule[];
  isLoading = false;
  userData: FirebaseObjectObservable<UserModule>;
  userSub: Subscription;

  constructor(
    private platform:     Platform,
    private splashScreen: SplashScreen,
    private statusBar:    StatusBar,
    private db:           AngularFireDatabase,
    private userService:  UsersService,
    private router:       Router,
    private afAuth:       AngularFireAuth
  ) {
    this.initializeApp();
  }

  ngOnInit() {

    this.isLoading = true;
    this.db.list('/categories')
    .subscribe(
      categories => {
        this.isLoading = false;
        console.log(categories);
        this.categories = categories;
      });

    this.afAuth.authState.subscribe( res => {
      if ( res ) {
        if (res.uid) {
          console.log(res.uid, ' => res.uid');
          console.log(this.db.object(`users/${res.uid}`), ' => db object');
          this.db.object(`users/${res.uid}`)
            .subscribe(
              userdata =>  {
                this.userData = userdata;
                this.router.navigateByUrl('/tabs/tabs/home');
                console.log( userdata, ' => user data' ); }
            );
        }
      }
    });

    }



  initializeApp() {
    this.platform.ready().then(() => {
      this.statusBar.styleDefault();
      this.splashScreen.hide();
    });
  }

  onLogout() {
    this.userService.logout();
    this.router.navigateByUrl('/signin');
  }

  ngOnDestroy() {
    this.userSub.unsubscribe();
  }
}
