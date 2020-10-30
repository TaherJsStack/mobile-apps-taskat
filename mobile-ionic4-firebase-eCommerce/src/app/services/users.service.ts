import { User } from './../data/user.interface';
import { Router } from '@angular/router';
import { UserModule } from './../modules/user.module';
import { Injectable } from '@angular/core';
import { Subject, Observable, Subscription } from '../../../node_modules/rxjs';
import { AngularFireDatabase } from '../../../node_modules/angularfire2/database';
import { AngularFireAuth } from 'angularfire2/auth';
import * as firebase from 'firebase';


@Injectable({
  providedIn: 'root'
})
export class UsersService {

  users: UserModule[] = [];
  userInfo: UserModule;

  constructor(
      private afAuth: AngularFireAuth,
      private router: Router,
      private db: AngularFireDatabase,
    ) {}

    // userIsActive() {
    //   return this.isUserActiv;
    // }

    getUser(userID) {
      console.log( this.db.object(`users/${userID}`) );
      return this.db.object(`users/${userID}`);
    }

    signup( user: UserModule, userID ) {
      return this.db.object(`users/${userID}`).update(user);
        // .then( () => this.isUserActiv = true );
    }

    signin() {}

    googleLogin() {
    this.afAuth.auth.signInWithRedirect( new firebase.auth.GoogleAuthProvider() );
    }


  logout() {
    this.afAuth.auth.signOut().then(() => {
      location.reload();
      this.router.navigateByUrl('/signin');
    });
    // this.router.navigate(['/signin']);
  }


}
