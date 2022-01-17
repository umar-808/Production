import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http'

import { AppRoutingModule, routingComponents } from './app-routing.module';
import { AppComponent } from './app.component';
import { JobListingComponent } from './MyComponents/job-listing/job-listing.component';
import { JobComponent } from './MyComponents/job/job.component';
import { JobDetailsComponent } from './MyComponents/job-details/job-details.component';

@NgModule({
  declarations: [
    AppComponent,
    routingComponents,
    JobListingComponent,
    JobComponent,
    JobDetailsComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    HttpClientModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }