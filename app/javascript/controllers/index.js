// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import MapController from "./map_controller"
application.register("map", MapController)

import MapViewController from "./map_view_controller"
application.register("map-view", MapViewController)

import QrScannerController from "./qr_scanner_controller"
application.register("qr-scanner", QrScannerController)

import RallyMapController from "./rally_map_controller"
application.register("rally-map", RallyMapController)
