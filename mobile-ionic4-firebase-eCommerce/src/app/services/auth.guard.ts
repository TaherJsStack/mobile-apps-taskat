import { AngularFireDatabase } from 'angularfire2/database';
import { AngularFireAuth } from 'angularfire2/auth';
import { AuthService } from './auth.service';
import { Injectable } from '@angular/core';
import { Route,  Router, CanLoad, UrlSegment } from '@angular/router';
import { Observable } from 'rxjs';
import 'rxjs/add/operator/map';

@Injectable({
  providedIn: 'root'
})
export class AuthGuard implements CanLoad {

  isUserActiv = false;

  constructor(
    private authService: AuthService,
    private router: Router,
    private afAuth: AngularFireAuth,
    private db: AngularFireDatabase ) {}

  canLoad(route: Route, segments: UrlSegment[]): Observable<boolean> | Promise<boolean> | boolean {

    this.afAuth.authState.subscribe( res => {
      if ( res ) {
        console.log(res.email, ' => res email');
        this.isUserActiv = true;
      } else {
        console.log(res, ' => res');
        this.isUserActiv = false;
        this.router.navigateByUrl('/signin');
      }
      // return res;
    });

      return this.isUserActiv;

  }

}
