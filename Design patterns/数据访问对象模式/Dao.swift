//
//  Dao.swift
//  Design patterns
//
//  Created by xhkj on 2019/6/28.
//  Copyright © 2019 Chuck. All rights reserved.
//

import UIKit

// from mvc student class

protocol StudentDao {
    func getAllStudents() -> [Student]
    func getStudent(rollNo: Int) -> Student
    func updateStudent(stu: Student) -> Void
    func deleteStudent(std: Student) -> Void
}

class StudentDaoImp: StudentDao {
    
    var students = [Student]()
    
    init() {
        students.append(Student(name: "jack", rollNo: "001"))
        students.append(Student(name: "rack", rollNo: "002"))
    }
    
    func getAllStudents() -> [Student] {
        return students
    }
    
    func getStudent(rollNo: Int) -> Student {
        return students[rollNo]
    }
    
    func updateStudent(stu: Student) {
        let s = students[Int(stu.rollNo!)!]
        s.name = stu.name!
    }
    
    func deleteStudent(std: Student) {
        students.remove(at: Int(std.rollNo!)!)
    }
}
