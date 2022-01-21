import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';


const baseUrl = 'http://localhost:8080'

@Injectable({
  providedIn: 'root'
})
export class BranchService {

  constructor(private http: HttpClient) { }

  getBranches(): Observable<any> {
    return this.http.get(`${baseUrl}/branches`)
  }

  getBranchById(id): Observable<any> {
    return this.http.get(`${baseUrl}/branches/${id}`)
  }

  getDepartmentsByBranchId(id): Observable<any> {
    return this.http.get(`${baseUrl}/branches/${id}/departments`)
  }
}
