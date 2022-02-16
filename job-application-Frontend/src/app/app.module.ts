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
import { AuthGuard } from '../app/Guards/auth.guard'
import { LoginService } from './Services/login.service';
import { FooterComponent } from './MyComponents/footer/footer.component';
import { PasswordResetComponent } from './MyComponents/password-reset/password-reset.component';
import { ApplyLeaveComponent } from './MyComponents/apply-leave/apply-leave.component';
import { LeavesRecordComponent } from './MyComponents/leaves-record/leaves-record.component';
import { SidebarComponent } from './MyComponents/sidebar/sidebar.component';
import { HeaderComponent } from './MyComponents/header/header.component';
import { UsersComponent } from './MyComponents/users/users.component';
import { ManagersComponent } from './MyComponents/managers/managers.component';
import { LeaveRequestsComponent } from './MyComponents/leave-requests/leave-requests.component';
import { MyInceptorInterceptor } from './Services/my-inceptor.interceptor';
import { HomepageComponent } from './MyComponents/homepage/homepage.component';

@NgModule({
  declarations: [
    AppComponent,
    JobListingComponent,
    JobComponent,
    JobDetailsComponent,
    CreateJobFormComponent,
    ApplicationFormComponent,
    LoginFormComponent,
    FooterComponent,
    PasswordResetComponent,
    SidebarComponent,
    HeaderComponent,
    ApplyLeaveComponent,
    LeavesRecordComponent,
    UsersComponent,
    ManagersComponent,
    LeaveRequestsComponent,
    HomepageComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    HttpClientModule
  ],
  providers: [AuthGuard, LoginService, {
    provide: HTTP_INTERCEPTORS,
    useClass: MyInceptorInterceptor,
    multi: true
  }],
  bootstrap: [AppComponent]
})
export class AppModule { }