//
//  MLBAPIService.swift
//  MLBStats
//
//  Created by Woojin on 3/18/24.
//

import Foundation
import Moya

// MLB API를 위한 엔드포인트 정의
enum MLBAPIService {
    case getGameSchedule(sportId: Int)
}

// Moya `TargetType` 프로토콜 구현
extension MLBAPIService: TargetType {
    var baseURL: URL {
        .init(string: "http://statsapi.mlb.com")!
    }
    
    var path: String {
        switch self {
        case .getGameSchedule:  "/api/v1/schedule/games/"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getGameSchedule:  .get
        }
    }
    
    var task: Task {
        switch self {
        case let .getGameSchedule(sportId):
            .requestParameters(
                parameters: ["sportId": sportId],
                encoding: URLEncoding.queryString
            )
        }
    }
    
    var headers: [String : String]? {
        // mlb stats api는 별도의 인증이 없음
        ["Content-type": "application/json"]
    }
    
    var sampleData: Data {
        Data()
    }
}
