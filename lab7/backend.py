# backend.py

import mysql.connector
import streamlit as st
import xml.etree.ElementTree as ET
from mysql.connector import IntegrityError
# backend.py



def connect_to_database():
    conn = mysql.connector.connect(
        host="localhost",
        user="root",
        password="12345678",
        database="onlinebookstore"
    )
    return conn

def execute_query(query):
    conn = connect_to_database()
    cursor = conn.cursor()
    cursor.execute(query)
    if "SELECT" in query:
        results = cursor.fetchall()
        columns = [desc[0] for desc in cursor.description]
        conn.close()
        return columns, results
    else:
        conn.commit()
        conn.close()
        
    



def insert_data(table_name, values):
    print(f"Inserting data into {table_name} table.")
    columns = ', '.join(values.keys())
    values_str = ', '.join(f"'{value}'" for value in values.values())
    query = f"INSERT INTO {table_name} ({columns}) VALUES ({values_str})"
    execute_query(query)
    st.success(f"Data inserted successfully into '{table_name}' table.")









def delete_records(table_name, condition):
    try:
        # Check if the record exists
        check_record_query = f"SELECT COUNT(*) FROM {table_name} WHERE {condition}"
        count_result = execute_query(check_record_query)

        print("count_result:", count_result)  # Add this line to print count_result

        if count_result and count_result[1][0][0] > 0:
            # Record exists, delete it
            delete_query = f"DELETE FROM {table_name} WHERE {condition}"
            execute_query(delete_query)  # Remove fetch=False
            return True, f'Record deleted successfully from the {table_name} table!'
        else:
            return False, f'Record not found in the {table_name} table.'
    except IntegrityError as e:
        return False, f'Error deleting record: {e}'






def update_data(table_name, update_columns, condition):
    set_values = ', '.join(f"{column} = '{value}'" for column, value in update_columns.items())
    query = f"UPDATE {table_name} SET {set_values} WHERE {condition}"
    execute_query(query)

def get_table_data(table_name):
    query = f"SELECT * FROM {table_name}"
    return execute_query(query)

def insert_data_from_xml(xml_file):
    tree = ET.parse(xml_file)
    root = tree.getroot()

    for table in root:
        table_name = table.tag
        for row in table:
            columns = ', '.join(row.tag for row in row)
            values = ', '.join(f"'{row.text}'" for row in row)
            query = f"INSERT INTO {table_name} ({columns}) VALUES ({values})"
            execute_query(query)

def update_book_from_xml(xml_file):
    tree = ET.parse(xml_file)
    root = tree.getroot()

    for table in root:
        table_name = table.tag
        for row in table:
            book_id = row.find('BookID').text
            update_columns = ', '.join(f"{row.tag} = '{row.text}'" for row in row if row.tag != 'BookID')
            query = f"UPDATE {table_name} SET {update_columns} WHERE BookID = {book_id}"
            execute_query(query)

if __name__ == '__main__':
    # Run necessary backend tasks, such as populating the database from XML files
    insert_data_from_xml('populate_db.xml')
    update_book_from_xml('update_1book.xml')
