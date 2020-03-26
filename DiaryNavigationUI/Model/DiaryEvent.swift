//
//  DiaryEvent.swift
//  iTouchApp
//
//  Created by Catalin Palade on 10/02/2020.
//  Copyright © 2020 Catalin Palade. All rights reserved.
//

import Foundation

struct DiaryEvent: Codable {
    
    let id:                     String
    let jobNumber:              String
    let client:                 String
    let address:                String
    let notes:                  String?
    let date:                   String?
    let clientContactName:      String?
    let clientContactPhone:     String?
    let surveyReason:           String?
    let siteContactName:        String?
    let siteContactPhone:       String?
    let whereToSurvey:          String?
    let siteSpecific:           String?
    let whatToSurvey:           String?
    let cleaningRequired:       String?
    let measurementsRequired:   String?
    let clientInstructions:     String?
    let engineerInstructions:   String?
    
    let jobPack:                [JobPack]?
    
    var formatedDate:           String? {
        get {
            guard let date = date else { return nil }
            let dateFormatterGet = DateFormatter()
            dateFormatterGet.dateFormat = "yyyy-MM-dd"
            
            let dateFormatterSet = DateFormatter()
            dateFormatterSet.dateFormat = "dd.MM.yyy"
            
            guard let tempDate = dateFormatterGet.date(from: date) else { return nil }
            return dateFormatterSet.string(from: tempDate)
        }
    }
    
    var day: String? {
        get {
            return String(formatedDate?.prefix(2) ?? "00")
        }
    }
    
    var monthYear: String? {
        get {
            return String(formatedDate?.suffix(7) ?? "00.0000")
        }
    }
    
    private enum CodingKeys: String, CodingKey {
        
        case id =                   "ID"
        case jobNumber =            "jobnumber"
        case client =               "client"
        case address =              "address"
        case notes =                "notes"
        case date =                 "date"
        case clientContactName =    "clientcontactname"
        case clientContactPhone =   "clientcontacttel"
        case surveyReason =         "surveyReason"
        case siteContactName =      "sitecontactname"
        case siteContactPhone =     "sitecontacttel"
        case whereToSurvey =        "wheretosurvey"
        case siteSpecific =         "site_specific"
        case whatToSurvey =         "whattosurvey"
        case cleaningRequired =     "cleaningrequired"
        case measurementsRequired = "measurementsrequired"
        case clientInstructions =   "clientinstructions"
        case engineerInstructions = "engineerinstructions"
        
        case jobPack = "jobpack"
    }
    
    struct JobPack: Codable {
        
        let type:               PackType
        let filename:           String?
        let subitems:           [Subitem]?
        let url:                String?
        
        var sortedSubitems:     [Subitem]? {
            get {
                var temp = self.subitems
                temp?.sort(by: {$0.ID! < $1.ID!})
                return temp
            }
        }
        
        enum PackType: String, Codable {
            case file =         "file"
            case folder =       "folder"
        }
        
        private enum CodingKeys: String, CodingKey {
            case type =         "type"
            case filename =     "filename"
            case subitems =     "subitems"
            case url =          "url"
        }
    }

    struct Subitem: Codable {
        let type:               PackType
        let filename:           String?
        let url:                String?
        
        fileprivate var ID:     Int? {
            get {
                guard let index = filename?.index(filename!.startIndex, offsetBy: 4) else { return nil }
                let substring = String((filename?[index])!)
                return Int(substring)
            }
        }
        
        enum PackType: String, Codable {
            case file =         "file"
            case folder =       "folder"
        }
        
        private enum CodingKeys: String, CodingKey {
            case type =         "type"
            case filename =     "filename"
            case url =          "url"
        }
    }
    
    #if DEBUG
    static let example = DiaryEvent(id: UUID().uuidString,
                                    jobNumber: "AA001",
                                    client: "Client001",
                                    address: "1 Adelaide Street, Rossendale, BB48PW",
                                    notes: nil,
                                    date: "2020-03-27",
                                    clientContactName: nil,
                                    clientContactPhone: nil,
                                    surveyReason: nil,
                                    siteContactName: nil,
                                    siteContactPhone: nil,
                                    whereToSurvey: nil,
                                    siteSpecific: nil,
                                    whatToSurvey: nil,
                                    cleaningRequired: nil,
                                    measurementsRequired: nil,
                                    clientInstructions: nil,
                                    engineerInstructions: nil,
                                    jobPack: nil)
    #endif
}


