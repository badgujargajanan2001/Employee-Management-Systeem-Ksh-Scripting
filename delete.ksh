#!/bin/ksh

# Taking the input from user for employee_id
echo "Enter Employee ID to deactivate: "
read employee_id

file="employee.data"
deactive_file="deactive.data"

employee_data=$(grep "^$employee_id#" $file)

if [ -z "$employee_data" ]
then
    echo "${employee_id} ID not found."
    exit 1
fi

updated_employee_data=$(echo "$employee_data" | sed 's/Active/Deactive/')

echo "$updated_employee_data" >> $deactive_file

sed -i "s|$employee_data|$updated_employee_data|" $file

echo "Employee ID $employee_id has been deactivated and moved to $deactive_file."

