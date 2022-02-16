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
    this.dataService.getCurrentUser().subscribe(
      res => {
        this.currUser = res
      }
    )
  }

  canActivate(): boolean {
    if (this.currUser.accessType === 1) {
      return true
    } else {
      this.router.navigate(['/login'])
      return false
    }
  }
  
}
