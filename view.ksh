#!/bin/ksh

# Taking input from user for employee_id to view all data
echo "Enter Employee ID: "
read employee_id

# Store the data file (employee.data)
file="employee.data"

# Get the employee data using the provided employee ID
employee_data=$(grep "^$employee_id#" $file)

# Check if employee data is found
if [ -z "$employee_data" ]; then
    echo "Error: Employee ID not found."
    exit 1
fi

# Extract data fields
IFS="#" read -r employee_id first_name last_name date_of_joining line_manager_id designation department phone_number email_address status <<< "$employee_data"

# Display the employee data
echo "--------------------------------------------"
echo "Employee ID       : $employee_id"
echo "Name              : $first_name $last_name"
echo "Date of Joining   : $date_of_joining"
echo "Line Manager ID   : $line_manager_id"
echo "Designation       : $designation"
echo "Department        : $department"
echo "Phone Number      : $phone_number"
echo "Email Address     : $email_address"
echo "Status            : $status"
echo "--------------------------------------------"

