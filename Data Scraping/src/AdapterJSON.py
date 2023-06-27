import json

class Serializer:
    def __init__(self, courses: list, departments: list, resources:list):
        self.courses=courses
        self.departments=departments
        self.resources = resources

    def serialize(self):
        serialized_courses = {
            "courses": [
                {
                    "course_id": course.course_id,
                    "semester": course.semester,
                    "year": course.year,
                    "title": course.title,
                    "url": course.url,
                    "detail": course.detail,
                    "lecturers": course.lecturers,
                    "department": course.department,
                    "courseImage": course.courseImage,
                    "level": course.level,
                    "downloadLink": course.download
                }
                for course in self.courses
            ]
        }

        serialized_departments = {
            "departments": [
                {
                    "name": department.name,
                    "numberOfCourses": department.numberOfCourses,
                    "departmentWeb": department.departmentWeb
                }
                for department in self.departments
            ]
        }

        serialized_resources = {
            "resources": [
                {
                    "name": resource.name,
                    "url": resource.url,
                    "type": resource.type,
                    "fType": resource.fType,
                    "cid": resource.cid,
                    "semester": resource.semester,
                    "year": resource.year
                }
                for resource in self.resources
            ]
        }
        with open("courses.json", "w") as file:
            json.dump(serialized_courses, file, indent=4)

        with open("departments.json", "w") as file:
            json.dump(serialized_departments, file, indent=4)

        with open("resources.json", "w") as file:
            json.dump(serialized_resources, file, indent=4)