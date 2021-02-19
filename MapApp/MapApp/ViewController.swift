//
//  ViewController.swift
//  MapApp
//
//  Created by Jeewoo Chung on 7/30/19.
//  Copyright © 2019 Jeewoo Chung. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    @IBOutlet var mapView: MKMapView!
    
    let initialLocation = CLLocation(latitude: 21.2839, longitude: -157.8362)
    let regionRadius:CLLocationDistance = 3000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        centerMapOnLocation(location: initialLocation)
        mapView.delegate = self
//
//        let point1 = Point(title: "Hotel", cord: CLLocationCoordinate2D(latitude: 21.2839, longitude: -157.8362), category: "Starred", notes: "It's our hotel")
//        mapView.addAnnotation(point1)
        
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    @IBAction func revealRegionDetailsWithLongPressOnMap(sender: UILongPressGestureRecognizer) {
        if sender.state != UIGestureRecognizer.State.began { return }
        let touchLocation = sender.location(in: mapView)
        let locationCoordinate = mapView.convert(touchLocation, toCoordinateFrom: mapView)
        print("Tapped at lat: \(locationCoordinate.latitude) long: \(locationCoordinate.longitude)")
        createNewAnnotation(lat: locationCoordinate.latitude, long: locationCoordinate.longitude, title: "new", notes: "notes", category: "category")
    }
    
    func createNewAnnotation(lat: CLLocationDegrees, long: CLLocationDegrees, title: String, notes: String, category: String) {
        let point = Point(title: title, cord: CLLocationCoordinate2D(latitude: lat, longitude: long), category: category, notes: notes)
        mapView.addAnnotation(point)
    }
    
}

extension ViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        guard let annotation = annotation as? Point else { return nil }
        
        let identifier = "marker"
        var view: MKMarkerAnnotationView
        
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        return view
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView,
                 calloutAccessoryControlTapped control: UIControl) {
        let location = view.annotation as! Point
        let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
        location.mapItem().openInMaps(launchOptions: launchOptions)
    }

}
