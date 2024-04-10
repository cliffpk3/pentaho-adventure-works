<h2>1. Business Problem</h2>
A second Adventure Works dimensional modeling project, now using Pentaho as main ETL tool. Adventure Works is a fictional  provider of wholesale and retail products for hiking and adventure enthusiasts, is gearing up for an enhanced analytical approach. 
With a focus on creating a dimensional model, the company aims to analyze sales data efficiently. The objective is to derive valuable insights from historical data using **Pentaho** and **MySQL** for the ETL process and dimensional model creation.

<h2>2. Business Assumptions</h2>
The data used for the construction of the dimensional model is publicly available on the **Microsoft Website**:
https://learn.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-ver16&tabs=ssms

<h4>2.1 Technical Assumptions:</h4>
<h4>2.1.1 Non-essential columns with over 50% of null values will be disregarded.</h4>
<h4>2.1.2 Dimensions with less information (e.g., product categories and subcategories) will be grouped into a single dimension.</h4>

<h2>3. Solution Strategy</h2>
<h4>3.1 Download data from **Microsoft Website**;</h4>
<h4>3.2 Exploratory analysis of data and data dictionary;</h4>
<h4>3.3 Creation of Select Queries, Dimensions, and Fact;</h4>
<h4>3.4 Get Pentaho ready for connect with MySQL database;</h4>
<h4>3.5 Structure of Dimensional Model.</h4>
<h4>3.6 Creation of DDL and DML archives.</h4>
<img align="center" alt="4_2" src="https://raw.githubusercontent.com/cliffpk3/adventure-works/main/extra_files/dimensional_model.png"/>

<h2>4. Business Requirements</h2>
<h4>4.1 A **DataMart** must be delivered to support analyses of sales order data (**SalesOrder**);</h4> 
<h4>4.2 The granularity of the fact should be the smallest possible granularity available in the OLTP, where each row of the fact will represent a sales order with its details;</h4> 
<h4>4.3 The dimensions should be analyzed by the candidate, examining the available data from the OLTP and the ER model;</h4> 
<h4>4.4 The dimensions must comply with **Type 1** slowly changing dimensions (SCD);</h4> 
<h4>4.5 Data extraction from the OLTP must follow the **OrderDate** (Order Date);</h4> 

<h2>5. Business Insights</h2> 
<h4>5.1 A data or proccess revision may be necessary for further analysis</h4>
There are many columns that could contribute to the product specification but contain numerous null values, making analyses on these features impractical. It would be advisable to improve the standardization in product registration or consider re-registering some products to ensure that the characteristics align with the analyses.
<h4>5.2 There are some data missing on AdventureWorks2019 database</h4>
The table **Store.BusinessEntity**, as described in the data dictionary, does not exist in the database sample. Additionally, the connection between the **Person.BusinessEntity** table (BusinessEntityID) and the **Sales.Store** table (StoreID) is irregular, thus resulting in misaligned data. The joining of tables was achieved through the **PERSON.BUSINESSENTITY**, **PERSON.PERSON**, and **SALES.STORE** tables.

<h2>6. Conclusion</h2>
A satisfactory dimensional model has been successfully structured using Pentaho and MySQL, enabling detailed analysis of various relevant characteristics within a sales analysis context. The **Business Intelligence** model provides efficient support for the business team.
