# frontend.py

import streamlit as st
import pandas as pd
from backend import insert_data, delete_records, update_data, get_table_data
from backend import execute_query
import time


def display_table(table_name):
    columns, data = get_table_data(table_name)
    df = pd.DataFrame(data, columns=columns)
    st.write(f"Displaying data from the {table_name} table:")
    st.write(df)

def update_users():
    st.subheader('Update Information in Users Table:')
    update_columns = {}
    for column in ['Username', 'Password']:
        update_columns[column] = st.text_input(column, '')
    condition = st.text_input('Enter the condition for updating (e.g., UserID=1)', '')
    if st.button('Update Information'):
        # Ensure that the condition is properly formatted
        condition = f"UserID={condition.strip()}"
        update_data('users', update_columns, condition)
        st.success('Information updated successfully in the Users table!')

# frontend.py

def update_carts():
    st.subheader('Update Information in Carts Table:')
    update_columns = {}
    for column in ['BookID', 'Quantity']:
        update_columns[column] = st.text_input(column, '')

    condition = st.text_input('Enter the condition for updating (e.g., CartID=1)', '')
    if st.button('Update Information'):
        # Ensure that the condition is properly formatted
        condition = f"CartID={condition.strip()}"
        
        update_data('carts', update_columns, condition)
        st.success('Information updated successfully in the Carts table!')
        
        
def update_books():
    st.subheader('Update Information in Books Table:')
    update_columns = {}
    for column in ['Title', 'Author', 'Price', 'Quantity']:
        update_columns[column] = st.text_input(column, '')
    condition = st.text_input('Enter the condition for updating (e.g., BookID=1)', '')
    if st.button('Update Information'):
        # Ensure that the condition is properly formatted
        condition = f"BookID={condition.strip()}"
        update_data('books', update_columns, condition)
        st.success('Information updated successfully in the Books table!')
# frontend.py

# ...

def delete_records_page():
    st.header('Delete Records')

    # Assuming 'users', 'books', and 'carts' are valid table names
    table_name = st.selectbox('Select a table to delete records from', ['users', 'books', 'carts'])
    
    st.write(f"Delete records from the {table_name} table:")

    condition = st.text_input(f'Enter the condition for deletion (e.g., {table_name}ID=1)', '')


    if st.button('Delete Records'):
        success, message = delete_records(table_name, condition)
        if success:
            st.success(message)
        else:
            st.error(message)

# ...






def main():
    st.title('Online Bookstore Management')

    st.sidebar.header('Navigation')
    page = st.sidebar.radio("Select a page", ["View Tables", "Insert Data", "Delete Records", "Update Information"])

    if page == "View Tables":
        st.header('View Tables')
        table_name = st.selectbox('Select a table to view', ['books', 'users', 'carts'])
        display_table(table_name)

    elif page == "Insert Data":
      st.header('Insert Data')

      if st.checkbox('Insert data into "users" table'):
        st.subheader('Insert Data into Users Table:')
        user_values = {}
        for column in ['Username', 'Password']:
            user_values[column] = st.text_input(column, '')
        if st.button('Insert User Data'):
            insert_data('users', user_values)
            st.success('User data inserted successfully!')

      if st.checkbox('Insert data into "books" table'):
        st.subheader('Insert Data into Books Table:')
        book_values = {}
        for column in ['Title', 'Author', 'Price', 'Quantity']:
            book_values[column] = st.text_input(column, '')
        if st.button('Insert Book Data'):
            insert_data('books', book_values)
            st.success('Book data inserted successfully!')

      # frontend.py

# ...

      if st.checkbox('Insert data into "carts" table'):
          st.subheader('Insert Data into Carts Table:')
          cart_values = {}
          for column in ['UserID', 'BookID', 'Quantity']:
           cart_values[column] = st.text_input(column, '')

          if st.button('Insert carts Data'):
            insert_data('carts', cart_values)
            st.success('cart data inserted successfully!')


# ...

    elif page == "Delete Records":
        delete_records_page()

# ...



    elif page == "Update Information":
        st.header('Update Information')
        table_name = st.selectbox('Select a table to update information in', ['books', 'users', 'carts'])
        st.write(f"Update information in the {table_name} table:")

        if table_name == 'users':
            update_users()
        elif table_name == 'books':
            update_books()
        elif table_name == 'carts':
            update_carts()
   
if __name__ == '__main__':
    main()
