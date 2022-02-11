import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

const baseUrl = 'http://localhost:8080'

@Injectable({
  providedIn: 'root'
})
export class DataService {

  constructor(private http: HttpClient) { }

  getLeaves(): Observable<any> {
    return this.http.get(`${baseUrl}/leaves`)
  }

  getManagers(): Observable<any> {
    return this.http.get(`${baseUrl}/team-leads`)
  }

  getUsers(): Observable<any> {
    return this.http.get(`${baseUrl}/users`)
  }

  getDepartment(id): Observable<any> {
    return this.http.get(`${baseUrl}/team-leads/${id}/department`)
  }

  getDesignation(id): Observable<any> {
    return this.http.get(`${baseUrl}/users/${id}/designation`)
  }

  deleteManager(id): Observable<any> {
    return this.http.delete(`${baseUrl}/team-leads/${id}`)
  }
}
