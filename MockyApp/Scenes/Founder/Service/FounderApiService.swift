//
//  ApiService.swift
//  MockyApp
//
//  Created by Idwall Go Dev 003 on 21/03/22.
//

import Foundation
import Alamofire

struct FounderApiService {
    
    private let baseUrl = "https://run.mocky.io/v3/f0c36709-84e2-4043-a0f0-3bec512f6c84"
    
    var delegate: FounderDelegate?
    
    func performRequest() {
        guard let url = URL(string: baseUrl) else { return }
        fetchFounders(with: url)
    }
    
    private func fetchFounders(with url: URL) {
        AF.request(url, method: .get).validate().responseDecodable(of: [Founder].self, queue: DispatchQueue.main) { dataResponse in
            
            guard let founders = dataResponse.value else { return }
            
            self.delegate?.updateDatasource(with: founders)
        }
    }
}
