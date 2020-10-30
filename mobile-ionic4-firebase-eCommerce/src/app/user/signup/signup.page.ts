import { AngularFireAuth } from 'angularfire2/auth';
import { UsersService } from './../../services/users.service';
import { Router } from '@angular/router';
import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import { AlertController } from '@ionic/angular';

@Component({
  selector: 'app-signup',
  templateUrl: './signup.page.html',
  styleUrls: ['./signup.page.scss'],
})
export class SignupPage implements OnInit {


  user;
  userEmail;
  userData;

  constructor(
      public  alertCtlr: AlertController,
      private router: Router,
      private userService: UsersService,
      private afAuth: AngularFireAuth) { }

  ngOnInit() {}


  onSignUp( user: NgForm) {

    const pass1 = user.value.password;
    const pass2 = user.value.confpassword;

    if (pass1.value !== pass2.value) {
        this.alertCtlr.create({
          header: 'Alert',
          message: 'password does not match',
          buttons: ['try again']
        }).then(alertgEl => {
          alertgEl.present();
        });
    } else {
      const userInfo = {
        id:        Math.round( Math.random() * 1000 ).toString(),
        name:      user.value.name,
        phone:     user.value.phone,
        photoURL:  'https://st-listas.20minutos.es/images/2014-06/383064/4461159_249px.jpg?1403287587',
        password:  user.value.password,
        email:     user.value.email,
        date:      new Date(),
        addedDate: new Date(),
        city:      'default',
        ginder:    'default',
        country:   'default'

      };
      // this.userService.signupEmailAndPassword(user.value.email, user.value.password);
      this.afAuth.auth.createUserWithEmailAndPassword(user.value.email, user.value.password)
      .then( res => {
        console.log(res.uid, ' => create User With Email And Password');
        this.userService.signup(userInfo, res.uid)
        .then( info => {
          console.log(info);
          this.router.navigateByUrl('/tabs/tabs/home');
          })
        .then( userData => { this.userData =  this.userService.getUser(res.uid); })
        .catch( err => {
                this.alertCtlr.create({
                  header: 'Terms and Conditions',
                  message:  err.message,
                  buttons: ['agree']
                })
                .then( error => {
                  error.present();
              });
            }
        );
      });

    }
  }

  onTerms() {
    this.alertCtlr.create({
      header: 'Terms and Conditions',
      // tslint:disable-next-line:max-line-length
      message: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      buttons: ['agree']
    }).then(termsEl => {
      termsEl.present();
    });
  }

  onBack() {
    this.router.navigateByUrl('/signin');
  }


}


