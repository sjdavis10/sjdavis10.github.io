**Lab: Installing PostgreSQL and Creating a Gradebook Database**

**Objective:**\
This lab will guide you through the process of installing PostgreSQL, creating a database and tables, and inserting data into your database. By completing these tasks, you will gain hands-on experience with database setup and SQL basics.

---

## **Step 1: Download and Install PostgreSQL**

1. **Go to the official PostgreSQL website**
   - Open a web browser and navigate to [PostgreSQL](https://www.postgresql.org/download/).
   - Choose the appropriate version for your operating system (Windows, macOS, or Linux).
2. **Download and Install PostgreSQL (without StackBuilder)**
   - Click on the installer link and download the file.

   - Open the installer by double-clicking the downloaded file. Follow these steps carefully:

   - Click **Next** on the welcome screen.

   - Choose the installation directory or leave it as default and click **Next**.

   - Select Components

     - Uncheck "Stack Builder" (this prevents unnecessary additional installations).

     - Ensure the following components remain selected:

       - ✅ PostgreSQL Server

       - ✅ pgAdmin 4
 
       - ✅ Command Line Tools

     - Click **Next**

   - Set Data Directory

     - Leave the default (C:\Program Files\PostgreSQL\XX\data) or change it if needed.
     - Click **Next**
     - Set a password for the PostgreSQL superuser (default user: `postgres`).
       - Enter `CTI_110_WakeTech` as the password. **Remember this password for later use.**

   - Select the default port (5432) unless you need a different one, then click **Next**.

   - Click **Next** again and review the summary before starting the installation.

   - Click **Install** and wait for the process to complete.

   - When the installation is complete, uncheck "Launch StackBuilder" and click **Finish** to exit the installer.

   - **Important:** When prompted to set an administrator password, enter `CTI_110_WakeTech`. You will need this password later.

   - When completed, uncheck any option to launch Stack Builder, then click Finish. Note where PostgreSQL is installed on your system.
 - 
3. **Open pgAdmin 4 to Verify Installation**
   - After installation, open **pgAdmin** from the **Start Menu** (a GUI tool for PostgreSQL) to confirm that PostgreSQL is ready to use.
   - When pgAdmin opens, you’ll see a "Servers" panel.
     - Click on "PostgreSQL", and you’ll be prompted for the password
     - Enter the password
    - Click OK to connect.
   - If you see a list of databases (including postgres), the installation was successful.

---

## **Step 2: Create the Gradebook Database**

1. In pgAdmin, expand the "Servers" list.
2. Right-click on "Databases" → Click Create → Database.
3. In the **General** tab:
   - Database Name: Enter `Gradebook_lastname`, replacing lastname with your actual last name.
     - Example: If your last name is Smith, enter Gradebook_Smith.
4. Owner: Ensure postgres is selected (default)
5. Click **Save**.

Your new database will now appear under the "Databases" section. 🎉

---
## **Step 3: Make sure connected to the `Gradebook_lastname` Database**
1. In the left-side **Browser panel**, expand **Servers**.
2. Expand **PostgreSQL XX** (where `XX` is your installed version).
3. Expand **Databases**.
4. Locate and click on **`Gradebook_lastname`** (your database).
   - Example: If your last name is **Smith**, select **`Gradebook_Smith`**.

## **Step 4: Create the Tables**

1. **Open the SQL Query Tool**
   - Method 1
     - Open the **SQL Query Tool** (icon looks like a stack of cylinders with a Play button). or 
   - Method 2
     - Click on **Tools** menu at the top
     - Select **Query Tool**
   - A new tab with a text editor will open
>[WARNING!]
> ⚠️ If says` Welcome to the Query Tool Workspace` an the Server names has an ❗ mark...in the `Exisiting Server` **Select** PostgreSQL 17 and then in `database` make sure your **Gradebook database** is selected. Default may be posgres...click on the entry line for database and select your database. this will then create a connection to the query tool for your database.
> You may have to reenter your password

1. **Create the `STUDENTS` Table**
   - In the **SQL Query Tool**, copy and paste the following SQL command:
  
   ```sql
   CREATE TABLE STUDENTS (
       STUDENT_ID SERIAL PRIMARY KEY,
       FIRST_NAME VARCHAR(50),
       LAST_NAME VARCHAR(50),
       EMAIL VARCHAR(100),
       ENROLLMENT_DATE DATE
   );
   ```
    - Click the **Execute (▶) button** or press **F5**.
    - A message should appear in the **Messages tab** saying:  
   ```graphql
   Query returned successfully.
   ```
   - This confirms that the **STUDENTS** table has been created.

2. **Create the `ASSIGNMENTS` Table**
   - After the `STUDENTS` table successfully executed, delete or clear the SQL Query Tool's editor window.
   - In the **SQL Query Tool**, copy and paste the following SQL command:
     ```sql
     CREATE TABLE ASSIGNMENTS (
         ASSIGNMENT_ID SERIAL PRIMARY KEY,
         TITLE VARCHAR(100),
         DESCRIPTION TEXT,
         DUE_DATE DATE,
         STUDENT_ID INT REFERENCES STUDENTS(STUDENT_ID)
     );
     ```
   - Click the **Execute (▶) button** or press **F5**.
   - You should see the success message:  
        ```graphql
        Query returned successfully.
        ```
   - This confirms that the **ASSIGNMENTS** table has been created.

>[NOTE!]
> You must run each query separately because PostgreSQL executes one SQL command at a time in the Query Tool.


---

## **Step 5: Verify That the Tables Were Created**
1. In the **pgAdmin Browser panel**, expand **`Gradebook_lastname`**.
2. Expand **Schemas** → Expand **public**.
3. Click **Tables**.
4. You should see two tables:
   - `STUDENTS`
   - `ASSIGNMENTS`
  
>[NOTE!]
> You may have to exit and restart pgAdmin for the database to reflect the added tables

## **Step 6: Insert Data**
>[NOTE!]
>If you exited earlier your may have to open the **SQL Query Tool** again. If says Welcome to the Query Tool Workspace an the Server names has an❗mark...in the `Exisiting Server` **Select** PostgreSQL 17 and then in `database` make sure your **Gradebook database** is selected. Default may be posgres...click on the entry line for database and select your database. this will then create a connection to the query tool for your database.
> You may have to reenter your password

1. **Insert a Student Record**

   - Use the following SQL command, replacing placeholders with your information:

     ```sql
     INSERT INTO STUDENTS (FIRST_NAME, LAST_NAME, EMAIL, ENROLLMENT_DATE)
     VALUES ('YourFirstName', 'YourLastName', 'YourEmail@example.com', 'YYYY-MM-DD');
     ```

   - Example:

     ```sql
     INSERT INTO STUDENTS (FIRST_NAME, LAST_NAME, EMAIL, ENROLLMENT_DATE)
     VALUES ('Jane', 'Doe', 'jane.doe@example.com', '2023-08-15');
     ```

   - If you want to omit the enrollment date, use:

     ```sql
     INSERT INTO STUDENTS (FIRST_NAME, LAST_NAME, EMAIL)
     VALUES ('Jane', 'Doe', 'jane.doe@example.com');
     ```

2. **Insert an Assignment Record**

   - Run the following SQL command, modifying the values:
     ```sql
     INSERT INTO ASSIGNMENTS (TITLE, DESCRIPTION, DUE_DATE, STUDENT_ID)
     VALUES ('Lab7 PostgreSQL', 'Set up a database and insert records as described in the instructions.', '2025-01-15', 1);
     ```
   - **Important:** Replace `STUDENT_ID` with the actual ID generated for your student record.

3. **Verify Your Insertions**

   - In **pgAdmin 4**, you will again use the `Query Tool` to verify the insertion. 

  - Checking Students Table
     ```sql
     SELECT * FROM STUDENTS;
    ```
    
    **Expected Data Output:**
    | STUDENT_ID | FIRST_NAME | LAST_NAME | EMAIL                    | ENROLLMENT_DATE |
    |------------|-----------|----------|--------------------------|----------------|
    | 1          | Jane      | Doe      | jane.doe@example.com     | 2023-08-15    |
  
    - Since `STUDENT_ID` is defined as `SERIAL PRIMARY KEY`, it automatically starts at `1`.
    - The `ENROLLMENT_DATE` is stored as `2023-08-15`.
   
- Checking Assignments Table
     ```sql
     SELECT * FROM ASSIGNMENTS;
    ```
  **Expected Data Output:**
  | ASSIGNMENT_ID | TITLE            | DESCRIPTION                                                   | DUE_DATE   | STUDENT_ID |
  |--------------|----------------|--------------------------------------------------------------|------------|------------|
  | 1            | Lab7 PostgreSQL | Set up a database and insert records as described in the instructions. | 2025-01-15 | 1          |

    - `ASSIGNMENT_ID` is `SERIAL`, so it starts at `1`
    - The `TITLE`, `DESCRIPTION`, and `DUE_DATE` values match your insert statement
    - `STUDENT` is `1`, referencing Jane Doe in the `STUDENTS` table
 

- To check student-assignment relationships, run:

     ```sql
     SELECT * FROM ASSIGNMENTS, STUDENTS WHERE ASSIGNMENTS.STUDENT_ID = STUDENTS.STUDENT_ID;
     ```

  **Expected Data Output:**

  | ASSIGNMENT_ID | TITLE            | DESCRIPTION                                                   | DUE_DATE   | STUDENT_ID | STUDENT_ID | FIRST_NAME | LAST_NAME | EMAIL                    | ENROLLMENT_DATE |
  |--------------|----------------|--------------------------------------------------------------|------------|------------|------------|------------|-----------|--------------------------|----------------|
  | 1            | Lab7 PostgreSQL | Set up a database and insert records as described in the instructions. | 2025-01-15 | 1          | 1          | Jane       | Doe       | jane.doe@example.com     | 2023-08-15    |

  - The query **performs an INNER JOIN** between `ASSIGNMENTS` and `STUDENTS` using the condition `ASSIGNMENTS.STUDENT_ID = STUDENTS.STUDENT_ID`.
  - Since there is only **one matching record** (Jane Doe has `STUDENT_ID = 1`, and the assignment also references `STUDENT_ID = 1`), you get a **single row** in the result.
  - The `STUDENT_ID` column appears twice because it exists in both tables. This can be improved with more explicit JOIN syntax but that will be further developed in DBA 120.
  

## **Step 7: Export and Submit Your Work**

1. **Export the Database Script**

   - In pgAdmin, select your database (`Gradebook`).
   - From the **Tools** menu, select **Backup**.
   - Choose **Plain** format.
   - Click on the Folder icon to the right of `Filename` so that you know where it will save the backup. You may change the location but make sure you know where that is at.
   - Name the file using your username, e.g., `gradebook_jdoe.sql`.

2. **Submit Your Work**

   - Upload the exported `.sql` file to Blackboard under the appropriate assignment section.
   - If unsuccessful, submit screenshots of error messages for partial credit.

---

## **Grading Criteria**

| Criteria                                                         | Points  |
| ---------------------------------------------------------------- | ------- |
| PostgreSQL installed and Gradebook database created successfully | 20      |
| `STUDENTS` and `ASSIGNMENTS` tables correctly created            | 20      |
| Student record inserted correctly                                | 20      |
| Assignment record inserted correctly                             | 20      |
| Database script file submitted correctly                         | 20      |
| **Total**                                                        | **100** |

**Notes:**

- Ensure SQL commands are executed without errors.
- Follow naming conventions and formatting as provided.
- Debug errors by checking error messages and revisiting steps.

---

## **Congratulations!** 


✅ You have successfully created the `STUDENTS` and `ASSIGNMENTS` tables using the **SQL Query Tool**.  
✅ The `ASSIGNMENTS` table has a **foreign key** that links `STUDENT_ID` to the `STUDENTS` table.  
✅ You can now insert records into the tables or run queries.  

