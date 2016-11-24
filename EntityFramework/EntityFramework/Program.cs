using System;
using System.Collections.Generic;
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
                var address = new Address() { AddressText = "Vitoshka 15", TownID = 4 };

                
                File.WriteAllText("entity.txt", content.ToString());
            }
        }
    }
}
