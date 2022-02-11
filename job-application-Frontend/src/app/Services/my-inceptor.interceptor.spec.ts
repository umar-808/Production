import { TestBed } from '@angular/core/testing';

import { MyInceptorInterceptor } from './my-inceptor.interceptor';

describe('MyInceptorInterceptor', () => {
  beforeEach(() => TestBed.configureTestingModule({
    providers: [
      MyInceptorInterceptor
      ]
  }));

  it('should be created', () => {
    const interceptor: MyInceptorInterceptor = TestBed.inject(MyInceptorInterceptor);
    expect(interceptor).toBeTruthy();
  });
});
