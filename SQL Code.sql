USE [master]
GO
 
CREATE DATABASE [LCS_DB]
GO
 
USE [LCS_DB]
GO
 
CREATE TABLE [dbo].[Branch](
    [branch_id] [NUMERIC](10, 0) IDENTITY(1,1) NOT NULL,
    [zip] [VARCHAR](6) NOT NULL,
    [city] [VARCHAR](25) NULL,
    [state] [VARCHAR](10) NULL,
    [country] [VARCHAR](60) NULL,
    [name] [VARCHAR](50) NOT NULL,
	[tax_code] [VARCHAR](50) NULL,
    
 CONSTRAINT [PK_Branch] PRIMARY KEY CLUSTERED 
(
    [branch_id] ASC
),
 CONSTRAINT [AK_zip] UNIQUE NONCLUSTERED 
(
    [zip] ASC
)
) ON [PRIMARY]
GO
 
CREATE TABLE [dbo].[Branch_Department](
    [branch_id] [NUMERIC](10, 0) NOT NULL,
    [department_id] [NUMERIC](10, 0) NOT NULL,
    [employee_id] [NUMERIC](10, 0) NOT NULL,
    [STATUS] [VARCHAR](10) NOT NULL,
    [remarks] [VARCHAR](100) NULL,
 CONSTRAINT [PK_Branch_Department] PRIMARY KEY CLUSTERED 
(
    [branch_id] ASC,
    [department_id] ASC,
    [employee_id] ASC
),
 CONSTRAINT [UK_emp_dep] UNIQUE NONCLUSTERED 
(
    [department_id] ASC,
    [employee_id] ASC
)
) ON [PRIMARY]
GO
 
CREATE TABLE [dbo].[Client](
    [client_id] [NUMERIC](10, 0) IDENTITY(1,1) NOT NULL,
    [client_name] [VARCHAR](25) NOT NULL,
    [client_mobile_number] [VARCHAR](10) NOT NULL,
    [client_email_address] [VARCHAR](25) NOT NULL,
    [client_address] [VARCHAR](150) NOT NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
    [client_id] ASC
)
) ON [PRIMARY]
GO
 
CREATE TABLE [dbo].[Department](
    [dept_id] [NUMERIC](10, 0) IDENTITY(1,1) NOT NULL,
    [dept_name] [VARCHAR](25) NOT NULL,
    [dept_description] [VARCHAR](100) NULL,
    [dept_contact_number] [VARCHAR](25) NOT NULL,
    [dept_email_id] [VARCHAR](25) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
    [dept_id] ASC
)
) ON [PRIMARY]
GO
 
CREATE TABLE [dbo].[Employee](
    [employee_id] [NUMERIC](10, 0) IDENTITY(1,1) NOT NULL,
    [first_name] [VARCHAR](25) NOT NULL,
    [middle_name] [VARCHAR](25) NULL,
    [last_name] [VARCHAR](25) NOT NULL,
    [date_of_birth] [DATE] NOT NULL,
    [contact_number] [VARCHAR](10) NOT NULL,
    [email_address] [VARCHAR](25) NOT NULL,
    [hire_date] [DATE] NOT NULL,
    [sin] [NUMERIC](15, 0) NOT NULL,
    [supervisor_id] [NUMERIC](10, 0) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
    [employee_id] ASC
),
 CONSTRAINT [AK_sin] UNIQUE NONCLUSTERED 
(
    [sin] ASC
)
) ON [PRIMARY]
GO
 
CREATE TABLE [dbo].[Employee_Project](
    [employee_id] [NUMERIC](10, 0) NOT NULL,
    [project_id] [NUMERIC](10, 0) NOT NULL,
    [hours_allocated] [DECIMAL](10, 2) NULL,
    [start_date] [DATE] NOT NULL,
    [end_date] [DATE] NULL,
 CONSTRAINT [PK_Employee_Project] PRIMARY KEY CLUSTERED 
(
    [employee_id] ASC,
    [project_id] ASC
)
) ON [PRIMARY]
GO
 
CREATE TABLE [dbo].[Invoice](
    [invoice_id] [NUMERIC](10, 0) IDENTITY(1,1) NOT NULL,
    [branch_id] [NUMERIC](10, 0) NOT NULL,
    [invoice_date] [DATE] NOT NULL,
    [invoice_type] [VARCHAR](150) NOT NULL,
    [terms_conditions] [VARCHAR](150) NOT NULL,
    CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
    [invoice_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
 
CREATE TABLE [dbo].[Job](
    [job_id] [NUMERIC](10, 0) IDENTITY(1,1) NOT NULL,
    [job_title] [VARCHAR](50) NOT NULL,
    [job_description] [VARCHAR](100) NOT NULL,
    [min_salary] [DECIMAL](10, 2) NULL,
    [max_salary] [DECIMAL](10, 2) NULL,
 CONSTRAINT [PK_Job] PRIMARY KEY CLUSTERED 
(
    [job_id] ASC
),
 CONSTRAINT [AK_job_title] UNIQUE NONCLUSTERED 
(
    [job_title] ASC
)
) ON [PRIMARY]
GO
 
CREATE TABLE [dbo].[Job_History](
    [employee_id] [NUMERIC](10, 0) NOT NULL,
    [start_date] [DATE] NOT NULL,
    [salary] [DECIMAL](10, 2) NOT NULL,
    [end_date] [DATE] NULL,
    [position_id] [NUMERIC](10, 0) NOT NULL,
 CONSTRAINT [PK_Job_History] PRIMARY KEY CLUSTERED 
(
    [employee_id] ASC,
    [start_date] ASC
)
) ON [PRIMARY]
GO
 
CREATE TABLE [dbo].[Payment](
    [payment_id] [NUMERIC](10, 0) IDENTITY(1,1) NOT NULL,
    [payment_amount] [DECIMAL](10, 2) NOT NULL,
    [payment_type] [VARCHAR](20) NOT NULL,
    [payment_date] [DATE] NULL,
    [payment_status] [VARCHAR](10) NOT NULL,
    [project_id] [NUMERIC](10, 0) NOT NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
    [payment_id] ASC
),
 CONSTRAINT [AK_project_id] UNIQUE NONCLUSTERED 
(
    [project_id] ASC
)
) ON [PRIMARY]
GO
 
CREATE TABLE [dbo].[POSITION](
    [employee_id] [NUMERIC](10, 0) NOT NULL,
    [position_id] [NUMERIC](10, 0) NOT NULL,
    [start_date] [DATE] NOT NULL,
    [end_date] [DATE] NULL,
    [remarks] [VARCHAR](100) NULL,
 CONSTRAINT [PK_Employee_Position] PRIMARY KEY CLUSTERED 
(
    [employee_id] ASC,
    [position_id] ASC
)
) ON [PRIMARY]
GO
 
CREATE TABLE [dbo].[Product](
    [product_id] [NUMERIC](10, 0) IDENTITY(1,1) NOT NULL,
    [product_title] [VARCHAR](30) NOT NULL,
    [product_description] [VARCHAR](150) NULL,
    [product_type] [VARCHAR](10) NULL,
    [product_specification] [VARCHAR](100) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
    [product_id] ASC
),
 CONSTRAINT [AK_product_title] UNIQUE NONCLUSTERED 
(
    [product_title] ASC
)
) ON [PRIMARY]
GO
 
CREATE TABLE [dbo].[Orders](
    [product_id] [NUMERIC](10, 0) NOT NULL,
    [project_id] [NUMERIC](10, 0) NOT NULL,
    [price] [DECIMAL](10, 2) NOT NULL,
    [discount] [DECIMAL](10, 2) NULL,
    [feedback] [VARCHAR](50) NULL,
    [invoice_id] [NUMERIC](10, 0) NULL
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
    [product_id] ASC,
    [project_id] ASC
)
) ON [PRIMARY]
GO
 
CREATE TABLE [dbo].[Project](
    [project_id] [NUMERIC](10, 0) IDENTITY(1,1) NOT NULL,
    [project_name] [VARCHAR](25) NOT NULL,
    [project_status] [VARCHAR](10) NOT NULL,
    [start_date] [DATE] NOT NULL,
    [end_date] [DATE] NULL,
    [client_id] [NUMERIC](10, 0) NOT NULL,
 CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED 
(
    [project_id] ASC
)
) ON [PRIMARY]
GO
 
ALTER TABLE [dbo].[Employee_Project] ADD  CONSTRAINT [DF_Employee_Project_hours_allocated]  DEFAULT ((0.00)) FOR [hours_allocated]
GO
 
ALTER TABLE [dbo].[Job] ADD  CONSTRAINT [DF_Job_min_salary]  DEFAULT ((0.00)) FOR [min_salary]
GO
 
ALTER TABLE [dbo].[Job_History] ADD  CONSTRAINT [DF_Job_History_salary]  DEFAULT ((2500.00)) FOR [salary]
GO
 
ALTER TABLE [dbo].[Payment] ADD  CONSTRAINT [DF_Payment_payment_amount]  DEFAULT ((1000.00)) FOR [payment_amount]
GO
 
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_price]  DEFAULT ((0.00)) FOR [price]
GO
 
ALTER TABLE [dbo].[Branch_Department]  WITH CHECK ADD  CONSTRAINT [FK_Branch_Department_Branch] FOREIGN KEY([branch_id])
REFERENCES [dbo].[Branch] ([branch_id])
GO
 
ALTER TABLE [dbo].[Branch_Department] CHECK CONSTRAINT [FK_Branch_Department_Branch]
GO
 
ALTER TABLE [dbo].[Branch_Department]  WITH CHECK ADD  CONSTRAINT [FK_Branch_Department_Department] FOREIGN KEY([department_id])
REFERENCES [dbo].[Department] ([dept_id])
GO
 
ALTER TABLE [dbo].[Branch_Department] CHECK CONSTRAINT [FK_Branch_Department_Department]
GO
 
ALTER TABLE [dbo].[Branch_Department]  WITH CHECK ADD  CONSTRAINT [FK_Branch_Department_Employee] FOREIGN KEY([employee_id])
REFERENCES [dbo].[Employee] ([employee_id])
GO
 
ALTER TABLE [dbo].[Branch_Department] CHECK CONSTRAINT [FK_Branch_Department_Employee]
GO
 
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Employee] FOREIGN KEY([supervisor_id])
REFERENCES [dbo].[Employee] ([employee_id])
GO
 
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Employee]
GO
 
ALTER TABLE [dbo].[Employee_Project]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Project_Employee] FOREIGN KEY([employee_id])
REFERENCES [dbo].[Employee] ([employee_id])
GO
 
ALTER TABLE [dbo].[Employee_Project] CHECK CONSTRAINT [FK_Employee_Project_Employee]
GO
 
ALTER TABLE [dbo].[Employee_Project]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Project_Project] FOREIGN KEY([project_id])
REFERENCES [dbo].[Project] ([project_id])
GO
 
ALTER TABLE [dbo].[Employee_Project] CHECK CONSTRAINT [FK_Employee_Project_Project]
GO
 
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Branch] FOREIGN KEY([branch_id])
REFERENCES [dbo].[Branch] ([branch_id])
GO
 
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Branch]
GO
 
