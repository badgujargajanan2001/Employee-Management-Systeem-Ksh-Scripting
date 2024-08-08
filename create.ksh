#!/bin/ksh

# Taking input from user for employee_id
# echo "Enter Employee ID: "
# read employee_id

# Validation for the employee_id
file="employee_latest_id.in"
employee_id=$(cut -d: -f2 "$file")

# --------------------------------------------------------------
# Taking input from user for first_name
echo ""
echo "Note: Only alphabets allowed and First letter Must be Capital"
echo "Example: Gajanan"
echo "Enter First Name: "
read first_name

# Validation for the first_name
if echo "$first_name" | grep -qE "^[A-Za-z]+$"
then
    echo ""
else
    echo "Error: First Name should contain only alphabets"
    exit 1
fi

# --------------------------------------------------------------
# Taking input from user for last_name
echo "Note: Last Name should contain only alphabets"
echo "Example: Badgujar"
echo "Enter Last Name: "
read last_name

# Validation for the last_name
if echo "$last_name" | grep -qE "^[A-Za-z]+$"
then
    echo ""
else
    echo "Error: Last Name should contain only alphabets"
    exit 1
fi

# --------------------------------------------------------------
# Taking input from user for date_of_joining
echo "Note: Date of Joining should be in the format dd/mm/yyyy"
echo "Enter Date of Joining: "
read date_of_joining

# Validation for the date_of_joining
if echo "$date_of_joining" | grep -qE "^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[0-2])/([0-9]{4})$"
then
    echo ""
else
    echo "Error: Date of Joining should be in the format dd/mm/yyyy or Enter valid date"
    exit 1
fi

# --------------------------------------------------------------
# Taking input from user for line_manager_id
echo "Enter Line Manager Id: "
read line_manager_id

# Validation for the line_manager_id
if echo "$line_manager_id" | grep -qE "^[0-9]{6}$"
then
    echo ""
else
    echo "Error: Line Manager Id should be in digits and exactly 6 digits long"
    exit 1
fi

# --------------------------------------------------------------
# Taking input from user for designation
echo "Note: Designation should contain only alphabets"
echo "Enter Designation: "
read designation

# Validation for designation
if echo "$designation" | grep -qE "^[A-Za-z]+$"
then
    echo ""
else
    echo "Error: Designation should contain only alphabets"
    exit 1
fi

# --------------------------------------------------------------
# Taking input from user for department
echo "Note: Department Name should contain only alphabets"
echo "Enter Department: "
read department

# Validation for department
if echo "$department" | grep -qE "^[A-Za-z]+$"
then
    echo ""
else
    echo "Error: Department should contain only alphabets"
    exit 1
fi

# --------------------------------------------------------------
# Taking input from user for phone_number
echo "Note: Phone Number should be a 10-digit number"
echo "Enter Phone Number: "
read phone_number

# Validation for phone_number
if echo "$phone_number" | grep -qE "^[0-9]{10}$"
then
    echo ""
else
    echo "Error: Phone Number should be a 10-digit number"
    exit 1
fi

# --------------------------------------------------------------
# Taking input from user for email_address
echo "Enter Email Address: "
read email_address

# Validation for the email address
if echo "$email_address" | grep -qE "^[a-zA-Z]+[0-9._+-]*@inspiritvision\.com$"
then
    echo ""
else
    echo "Error: Please Enter Valid Email Address"
    exit 1
fi

# --------------------------------------------------------------
# Status for the employee
status="Active"

# Append to employee.data file
echo "$employee_id#$first_name#$last_name#$date_of_joining#$line_manager_id#$designation#$department#$phone_number#$email_address#$status" >> employee.data

# Increment for the employee ID
increment=$(($employee_id + 1))
sed -i "s/$employee_id/$increment/" employee_latest_id.in

echo "Data Inserted"

