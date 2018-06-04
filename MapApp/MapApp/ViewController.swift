//
//  ViewController.swift
//  MapApp
//
//  Created by Zhanserik on 6/19/17.
//  Copyright © 2017 Kenes Inc. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet var mapView: MKMapView!
    var locationManager = CLLocationManager()
    var pinView: MKPinAnnotationView?
    var annotation: MKAnnotation?
    var delta = ""
    var places = [Place(coordinate: CLLocationCoordinate2D(latitude: 43.24, longitude: 76.89), title: "Restaurant Turandot", subtitle: "Restaurant of chinese food", color: UIColor.black),
                  Place(coordinate: CLLocationCoordinate2D(latitude: 43.24, longitude: 76.9), title: "Restaurant Dastarkhan", subtitle: "Restaurant of kazakh food", color: UIColor.blue),
                  Place(coordinate: CLLocationCoordinate2D(latitude: 43.24, longitude: 76.91), title: "Restaurant Mimino", subtitle: "Restaurant of georgian food", color: UIColor.red),
                  Place(coordinate: CLLocationCoordinate2D(latitude: 43.23, longitude: 76.9), title: "Restaurant Taksim", subtitle: "Restaurant of turkish food", color: UIColor.green),
                  Place(coordinate: CLLocationCoordinate2D(latitude: 43.22, longitude: 76.9), title: "Restaurant Tango", subtitle: "Restaurant of latin american food", color: UIColor.gray),
                  Place(coordinate: CLLocationCoordinate2D(latitude: 43.225, longitude: 76.9), title: "Restaurant Paris Baget", subtitle: "Restaurant of french food", color: UIColor.white),
                  Place(coordinate: CLLocationCoordinate2D(latitude: 43.21, longitude: 76.9), title: "Restaurant Burito", subtitle: "Restaurant of mexican food", color: UIColor.yellow)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestAlwaysAuthorization()
    
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        mapView.showsPointsOfInterest = true
        mapView.delegate = self
        
        for place in places{
            mapView.addAnnotation(place)
            //pinView?.pinTintColor = place.color
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?  //when this method is called? what it does?
    {
//        if annotation is MKUserLocation {return nil}   //?????/
        let place = annotation as! Place               //?????/
        
        let reuseId = "pin"       // purpose
        
        pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKPinAnnotationView
        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView!.canShowCallout = true
            pinView!.animatesDrop = true
            let calloutButton = UIButton(type: .detailDisclosure)
            pinView!.rightCalloutAccessoryView = calloutButton
            pinView!.sizeToFit()
            pinView!.pinTintColor = place.color
        }
        else {
            pinView!.annotation = annotation
        }
        
        
        return pinView
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "info" {
                let controller = segue.destination as! DetailViewController
                controller.place = self.annotation as? Place
                controller.delta = self.delta
            }
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if control == view.rightCalloutAccessoryView {
        performSegue(withIdentifier: "info", sender: nil)
        }
    }
    
}
extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        annotation = view.annotation as! Place
        
        let userLocation = mapView.userLocation.location
        
        let annotationLocation = CLLocation(latitude: (annotation?.coordinate.latitude)!, longitude: (annotation?.coordinate.longitude)!)
        
        delta = "\(String(describing: Int(userLocation!.distance(from: annotationLocation))))"
        
    }
}