ALTER TABLE [dbo].[Job_History]  WITH CHECK ADD  CONSTRAINT [FK_Job_History_Employee] FOREIGN KEY([employee_id])
REFERENCES [dbo].[Employee] ([employee_id])
GO
 
ALTER TABLE [dbo].[Job_History] CHECK CONSTRAINT [FK_Job_History_Employee]
GO
 
ALTER TABLE [dbo].[Job_History]  WITH CHECK ADD  CONSTRAINT [FK_Job_History_Job] FOREIGN KEY([position_id])
REFERENCES [dbo].[Job] ([job_id])
GO
 
ALTER TABLE [dbo].[Job_History] CHECK CONSTRAINT [FK_Job_History_Job]
GO
 
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Project] FOREIGN KEY([project_id])
REFERENCES [dbo].[Project] ([project_id])
GO
 
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_Project]
GO
 
ALTER TABLE [dbo].[POSITION]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Position_Employee] FOREIGN KEY([employee_id])
REFERENCES [dbo].[Employee] ([employee_id])
GO
 
ALTER TABLE [dbo].[POSITION] CHECK CONSTRAINT [FK_Employee_Position_Employee]
GO
 
ALTER TABLE [dbo].[POSITION]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Position_Job] FOREIGN KEY([position_id])
REFERENCES [dbo].[Job] ([job_id])
GO
 
ALTER TABLE [dbo].[POSITION] CHECK CONSTRAINT [FK_Employee_Position_Job]
GO
 
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Invoice] FOREIGN KEY([invoice_id])
REFERENCES [dbo].[Invoice] ([invoice_id])
GO
 
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Invoice]
GO
 
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
 
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Product]
GO
 
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Project] FOREIGN KEY([project_id])
REFERENCES [dbo].[Project] ([project_id])
GO
 
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Project]
GO
 
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [Client_CK_email_address] CHECK  (([client_email_address] LIKE '%_@__%.__%'))
GO
 
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [Client_CK_email_address]
GO
 
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [Client_CK_Mobile_Number] CHECK  ((NOT [client_mobile_number] LIKE '%[^0-9]%'))
GO
 
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [Client_CK_Mobile_Number]
GO
 
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [Department_CK_contact_number] CHECK  ((NOT [dept_contact_number] LIKE '%[^0-9]%'))
GO
 
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [Department_CK_contact_number]
GO
 
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [Department_CK_email_id] CHECK  (([dept_email_id] LIKE '%_@__%.__%'))
GO
 
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [Department_CK_email_id]
GO
 
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [Employee_CK_contact_number] CHECK  ((NOT [contact_number] LIKE '%[^0-9]%'))
GO
 
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [Employee_CK_contact_number]
GO
 
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [Employee_CK_email_address] CHECK  (([email_address] LIKE '%_@__%.__%'))
GO
 
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [Employee_CK_email_address]
GO
 
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [Employee_CK_hire_date] CHECK  (([hire_date]>[date_of_birth]))
GO
 
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [Employee_CK_hire_date]
GO
 
ALTER TABLE [dbo].[Employee_Project]  WITH CHECK ADD  CONSTRAINT [Employee_Project_CK_start_date] CHECK  (([start_date]<=[end_date]))
GO
 
ALTER TABLE [dbo].[Employee_Project] CHECK CONSTRAINT [Employee_Project_CK_start_date]
GO
 
ALTER TABLE [dbo].[Employee_Project]  WITH CHECK ADD  CONSTRAINT [Employee_ProjectCK_hours_allocated] CHECK  (([hours_allocated]<=(8.00)))
GO
 
ALTER TABLE [dbo].[Employee_Project] CHECK CONSTRAINT [Employee_ProjectCK_hours_allocated]
GO
 
ALTER TABLE [dbo].[Job]  WITH CHECK ADD  CONSTRAINT [Job_CK_min_salary] CHECK  (([min_salary]<=[max_salary]))
GO
 
ALTER TABLE [dbo].[Job] CHECK CONSTRAINT [Job_CK_min_salary]
GO
 
ALTER TABLE [dbo].[Job_History]  WITH CHECK ADD  CONSTRAINT [Job_History_CK_start_date] CHECK  (([start_date]<=[end_date]))
GO
 
ALTER TABLE [dbo].[Job_History] CHECK CONSTRAINT [Job_History_CK_start_date]
GO
 
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [Payment_CK_payment_amount] CHECK  (([payment_amount]>=(1000)))
GO
 
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [Payment_CK_payment_amount]
GO
 
ALTER TABLE [dbo].[POSITION]  WITH CHECK ADD  CONSTRAINT [Employee_Position_CK_start_date] CHECK  (([start_date]<=[end_date]))
GO
 
ALTER TABLE [dbo].[POSITION] CHECK CONSTRAINT [Employee_Position_CK_start_date]
GO
 
ALTER TABLE [dbo].[Project]  WITH CHECK ADD  CONSTRAINT [CK_start_date] CHECK  (([start_date]<=[end_date]))
GO
 
ALTER TABLE [dbo].[Project] CHECK CONSTRAINT [CK_start_date]
GO
 
USE [master]
GO
 
ALTER DATABASE [LCS_DB] SET  READ_WRITE 
GO

USE LCS_DB;
-- Insertion of Branch Data -- 
INSERT INTO BRANCH VALUES ('S9H3W4','Toronto','ON','Canada', 'LCS Company','552195155');
INSERT INTO BRANCH VALUES ('M1B0A1','Scarborough','ON','Canada', 'LCS Company','552195156');
INSERT INTO BRANCH VALUES ('G2Z9Z9','Quebec','ON','Canada', 'LCS Company','552195157');
INSERT INTO BRANCH VALUES ('L3P0A1','Markham','ON','Canada', 'LCS Company','552195158');
INSERT INTO BRANCH VALUES ('L2L2L2','Mississauga','ON','Canada', 'LCS Company','552195159');
 
-- Insertion of Department Data -- 
INSERT INTO DEPARTMENT VALUES ('Admin Department ','Maintains office services by organizing office operations and procedures','4174482839','admindepartment@lcs.com')
INSERT INTO DEPARTMENT VALUES ('Asset Management','Manages company assets','4174482840','assetmanagement@lcs.com')
INSERT INTO DEPARTMENT VALUES ('Board of Directors ','Establish the mission, goals and policies of the organization','4174482841','boardofdirectors@lcs.com')
INSERT INTO DEPARTMENT VALUES ('Customer Service ','The first person most customers communicate with when they have a problem','4174482842','customerservice@lcs.com')
INSERT INTO DEPARTMENT VALUES ('Finance / Accounting ','Conducts cost and revenues analyses','4174482843','financeaccounting@lcs.com')
INSERT INTO DEPARTMENT VALUES ('Human Resources ','Develop and manage a range of activities for a company.','4174482844','humanresources@lcs.com')
INSERT INTO DEPARTMENT VALUES ('Operations ','Oversee operational activities at every level of an organization','4174482845','operations@lcs.com')
INSERT INTO DEPARTMENT VALUES ('Quality Assurance ','Responsible for monitoring, inspecting and proposing measures to correct','4174482846','qualityassurance@lcs.com')
INSERT INTO DEPARTMENT VALUES ('Sales and Marketing ','Demonstrates products and services as deemed necessary by clients and management.','4174482847','salesandmarketing@lcs.com')
INSERT INTO DEPARTMENT VALUES ('Technology ','Responsible for developing codes and architecture designs for the respective clients','4174482848','technology@lcs.com')
 
-- Insertion of JOB Data --
INSERT INTO JOB VALUES ('Chief Executive Officer' ,'Responsible for managing a company''s overall operations', 250, 300)
INSERT INTO JOB VALUES ('HR Manager' , 'Lead and direct the routine functions of the Human Resources (HR) department',60, 75)
INSERT INTO JOB VALUES ('HR Analyst' , 'Collects, compile, and analyze HR data', 45, 55)
INSERT INTO JOB VALUES ('Finance Manager' , 'Distributes the financial resources of a company', 60, 75)
INSERT INTO JOB VALUES ('Finance Analyst', 'Analyzes current and past financial data and performance', 45, 55)
INSERT INTO JOB VALUES ('Team Lead' , 'Provides guidance and instruction to a working group about a project or portfolio of projects', 70, 80)
INSERT INTO JOB VALUES ('Solutions Architect' , 'Solves complex problems in an organization by designing or modifying technology architecture', 55, 60)
INSERT INTO JOB VALUES ('Software Developer' , 'Designs and builds computer programs', 30, 35)
INSERT INTO JOB VALUES ('Senior Developer' , 'Designs and implements new and updated software programs. Guides other developers in the team', 48, 53)
INSERT INTO JOB VALUES ('QA Automation Tester' , 'Write scripts and create automation environments for repeated tests', 48, 53)
INSERT INTO JOB VALUES ('QA Manual Tester' , 'Manual testing of new software in both the pre-and post-release stage of the development lifecycle', 30, 35)
INSERT INTO JOB VALUES ('IT' , 'Managing and storing data using computers, software, databases, networks, and servers', 30, 35)
INSERT INTO JOB VALUES ('System Administrator' , 'Organize, install and support an organization''s computer systems', 45, 50)
INSERT INTO JOB VALUES ('Customer Service Associate' , 'Manages customer concerns', 35, 45)
INSERT INTO JOB VALUES ('Customer Service Analyst' , 'Responsible for gathering data and doing research', 45, 50)
 
