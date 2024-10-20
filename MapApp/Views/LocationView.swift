//
//  LocationView.swift@
//  MapApp
//
//  Created by Vishal Sharma on 31/08/24.
//

import SwiftUI
import MapKit

struct LocationView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    
    var body: some View {
        ZStack{
            Map(coordinateRegion: $vm.mapRegion)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                header
                    .padding()
                
                Spacer()
                
                ZStack {
                    ForEach(vm.locations) { locationPoint in
                        if vm.mapLocation.id == locationPoint.id {
                            LocationPreviewView(location: locationPoint)
                                .shadow(color: Color.black.opacity(0.3),radius: 10)
                                .padding()
                                .transition(.asymmetric(
                                    insertion: .move(edge: .leading),
                                    removal: .move(edge: .trailing)
                                ))
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    LocationView()
        .environmentObject(LocationsViewModel())
}


extension LocationView {
    private var header: some View {
        return VStack {
            
            Button(action:  vm.toggleLocationsList) {
                Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
                    .font(.title2)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.primary)
                    .frame(height: 55)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .overlay(alignment: .leading, content: {
                        Image(systemName: "arrow.down" )
                            .font(.headline)
                            .foregroundColor(.primary)
                            .padding()
                            .rotationEffect(Angle(degrees: vm.showLocationsList ? 180 : 0))
                    })
            }
            
            if vm.showLocationsList {
                LocationListView()
            }
        }
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(radius: 20)
    }
}
