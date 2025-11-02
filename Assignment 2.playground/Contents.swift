import UIKit

let students: [(name: String, grade: Int)] = [
    (name: "Daniel", grade: 92),
    (name: "Theresa", grade: 85),
    (name: "Aubrey", grade: 77),
    (name: "Marcus", grade: 64),
    (name: "Lily", grade: 98)
]


func gradeSummary(for data: [(name: String, grade: Int)]) -> (min: Int, max: Int, average: Double) {
    // assume there is at least 1 item (we have 5 per requirements)
    var minGrade = data[0].grade
    var maxGrade = data[0].grade
    var total = 0
    
    for item in data {
        let g = item.grade
        if g < minGrade { minGrade = g }
        if g > maxGrade { maxGrade = g }
        total += g
    }
    
    let avg = Double(total) / Double(data.count)
    return (min: minGrade, max: maxGrade, average: avg)
}


let summary = gradeSummary(for: students)


let passingStudents = students.filter { $0.grade >= 80 }


print("*** Grade Summary ***")
print("Lowest grade: \(summary.min)")
print("Highest grade: \(summary.max)")
print(String(format: "Average grade: %.2f", summary.average))

print("\n*** Students with grade >= 80 ***")
for student in passingStudents {
    print("\(student.name): \(student.grade)")
}
