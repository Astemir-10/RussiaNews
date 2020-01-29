//
//  DateInstrument.swift
//  RussiaNews
//
//  Created by Astemir Shibzuhov on 29.01.2020.
//  Copyright © 2020 Astemir Shibzuhov. All rights reserved.
//

import Foundation

class DateInstrument {
    private func toDayDate(dateFormat: String) -> String {
        let toDayDate = Date()
        let toDayDayFormat = DateFormatter()
        toDayDayFormat.dateFormat = dateFormat
        let dateStr = toDayDayFormat.string(from: toDayDate)
        return dateStr
    }

    private func article(from date: String, dateFormat: String) -> String {
        let articleDateFormat = DateFormatter()
        articleDateFormat.dateFormat = "yyyy-MM-dd'T'HH:mm:s'Z'"
        let dateArticle = articleDateFormat.date(from: date)
        
        let normalFormat = DateFormatter()
        normalFormat.dateFormat = dateFormat
        let normalDate = normalFormat.string(from: dateArticle!)
        return normalDate
    }

    func dateConverter(articleDate: String) -> String {

        let nowMinute = toDayDate(dateFormat: "mm")
        let articleMinute = article(from: articleDate, dateFormat: "mm")
        let minuteAgo =  Int(articleMinute)! - Int(nowMinute)!
        
        let nowHour = toDayDate(dateFormat: "HH")
        let articleHour = article(from:  articleDate, dateFormat: "HH")
        let hourAgo = Int(nowHour)! - Int(articleHour)!
        
        let articleHourAndMinute = article(from: articleDate, dateFormat: "HH:mm")
        
        let nowDay = toDayDate(dateFormat: "dd")
        let articleDay = article(from: articleDate, dateFormat: "dd")
        let dayAgo = Int(nowDay)! - Int(articleDay)!
        
        let fullDateArticle = article(from: articleDate, dateFormat: "dd.MM.yyyy, HH:mm")
        
        let nowYear = toDayDate(dateFormat: "yyyy")
        let articleYear = article(from: articleDate, dateFormat: "yyyy")
        let agoYear = Int(nowYear)! - Int(articleYear)!
        
        if agoYear > 0 {
            return fullDateArticle
        } else if agoYear < 0  {
           
                return ""
            
        }
        if dayAgo > 0 {
            switch dayAgo {
            case 1: return "Вчера в \(articleHourAndMinute)"
            default:
                return fullDateArticle
            }
        } else {
        
        if hourAgo > 1 {
            switch hourAgo {
            case 1: return "час назад"
            case 2: return "двва чаа назад"
            case 3: return "три часа назад"
            case 4: return "четыре часа назад"
                
            default:
                if hourAgo < 6 {
                    return "\(hourAgo) часов назад"
                } else {
                    return "Сегодня в \(articleHourAndMinute)"
                }
            }
        } else {
            switch minuteAgo {
            case 0: return "минуту назад"
            case 1: return "минуту назад"
            case 2: return "2 минуты назад"
            case 3: return "3 минуты назад"
            case 4: return "4 минуты назад"
            default:
                return "\(minuteAgo) минут назад"
            }
            }
            
        }
        
    }
}
