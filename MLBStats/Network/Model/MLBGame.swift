//
//  MLBGame.swift
//  MLBStats
//
//  Created by Woojin on 3/18/24.
//

import Foundation

// MARK: - MLBGame
struct MLBGame: Codable {
    let copyright: String?
    let totalItems, totalEvents, totalGames, totalGamesInProgress: Int?
    let dates: [DateElement]?
}

// MARK: - DateElement
struct DateElement: Codable {
    let date: String?
    let totalItems, totalEvents, totalGames, totalGamesInProgress: Int?
    let games: [Game]?
    let events: [Event]?
}

// MARK: - Game
struct Game: Codable {
    let gamePk: Int?
    let gameGUID, link: String?
    let gameType: GameType?
    let season: String?
    let gameDate: Date?
    let officialDate: String?
    let status: Status?
    let teams: Teams?
    let venue: Venue?
    let content: Content?
    let isTie: Bool?
    let gameNumber: Int?
    let publicFacing: Bool?
    let doubleHeader, gamedayType, tiebreaker: DoubleHeader?
    let calendarEventID, seasonDisplay: String?
    let dayNight: DayNight?
    let description: String?
    let scheduledInnings: Int?
    let reverseHomeAwayStatus: Bool?
    let inningBreakLength: Int?
    let seriesDescription: SeriesDescription?
    let recordSource: GameType?
    let ifNecessary: DoubleHeader?
    let ifNecessaryDescription: IfNecessaryDescription?
    let gamesInSeries, seriesGameNumber: Int?
}

// MARK: - Event
struct Event: Codable {}

// MARK: - Content
struct Content: Codable {
    let link: String?
}

enum DayNight: String, Codable {
    case day = "day"
    case night = "night"
}

enum DoubleHeader: String, Codable {
    case e = "E"
    case n = "N"
    case p = "P"
    case y = "Y"
}

enum GameType: String, Codable {
    case e = "E"
    case s = "S"
}

enum IfNecessaryDescription: String, Codable {
    case normalGame = "Normal Game"
}

enum SeriesDescription: String, Codable {
    case exhibition = "Exhibition"
    case springTraining = "Spring Training"
}

// MARK: - Status
struct Status: Codable {
    let abstractGameState: AbstractGameState?
    let codedGameState: CodedGameState?
    let detailedState: DetailedState?
    let statusCode: CodedGameState?
    let startTimeTBD: Bool?
    let abstractGameCode: AbstractGameCode?
    let reason: String?
}

enum AbstractGameCode: String, Codable {
    case f = "F"
    case l = "L"
}

enum AbstractGameState: String, Codable {
    case abstractGameStateFinal = "Final"
    case live = "Live"
}

enum CodedGameState: String, Codable {
    case f = "F"
    case fo = "FO"
    case ft = "FT"
    case i = "I"
}

enum DetailedState: String, Codable {
    case completedEarly = "Completed Early"
    case detailedStateFinal = "Final"
    case inProgress = "In Progress"
}

// MARK: - Teams
struct Teams: Codable {
    let away, home: Away?
}

// MARK: - Away
struct Away: Codable {
    let leagueRecord: LeagueRecord?
    let score: Int?
    let team: Venue?
    let isWinner, splitSquad: Bool?
    let seriesNumber: Int?
}

// MARK: - LeagueRecord
struct LeagueRecord: Codable {
    let wins, losses: Int?
    let pct: String?
}

// MARK: - Venue
struct Venue: Codable {
    let id: Int?
    let name, link: String?
}
