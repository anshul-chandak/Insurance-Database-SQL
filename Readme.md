# InsurCare – Insurance Management System (SQL Project)

## Business Problem

Insurance companies manage large volumes of customer, policy, claim, and agent data — often leading to data fragmentation, reporting challenges, and inefficiencies in operations.

Goal: Build a robust SQL-based system to organize, query, and optimize the management of insurance operations including customer profiles, policy plans, claims, and agent assignments.

## Solution Overview

This project simulates a real-world Insurance Management System by:
- Designing a normalized data model
- Creating optimized SQL schemas
- Writing stored procedures, functions, and triggers
- Building business logic to handle:
  - Customer-policy mapping
  - Claim validations
  - Agent commissions
  - Premium due tracking
  - Fraud checks

## Data Model / Schema

The system uses relational tables representing:

| Table                   | Description                                           |
|------------------------|-------------------------------------------------------|
| t_MasterCustomer        | Customer details including DOB, dependents, etc.     |
| t_CustomerAddress       | Customer address with foreign key link to customer   |
| t_InsuranceCompany      | Registered insurance providers                       |
| t_PolicyDetails         | Policy offerings with type, premium, and linkage     |
| t_CompanyAddress        | Address of each insurance company                    |
| t_AgentDetails          | Agents selling and managing insurance policies       |
| t_CustomerInsurance     | Mapped policies owned by customers                   |
| t_Claims                | Submitted claims by customers                        |
| t_ClaimSettlement       | Payments issued for approved claims                  |
| t_CustomerPayment       | Policy premiums paid by customers                    |
| t_UserCredential        | Login data for each customer                         |
| t_CustomerContact       | Customer phone/email contact details                 |
| t_CompanyContact        | Insurance company contact information                |

## Technical Implementation

### 1. Schema Design

- Primary keys, foreign keys, and unique constraints were enforced
- Proper use of VARCHAR, DATE, DECIMAL, and ENUM data types
- Normalized to 3NF for consistency and performance

### 2. Stored Procedures

Custom procedures were written to:
- Add new customers and policies
- Handle policy claims and settlements
- Calculate agent commissions

Example:

```sql
CALL AddNewClaim(customer_id, policy_id, claim_amount, reason);
```

### 3. User-Defined Functions

Used to encapsulate reusable logic such as:
- Checking overdue premium payments
- Calculating total claims raised by a customer

Example:

```sql
SELECT CheckPremiumStatus(customer_id);
```

### 4. Triggers

Used to enforce business logic on data events:
- Automatically updating customer status upon large claims
- Logging changes in nominee assignments

Example:

```sql
AFTER INSERT ON t_Claims
FOR EACH ROW
BEGIN
  -- Update customer's claim count
END;
```

## Key Features

- Fully normalized and relational schema
- Reusable stored procedures and business logic
- Financial operations like claim approvals and premium tracking
- Data integrity through constraints and triggers

## Outcomes

This project simulates the back-end engine of an insurance ERP system, enabling:
- Real-time policy validation
- Customer claims analysis
- Branch-level policy management
- Enhanced decision-making for insurers

## How to Use

1. Clone or download this repository
2. Import the `Insurcare_InsuranceManagementDbProjectCode.sql` file into your SQL environment
3. Execute schema and data scripts
4. Test stored procedures, functions, and queries for sample use cases

## Built By

Anshul Chandak  
MS in Information Technology and Management – University of Texas at Dallas

## Final Note

This project demonstrates how SQL can power the core of an enterprise insurance management system and is ideal for demonstrating data modeling, backend logic, and relational integrity for technical interviews and case study evaluations.
