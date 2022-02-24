import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

const baseUrl = 'http://localhost:8080'

@Injectable({
  providedIn: 'root'
})
export class DataService {

  constructor(private http: HttpClient) { }

  getCurrentUser(): Observable<any> {
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

  registerUser(user): Observable<any> {
    return this.http.post(`${baseUrl}/users`, user)
  }

  getUserDepartment(id): Observable<any> {
    return this.http.get(`${baseUrl}/users/${id}/department`)
  }

  getManagerDepartment(id): Observable<any> {
    return this.http.get(`${baseUrl}/team-leads/${id}/department`)
  }

  getDepartments(): Observable<any> {
    return this.http.get(`${baseUrl}/departments`)
  }

  getDesignation(id): Observable<any> {
    return this.http.get(`${baseUrl}/users/${id}/designation`)
  }

  getDesignations(): Observable<any> {
    return this.http.get(`${baseUrl}/designations`)
  }

  deleteManager(id): Observable<any> {
    return this.http.delete(`${baseUrl}/team-leads/${id}`)
  }

  deleteUser(id): Observable<any> {
    return this.http.delete(`${baseUrl}/users/${id}`)
  }

  saveLeaveRequest(request): Observable<any> {
    return this.http.post(`${baseUrl}/leave-requests`, request)
  }

  updateLeaveRequest(request, id): Observable<any> {
    return this.http.put(`${baseUrl}/leave-requests/${id}`, request)
  }

  deleteLeaveRequest(id): Observable<any> {
    return this.http.delete(`${baseUrl}/leave-requests/${id}`)
  }

  resetPassword(user, id): Observable<any> {
    return this.http.put(`${baseUrl}/users/${id}/reset-password`, user)
  }

  getBranches(): Observable<any> {
    return this.http.get(`${baseUrl}/branches`)
  }

  getBranchById(id): Observable<any> {
    return this.http.get(`${baseUrl}/branches/${id}`)
  }

  getDepartmentsByBranchId(id): Observable<any> {
    return this.http.get(`${baseUrl}/branches/${id}/departments`)
  }

  getJobs(): Observable<any> {
    return this.http.get(`${baseUrl}/jobs`)
  }

  getJobById(id): Observable<any> {
    return this.http.get(`${baseUrl}/jobs/${id}`)
  }

  getBranchName(id): Observable<any> {
    return this.http.get(`${baseUrl}/jobs/${id}/branch`)
  }

  createJob(job): Observable<any> {
    return this.http.post(`${baseUrl}/jobs`, job)
  }

  getUserPass(): Observable<any> {
    return this.http.get(`${baseUrl}/user-passwords`)
  }

  getApplicants(): Observable<any> {
    return this.http.get(`${baseUrl}/applicants`)
  }

  getApplicantFile(id): Observable<any> {
    return this.http.get(`${baseUrl}/applicants/${id}/file`)
  }

  downloadFile(id): Observable<any> {
    return this.http.get(`${baseUrl}/files/${id}`, {responseType: 'blob'})
  }

  create(data): Observable<any> {
    return this.http.post(`${baseUrl}/applicants`, data)
  }

  uploadFile(data): Observable<any> {
    return this.http.post(`${baseUrl}/files`, data)
  }
}
