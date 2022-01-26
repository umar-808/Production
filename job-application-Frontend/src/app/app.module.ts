import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http'

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { JobListingComponent } from './MyComponents/job-listing/job-listing.component';
import { JobComponent } from './MyComponents/job/job.component';
import { JobDetailsComponent } from './MyComponents/job-details/job-details.component';
import { CreateJobFormComponent } from './MyComponents/create-job-form/create-job-form.component';
import { ApplicationFormComponent } from './MyComponents/application-form/application-form.component';
import { LoginFormComponent } from './MyComponents/login-form/login-form.component';
import { AuthGuard } from './auth.guard';
import { LoginService } from './Services/login.service';

@NgModule({
  declarations: [
    AppComponent,
    JobListingComponent,
    JobComponent,
    JobDetailsComponent,
    CreateJobFormComponent,
    ApplicationFormComponent,
    LoginFormComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    HttpClientModule
  ],
  providers: [ AuthGuard, LoginService],
  bootstrap: [AppComponent]
})
export class AppModule { }