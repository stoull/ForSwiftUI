//
//  LandmarkList.swift
//  ForSwiftUI
//
//  Created by Kevin on 2023/7/19.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
//        List {
//            LandmarkRow(landmark: landmarks[0])
//            LandmarkRow(landmark: landmarks[1])
//        }
//        List(landmarks, id:\.id) { landmark in
//            LandmarkRow(landmark: landmark)
//        }
        
//        List(landmarks) { landmark in
//        LandmarkRow(landmark: landmark)
//        }
        
        NavigationView {
            List {
                
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink {
                        Badge()
                    } label: {
                        Text("Badge")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        debugPrint("Add new did Click")
                    } label: {
                        Text("Add")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        CombineWithNotification()
                    } label: {
                        Text("Combine")
                    }
                }
            }
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
//        LandmarkList().previewDevice(PreviewDevice(rawValue: "iPhone SE (2nd generation)"))
    }
}
