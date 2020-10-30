import { AuthService } from './../../api_service/auth.service';
import { Component, OnInit } from '@angular/core';
import { Storage } from '@ionic/storage';
import { Router } from '@angular/router';

@Component({
  selector: 'app-login',
  templateUrl: './login.page.html',
  styleUrls: ['./login.page.scss'],
})
export class LoginPage implements OnInit {

  constructor(private authService: AuthService, private storage: Storage, private router: Router) { }

  ngOnInit() {

    this.storage.get('token').then((val) => {
      if (val !== null) {
        this.router.navigateByUrl('/tabs/profile');
      }
    });

  }

  authLogin(){
    this.authService.authentication();
    this.authService.isAuthLgin
    .subscribe(
      isAuth => {
        // console.log('authLogin =>', isAuth)
        if (isAuth) {
          this.router.navigateByUrl('/tabs/profile');          
        }
      }
    )
  }


}