-- Insertion of Employee Data --
INSERT INTO EMPLOYEE VALUES ('Jaiden','Mark','Abbott  ','10/09/1997','2048211896','jaiden.abott@lcs.com','08/13/2018',463612515,NULL);
INSERT INTO EMPLOYEE VALUES (' Zackary',NULL,'Archer  ','09/06/1998','2042343348','zackary.archer@lcs.com','12/23/2021',958792376,1);
INSERT INTO EMPLOYEE VALUES ('Jessie',NULL,'Avila ','11/15/1987','7052295233','jessie.avila@lcs.com','02/19/2018',645885971,2);
INSERT INTO EMPLOYEE VALUES ('Royce','Curt','Beasley ','01/09/1991','8194347708','royce.beott@lcs.com','08/15/2018',524196409,1);
INSERT INTO EMPLOYEE VALUES ('Rowan','Claire','Beasley ','10/11/1991','3066092070','rowan.beott@lcs.com','09/03/2022',383970480,2);
INSERT INTO EMPLOYEE VALUES ('Annalise','Anne','Benitez ','10/09/1991','7809966759','annalise.beott@lcs.com','05/18/2021',662672401,5);
INSERT INTO EMPLOYEE VALUES ('Kristin',NULL,'Conner ','05/23/1976','5142158844','kristin.conner@lcs.com','02/01/2018',738740703,5);
INSERT INTO EMPLOYEE VALUES ('Madden ','Claire','Conrad','10/09/1976','5875907459','madden.coott@lcs.com','06/13/2019',989320767,5);
INSERT INTO EMPLOYEE VALUES ('Carleigh',NULL,'Durham ','10/09/1997','4185324945','carleigh.durham@lcs.com','04/20/2018',198059396,5);
INSERT INTO EMPLOYEE VALUES ('Azaria',NULL,'Golden ','10/09/1976','2044718557','azaria.golden@lcs.com','02/22/2018',205241854,5);
INSERT INTO EMPLOYEE VALUES ('Charlize',NULL,'Hubbard ','12/11/1995','2262218316','charlize.hubbard@lcs.com','11/30/2019',365857390,2);
INSERT INTO EMPLOYEE VALUES ('Beckett','Mae','Horn ','10/09/1988','2507988447','beckett.hoott@lcs.com','12/09/2018',641244223,11);
INSERT INTO EMPLOYEE VALUES ('Emery',NULL,'Suarez ','12/09/1988','4035462534','emery.suarez@lcs.com','06/12/2021',944999515,5);
INSERT INTO EMPLOYEE VALUES ('Ansley',NULL,'Valentine ','10/09/1990','8673742851','ansley.valentine@lcs.com','08/02/2019',673984761,2);
INSERT INTO EMPLOYEE VALUES ('Ell',NULL,'Malone ','10/25/1997','7805974968','ell.malone@lcs.com','03/16/2020',415302850,2);
INSERT INTO EMPLOYEE VALUES ('Reynaldo',NULL,'Jordan ','10/09/1995','9025661047','reynaldo.jordan@lcs.com','08/10/2019',431102946,15);
INSERT INTO EMPLOYEE VALUES ('Jamal',NULL,'Mcknight ','08/26/1999','5817048259','jamal.mcknight@lcs.com','06/09/2022',906348131,14);
INSERT INTO EMPLOYEE VALUES ('Adriel',NULL,'Park ','04/28/1997','4039399761','adriel.park@lcs.com','12/11/2018',640320214,14);
INSERT INTO EMPLOYEE VALUES ('Dalia',NULL,'Paul ','10/09/1988','7803722289','dalia.paul@lcs.com','11/01/2019',447989781,14);
INSERT INTO EMPLOYEE VALUES ('Johanna',NULL,'Rich ','06/11/1995','4162677795','johanna.rich@lcs.com','06/24/2021',479532962,14);
INSERT INTO EMPLOYEE VALUES ('Lark','Eldon','Travis','11/17/1992','9053252915','lark.travis@lcs.com','11/26/2018',733257091,2);
INSERT INTO EMPLOYEE VALUES ('Alaia','Wiley','Thorne','10/07/1987','2892141179','alaia.thorne@lcs.com','08/15/2018',566142436,21);
INSERT INTO EMPLOYEE VALUES ('Justice','Kathryn','Rivers','08/14/1979','9054617674','justice.rivers@lcs.com','09/04/2019',213985112,21);
INSERT INTO EMPLOYEE VALUES ('Chester','Ollie','Parris','08/07/1978','4505721042','chester.parris@lcs.com','07/08/2019',193290293,21);
INSERT INTO EMPLOYEE VALUES ('Irma',NULL,'Carver','07/10/1986','6043538923','irma.carver@lcs.com','06/07/2018',377381280,21);
INSERT INTO EMPLOYEE VALUES ('Luvenia','Lenora','Alfredson','07/16/1983','4186266452','luvenia.alfredso@lcs.com','08/03/2019',483150363,21);
INSERT INTO EMPLOYEE VALUES ('Webster',NULL,'Marylyn','07/12/1998','5875372061','webster.marylyn@lcs.com','01/11/2018',679548198,2);
INSERT INTO EMPLOYEE VALUES ('Kennard','Gale','Morin','07/22/1991','5814236520','Kennard.Gale@lcs.com','02/01/2019',139424865,27);
INSERT INTO EMPLOYEE VALUES ('Bertie','Nevaeh','Walter','12/14/1990','5143468513','Bertie.Nevaeh@lcs.com','02/13/2019',686733916,27);
INSERT INTO EMPLOYEE VALUES ('Milton','Jean','Kersey','07/12/1994','4032751194','Milton.Jean@lcs.com','03/04/2019',391874963,27);
INSERT INTO EMPLOYEE VALUES ('Ross','Rosalie','Booth','06/01/1994','4502496319','Ross.Rosalie@lcs.com','03/08/2019',597028661,27);
INSERT INTO EMPLOYEE VALUES ('Serenity','Jaslyn','Monk','12/17/1996','4189474245','Serenity.Jaslyn@lcs.com','03/22/2019',145158648,27);
INSERT INTO EMPLOYEE VALUES ('Raelene','Wynne','Parrish','06/28/1992','5197451073','Raelene.Wynne@lcs.com','04/04/2019',227133204,27);
INSERT INTO EMPLOYEE VALUES ('Jazmin','Ariel','Morrish','11/18/1994','7783509914','Jazmin.Ariel@lcs.com','05/02/2019',530033976,27);
INSERT INTO EMPLOYEE VALUES ('Carlyle','Whitney','Sweet','09/27/1994','2047844610','Carlyle.Whitney@lcs.com','05/03/2019',396052789,27);
INSERT INTO EMPLOYEE VALUES ('Zane','Carina','Milford','03/27/1994','7806906461','Zane.Carina@lcs.com','05/30/2019',347315111,27);
INSERT INTO EMPLOYEE VALUES ('Piety','Mervyn','Pryor','12/26/1996','4185449742','Piety.Mervyn@lcs.com','06/07/2019',485669402,27);
INSERT INTO EMPLOYEE VALUES ('Johnie','Clanc','Little','09/01/1991','7804153589','Johnie.Clanc@lcs.com','07/16/2019',715480778,27);
INSERT INTO EMPLOYEE VALUES ('Kailyn','Krystelle','Samuel','01/30/1990','2042626604','Kailyn.Krystelle@lcs.com','08/21/2019',346550585,27);
INSERT INTO EMPLOYEE VALUES ('Gunner','Honey','Tate','02/27/1991','4165136380','Gunner.Honey@lcs.com','09/02/2019',996799193,27);
INSERT INTO EMPLOYEE VALUES ('Sefton','Royale','Snell','10/06/1998','4162149418','Sefton.Royale@lcs.com','09/23/2019',744747635,27);
INSERT INTO EMPLOYEE VALUES ('Chantell','Tel','Mercer','11/30/1999','4502913134','Chantell.Tel@lcs.com','10/07/2019',926251687,27);
 
