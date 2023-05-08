import Foundation

final class BusinessHourFactory {
    
    // MARK: - Private methods

    // Создаем список [название всех отрезков недели для рабочего времени, рабочее время]
    private func buildWeekSegment(with businessHour: BusinessHour) -> [String] {
        
        let days = businessHour.days
        let hours = "\(businessHour.from) - \(businessHour.to)"
        var result: [String] = []
        var startDay = days[0]
        var lastDay = startDay
        
        for j in 1..<days.count {
            if days[j] == lastDay + 1 {
                lastDay = days[j]
            } else {
                let weekSegment = buildWeekSegmentString(startDay: startDay, lastDay: lastDay)
                result.append(weekSegment)
                startDay = days[j]
                lastDay = startDay
            }
        }
        let weekSegment = buildWeekSegmentString(startDay: startDay, lastDay: lastDay)
        result.append(weekSegment)
        let workingDaysString = result.joined(separator: ", ")
        
        return [workingDaysString, hours]
    }
    
    // Создаем строку дней для рабочего времени в зависимости от начала и конца отрезка недели
    private func buildWeekSegmentString(startDay: Int, lastDay: Int) -> String {
                
        if startDay == lastDay {
            return dayOfWeek(startDay)
        } else if startDay == 1 && lastDay == 5 {
            return "Будни"
        } else if startDay == 1 && lastDay == 7 {
            return "Ежедневно"
        } else {
            return "\(dayOfWeek(startDay)) - \(dayOfWeek(lastDay))"
        }
    }
    
    // Генерируем название дня недели в зависимости от порядкового номера
    private func dayOfWeek(_ day: Int) -> String {
        switch day {
        case 1:
            return "Пн"
        case 2:
            return "Вт"
        case 3:
            return "Ср"
        case 4:
            return "Чт"
        case 5:
            return "Пт"
        case 6:
            return "Сб"
        case 7:
            return "Вс"
        default:
            return ""
        }
    }
    
    // MARK: - Public methods

    // Создаем список всех отрезков недели с рабочим временем
    public func buildWorkingDays(from businessHours: [BusinessHour]?) -> [[String]] {
        
        var workingDays: [[String]] = []
        
        guard let businessHours = businessHours
        else { return workingDays }
        
        for i in 0..<businessHours.count {
            let segment = buildWeekSegment(with: businessHours[i])
            workingDays.append(segment)
        }
        
        return workingDays
    }
}
