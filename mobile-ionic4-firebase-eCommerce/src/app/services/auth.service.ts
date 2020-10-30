import { UsersService } from './users.service';
import { Router } from '@angular/router';
import { AngularFireAuth } from 'angularfire2/auth';
import { Injectable } from '@angular/core';
import * as firebase from 'firebase';
import { Subject, Observable } from '../../../node_modules/rxjs';
import { AngularFireDatabase } from '../../../node_modules/angularfire2/database';


@Injectable({
  providedIn: 'root'
})
export class AuthService {

  user: Observable<firebase.User>;
  isUserActiv = false;

  get userIsActive() {
    return this.isUserActiv;
  }


  constructor() {}

  login() {

    this.isUserActiv = true;
  }


  logout() {
    this.isUserActiv = false;
    // this.afAuth.auth.signOut();
    // this.router.navigate(['/']);
  }


}
