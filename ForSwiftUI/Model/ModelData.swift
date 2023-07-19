//
//  ModelData.swift
//  ForSwiftUI
//
//  Created by Kevin on 2023/7/19.
//

import Foundation
import Combine


final class ModelData: ObservableObject {
    @Published var landmarks: [Landmark] = load("landmarkData.json")
}

func load<T: Decodable>(_ fileName: String) -> T {
    let data: Data
    guard let file = Bundle.main.url(forResource: fileName, withExtension: nil) else {
        fatalError("找不到名为\(fileName)的文件")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("不能在main bundle中加载名为\(fileName)的文件，error: \(error.localizedDescription)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("不能解析 \(fileName) 为类 \(T.self) error: \(error.localizedDescription)")
    }
}
