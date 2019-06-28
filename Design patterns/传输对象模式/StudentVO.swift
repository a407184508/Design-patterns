//
//  StudentVO.swift
//  Design patterns
//
//  Created by xhkj on 2019/6/28.
//  Copyright © 2019 Chuck. All rights reserved.
//

import UIKit

class StudentVO {

    var name = ""
    var number = 0
    
    init(name: String, number: Int) {
        self.name = name
        self.number = number
    }
}

class StudentBO {
    
    var students = [StudentVO]()
    
    init() {
        students.append(StudentVO(name: "Jack", number: 0))
        students.append(StudentVO(name: "Lina", number: 1))
    }
    
    func deleteStudent(stu: StudentVO) {
        students.remove(at: stu.number)
    }
    
    func getAllStudents() -> [StudentVO] {
        return students
    }
    
    func getStudent(number: Int) -> StudentVO {
        return students[number]
    }
    
    func updateStudent(stu: StudentVO) {
        students[stu.number].name = stu.name
    }
}
