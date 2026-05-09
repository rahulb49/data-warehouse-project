/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files. 
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from csv Files to bronze tables.

Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;
===============================================================================
*/


create or alter procedure bronze.load_bronze AS
BEGIN



	Truncate Table bronze.crm_cust_info; 

	bulk insert bronze.crm_cust_info 
	from 'C:\Users\Asus TUF F15\Downloads\dbc9660c89a3480fa5eb9bae464d6c07 (1)\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
	with (
		Firstrow = 2,
		Fieldterminator = ',',
		tablock
	);

	Select count(*) from bronze.crm_cust_info

	-------------------------------------------------
	Truncate Table bronze.crm_prd_info; 
	Bulk insert bronze.crm_prd_info
	from 'C:\Users\Asus TUF F15\Downloads\dbc9660c89a3480fa5eb9bae464d6c07 (1)\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
	with (
		Firstrow = 2,
		Fieldterminator = ',',
		tablock
	);

	Select count(*) from bronze.crm_prd_info;
	---------------------------------------------------
	Truncate Table bronze.crm_sales_details; 
	BULK INSERT bronze.crm_sales_details
			FROM 'C:\Users\Asus TUF F15\Downloads\dbc9660c89a3480fa5eb9bae464d6c07 (1)\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
			WITH (
				FIRSTROW = 2,
				FIELDTERMINATOR = ',',
				TABLOCK
			);
	Select count(*) from bronze.crm_sales_details;
	---------------------------------------------

	Truncate Table bronze.erp_loc_a101; 
	BULK INSERT bronze.erp_loc_a101
			FROM 'C:\Users\Asus TUF F15\Downloads\Project\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
			WITH (
				FIRSTROW = 2,
				FIELDTERMINATOR = ',',
				TABLOCK
			);
	Select count(*) from bronze.erp_loc_a101;
	-------------------------------------------------
	Truncate Table bronze.erp_cust_az12; 
	BULK INSERT bronze.erp_cust_az12
			FROM 'C:\Users\Asus TUF F15\Downloads\Project\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
			WITH (
				FIRSTROW = 2,
				FIELDTERMINATOR = ',',
				TABLOCK
			);

	Select count(*) from bronze.erp_cust_az12;
	-----------------------------------------------------
	Truncate Table bronze.erp_px_cat_g1v2; 
	BULK INSERT bronze.erp_px_cat_g1v2
			FROM 'C:\Users\Asus TUF F15\Downloads\Project\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
			WITH (
				FIRSTROW = 2,
				FIELDTERMINATOR = ',',
				TABLOCK
			);
	Select count(*) from bronze.erp_px_cat_g1v2;
end