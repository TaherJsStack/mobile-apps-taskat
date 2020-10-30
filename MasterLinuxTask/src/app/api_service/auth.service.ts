import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Storage } from '@ionic/storage';

import { environment } from 'src/environments/environment';
import { BehaviorSubject } from 'rxjs';

const API_KEY = environment.API_KEY;
const BACKEND_API = environment.API_URL;

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  isAuth      = new BehaviorSubject<Boolean>(false);
  isAuthLgin  = this.isAuth.asObservable();

  constructor(private http: HttpClient, private storage: Storage) { }


  authentication() {
    
    return this.http.get<{expires_at: Date, request_token: string, success: boolean}>(BACKEND_API+'authentication/token/new?api_key='+ API_KEY)
    .subscribe(
      token => {
          this.storage.set('token', token.request_token);
          console.log('token =>', token)
          window.open('https://www.themoviedb.org/authenticate/'+token.request_token);

          this.isAuth.next(true);
          setTimeout(() => {
              this.logout()
          }, 600000);
        },
      err => {
        console.log("authentication =>", err)
      }
    )
  }

  session_Id() {
    return this.http.get(BACKEND_API+'authentication/session/new?api_key='+ API_KEY);
  }


  logout() {
    this.storage.remove('token');
    this.isAuth.next(false);
  }
}
