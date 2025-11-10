# db_config.py
# ----------------------------------------
# Database connection setup for Flask + MySQL
# ----------------------------------------

import mysql.connector

def get_db_connection():
    """
    Creates and returns a connection object to the MySQL database.
    Make sure your MySQL server is running and the credentials match.
    """
    try:
        conn = mysql.connector.connect(
            host="localhost",                 # Database host (usually localhost)
            user="root",                      # Your MySQL username
            password="lakshitasql",   # 🔒 Replace with your MySQL password
            database="project_submission_tracker"  # Your database name
        )
        return conn
    except mysql.connector.Error as err:
        print(f"❌ Error: {err}")
        return None
