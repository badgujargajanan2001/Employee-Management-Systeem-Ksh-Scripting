#!/bin/ksh

# Taking input from user for employee_id
echo "Enter Employee ID to update: "
read employee_id

# File containing employee data
file="employee.data"

#jkC
#C
# Fetch the employee data using the provided employee ID
employee_data=$(grep "^$employee_id#" $file)

# Check if employee data is found
if [ -z "$employee_data" ]; then
    echo "Error: Employee ID not found."
    exit 1
fi

# Extract data fields
IFS="#" read -r emp_id first_name last_name date_of_joining line_manager_id designation department phone_number email_address status <<< "$employee_data"

# Menu for updating fields
echo "Select the field to update:"
echo "1. First Name"
echo "2. Last Name"
echo "3. Date of Joining"
echo "4. Line Manager ID"
echo "5. Designation"
echo "6. Department"
echo "7. Phone Number"
echo "8. Email Address"
echo "9. Status"
echo "10. Update All Fields"
echo "Enter the option number: "
read option

#--------------------------------------------------------------------
if [ "$option" -eq 1 ] || [ "$option" -eq 10 ]; then
    echo "Enter new First Name (current: $first_name): "
    read new_first_name
    if [ -n "$new_first_name" ]; then
        if echo "$new_first_name" | grep -qE "^[A-Za-z]+$";
        then
            first_name=$new_first_name
        else
            echo "Error: First Name should contain only alphabets"
            exit 1
        fi
    fi
fi

#---------------------------------------------------------------------
if [ "$option" -eq 2 ] || [ "$option" -eq 10 ]; then
    echo "Enter new Last Name (current: $last_name): "
    read new_last_name
    if [ -n "$new_last_name" ]; then
        if echo "$new_last_name" | grep -qE "^[A-Za-z]+$"; then
            last_name=$new_last_name
        else
            echo "Error: Last Name should contain only alphabets"
            exit 1
        fi
    fi
fi

#-------------------------------------------------------------------------
if [ "$option" -eq 3 ] || [ "$option" -eq 10 ]; then
    echo "Enter new Date of Joining (current: $date_of_joining): "
    read new_date_of_joining
    if [ -n "$new_date_of_joining" ]; then
        if echo "$new_date_of_joining" | grep -qE "^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[0-2])/([0-9]{4})$"; then
            date_of_joining=$new_date_of_joining
        else
            echo "Error: Date of Joining should be in the format dd/mm/yyyy"
            exit 1
        fi
    fi
fi

#-------------------------------------------------------------------------
if [ "$option" -eq 4 ] || [ "$option" -eq 10 ]; then
    echo "Enter new Line Manager ID (current: $line_manager_id): "
    read new_line_manager_id
    if [ -n "$new_line_manager_id" ]; then
        if echo "$new_line_manager_id" | grep -qE "^[0-9]{6}$"; then
            line_manager_id=$new_line_manager_id
        else
            echo "Error: Line Manager ID should be in digits and exactly 6 digits long"
            exit 1
        fi
    fi
fi

#-------------------------------------------------------------------------
if [ "$option" -eq 5 ] || [ "$option" -eq 10 ]; then
    echo "Enter new Designation (current: $designation): "
    read new_designation
    if [ -n "$new_designation" ]; then
        if echo "$new_designation" | grep -qE "^[A-Za-z]+$"; then
            designation=$new_designation
        else
            echo "Error: Designation should contain only alphabets"
            exit 1
        fi
    fi
fi

#------------------------------------------------------------------------------
if [ "$option" -eq 6 ] || [ "$option" -eq 10 ]; then
    echo "Enter new Department (current: $department): "
    read new_department
    if [ -n "$new_department" ]; then
        if echo "$new_department" | grep -qE "^[A-Za-z]+$"; then
            department=$new_department
        else
            echo "Error: Department should contain only alphabets"
            exit 1
        fi
    fi
fi

#------------------------------------------------------------------------------
if [ "$option" -eq 7 ] || [ "$option" -eq 10 ]; then
    echo "Enter new Phone Number (current: $phone_number): "
    read new_phone_number
    if [ -n "$new_phone_number" ]; then
        if echo "$new_phone_number" | grep -qE "^[0-9]{10}$"; then
            phone_number=$new_phone_number
        else
            echo "Error: Phone Number should be a 10-digit number"
            exit 1
        fi
    fi
fi

#------------------------------------------------------------------------------
if [ "$option" -eq 8 ] || [ "$option" -eq 10 ]; then
    echo "Enter new Email Address (current: $email_address): "
    read new_email_address
    if [ -n "$new_email_address" ]; then
        if echo "$new_email_address" | grep -qE "^[a-zA-Z]+[0-9._+-]*@inspiritvision\.com$"; then
            email_address=$new_email_address
        else
            echo "Error: Please enter a valid email address"
            exit 1
        fi
    fi
fi

#------------------------------------------------------------------------------
if [ "$option" -eq 9 ] || [ "$option" -eq 10 ]; then
    echo "Enter new Status (Active/Deactive): "
    read new_status
    if [ -n "$new_status" ]; then
        if echo "$new_status" | grep -qE "^(Active|Deactive)$"; then
            status=$new_status
        else
            echo "Error: Status should be either Active or Deactive"
            exit 1
        fi
    fi
fi

#------------------------------------------------------------------------------
# Update the employee data in the file
new_employee_data="$employee_id#$first_name#$last_name#$date_of_joining#$line_manager_id#$designation#$department#$phone_number#$email_address#$status"

sed -i "s|$employee_data|$new_employee_data|" $file

echo "Employee ID $employee_id has been updated."