-- Insertion of Branch Department Data --
INSERT INTO BRANCH_DEPARTMENT VALUES (1, 3,1,'Onboarded', 'Employee is currently onboarded in this branch and department');
INSERT INTO BRANCH_DEPARTMENT VALUES (1, 6,2,'Onboarded', 'Employee is currently onboarded in this branch and department');
INSERT INTO BRANCH_DEPARTMENT VALUES (1, 6,3,'Onboarded', 'Employee is currently onboarded in this branch and department');
INSERT INTO BRANCH_DEPARTMENT VALUES (1, 5,4,'Onboarded', 'Employee is currently onboarded in this branch and department');
INSERT INTO BRANCH_DEPARTMENT VALUES (2, 10,5,'Onboarded', 'Employee is currently onboarded in this branch and department');
INSERT INTO BRANCH_DEPARTMENT VALUES (2, 10,6,'Onboarded', 'Employee is currently onboarded in this branch and department');
INSERT INTO BRANCH_DEPARTMENT VALUES (2, 10,7,'Onboarded', 'Employee is currently onboarded in this branch and department');
INSERT INTO BRANCH_DEPARTMENT VALUES (2, 10,8,'Onboarded', 'Employee is currently onboarded in this branch and department');
INSERT INTO BRANCH_DEPARTMENT VALUES (1, 8,9,'Onboarded', 'Employee is currently onboarded in this branch and department');
INSERT INTO BRANCH_DEPARTMENT VALUES (3, 8,10,'Onboarded', 'Employee is currently onboarded in this branch and department');
INSERT INTO BRANCH_DEPARTMENT VALUES (3, 2,11,'Onboarded', 'Employee is currently onboarded in this branch and department');
INSERT INTO BRANCH_DEPARTMENT VALUES (3, 2,12,'Onboarded', 'Employee is currently onboarded in this branch and department');
INSERT INTO BRANCH_DEPARTMENT VALUES (1, 10,13,'Onboarded', 'Employee is currently onboarded in this branch and department');
INSERT INTO BRANCH_DEPARTMENT VALUES (2, 10,14,'Onboarded', 'Employee is currently onboarded in this branch and department');
INSERT INTO BRANCH_DEPARTMENT VALUES (3, 4,15,'Onboarded', 'Employee is currently onboarded in this branch and department');
INSERT INTO BRANCH_DEPARTMENT VALUES (3, 4,16,'Onboarded', 'Employee is currently onboarded in this branch and department');
INSERT INTO BRANCH_DEPARTMENT VALUES (2, 10,17,'Onboarded', 'Employee is currently onboarded in this branch and department');
INSERT INTO BRANCH_DEPARTMENT VALUES (2, 8,18,'Onboarded', 'Employee is currently onboarded in this branch and department');
INSERT INTO BRANCH_DEPARTMENT VALUES (1, 10,19,'Offboarded', 'Employee is all cleared out');
INSERT INTO BRANCH_DEPARTMENT VALUES (1, 10,20,'Offboarded', 'Employee is all cleared out');
INSERT INTO BRANCH_DEPARTMENT VALUES (1, 10,21,'Onboarded', 'Employee is currently onboarded in this branch and department');
INSERT INTO BRANCH_DEPARTMENT VALUES (1, 10,22,'Onboarded', 'Employee is currently onboarded in this branch and department');
INSERT INTO BRANCH_DEPARTMENT VALUES (1, 10,23,'Onboarded', 'Employee is currently onboarded in this branch and department');
INSERT INTO BRANCH_DEPARTMENT VALUES (2, 10,24,'Onboarded', 'Employee is currently onboarded in this branch and department');
INSERT INTO BRANCH_DEPARTMENT VALUES (1, 8,25,'Onboarded', 'Employee is currently onboarded in this branch and department');
INSERT INTO BRANCH_DEPARTMENT VALUES (2, 8,26,'Onboarded', 'Employee is currently onboarded in this branch and department');
INSERT INTO BRANCH_DEPARTMENT VALUES (1, 10,27,'Onboarded', 'Employee is currently onboarded in this branch and department');
INSERT INTO BRANCH_DEPARTMENT VALUES (4, 10,28,'Onboarded', 'Employee is currently onboarded in this branch and department');
INSERT INTO BRANCH_DEPARTMENT VALUES (4, 10,29,'Onboarded', 'Employee is currently onboarded in this branch and department');
INSERT INTO BRANCH_DEPARTMENT VALUES (4, 8,30,'Onboarded', 'Employee is currently onboarded in this branch and department');
INSERT INTO BRANCH_DEPARTMENT VALUES (4, 10,31,'Onboarded', 'Employee is currently onboarded in this branch and department');
INSERT INTO BRANCH_DEPARTMENT VALUES (4, 10,32,'Onboarded', 'Employee is currently onboarded in this branch and department');
INSERT INTO BRANCH_DEPARTMENT VALUES (4, 8,33,'Onboarded', 'Employee is currently onboarded in this branch and department');
INSERT INTO BRANCH_DEPARTMENT VALUES (5, 10,34,'Onboarded', 'Employee is currently onboarded in this branch and department');
INSERT INTO BRANCH_DEPARTMENT VALUES (5, 10,35,'Onboarded', 'Employee is currently onboarded in this branch and department');
INSERT INTO BRANCH_DEPARTMENT VALUES (5, 8,36,'Onboarded', 'Employee is currently onboarded in this branch and department');
INSERT INTO BRANCH_DEPARTMENT VALUES (5, 10,37,'Onboarded', 'Employee is currently onboarded in this branch and department');
INSERT INTO BRANCH_DEPARTMENT VALUES (5, 10,38,'Onboarded', 'Employee is currently onboarded in this branch and department');
INSERT INTO BRANCH_DEPARTMENT VALUES (5, 8,39,'Onboarded', 'Employee is currently onboarded in this branch and department');
INSERT INTO BRANCH_DEPARTMENT VALUES (5, 10,40,'Onboarded', 'Employee is currently onboarded in this branch and department');
INSERT INTO BRANCH_DEPARTMENT VALUES (5, 10,41,'Onboarded', 'Employee is currently onboarded in this branch and department');
INSERT INTO BRANCH_DEPARTMENT VALUES (5, 8,42,'Onboarded', 'Employee is currently onboarded in this branch and department');
 
 
-- Insertion of Employee Position Data --
INSERT INTO POSITION VALUES (1,1,'08/13/2018',NULL,'Full Time');
INSERT INTO POSITION VALUES (2,3,'12/23/2021',NULL,'Full Time');
INSERT INTO POSITION VALUES (2,2,'08/26/2022',NULL,'Full Time');
INSERT INTO POSITION VALUES (3,3,'02/19/2018',NULL,'Full Time');
INSERT INTO POSITION VALUES (4,4,'06/29/2022',NULL,'Full Time');
INSERT INTO POSITION VALUES (5,6,'08/15/2018',NULL,'Full Time');
INSERT INTO POSITION VALUES (6,7,'05/18/2021',NULL,'Full Time');
INSERT INTO POSITION VALUES (7,8,'01/02/2018',NULL,'Contract');
INSERT INTO POSITION VALUES (8,9,'06/13/2019',NULL,'Full Time');
INSERT INTO POSITION VALUES (9,10,'04/20/2018',NULL,'Full Time');
INSERT INTO POSITION VALUES (10,11,'02/22/2018',NULL,'Full Time');
INSERT INTO POSITION VALUES (12,12,'09/12/2018',NULL,'Full Time');
INSERT INTO POSITION VALUES (11,13,'11/30/2019',NULL,'Full Time');
INSERT INTO POSITION VALUES (16,14,'10/08/2019',NULL,'Full Time');
INSERT INTO POSITION VALUES (15,15,'03/16/2020',NULL,'Full Time');
INSERT INTO POSITION VALUES (17,8,'09/06/2022',NULL,'Contract');
INSERT INTO POSITION VALUES (13,8,'11/12/2018','10/09/2020','Contract');
INSERT INTO POSITION VALUES (19,8,'01/11/2019','03/11/2022','Contract');
INSERT INTO POSITION VALUES (20,8,'06/24/2021',NULL,'Contract');
INSERT INTO POSITION VALUES (13,11,'12/06/2021',NULL,'Full Time');
INSERT INTO POSITION VALUES (14,10,'02/08/2019',NULL,'Full Time');
INSERT INTO POSITION VALUES (14,6,'10/01/2021',NULL,'Full Time');
INSERT INTO POSITION VALUES (21,6,'08/15/2018',NULL,'Full Time');
INSERT INTO POSITION VALUES (22,9,'08/15/2018',NULL,'Full Time');
INSERT INTO POSITION VALUES (23,8,'09/04/2019',NULL,'Contract');
INSERT INTO POSITION VALUES (24,8,'07/08/2019',NULL,'Contract');
INSERT INTO POSITION VALUES (25,10,'06/07/2018',NULL,'Contract');
INSERT INTO POSITION VALUES (26,10,'08/03/2019',NULL,'Contract');
INSERT INTO POSITION VALUES (27,6,'01/11/2018',NULL,'Full Time');
INSERT INTO POSITION VALUES (28,7,'02/01/2019',NULL,'Full Time');
INSERT INTO POSITION VALUES (29,9,'02/13/2019',NULL,'Full Time');
INSERT INTO POSITION VALUES (30,10,'03/04/2019',NULL,'Full Time');
INSERT INTO POSITION VALUES (31,7,'03/08/2019',NULL,'Full Time');
INSERT INTO POSITION VALUES (32,9,'03/22/2019',NULL,'Full Time');
INSERT INTO POSITION VALUES (33,10,'04/04/2019',NULL,'Full Time');
INSERT INTO POSITION VALUES (34,7,'05/02/2019',NULL,'Full Time');
INSERT INTO POSITION VALUES (35,9,'05/03/2019',NULL,'Full Time');
INSERT INTO POSITION VALUES (36,10,'05/30/2019',NULL,'Full Time');
INSERT INTO POSITION VALUES (37,7,'06/07/2019',NULL,'Full Time');
INSERT INTO POSITION VALUES (38,9,'07/16/2019',NULL,'Full Time');
INSERT INTO POSITION VALUES (39,10,'08/21/2019',NULL,'Full Time');
INSERT INTO POSITION VALUES (40,7,'09/02/2019',NULL,'Full Time');
INSERT INTO POSITION VALUES (41,9,'09/23/2019',NULL,'Full Time');
INSERT INTO POSITION VALUES (42,10,'10/07/2019',NULL,'Full Time');
 
 
 
-- Insertion of Client Data --
INSERT INTO CLIENT VALUES ('Bell','8663102355','contactus@bell.ca','1383 Wilson Rd N #8')
INSERT INTO CLIENT VALUES ('Air Canada','8882472262','contactus@aircanada.ca','1273 Air Canada Centre')
INSERT INTO CLIENT VALUES ('People''s Group','8006630324','contactus@peoplesgroup.ca','95 Wellington St W Suite 1310, Toronto, ON M5J 2N7')
INSERT INTO CLIENT VALUES ('Tim Hortons','8886011616','contactus@timhortons.ca','4150 Tuller Road, Suite 236, Dublin')
INSERT INTO CLIENT VALUES ('President''s Choice','8662467262','contactus@pchoice.ca','500 Lake Shore Blvd W Suite 600 Toronto, ON')
INSERT INTO CLIENT VALUES ('Scotiabank ','4167017200','contactus@scotiabank.ca','44 King Street West, Scotia Plaza 8th Floor, Toronto, ON')
INSERT INTO CLIENT VALUES ('Hudson''s Bay Company ','8005212364','contactus@hbaycompany.ca','Brampton, 8925 Torbram Rd. HQ')
INSERT INTO CLIENT VALUES ('Walmart','8003280402','contactus@walmart.ca','1940 Argentia Rd, Mississauga, ON L5N 1P9, Canada')
INSERT INTO CLIENT VALUES ('Dollarama ','8883654266','contactus@dollarama.ca','5805 Royalmount Avenue Montreal, Quebec H4P 0A1')
INSERT INTO CLIENT VALUES ('Winners','8006469466','contactus@winners.ca',' 60 Standish Court Mississauga, ON L5R 0G1')
INSERT INTO CLIENT VALUES ('Canadian Tire','8003878803','contactus@canadiantire.ca','2180 Yonge Street, Toronto, ON M4P 2V8, Canada')
INSERT INTO CLIENT VALUES ('CTV 2','4163845000','contactus@ctv2.ca','33 Beacon Road Barrie, ON L4N 9J9')
INSERT INTO CLIENT VALUES ('Bath & Body Works','8886846412','contactus@b&bworks.ca',' 4875 Marc-Blain, Suite 201. Saint-Laurent, Québec. H4R 3B2')
INSERT INTO CLIENT VALUES ('Chipotle','8338600467','contactus@chipotle.ca','610 Newport Center Drive, Suite 1100. Newport Beach, CA 92660')
INSERT INTO CLIENT VALUES ('Circle K','8002685574','contactus@circlek.ca','7749 Kennedy Rd Markham, ON, L3R 0L7 Canada')
INSERT INTO CLIENT VALUES ('Shopify','8886463579','contactus@shopify.ca','150 Elgin Street 8th Floor Ottawa, ON K2P 1L4 Canada')
INSERT INTO CLIENT VALUES ('Amazon','8772235127','contactus@amazon.ca',' 410 Terry Ave N, Seattle 98109, WA')
INSERT INTO CLIENT VALUES ('Ali Express','5222155100','contactus@aliexpress.ca','Hangzhou Shi, 1818-2 Wenyi W Rd, Yuhang Qu')
INSERT INTO CLIENT VALUES ('Evernorth','8008532713','contactus@evernorth.ca',' Express Way Saint Louis, MO 63121')
INSERT INTO CLIENT VALUES ('Best Buy','8662378289','contactus@bestbuy.ca','7601 Penn Ave S. Richfield, MN 55423')
 
-- Insertion of Product Data --
INSERT INTO PRODUCT VALUES ('Application Services','Software solutions that improve the speed, security, and operability of applications','TECH','Agile Transformation');
INSERT INTO PRODUCT VALUES ('Artificial Intelligence','The simulation of human intelligence processes by machines','TECH','Solutions.AI, Data-led Transformation, Responsible AI');
INSERT INTO PRODUCT VALUES ('Automation','The use of software and systems to perform automated processes and tasks, replacing the manual work of IT professionals.','TECH','Handle tasks and processes, Quick responses , Improve workflow');
INSERT INTO PRODUCT VALUES ('Business Process Outsourcing','It is the delegation of one or more IT-intensive business processes','INNOV','Cost savings, Pricing, Resources and Technology');
INSERT INTO PRODUCT VALUES ('Business Strategy','An organizational master plan','INNOV','Current state section, Future state section, Strategic plan section, Executive summary');
INSERT INTO PRODUCT VALUES ('Change Management','Designed to minimize disruptions to IT services while making changes to critical systems and services','INNOV','Prepare the Organization for Change');
INSERT INTO PRODUCT VALUES ('Cloud','The ability to store and access data and programs over the internet instead of on a hard drive','TECH','On-demand self-service');
INSERT INTO PRODUCT VALUES ('Data & Analytics','The management of data for all uses (operational and analytical)','TECH','Data cleaning and preparation, Data analysis and exploration');
INSERT INTO PRODUCT VALUES ('Digital Commerce','The process of buying things online without human intervention','INNOV','Payment Systems, Mobile,Friendly Website and Storefront');
INSERT INTO PRODUCT VALUES ('Digital Engineering & Manuf','Technology-based approach to production that links different data silos','INNOV','Product life cycle, smart factory, value chain management');
INSERT INTO PRODUCT VALUES ('Ecosystem Services','Ecosystems provide many of the basic services that make life possible for people.','INNOV','Energy Flow, Water Cycle, Nutrient Cycle, Community Dynamics.');
INSERT INTO PRODUCT VALUES ('Finance Technology Consulting','Financial consultants provide internally-focused financial advice to corporations.','INNOV','Advise clients on a range of financial services and decisions');
INSERT INTO PRODUCT VALUES ('Infrastructure','System of hardware, software, facilities and service components that support the delivery of business systems and IT-enabled processes','TECH','Computing performance, Storage capacity');
INSERT INTO PRODUCT VALUES ('IT Security','Cyber Security is a set of techniques that are used to protect internet-connected systems','TECH','Authentication and password management');
INSERT INTO PRODUCT VALUES ('Game Development','Offers creation games of different genres','INNOV','Develop new games');
INSERT INTO PRODUCT VALUES ('Digital Marketing','Marketing is the activity, set of institutions, and processes for creating, communicating','CUST_EXP','Identify the Target Market, Benefits and Advantages of the Product');
INSERT INTO PRODUCT VALUES ('Metaverse ','A hypothetical iteration of the Internet as a single, universal and immersive virtual world','INNOV','Storage: SSD Only, Graphics Card: 4 GB graphic card, CPU: Min 3.5 GHz, File Size: 8 GB, 144 GHz');
INSERT INTO PRODUCT VALUES ('Supply Chain Management','Management of the flow of goods, data, and finances related to a product or service','INNOV','Monitoring and Planning');
INSERT INTO PRODUCT VALUES ('Sustainability','In the broadest sense, sustainability refers to the ability to maintain or support a process continuously over time','INNOV','Sustainable design, durability, energy efficiency, waste reduction, ');
INSERT INTO PRODUCT VALUES ('Technology Innovation','A technological innovation is a new or improved product or process whose technological characteristics are significantly different from before.','TECH','Objectives and goals of the new design');
 
