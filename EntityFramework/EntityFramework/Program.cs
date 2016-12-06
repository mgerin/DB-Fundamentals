using System;
using System.Collections;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EntityFramework.Models;

namespace EntityFramework
{
    class Program
    {
        static void Main()
        {
            SoftuniContext context = new SoftuniContext();
            StringBuilder content = new StringBuilder();
            using (context)
            {
                // Problem 03
                // IEnumerable<Employee> employees = context.Employees;
                // foreach (Employee employee in employees)
                // {
                //    content.AppendLine($"{employee.FirstName} {employee.LastName} {employee.MiddleName} {employee.JobTitle} {employee.Salary}");
                //    
                // }

                // Problem 04
                // var employeesNames = context.Employees.Where(x => x.Salary > 50000).Select(em => em.FirstName);
                // 
                // foreach (string employeesName in employeesNames)
                // {
                //     content.AppendLine(employeesName);
                // }

                // Problem 05
                // var employees = context.Employees.Where(em => em.Department.Name == "Research and Development")
                //     .OrderBy(em => em.Salary)
                //     .ThenByDescending(em => em.FirstName);
                // 
                // foreach (var employee in employees)
                // {
                //     content.AppendLine($"{employee.FirstName} {employee.LastName} " +
                //                        $"from {employee.Department.Name} - ${employee.Salary:F2}");
                // }

                // Problem 06
                // var address = new Address() { AddressText = "Vitoshka 15", TownID = 4 };
                // var employee = context.Employees.First(emp => emp.LastName == "Nakov");
                // employee.Address = address;
                // 
                // context.SaveChanges();
                // 
                // var employeeAddresses =
                //     context.Employees.OrderByDescending(em => em.Address.AddressID)
                //         .Take(10)
                //         .Select(em => em.Address.AddressText);
                // 
                // foreach (string employeeAddress in employeeAddresses)
                // {
                //     content.AppendLine(employeeAddress);
                // }

                //Problem 07
                // var project = context.Projects.Find(2);
                // var employees = project.Employees;
                // 
                // foreach (Employee employee in employees)
                // {
                //     employee.Projects.Remove(project);
                // }
                // context.SaveChanges();
                // 
                // context.Projects.Remove(project);
                // context.SaveChanges();
                // 
                // var projects = context.Projects.Take(10).Select(pr => pr.Name);
                // foreach (string proj in projects)
                // {
                //     content.AppendLine(proj);
                // }

                // Problem 08
                // var employees =
                //     context.Employees.Where(
                //         employee =>
                //             employee.Projects.Count(
                //                 project => project.StartDate.Year >= 2001 && project.StartDate.Year <= 2003) > 0).Take(30);
                // 
                // foreach (var employee in employees)
                // {
                //     content.AppendLine($"{employee.FirstName} {employee.LastName} {employee.Manager.FirstName}");
                //     foreach (Project project in employee.Projects)
                //     {
                //         content.AppendLine($"--{project.Name} {project.StartDate} {project.EndDate}");
                // 
                //     }
                // }

                // Problem 09
                // var addresses =
                //     context.Addresses.OrderByDescending(address => address.Employees.Count)
                //         .ThenBy(address => address.Town.Name)
                //         .Take(10);
                // 
                // foreach (Address address in addresses)
                // {
                //     content.AppendLine(
                //         $"{address.AddressText}, {address.Town.Name} - {address.Employees.Count} employees");
                // }

                // Problem 10
                // Employee employee = context.Employees.Find(147);
                // 
                // IEnumerable<Project> projects = employee.Projects.OrderBy(proj => proj.Name);
                // content.AppendLine($"{employee.FirstName} {employee.LastName} {employee.JobTitle}");
                // 
                // foreach (Project project in projects)
                // {
                //     content.AppendLine($"{project.Name}");
                // }

                // 11.	Departments with more than 5 employees
                // IEnumerable<Department> departments =
                //     context.Departments.Where(department => department.Employees.Count > 5)
                //         .OrderBy(department => department.Employees.Count);
                // 
                // foreach (Department department in departments)
                // {
                //     content.AppendLine($"{department.Name} {department.Employee.FirstName}");
                //     foreach (Employee employee in department.Employees)
                //     {
                //         content.AppendLine($"{employee.FirstName} {employee.LastName} {employee.JobTitle}");
                //     }
                // }

                // 12. Native SQL Query
                // context.Addresses.Count();
                // 
                // var timer = new Stopwatch();
                // 
                // timer.Start();
                // PrintNameWithLinq(context);
                // timer.Stop();
                // content.AppendLine($"Linq: {timer.Elapsed}");
                // timer.Reset();
                // 
                // timer.Start();
                // PrintNamesWithNativeQuery(context);
                // timer.Stop();
                // content.AppendLine($"Native: {timer.Elapsed}");
                // timer.Reset();

                // 15.	Find Latest 10 Projects
                // var latestStartedprojects =
                //     context.Projects.OrderByDescending(project => project.StartDate)
                //         .Take(10)
                //         .OrderBy(project => project.Name);
                // 
                // foreach (var latestStartedproject in latestStartedprojects)
                // {
                //     content.AppendLine(
                //         $"{latestStartedproject.Name} {latestStartedproject.Description} {latestStartedproject.StartDate} {latestStartedproject.EndDate}");
                // }

                // 16.	Increase Salaries
                // var employees =
                //     context.Employees.Where(
                //         employee =>
                //             employee.Department.Name == "Engineering" || employee.Department.Name == "Tool Design" ||
                //             employee.Department.Name == "Marketing" ||
                //             employee.Department.Name == "Information Services");
                // 
                // foreach (var employee in employees)
                // {
                //     employee.Salary *= 1.12m;
                //     content.AppendLine($"{employee.FirstName} {employee.LastName} (${employee.Salary})");
                // }
                // 
                // context.SaveChanges();

                // 17.	Remove Towns
                // string townName = Console.ReadLine();
                // Town wantedTown = context.Towns.FirstOrDefault(town => town.Name == townName);
                // 
                // Address[] townAddresses = wantedTown.Addresses.ToArray();
                // foreach (Address townAddress in townAddresses)
                // {
                //     Employee[] employeesAddresses = townAddress.Employees.ToArray();
                //     foreach (var employee in employeesAddresses)
                //     {
                //         employee.AddressID = null;
                //     }
                // }
                // 
                // context.Addresses.RemoveRange(townAddresses);
                // context.Towns.Remove(wantedTown);
                // context.SaveChanges();
                // if (townAddresses.Length == 1)
                // {
                //     content.AppendLine($"{townAddresses.Length} address in {townName} was deleted");
                // }
                // else
                // {
                //     content.AppendLine($"{townAddresses.Length} addresses in {townName} were deleted");
                // }

                // 18.	Find Employees by First Name starting with ‘SA’
                // string pattern = "SA";
                // var employeesByNamePattern = context.Employees.Where(employee => employee.FirstName.StartsWith(pattern));
                // 
                // foreach (Employee employee in employeesByNamePattern)
                // {
                //     content.AppendLine($"{employee.FirstName} {employee.LastName} " +
                //                        $"- {employee.JobTitle} - (${employee.Salary})");
                // }




                File.WriteAllText("entity.txt", content.ToString());
            }
        }

        private static void PrintNamesWithNativeQuery(SoftuniContext context)
        {
            string query = "SELECT em.FirstName FROM Employees em " +
                           "JOIN EmployeesProjects emproj " +
                           "ON emproj.EmployeeId = em.EmployeeId " +
                           "JOIN Projects proj " +
                           "ON emproj.ProjectId = proj.ProjectId AND YEAR(proj.StartDate) = 2002 " +
                           "GROUP BY em.FirstName";
            var result = context.Database.SqlQuery<string>(query);
            foreach (var f in result)
            {
                
            }
        }

        private static void PrintNameWithLinq(SoftuniContext context)
        {
            var employeesNames =
                context.Employees.Where(
                    employee => employee.Projects.Count(project => project.StartDate.Year == 2002) != 0)
                    .Select(employee => employee.FirstName)
                    .GroupBy(s => s);
            foreach (var s in employeesNames)
            {
                
            }
        }
    }
}
