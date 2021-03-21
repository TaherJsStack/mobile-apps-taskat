import { Component } from '@angular/core';
import { StatusBar } from '@ionic-native/status-bar/ngx';
import { Platform } from '@ionic/angular';

@Component({
  selector: 'app-root',
  templateUrl: 'app.component.html',
  styleUrls: ['app.component.scss'],
})
export class AppComponent {

  constructor(private statusBar: StatusBar, public platform: Platform)
  {
    this.initializeApp();
  }



  initializeApp() {

    this.platform.ready().then(() => {

    })
  }

}