-- Insertion of Project Data --
INSERT INTO PROJECT VALUES ('Rubic','Completed','09/10/2018','06/13/2019',3);
INSERT INTO PROJECT VALUES ('Bullet Train','Completed','09/23/2018','08/02/2019',16);
INSERT INTO PROJECT VALUES ('Gonna Bell!','Completed','10/22/2018','11/11/2018',1);
INSERT INTO PROJECT VALUES ('HRIS','Completed','11/15/2018','11/30/2019',6);
INSERT INTO PROJECT VALUES ('Novartis','Completed','05/06/2019','03/16/2020',19);
INSERT INTO PROJECT VALUES ('HOPE','Completed','05/16/2019','08/10/2019',19);
INSERT INTO PROJECT VALUES ('B&B Customer Feedback','Completed','11/16/2020','05/18/2021',13);
INSERT INTO PROJECT VALUES ('Next Gen Bell','Completed','07/21/2021','05/11/2022',1);
INSERT INTO PROJECT VALUES ('HIMMS','Ongoing','10/13/2021',NULL,19);
INSERT INTO PROJECT VALUES ('Reinvent Bell','Ongoing','10/18/2021',NULL,1);
INSERT INTO PROJECT VALUES ('Medical Hope Solution','Ongoing','01/03/2022',NULL,19);
INSERT INTO PROJECT VALUES ('Self-Checkout','Completed','02/07/2022','06/29/2022',4);
INSERT INTO PROJECT VALUES ('Tims Customer Feedback','Completed','02/21/2022','09/03/2022',4);
INSERT INTO PROJECT VALUES ('Reinvent Tim Horton''s App','Ongoing','03/21/2022',NULL,4);
INSERT INTO PROJECT VALUES ('Air Chat Automation','Ongoing','05/09/2022',NULL,2);
INSERT INTO PROJECT VALUES ('Air CA Web Feedback','Ongoing','10/03/2022',NULL,2);
INSERT INTO PROJECT VALUES ('Kokoda','NotStarted','7/5/2023',NULL,5);
INSERT INTO PROJECT VALUES ('Kazamm','NotStarted','7/5/2023',NULL,6);
INSERT INTO PROJECT VALUES ('Zydus','NotStarted','7/5/2023',NULL,9);
INSERT INTO PROJECT VALUES ('E-Node','NotStarted','7/5/2023',NULL,10);
INSERT INTO PROJECT VALUES ('Constraint Test','NotStarted','7/5/2023',NULL,10);
INSERT INTO PROJECT VALUES ('Constraint Test2','NotStarted','7/5/2023',NULL,10);
 
-- Insertion of Payment Data --
INSERT INTO PAYMENT VALUES (45000,'wire_transfer','06/13/2019','Success',1);
INSERT INTO PAYMENT VALUES (90000,'wire_transfer','08/02/2019','Success',2);
INSERT INTO PAYMENT VALUES (34000,'direct_deposite','11/11/2018','Success',3);
INSERT INTO PAYMENT VALUES (30000,'credit_card','11/30/2019','Success',4);
INSERT INTO PAYMENT VALUES (34000,'credit_card','03/16/2020','Success',5);
INSERT INTO PAYMENT VALUES (25000,'cheque','08/10/2019','Success',6);
INSERT INTO PAYMENT VALUES (30000,'cheque','05/18/2021','Success',7);
INSERT INTO PAYMENT VALUES (50000,'direct_deposite','05/11/2022','Success',8);
INSERT INTO PAYMENT VALUES (36000,'credit_card',NULL,'Ongoing',9);
INSERT INTO PAYMENT VALUES (45000,'cheque',NULL,'Ongoing',10);
INSERT INTO PAYMENT VALUES (50000,'wire_transfer',NULL,'Ongoing',11);
INSERT INTO PAYMENT VALUES (20000,'cheque','06/29/2022','Success',12);
INSERT INTO PAYMENT VALUES (35000,'credit_card','09/03/2022','Success',13);
INSERT INTO PAYMENT VALUES (40000,'direct_deposite',NULL,'Ongoing',14);
INSERT INTO PAYMENT VALUES (30000,'credit_card',NULL,'Ongoing',15);
INSERT INTO PAYMENT VALUES (28000,'cheque',NULL,'Ongoing',16);
INSERT INTO PAYMENT VALUES (44000,'credit_card',NULL,'NotStarted',17);
INSERT INTO PAYMENT VALUES (37000,'credit_card',NULL,'NotStarted',18);
INSERT INTO PAYMENT VALUES (60000,'wire_transfer',NULL,'NotStarted',19);
INSERT INTO PAYMENT VALUES (36000,'direct_deposite',NULL,'NotStarted',20);
 
-- Insertion of Job History Data --
INSERT INTO JOB_HISTORY VALUES (1,'08/13/2018',50000,NULL,1);
INSERT INTO JOB_HISTORY VALUES (2,'12/23/2021',8333.33,'08/25/2022',3);
INSERT INTO JOB_HISTORY VALUES (2,'08/26/2022',12166.67,NULL,2);
INSERT INTO JOB_HISTORY VALUES (3,'02/19/2018',8000,NULL,3);
INSERT INTO JOB_HISTORY VALUES (4,'08/15/2018',12500,NULL,4);
INSERT INTO JOB_HISTORY VALUES (5,'03/09/2022',12833.33,NULL,6);
INSERT INTO JOB_HISTORY VALUES (6,'05/18/2021',9166.67,NULL,7);
INSERT INTO JOB_HISTORY VALUES (7,'01/02/2018',5833.33,NULL,8);
INSERT INTO JOB_HISTORY VALUES (8,'06/13/2019',8333.33,NULL,9);
INSERT INTO JOB_HISTORY VALUES (9,'04/20/2018',8833.33,NULL,10);
INSERT INTO JOB_HISTORY VALUES (10,'02/22/2018',5833.33,NULL,11);
INSERT INTO JOB_HISTORY VALUES (12,'09/12/2018',5833.33,NULL,12);
INSERT INTO JOB_HISTORY VALUES (11,'11/30/2019',7500,NULL,13);
INSERT INTO JOB_HISTORY VALUES (16,'10/08/2019',7500,NULL,14);
INSERT INTO JOB_HISTORY VALUES (15,'03/16/2020',7500,NULL,15);
INSERT INTO JOB_HISTORY VALUES (17,'09/06/2022',5833.33,NULL,8);
INSERT INTO JOB_HISTORY VALUES (13,'11/12/2018',5833.33,'10/09/2020',8);
INSERT INTO JOB_HISTORY VALUES (19,'01/11/2019',5833.33,'03/11/2022',8);
INSERT INTO JOB_HISTORY VALUES (20,'06/24/2021',5833.33,NULL,8);
INSERT INTO JOB_HISTORY VALUES (13,'12/06/2021',5833.33,NULL,11);
INSERT INTO JOB_HISTORY VALUES (14,'02/08/2019',8000,'10/08/2021',10);
INSERT INTO JOB_HISTORY VALUES (14,'10/01/2021',13000,NULL,6);
INSERT INTO JOB_HISTORY VALUES (21,'08/15/2018',12833.33,NULL,6);
INSERT INTO JOB_HISTORY VALUES (22,'08/15/2018',8333.33,NULL,9);
INSERT INTO JOB_HISTORY VALUES (23,'09/04/2019',5833.33,NULL,8);
INSERT INTO JOB_HISTORY VALUES (24,'07/08/2019',5833.33,NULL,8);
INSERT INTO JOB_HISTORY VALUES (25,'06/07/2018',5833.33,NULL,10);
INSERT INTO JOB_HISTORY VALUES (26,'08/03/2019',5833.33,NULL,10);
INSERT INTO JOB_HISTORY VALUES (27,'01/11/2018',12833.33,NULL,6);
INSERT INTO JOB_HISTORY VALUES (28,'02/01/2019',9166.67,NULL,7);
INSERT INTO JOB_HISTORY VALUES (29,'02/13/2019',8333.33,NULL,9);
INSERT INTO JOB_HISTORY VALUES (30,'03/04/2019',8833.33,NULL,10);
INSERT INTO JOB_HISTORY VALUES (31,'03/08/2019',9166.67,NULL,7);
INSERT INTO JOB_HISTORY VALUES (32,'03/22/2019',8333.33,NULL,9);
INSERT INTO JOB_HISTORY VALUES (33,'04/04/2019',8833.33,NULL,10);
INSERT INTO JOB_HISTORY VALUES (34,'05/02/2019',9166.67,NULL,7);
INSERT INTO JOB_HISTORY VALUES (35,'05/03/2019',8333.33,NULL,9);
INSERT INTO JOB_HISTORY VALUES (36,'05/30/2019',8833.33,NULL,10);
INSERT INTO JOB_HISTORY VALUES (37,'06/07/2019',9166.67,NULL,7);
INSERT INTO JOB_HISTORY VALUES (38,'07/16/2019',8333.33,NULL,9);
INSERT INTO JOB_HISTORY VALUES (39,'08/21/2019',8833.33,NULL,10);
INSERT INTO JOB_HISTORY VALUES (40,'09/02/2019',9166.67,NULL,7);
INSERT INTO JOB_HISTORY VALUES (41,'09/23/2019',8333.33,NULL,9);
INSERT INTO JOB_HISTORY VALUES (42,'10/07/2019',8833.33,NULL,10);
 
 
-- Insertion of Employee Project Data --
INSERT INTO EMPLOYEE_PROJECT VALUES (21,1,8,'09/10/2018','06/13/2019' );
INSERT INTO EMPLOYEE_PROJECT VALUES (9,1,8,'09/10/2018','06/13/2019' );
INSERT INTO EMPLOYEE_PROJECT VALUES (7,2,8,'09/23/2018','08/02/2019' );
INSERT INTO EMPLOYEE_PROJECT VALUES (9,2,8,'09/23/2018','08/02/2019' );
INSERT INTO EMPLOYEE_PROJECT VALUES (22,3,8,'10/22/2018','11/11/2018' );
INSERT INTO EMPLOYEE_PROJECT VALUES (25,3,8,'10/22/2018','11/11/2018' );
INSERT INTO EMPLOYEE_PROJECT VALUES (22,4,8,'11/15/2018','11/30/2019' );
INSERT INTO EMPLOYEE_PROJECT VALUES (25,4,8,'11/15/2018','11/30/2019' );
INSERT INTO EMPLOYEE_PROJECT VALUES (8,5,8,'05/06/2019','03/16/2020' );
INSERT INTO EMPLOYEE_PROJECT VALUES (25,5,8,'05/06/2019','03/16/2020' );
INSERT INTO EMPLOYEE_PROJECT VALUES (26,5,8,'05/06/2019','03/16/2020' );
INSERT INTO EMPLOYEE_PROJECT VALUES (23,6,8,'05/16/2019','08/10/2019' );
INSERT INTO EMPLOYEE_PROJECT VALUES (19,6,8,'05/16/2019','08/10/2019' );
INSERT INTO EMPLOYEE_PROJECT VALUES (21,7,8,'11/16/2020','05/18/2021' );
INSERT INTO EMPLOYEE_PROJECT VALUES (9,7,8,'11/16/2020','05/18/2021' );
INSERT INTO EMPLOYEE_PROJECT VALUES (7,8,8,'07/21/2021','05/11/2022' );
INSERT INTO EMPLOYEE_PROJECT VALUES (9,8,8,'07/21/2021','05/11/2022' );
INSERT INTO EMPLOYEE_PROJECT VALUES (22,8,8,'07/21/2021','05/11/2022' );
INSERT INTO EMPLOYEE_PROJECT VALUES (6,9,8,'10/13/2021',NULL);
INSERT INTO EMPLOYEE_PROJECT VALUES (25,9,8,'10/13/2021',NULL);
INSERT INTO EMPLOYEE_PROJECT VALUES (28,10,8,'10/18/2021',NULL);
INSERT INTO EMPLOYEE_PROJECT VALUES (29,10,8,'10/18/2021',NULL);
INSERT INTO EMPLOYEE_PROJECT VALUES (30,10,8,'10/18/2021',NULL);
INSERT INTO EMPLOYEE_PROJECT VALUES (31,11,8,'01/03/2022',NULL);
INSERT INTO EMPLOYEE_PROJECT VALUES (32,11,8,'01/03/2022',NULL);
INSERT INTO EMPLOYEE_PROJECT VALUES (33,11,8,'01/03/2022',NULL);
INSERT INTO EMPLOYEE_PROJECT VALUES (23,12,8,'02/07/2022','06/29/2022' );
INSERT INTO EMPLOYEE_PROJECT VALUES (19,12,8,'02/07/2022','06/29/2022' );
INSERT INTO EMPLOYEE_PROJECT VALUES (21,13,8,'02/21/2022','09/03/2022' );
INSERT INTO EMPLOYEE_PROJECT VALUES (34,14,8,'03/21/2022',NULL);
INSERT INTO EMPLOYEE_PROJECT VALUES (35,14,8,'03/21/2022',NULL);
INSERT INTO EMPLOYEE_PROJECT VALUES (36,14,8,'03/21/2022',NULL);
INSERT INTO EMPLOYEE_PROJECT VALUES (37,15,8,'05/09/2022',NULL);
INSERT INTO EMPLOYEE_PROJECT VALUES (38,15,8,'05/09/2022',NULL);
INSERT INTO EMPLOYEE_PROJECT VALUES (39,15,8,'05/09/2022',NULL);
INSERT INTO EMPLOYEE_PROJECT VALUES (40,16,8,'10/03/2022',NULL);
INSERT INTO EMPLOYEE_PROJECT VALUES (41,16,8,'10/03/2022',NULL);
INSERT INTO EMPLOYEE_PROJECT VALUES (42,16,8,'10/03/2022',NULL);
INSERT INTO EMPLOYEE_PROJECT VALUES (1,17,0,'07/05/2023',NULL);
INSERT INTO EMPLOYEE_PROJECT VALUES (1,18,0,'07/05/2023',NULL);
INSERT INTO EMPLOYEE_PROJECT VALUES (1,19,0,'07/05/2023',NULL);
 
