/*
 * Advent of Code 2022
 * Created by: Sean Miller
 * 2022-12-21
**/

import Foundation

public final class Day1 {
    // MARK: - Public Static API
    
    /// Part 1
    public static func part1() {
        print("The max total calories amongst the elves is: \(listOfCaloriesPerElf?.max() ?? -1)")
    }
    
    /// Part 2
    public static func part2() {
        guard let listOfCaloriesPerElf else {
            return
        }
        
        let top3Sum = listOfCaloriesPerElf.sorted(by: >)[...2].reduce(0, +)
        print("The total of the highest 3 calories is: \(top3Sum)")
    }
    
    // MARK: - Private API
    
    private static var listOfCaloriesPerElf: [Int]? {
        guard
            let path = Bundle.main.path(forResource: "day1_part1", ofType: "txt"),
            let data = try? String(contentsOfFile: path, encoding: .utf8)
        else {
            print("Couldn't find file")
            return nil
        }
        
        let calories: [String] = data.components(separatedBy: "\n\n")
        var caloriesPerElf: [Int] = []

        calories.forEach { calorie in
            caloriesPerElf.append(calorie.components(separatedBy: "\n").map { Int($0) ?? 0 }.reduce(0, +))
        }

        return caloriesPerElf
    }
    
}

