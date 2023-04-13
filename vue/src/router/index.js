import Vue from 'vue'
import Router from 'vue-router'
import Home from '../views/Home.vue'
import Login from '../views/Login.vue'
import Logout from '../views/Logout.vue'
import Register from '../views/Register.vue'
import store from '../store/index'
import TenantPortal from '../views/TenantPortal.vue'
import LandlordPortal from '../views/LandlordPortal.vue'
import MaintenancePortal from '../views/MaintenancePortal.vue'
import PropertyDetails from '../views/PropertyDetails.vue'
import Property from '../views/Property.vue'
import Payment from '../views/Payment.vue'
import NewMaintenanceRequest from '../views/NewMaintenanceRequest.vue'
import MaintenanceRequestDetails from '../views/MaintenanceRequestDetails.vue'
import addPropertyForm from '../views/addPropertyForm.vue'



Vue.use(Router)

/**
 * The Vue Router is used to "direct" the browser to render a specific view component
 * inside of App.vue depending on the URL.
 *
 * It also is used to detect whether or not a route requires the user to have first authenticated.
 * If the user has not yet authenticated (and needs to) they are redirected to /login
 * If they have (or don't need to) they're allowed to go about their way.
 */

const router = new Router({

  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/',
      name: 'home',
      component: Home,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/login",
      name: "login",
      component: Login,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/logout",
      name: "logout",
      component: Logout,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/register",
      name: "register",
      component: Register,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/tenant-portal",
      name: "tenant-portal",
      component: TenantPortal,
      meta: {
        requiresAuth: true,
        requiredType: 'tenant'
      }
    },
    {
      path: "/add-property-form",
      name: "add-property-form",
      component: addPropertyForm,
      meta: {
        requiresAuth: true,
        requiredType: 'landlord'
      }
    },
    {
      path: "/landlord-portal",
      name: "landlord-portal",
      component: LandlordPortal,
      meta: {
        requiresAuth: true,
        requiredType: 'landlord'
      }
    },
    {
      path: "/maintenance-portal",
      name: "maintenance-portal",
      component: MaintenancePortal,
      meta: {
        requiresAuth: true,
        requiredType: 'maintenance'
      }
    },
    {
      path: "/property/:id",
      name: "property",
      component: Property,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/property-detail/:id",
      name: "property-detail",
      component: PropertyDetails,
      meta: {
        requiresAuth: true,
        requiredType: 'landlord'
      }
    },
    {
      path: "/tenant-portal/payment",
      name: "payment",
      component: Payment,
      meta: {
        requiresAuth: true,
        requiredType: 'tenant'
      }
    },
    {
      path: "/tenant-portal/maintenance-request",
      name: "maintenance-request",
      component: NewMaintenanceRequest,
      meta: {
        requiresAuth: true,
        requiredType: 'maintenance'
      }
    },
    {
      path: "/maintenance-portal/:id/detail",
      name: "request-details",
      component: MaintenanceRequestDetails,
      meta: {
        requiresAuth: true,
        requiredType: 'maintenance'
      }
    }
  ],
  scrollBehavior() {

    return { x: 0, y: 0 };
  }
})



router.beforeEach((to, from, next) => {
  // Determine if the route requires Authentication
  const requiresAuth = to.matched.some(x => x.meta.requiresAuth);

  // If it does and they are not logged in, send the user to "/login"
  if (requiresAuth && store.state.token === '') {
    next("/login");
  } else {
    // Else let them go to their next destination

    //Check for required Type value
    const requiredType = to.meta.requiredType;
    if (requiredType && store.state.user.type !== requiredType) {
      next({ name: getDestinationPage() });
    } else {
      next();

    }
  }
});

function getDestinationPage() {
  const userType = store.state.user.type;
  let destination = "";
  switch (userType) {
    case "tenant":
      destination = "tenant-portal";
      break;
    case "landlord":
      destination = "landlord-portal";
      break;
    case "maintenance":
      destination = "maintenance-portal";
      break;
    default:
      destination = "/login";
      break;
  }

  return destination;
}

export default router;