-- Insertion of Invoice Data --
INSERT INTO INVOICE VALUES (1, '06/13/2019', 'Adjustment', 'Due upon reciept');
INSERT INTO INVOICE VALUES (2, '08/02/2019', 'Normal', 'Due upon reciept');
INSERT INTO INVOICE VALUES (1, '11/11/2018', 'Normal', 'Due upon reciept');
INSERT INTO INVOICE VALUES (2, '11/30/2019', 'Normal', 'Due upon reciept');
INSERT INTO INVOICE VALUES (2, '03/16/2020', 'Normal', 'Due upon reciept');
INSERT INTO INVOICE VALUES (1, '08/10/2019', 'Normal', 'Due upon reciept');
INSERT INTO INVOICE VALUES (2, '05/18/2021', 'Normal', 'Due upon reciept');
INSERT INTO INVOICE VALUES (2, '05/11/2022', 'Normal', 'Due upon reciept');
INSERT INTO INVOICE VALUES (2, '06/29/2022', 'Refund', 'Due upon reciept');
INSERT INTO INVOICE VALUES (4, '09/03/2022', 'Adjustment', 'Due upon reciept');

-- Insertion of Product Project Data --
INSERT INTO ORDERS VALUES (11,1,45000,NULL,'Satisfied',3);
INSERT INTO ORDERS VALUES (3,2,90000,NULL,'Satisfied',NULL);
INSERT INTO ORDERS VALUES (1,3,34000,NULL,'Satisfied',1);
INSERT INTO ORDERS VALUES (4,4,30300,0.0001,'Satisfied',6);
INSERT INTO ORDERS VALUES (14,5,37400,0.1,'Satisfied',NULL);
INSERT INTO ORDERS VALUES (14,6,26250,0.5,'Satisfied',NULL);
INSERT INTO ORDERS VALUES (5,7,36000,0.2,'Satisfied',NULL);
INSERT INTO ORDERS VALUES (2,8,50000,NULL,'Satisfied',1);
INSERT INTO ORDERS VALUES (4,9,36000,NULL,NULL, NULL);
INSERT INTO ORDERS VALUES (5,10,45000,NULL,NULL, 1);
INSERT INTO ORDERS VALUES (6,11,50000,NULL,NULL, NULL);
INSERT INTO ORDERS VALUES (7,12,20000,NULL,'Satisfied',4);
INSERT INTO ORDERS VALUES (8,13,35000,NULL,'Satisfied', 4);
INSERT INTO ORDERS VALUES (9,14,40000,NULL,NULL, 4);
INSERT INTO ORDERS VALUES (10,15,30000,NULL,NULL, NULL);
INSERT INTO ORDERS VALUES (12,16,28000,NULL,NULL, NULL);
INSERT INTO ORDERS VALUES (15,17,44000,NULL,NULL, 5);
INSERT INTO ORDERS VALUES (16,18,37000,NULL,'Satisfied', 6);
INSERT INTO ORDERS VALUES (17,19,60000,NULL,'Satisfied', 9);
INSERT INTO ORDERS VALUES (18,20,36000,NULL,'Satisfied', 10);
 
 
---------------------------------------------------------------------- Constraint Testing --------------------------------------------------------------------------------
-- Constraint Test 1
-- Date : 12/06/2022
-- Description: Inserting a NULL value on a NOT NULL column
-- Expected Result: Insert fails with Cannot insert the value NULL into column 'product_title' Error
-- Action:
    INSERT INTO PRODUCT VALUES (NULL,'Software solutions that improve the speed, security, and operability of applications','TECH','Agile Transformation'); 
-- Actual Result:  Cannot insert the value NULL into column 'product_title', table 'LCS_DB.dbo.Product'; column does not allow nulls. INSERT fails. The statement has been terminated.
 
-- Constraint Test 2
-- Date : 12/06/2022
-- Description: Inserting a value on a column with default value
-- Expected Result: Insert fails with An explicit value for the identity column in table 'PRODUCT' can only be specified when a column list is used and IDENTITY_INSERT is ON Error
-- Action:
    INSERT INTO PRODUCT VALUES (23, 'Product Name','Software solutions that improve the speed, security, and operability of applications','TECH','Agile Transformation'); 
-- Actual Result:  An explicit value for the identity column in table 'PRODUCT' can only be specified when a column list is used and IDENTITY_INSERT is ON.
 
 
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Constraint Test 3
-- Date : 12/06/2022
-- Description: Inserting an existing Product Ttile in Product Table
-- Expected Result: Insert fails with Violation of UNIQUE KEY constraint 'AK_product_title' Error
-- Action:
    INSERT INTO PRODUCT VALUES ('Application Services','Software solutions that improve the speed, security, and operability of applications','TECH','Agile Transformation'); 
-- Actual Result:  Violation of UNIQUE KEY constraint 'AK_product_title'. Cannot insert duplicate key in object 'dbo.Product'. The duplicate key value is (Application Services). The statement has been terminated.
 
-- Constraint Test 4
-- Date : 12/06/2022
-- Description: Inserting a unique Product Tile in Product Table
-- Expected Result: Insert is successful. Message (1 row affected) is displayed
-- Action:
-- Inserting a unique Product Tile in Product Table
-- Action:
    INSERT INTO PRODUCT VALUES ('UniqueXX123','Software solutions that improve the speed, security, and operability of applications','TECH','Agile Transformation'); 
-- Actual Result: Insert is successful. Message (1 row affected) is displayed
 
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Constraint Test 5
-- Date : 12/06/2022
-- Description: Inserting an existing zip in Branch Table
-- Expected Result: Insert fails with Violation of UNIQUE KEY constraint 'AK_zip' Error
-- Action:
    INSERT INTO BRANCH VALUES ('S9H3W4','Toronto','ON','Canada', 'LCS Company');
-- Actual Result: Violation of UNIQUE KEY constraint 'AK_zip'. Cannot insert duplicate key in object 'dbo.Branch'. The duplicate key value is (S9H3W4). The statement has been terminated.
 
-- Constraint Test 6
-- Date : 12/06/2022
-- Description: Inserting a unique zip in Branch Table
-- Expected Result: Insert is successful. Message (1 row affected) is displayed
-- Action:
    INSERT INTO BRANCH VALUES ('SX1234','Toronto','ON','Canada', 'LCS Company');
-- Actual Result: Insert is successful. Message (1 row affected) is displayed
 
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Constraint Test 7
-- Date : 12/06/2022
-- Description: Inserting a non digit client mobile number in Client Table
-- Expected Result: Insert fails. The INSERT statement conflicted with the CHECK constraint "Client_CK_Mobile_Number"
-- Action:
    INSERT INTO CLIENT VALUES ('Constraint Test','8663number','contactus@bell.ca','1383 Wilson Rd N #8')
-- Actual Result: The INSERT statement conflicted with the CHECK constraint "Client_CK_Mobile_Number". The conflict occurred in database "LCS_DB", table "dbo.Client", column 'client_mobile_number'.The statement has been terminated.
 
