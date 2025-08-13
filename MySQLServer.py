import mysql.connector
from mysql.connector import Error

def create_bookstore_database():
    connection = None
    try:
        # Connect to MySQL server (without specifying a database)
        connection = mysql.connector.connect(
            host='localhost',
            user='root',      # Replace with your MySQL username
            password=''       # Replace with your MySQL password
        )
        
        if connection.is_connected():
            cursor = connection.cursor()
            
            # Create database (won't fail if it already exists)
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
            connection.commit()
            print("Database 'alx_book_store' created successfully!")
            
    except Error as e:
        print(f"Error occurred while connecting to MySQL: {e}")
    finally:
        # Properly close resources
        if connection and connection.is_connected():
            if 'cursor' in locals():
                cursor.close()
            connection.close()
            print("MySQL connection closed")

if __name__ == "__main__":
    create_bookstore_database()
