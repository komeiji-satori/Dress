// This impl. bases upon one that can be found in the router's test cases.
import { ActivatedRouteSnapshot, DetachedRouteHandle, RouteReuseStrategy } from '@angular/router';
import { PhotoComponent } from './photo/photo.component';
import { Injectable } from "@angular/core";

@Injectable()
export class CustomReuseStrategy implements RouteReuseStrategy {
  handlers: { [key: string]: DetachedRouteHandle } = {};

  shouldDetach(route: ActivatedRouteSnapshot): boolean {
    // console.log('CustomReuseStrategy:shouldDetach', route);
    if (route.component === PhotoComponent) {
      return false;
    }
    return true;
  }

  store(route: ActivatedRouteSnapshot, handle: DetachedRouteHandle): void {
    // console.log('CustomReuseStrategy:store', route, handle);
    this.handlers[route.routeConfig.path] = handle;
  }

  shouldAttach(route: ActivatedRouteSnapshot): boolean {
    // console.log('CustomReuseStrategy:shouldAttach', route);
    if (route.component === PhotoComponent) {
      return false;
    }
    return !!route.routeConfig && !!this.handlers[route.routeConfig.path];
  }

  retrieve(route: ActivatedRouteSnapshot): DetachedRouteHandle {
    // console.log('CustomReuseStrategy:retrieve', route);
    if (!route.routeConfig) {
      return null;
    }
    return this.handlers[route.routeConfig.path];
  }

  shouldReuseRoute(future: ActivatedRouteSnapshot, curr: ActivatedRouteSnapshot): boolean {
    // console.log('CustomReuseStrategy:shouldReuseRoute', future, curr);
    if (curr.firstChild && curr.firstChild.component === PhotoComponent) {
      return false;
    }
    return future.routeConfig === curr.routeConfig;
  }
}
