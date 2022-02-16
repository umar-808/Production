import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

const baseUrl = 'http://localhost:8080'

@Injectable({
  providedIn: 'root'
})
export class DataService {

  constructor(private http: HttpClient) { }

  getCurrentUser(): Observable<any>{
    return this.http.get(`${baseUrl}/current-user`)
  }

  getLeavesRecord(): Observable<any> {
    return this.http.get(`${baseUrl}/leaves`)
  }

  getLeaveRequests(): Observable<any> {
    return this.http.get(`${baseUrl}/leave-requests`)
  }
  
  getLeaveRequestById(id): Observable<any> {
    return this.http.get(`${baseUrl}/users/${id}/leave-requests`)
  }

  getManagers(): Observable<any> {
    return this.http.get(`${baseUrl}/team-leads`)
  }

  getUsers(): Observable<any> {
    return this.http.get(`${baseUrl}/users`)
  }

  getUserDepartment(id): Observable<any> {
    return this.http.get(`${baseUrl}/users/${id}/department`)
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

  deleteUser(id): Observable<any> {
    return this.http.delete(`${baseUrl}/users/${id}`)
  }

  saveLeaveRequest(request) {
    return this.http.post(`${baseUrl}/leave-requests`, request)
  }

  updateLeaveRequest(request, id) {
    return this.http.put(`${baseUrl}/leave-requests/${id}`, request)
  }
}