-- Constraint Test 8
-- Date : 12/06/2022
-- Description: Inserting a valid digit client mobile number in Client Table
-- Expected Result: Insert is successful. Message (1 row affected) is displayed
-- Action:
    INSERT INTO CLIENT VALUES ('Constraint Test','4382903784','contactus@bell.ca','1383 Wilson Rd N #8') 
-- Actual Result: Insert is successful. Message (1 row affected) is displayed
 
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Constraint Test 9
-- Date : 12/06/2022
-- Description: Inserting an email without @ in Client Table
-- Expected Result: Insert fails. The INSERT statement conflicted with the CHECK constraint "Client_CK_email_address"
-- Action:
    INSERT INTO CLIENT VALUES ('Constraint Test','4372602569','contactusbell.ca','1383 Wilson Rd N #8') 
-- Actual Result: The INSERT statement conflicted with the CHECK constraint "Client_CK_email_address". The conflict occurred in database "LCS_DB", table "dbo.Client", column 'client_email_address'. The statement has been terminated.
 
-- Constraint Test 10
-- Date : 12/06/2022
-- Description: Inserting an email with @ in Client Table
-- Expected Result: Insert is successful. Message (1 row affected) is displayed
-- Action:
    INSERT INTO CLIENT VALUES ('Constraint Test','4372602569','constraint@test.ca','1383 Wilson Rd N #8') 
-- Actual Result: Insert is successful. Message (1 row affected) is displayed
 
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Constraint Test 11
-- Date : 12/06/2022
-- Description: Inserting a project with end date older than start date
-- Expected Result: Insert fails. The INSERT statement conflicted with the CHECK constraint "CK_start_date"
-- Action:
    INSERT INTO PROJECT VALUES ('Project Constraint','Completed','09/10/2020','06/13/2019',3); 
-- Actual Result: The INSERT statement conflicted with the CHECK constraint "CK_start_date". The conflict occurred in database "LCS_DB", table "dbo.Project". The statement has been terminated.
 
-- Constraint Test 12
-- Date : 12/06/2022
-- Description: Inserting a project with start date older than end date
-- Expected Result: Insert is successful. Message (1 row affected) is displayed
-- Action:
    INSERT INTO PROJECT VALUES ('Project Constraint','Completed','09/10/2019','06/13/2029',3); 
-- Actual Result: Insert is successful. Message (1 row affected) is displayed
 
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Constraint Test 13
-- Date : 12/06/2022
-- Description: Inserting a non digit department mobile number in Department Table
-- Expected Result: Insert fails. The INSERT statement conflicted with the CHECK constraint "Department_CK_contact_number"
-- Action:
    INSERT INTO DEPARTMENT VALUES ('Constraint Department','Constraint Testing','417448abc','admindepartment@lcs.com') 
-- Actual Result: The INSERT statement conflicted with the CHECK constraint "Department_CK_contact_number". The conflict occurred in database "LCS_DB", table "dbo.Department", column 'dept_contact_number'.The statement has been terminated.
 
-- Constraint Test 14
-- Date : 12/06/2022
-- Description: Inserting a valid digit department mobile number in Department Table
-- Expected Result: Insert is successful. Message (1 row affected) is displayed
-- Action:
    INSERT INTO DEPARTMENT VALUES ('Constraint Department','Constraint Testing','4372605483','admindepartment@lcs.com') 
-- Actual Result: Insert is successful. Message (1 row affected) is displayed
 
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Constraint Test 15
-- Date : 12/06/2022
-- Description: Inserting an email without @ in Department Table
-- Expected Result: Insert fails. The INSERT statement conflicted with the CHECK constraint "Department_CK_email_id"
-- Action:
    INSERT INTO DEPARTMENT VALUES ('Constraint Department ','Constraint Testing','4174482839','admindepartmentlcs.com') 
-- Actual Results: The INSERT statement conflicted with the CHECK constraint "Department_CK_email_id". The conflict occurred in database "LCS_DB", table "dbo.Department", column 'dept_email_id'. The statement has been terminated.
 
-- Constraint Test 16
-- Date : 12/06/2022
-- Description: Inserting an email with @ in Department Table
-- Expected Result: Insert is successful. Message (1 row affected) is displayed
-- Action:
    INSERT INTO DEPARTMENT VALUES ('Constraint Department ','Constraint Testing','4174482839','constraint@department.com') 
-- Actual Result: Insert is successful. Message (1 row affected) is displayed
 
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Constraint Test 17
-- Date : 12/06/2022
-- Description: Inserting an employee with hire date older than date of birth
-- Expected Result: Insert fails. The INSERT statement conflicted with the CHECK constraint "Employee_CK_hire_date"
-- Action:
    INSERT INTO EMPLOYEE VALUES ('Leonard',NULL,'Cooper','10/09/1997','2048211896','jaiden.abott@lcs.com','08/13/1996',463612901,NULL); 
-- Actual Result: The INSERT statement conflicted with the CHECK constraint "Employee_CK_hire_date". The conflict occurred in database "LCS_DB", table "dbo.Employee". The statement has been terminated.
 
-- Constraint Test 18
-- Date : 12/06/2022
-- Description: Inserting an employee with date of birth older than hire date
-- Expected Result: Insert is successful. Message (1 row affected) is displayed
-- Action:
    INSERT INTO EMPLOYEE VALUES ('Leonard',NULL,'Cooper','10/09/1996','2048211896','jaiden.abott@lcs.com','08/13/1997',463612901,NULL); 
-- Actual Result: Insert is successful. Message (1 row affected) is displayed
 
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Constraint Test 19
-- Date : 12/06/2022
-- Description: Inserting a non digit employee mobile number in Employee Table
-- Expected Result: Insert fails. The INSERT statement conflicted with the CHECK constraint "Employee_CK_contact_number"
-- Action: 
    INSERT INTO EMPLOYEE VALUES ('Leonard','Mark','Cooper','10/09/1997','20482asdcg','jaiden.abott@lcs.com','08/13/2018',463612590,NULL); 
-- Actual Result: The INSERT statement conflicted with the CHECK constraint "Employee_CK_contact_number". The conflict occurred in database "LCS_DB", table "dbo.Employee", column 'contact_number'. The statement has been terminated.
 
-- Constraint Test 20
-- Date : 12/06/2022
-- Description: Inserting a valid digit employee mobile number in Employee Table
-- Expected Result: Insert is successful. Message (1 row affected) is displayed
-- Action:
    INSERT INTO EMPLOYEE VALUES ('Leonard','Mark','Cooper','10/09/1997','4372605483','jaiden.abott@lcs.com','08/13/2018',463612590,NULL); 
-- Actual Result: Insert is successful. Message (1 row affected) is displayed
 
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Constraint Test 21
-- Date : 12/06/2022
-- Description: Inserting an email without @ in Employee Table
-- Expected Result: Insert fails. The INSERT statement conflicted with the CHECK constraint "Employee_CK_email_address"
-- Action: 
    INSERT INTO EMPLOYEE VALUES ('Leonard','Mark','Cooper ','10/09/1997','2048211896','jaiden.abottlcs.com','08/13/2018',463645590,NULL); 
-- Actual Result: The INSERT statement conflicted with the CHECK constraint "Employee_CK_email_address". The conflict occurred in database "LCS_DB", table "dbo.Employee", column 'email_address'. The statement has been terminated.
 
-- Constraint Test 22
-- Date : 12/06/2022
-- Description: Inserting an email with @ in Employee Table
-- Expected Result: Insert is successful. Message (1 row affected) is displayed
-- Action:
    INSERT INTO EMPLOYEE VALUES ('Leonard','Mark','Cooper ','10/09/1997','2048211896','leonardcooper@lcs.com','08/13/2018',463612523,NULL); 
-- Actual Result: Insert is successful. Message (1 row affected) is displayed
 
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Constraint Test 23
-- Date : 12/06/2022
-- Description: Inserting an existing SIN number in Employee Table
-- Expected Result: Insert fails. Violation of UNIQUE KEY constraint 'AK_sin'
-- Action:
    INSERT INTO EMPLOYEE VALUES ('Leonard','Mark','Cooper','10/09/1997','2048211896','jaiden.abott@lcs.com','08/13/2018',463612515,NULL);
-- Actual Result: Violation of UNIQUE KEY constraint 'AK_sin'. Cannot insert duplicate key in object 'dbo.Employee'. The duplicate key value is (463612515). The statement has been terminated.
 
-- Constraint Test 24
-- Date : 12/06/2022
-- Description: Inserting a unique SIN number in Employee Table
-- Expected Result: Insert is successful. Message (1 row affected) is displayed
-- Action:
    INSERT INTO EMPLOYEE VALUES ('Leonard','Mark','Cooper','10/09/1997','2048211896','jaiden.abott@lcs.com','08/13/2018',463612580,NULL);
-- Actual Result: Insert is successful. Message (1 row affected) is displayed
 
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Constraint Test 25
-- Date : 12/06/2022
-- Description: Inserting greater than 8 hours allocated in Employee_Project Table
-- Expected Result: Insert fails.The INSERT statement conflicted with the CHECK constraint "Employee_ProjectCK_hours_allocated"
-- Action:
    INSERT INTO EMPLOYEE_PROJECT VALUES (21,3,9,'09/10/2018','06/13/2019' ); 
-- Actual Result: The INSERT statement conflicted with the CHECK constraint "Employee_ProjectCK_hours_allocated". The conflict occurred in database "LCS_DB", table "dbo.Employee_Project", column 'hours_allocated'. The statement has been terminated.
 
-- Constraint Test 26
-- Date : 12/06/2022
-- Description: Inserting less than 8 hours allocated in Employee_Project Table
-- Expected Result: Insert is successful. Message (1 row affected) is displayed
-- Action:
    INSERT INTO EMPLOYEE_PROJECT VALUES (21,2,6,'09/10/2018','06/13/2019' ); 
-- Actual Result: Insert is successful. Message (1 row affected) is displayed
 
-- Constraint Test 27
-- Date : 12/06/2022
-- Description: Inserting 8 hours allocated in Employee_Project Table
-- Expected Result: Insert is successful. Message (1 row affected) is displayed
-- Action:
    INSERT INTO EMPLOYEE_PROJECT VALUES (21,4,8,'09/10/2018','06/13/2019' ); 
-- Actual Result: Insert is successful. Message (1 row affected) is displayed
 
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Constraint Test 28
-- Date : 12/06/2022
-- Description: Inserting an existing job title in Job Table
-- Expected Result: Insert fails. Violation of UNIQUE KEY constraint 'AK_job_title'
-- Action:
    INSERT INTO JOB VALUES ('Chief Executive Officer' ,'Responsible for managing a company''s overall operations', 250, 300) 
-- Actual Result: Violation of UNIQUE KEY constraint 'AK_job_title'. Cannot insert duplicate key in object 'dbo.Job'. The duplicate key value is (Chief Executive Officer). The statement has been terminated
 
-- Constraint Test 29
-- Date : 12/06/2022
-- Description: Inserting a unique job title in Job Table
-- Expected Result: Insert is successful. Message (1 row affected) is displayed
-- Action:
    INSERT INTO JOB VALUES ('Secretary' ,'Assist the CEO', 250, 300) 
