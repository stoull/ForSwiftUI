//
//  LandmarkDetail.swift
//  ForSwiftUI
//
//  Created by Kevin on 2023/7/19.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    
    var landmark: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            CircleImage(image: landmark.image)
                .offset(y: -80)
                .padding(.bottom, -80)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                        .foregroundColor(Color.black)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }

                
                HStack {
                    Text(landmark.park)
                        .font(.subheadline)
                    Spacer()
                    Text(landmark.state)
                        .font(.subheadline)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text("About")
                    .font(.title2)
                    .padding(.top, 8)
                Text(landmark.description)
                    .padding(.top, 4)
            }
            .padding()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button {
                debugPrint("Share button didClick")
            } label: {
                Text("Share")
            }
        }
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks
    static var previews: some View {
        LandmarkDetail(landmark: landmarks[0])
    }
}
