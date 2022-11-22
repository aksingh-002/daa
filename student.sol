pragma solidity ^0.4.25;
pragma experimental ABIEncoderV2;

contract StudentRecord {

    Student[] student_record;

    struct Student {
        uint roll_no;
        string name;
        string branch;
        uint cgpa;
    }

    function () public {
        revert ("WRONG FUNCTION CALLED !");
    }

    function setStudentRecord(uint roll, string name, string branch, uint cgpa) public {
        for (uint i = 0; i < student_record.length; i++) {
            if (student_record[i].roll_no == roll) {
                revert ("Stdent already exists !!");
            }
        }

        student_record.push(Student(roll, name, branch, cgpa));
    }
 
    function getStudentRecord(uint roll) public view returns(Student memory) {
        for (uint i = 0; i < student_record.length; i++) {
            if (student_record[i].roll_no == roll) {
                return student_record[i];
            }
            revert ("Stdent not found in the record !!");
        }
    }

    function getAllRecords() public view returns(Student[] memory) {
        return student_record;
    }

    function totalStudentRecord() public view returns(uint) {
        return student_record.length;
    }
}