-- Actual Result: Insert is successful. Message (1 row affected) is displayed
 
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Constraint Test 30
-- Date : 12/06/2022
-- Description: Inserting a a job with min salary greater than max salary in Job Table
-- Expected Result: Insert fails. The INSERT statement conflicted with the CHECK constraint "Job_CK_min_salary"
-- Action:
    INSERT INTO JOB VALUES ('Senior Associate' ,'Constraint Test', 350, 300) 
-- Actual Result: The INSERT statement conflicted with the CHECK constraint "Job_CK_min_salary". The conflict occurred in database "LCS_DB", table "dbo.Job". The statement has been terminated
 
-- Constraint Test 31
-- Date : 12/06/2022
-- Description:Inserting a a job with min salary less than max salary in Job Table
-- Expected Result: Insert is successful. Message (1 row affected) is displayed
-- Action:
    INSERT INTO JOB VALUES ('Junior Associate' ,'Constraint Test', 260, 500) 
-- Actual Result: Insert is successful. Message (1 row affected) is displayed
 
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Constraint Test 32
-- Date : 12/06/2022
-- Description: Inserting a job history with start date older than end date
-- Expected Result: Insert fails. The INSERT statement conflicted with the CHECK constraint "Job_History_CK_start_date"
-- Action:
    INSERT INTO JOB_HISTORY VALUES (1,'08/13/2019',50000,'05/13/2019',1); 
-- Actual Result: The INSERT statement conflicted with the CHECK constraint "Job_History_CK_start_date". The conflict occurred in database "LCS_DB", table "dbo.Job_History". The statement has been terminated.
 
-- Constraint Test 33
-- Date : 12/06/2022
-- Description: Inserting a job history with end date older than start date
-- Expected Result: Insert is successful. Message (1 row affected) is displayed
-- Action:
    INSERT INTO JOB_HISTORY VALUES (1,'05/13/2019',50000,'08/13/2019',1); 
-- Actual Result: Insert is successful. Message (1 row affected) is displayed
 
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Constraint Test 34
-- Date : 12/06/2022
-- Description: Inserting payment amount that is less than 1000
-- Expected Result: Insert fails. The INSERT statement conflicted with the CHECK constraint "Payment_CK_payment_amount"
-- Action:
    INSERT INTO PAYMENT VALUES (999,'wire_transfer','06/13/2019','Success',21);
-- Actual Result: The INSERT statement conflicted with the CHECK constraint "Payment_CK_payment_amount". The conflict occurred in database "LCS_DB", table "dbo.Payment", column 'payment_amount'. The statement has been terminated.
 
-- Constraint Test 35
-- Date : 12/06/2022
-- Description: Inserting payment amount that is greater than 1000
-- Expected Result: Insert is successful. Message (1 row affected) is displayed
-- Action:
    INSERT INTO PAYMENT VALUES (1001,'wire_transfer','06/13/2019','Success',21); 
-- Actual Result: Insert is successful. Message (1 row affected) is displayed
 
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Constraint Test 36
-- Date : 12/06/2022
-- Description: Inserting payment to a project who already has a payment record
-- Expected Result: Insert fails. Violation of UNIQUE KEY constraint 'AK_project_id'
-- Action:
    INSERT INTO PAYMENT VALUES (5000,'wire_transfer','06/13/2019','Success',21); 
-- Actual Result: Violation of UNIQUE KEY constraint 'AK_project_id'. Cannot insert duplicate key in object 'dbo.Payment'. The duplicate key value is (21). The statement has been terminated.
 
-- Constraint Test 37
-- Date : 12/06/2022
-- Description: Inserting payment to a project who don't have a payment record
-- Expected Result: Insert is successful. Message (1 row affected) is displayed
-- Action:
    INSERT INTO PAYMENT VALUES (5000,'wire_transfer','06/13/2019','Success',22); 
-- Actual Result: Insert is successful. Message (1 row affected) is displayed
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Constraint Test 38
-- Date : 12/06/2022
-- Description: Inserting a branch department record for an employee that already has a branch and department in Branch_Department Table
-- Expected Result: Insert fails. Violation of UNIQUE KEY constraint 'UK_emp_dep
-- Action:
    INSERT INTO BRANCH_DEPARTMENT VALUES (2, 3,1,'Onboarded', 'Employee is currently onboarded in this branch and department'); 
-- Actual Result: Violation of UNIQUE KEY constraint 'UK_emp_dep'. Cannot insert duplicate key in object 'dbo.Branch_Department'. The duplicate key value is (3, 1). The statement has been terminated.
 
-- Constraint Test 39
-- Date : 12/06/2022
-- Description: Inserting a branch department record for an employee that doesn't have a branch and department in Branch_Department Table
-- Expected Result: Insert is successful. Message (1 row affected) is displayed
-- Action:
    INSERT INTO BRANCH_DEPARTMENT VALUES (2, 3,42,'Onboarded', 'Employee is currently onboarded in this branch and department'); 
-- Actual Result: Insert is successful. Message (1 row affected) is displayed
 
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 
-------------------------------------- Reports -----------------------------------
-- View Product Table Details
SELECT product_id, product_title, product_description, product_type, product_specification FROM Product;
 
-- View Client Table Details
SELECT client_id, client_name, client_mobile_number, client_email_address, client_address FROM Client; 
 
-- View Project Table Details
SELECT project_id, project_name, project_status, start_date, end_date, client_id FROM Project; 
 
-- View Employee Table Details
SELECT EMP.employee_id, first_name, middle_name, last_name, date_of_birth, contact_number, email_address, hire_date, sin,
(SELECT first_name FROM Employee WHERE employee_id = EMP.supervisor_id) AS 'supervisor_name',
JOB.job_title, JH.salary,
dep.dept_name, BRA.city, BRA.country
FROM Employee EMP INNER JOIN Branch_Department BRA_DEP ON EMP.employee_id =  BRA_DEP.employee_id
INNER JOIN Branch BRA ON BRA_DEP.branch_id = BRA.branch_id
INNER JOIN Department DEP ON BRA_DEP.department_id = DEP.dept_id
INNER JOIN Job_History JH ON EMP.employee_id = JH.employee_id
INNER JOIN Job ON Job.job_id = JH.position_id
WHERE JH.end_date IS NULL
; 
-- View Department Table Details
SELECT dept_id, dept_name, dept_description, dept_contact_number, dept_email_id FROM Department; 
 
-- View Branch Table Details
SELECT branch_id, zip, city, state, country FROM Branch; 
 
-- View Job Table Details
SELECT job_id, job_title, job_description, min_salary, max_salary FROM Job; 

-- View Invoice General Information
SELECT A.invoice_id, A.branch_id, B.name, B.tax_code, A.invoice_type, A.invoice_date, A.terms_conditions, SUM(E.payment_amount) AS 'total_amount'
FROM Invoice A INNER JOIN Branch B ON A.branch_id = B.branch_id
INNER JOIN Orders C ON A.invoice_id = C.invoice_id 
INNER JOIN Project D ON C.project_id = D.project_id 
INNER JOIN Payment E ON D.project_id = E.project_id
WHERE A.invoice_id =1
GROUP BY A.invoice_id, A.branch_id, B.name, B.tax_code, A.invoice_type, A.invoice_date, A.terms_conditions
;
-- View Invoice Details
SELECT B.product_title, B.product_description, C.project_name, C.start_date, C.end_date,
E.payment_amount, F.client_name, F.client_address
FROM Orders A INNER JOIN Product B ON A.product_id = B.product_id 
INNER JOIN Project C ON A.project_id = C.project_id
INNER JOIN Invoice D ON A.invoice_id = D.invoice_id 
INNER JOIN Payment E ON C.project_id = E.project_id
INNER JOIN Client F ON c.client_id = f.client_id
WHERE D.invoice_id = 1
 
-- View Projects that are using the Products offered by the company
SELECT product_id, project_id, price, discount, feedback, invoice_id FROM ORDERS;
 
-- Count number of projects per client
SELECT A.client_id, A.client_name, COUNT(*) AS 'number_of_projects' FROM Client A LEFT JOIN Project B ON A.client_id = B.client_id GROUP BY A.client_id, A.client_name;
 
-- Count number of projects that are using the Products offered by the company
SELECT A.product_id, A.product_title, A.product_specification, COUNT(*) AS 'number_of_projects' FROM Product A LEFT JOIN ORDERS B ON A.product_id = B.product_id GROUP BY A.product_id, A.product_title, A.product_specification;
 
-- Count number of employees assigned to a project
SELECT A.project_id, A.project_name, COUNT(B.employee_id) AS 'number_of_employees' FROM Project A LEFT JOIN Employee_Project B ON A.client_id = B.employee_id GROUP BY A.project_id, A.project_name;
 
-- View project of clients and if there are any discount received
SELECT A.client_id, A.client_name, B.project_id, B.project_name, C.discount FROM Client A INNER JOIN Project B ON A.client_id = B.client_id INNER JOIN ORDERS C ON B.project_id = C.project_id ORDER BY C.discount DESC;
 
-- Count total amount of payment made by Clients
SELECT A.client_id, A.client_name, SUM(C.payment_amount) AS 'total_of_amount' FROM Client A INNER JOIN Project B ON A.client_id = B.client_id 
    INNER JOIN Payment C ON B.project_id = C.project_id 
    GROUP BY A.client_id, A.client_name 
    ORDER BY SUM(C.payment_amount) DESC;
 
-- Count total amount of payment received per year
SELECT YEAR(payment_date) AS 'Year', SUM(payment_amount) AS 'total_of_amount' FROM Payment 
	WHERE payment_date IS NOT NULL
    GROUP BY YEAR(payment_date)
	ORDER BY YEAR(payment_date) DESC;
 
-- Count number of employees per branch
SELECT A.branch_id, A.city, COUNT(*) AS 'number_of_employees' FROM Branch A LEFT JOIN Branch_Department B ON A.branch_id = B.branch_id
    GROUP BY A.branch_id, A.city;

-- Total amount of payment received for products used in projects
SELECT A.product_id, A.product_title, A.product_specification, SUM(D.payment_amount) AS 'total_of_amount'
    FROM Product A INNER JOIN ORDERS B ON A.product_id = B.product_id 
    INNER JOIN PROJECT C ON B.project_id = C.project_id INNER JOIN Payment D ON C.project_id = D.project_id
    WHERE D.payment_status='Success'
    GROUP BY A.product_id, A.product_title, A.product_specification
    ORDER BY SUM(D.payment_amount) DESC;

-- View Employees with the lowest salary
SELECT DISTINCT  A.employee_id, A.first_name, B.salary FROM Employee A INNER JOIN Job_History B ON A.employee_id = B.employee_id
    WHERE B.salary = (SELECT MIN(SALARY) FROM Job_History 
    WHERE end_date IS NULL);
 
-- View Employees with the highest salary
SELECT DISTINCT  A.employee_id, A.first_name, B.salary FROM Employee A LEFT JOIN Job_History B ON A.employee_id = B.employee_id
    WHERE B.salary = (SELECT MAX(SALARY) FROM Job_History 
    WHERE end_date IS NULL);
 
