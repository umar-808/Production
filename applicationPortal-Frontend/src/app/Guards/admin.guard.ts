import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, CanActivate, Router, RouterStateSnapshot, UrlTree } from '@angular/router';
import { Observable } from 'rxjs';
import { DataService } from '../Services/data.service';

@Injectable({
  providedIn: 'root'
})
export class AdminGuard implements CanActivate {

  currUser: any
  constructor( private router: Router, private dataService: DataService) {
    
  }

  canActivate(): boolean {
    this.dataService.getCurrentUser().subscribe(
      res => {
        this.currUser = res
      }
    )
    if (this.currUser.accessType === 1) {
      return true
    } else {
      return false
    }
  }
  
}
