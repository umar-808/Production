import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

const baseUrl = 'http://localhost:8080'

@Injectable({
  providedIn: 'root'
})
export class JobService {

  constructor(private http: HttpClient) { }

  getJobs(): Observable<any> {
    return this.http.get(`${baseUrl}/jobs`)
  }

  getJobById(id): Observable<any> {
    return this.http.get(`${baseUrl}/jobs/${id}`)
  }
}
