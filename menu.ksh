#!/bin/ksh

while true; do
    clear
    echo "============================"
    echo " Employee Management System"
    echo "============================"
    echo "1. Create New Employee Record"
    echo "2. Deactivate Employee Record"
    echo "3. Update Employee Record"
    echo "4. View Employee Record"
    echo "5. Exit"
    echo "============================"
    echo "Enter your choice (1-5): "
    read choice

    case $choice in
        1)
            ./create.ksh
            ;;
        2)
            ./delete.ksh
            ;;
        3)
            ./update.ksh
            ;;
        4)
            ./view.ksh
            ;;
        5)
            echo "Exiting the system. Goodbye!"
            exit 0
            ;;
        *)
            echo "Invalid choice! Please select a valid option."
            ;;
    esac

    echo "Press Enter to continue..."
    read
done

