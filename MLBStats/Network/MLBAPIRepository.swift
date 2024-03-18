//
//  MLBAPIRepository.swift
//  MLBStats
//
//  Created by Woojin on 3/18/24.
//

import RxSwift
import Moya

class MLBAPIRepository {
    enum Constant {
        static let sportId: Int = 1
    }
    
    private let provider = MoyaProvider<MLBAPIService>()

    func getGameSchedule() -> Single<[MLBGame]> {
        provider.rx
            .request(.getGameSchedule(sportId: Constant.sportId))
            .filterSuccessfulStatusCodes()
            .map([MLBGame].self)
    }
}
