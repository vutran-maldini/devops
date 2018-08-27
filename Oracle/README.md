<h1>The DUAL Table<h1>
DUAL is a table automatically created by Oracle Database along with the data dictionary. DUAL is in the schema of the user SYS but is accessible by the name DUAL to all users. It has one column, DUMMY, defined to be VARCHAR2(1), and contains one row with a value X. Selecting from the DUAL table is useful for computing a constant expression with the SELECT statement. Because DUAL has only one row, the constant is returned only once. Alternatively, you can select a constant, pseudocolumn, or expression from any table, but the value will be returned as many times as there are rows in the table. Please refer to "SQL Functions" for many examples of selecting a constant value from DUAL.
https://docs.oracle.com/cd/B19306_01/server.102/b14200/queries009.htm

<h1>USERENV</h1>
https://docs.oracle.com/cd/B19306_01/server.102/b14200/functions208.htm

<h1>NVL</h1>
https://docs.oracle.com/cd/B19306_01/server.102/b14200/functions105.htm