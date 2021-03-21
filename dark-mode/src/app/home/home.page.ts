import { Component, OnInit } from '@angular/core';
import { StatusBar } from '@ionic-native/status-bar/ngx';
import { ScreenOrientation } from '@ionic-native/screen-orientation/ngx';

@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
})
export class HomePage implements OnInit {

  day;
  month;
  yesr;

  isLandscape: boolean;

  constructor(
    private statusBar: StatusBar,
    private screenOrientation: ScreenOrientation) {}

  ngOnInit() {
    let currentdate = new Date();
    this.day = currentdate.getDate()
    this.month = currentdate.getMonth() + 1;

    let element = document.getElementById("footer");

    // detect orientation changes
    this.screenOrientation.onChange().subscribe(
      (info) => {
        if (this.screenOrientation.type === 'landscape-secondary') {
          element.classList.add("landscape");
        }else {
          element.classList.remove("landscape");
        }
      }
    );
  }


  onClick(event){
    let systemDark = window.matchMedia("(prefers-color-scheme: light)");
    systemDark.addListener(this.colorTest);
    if(event.detail.checked){
      document.body.setAttribute('data-theme', 'dark');
      this.statusBar.backgroundColorByHexString('#0e1329');
    }
    else{
      document.body.setAttribute('data-theme', 'light');
      this.statusBar.backgroundColorByHexString('#cf7004');
    }
  }

   colorTest(systemInitiatedDark) {
    if (systemInitiatedDark.matches) {
      console.log('systemInitiatedDark.matches =>', systemInitiatedDark.matches)
      document.body.setAttribute('data-theme', 'dark');
      this.statusBar.backgroundColorByHexString('#0e1329');
    } else {
      document.body.setAttribute('data-theme', 'light');
      this.statusBar.backgroundColorByHexString('#cf7004');
    }
  }


}
