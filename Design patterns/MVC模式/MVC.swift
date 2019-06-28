//
//  MVC.swift
//  Design patterns
//
//  Created by xhkj on 2019/6/28.
//  Copyright © 2019 Chuck. All rights reserved.
//

import UIKit

class Student {
    var name: String?
    var rollNo: String?
    
    init(name: String, rollNo: String) {
        self.name = name
        self.rollNo = rollNo
    }
}

class StudentView {
    
    func printStudentDetail(name: String, rollNo: String) {
        
        print("student name: \(name), rollNo:\(rollNo)")
    }
}

class StudentController {
    
    var model: Student
    var view: StudentView
    
    init(model: Student, view: StudentView) {
        self.model = model
        self.view = view
    }
    
    var studentName: String? {
        set {
            model.name = newValue
        }
        get {
            return model.name
        }
    }
    
    var studentRollNo: String? {
        set {
            model.rollNo = newValue
        }
        get {
            return model.rollNo
        }
    }
    
    func updateView() {
        view.printStudentDetail(name: studentName ?? "", rollNo: studentRollNo ?? "")
    }
}
