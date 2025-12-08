## Table of Contents
-[Project Overview](#project-overview)
-[Insights and recommendations are provided on the following key areas](#insights-and-recommendations-are-provided-on-the-following-key-areas)
-[Executive Summary](#executive-summary)
-[Key Insights](#key-insights)
-[Recommendations](#recommendations)
-[Tools and Technologies](#tools-and-technologies)
-[Data Cleaning Process](#data-cleaning-process)
-[Repository Contents](#repository-contents)


# Affordable Housing Analysis – Washington D.C.

## Project Overview

Affordable housing remains one of the biggest challenges in Washington D.C. Despite many government programs, there has been little visibility into which agencies deliver the most housing, how projects are spread across wards, and if housing efforts truly meet affordability targets (AMI groups).
This project analyzes Washington D.C.’s affordable housing data to uncover:

* Where most housing developments are located
* Which agencies drive the highest delivery
* How progress is distributed across project stages
* Whether housing supports the right income levels

---

##  Insights and recommendations are provided on the following key areas:


**1. Leading Agencies in Affordable Housing Delivery** <br>
Identified which government agencies are driving the largest share of affordable housing projects and their total contribution to the city’s housing supply.

**2. Affordable Housing Distribution Across Wards** <br>
Analyzed how affordable housing projects are spread across Washington D.C.’s wards, revealing major concentration zones and areas with low development.

**3. Overall Development Progress** <br>
Measured project status — completed, under construction, and pipeline — to understand overall delivery performance and progress.

**4. Distribution by Income Level (AMI)** <br>
Examined how affordable housing units are distributed across different income groups (0–30%, 31–50%, 51–60%, and 61–80% AMI).


---


## Executive Summary

Affordable housing delivery is progressing steadily, with over **60% of projects completed** since 2015.
Most housing is concentrated in **Ward 8**, followed by **Wards 6 and 7**, while **Ward 3** has the least activity.

The majority of housing units serve **low- to moderate-income families (31–60% AMI)**, showing strong focus on working-class residents, but fewer projects target deeply affordable units (0–30% AMI).

Agency performance is led by **DCHFA–DHCD (7,523 units)** and **DHCD (7,505 units)**, showing that most delivery comes from a few major players. 
<br>
<br>
<img width="998" height="520" alt="main dashboard" src="https://github.com/user-attachments/assets/82ab3885-14ea-4aa4-80d3-b3a8251293d4" />

---
## Key Insights

**1. Leading Agencies** <br>
DCHFA–DHCD and DHCD lead in affordable housing delivery, contributing most of the city’s total units. DMPED and OP follow with smaller shares, showing room for stronger collaboration.

<img width="850" height="450" alt="main 1" src="https://github.com/user-attachments/assets/135f829c-77a1-4eb3-8c5a-2a121e777038" />
<br>
<br>
<br> 
<br>

**2. Housing Distribution Across Wards** <br>
Ward 8 records the highest concentration of affordable housing with 10,338 units, followed by Wards 6 and 7, while Ward 3 shows the lowest level of activity, underscoring the uneven distribution across the city.

<img width="850" height="450" alt="main 2" src="https://github.com/user-attachments/assets/27145260-6053-4f6a-bb20-97a0db4296db" />
<br>
<br>
<br> 
<br>

**3. Project Progress** <br>
Out of 37,519 planned units, 58% are completed, 31% are in the pipeline, and 11% are under construction, with development advancing across phases.

<img width="850" height="515" alt="main 3" src="https://github.com/user-attachments/assets/a9b9747e-e635-460e-9df1-8b5b4ecb5fd8" />
<br>
<br>
<br> 
<br>

 **4. Affordability Levels (AMI)** <br>
Most units serve households earning 31–60% of AMI, while support for 0–30% AMI groups remains limited, leaving the lowest-income tier less served.

<img width="850" height="450" alt="main 4" src="https://github.com/user-attachments/assets/c70b04fa-f0a0-4f88-9b2c-485bfcb39b34" />

---
##  Key Recommendations

1. **Increase Collaboration Across Agencies** <br>
   Encourage partnerships between smaller agencies (e.g., DMPED, OP) and larger ones to expand housing delivery capacity.

2. **Balance Development Across Wards** <br>
   Use zoning and land incentives to encourage more projects in low-development areas like Ward 3.

3. **Accelerate Pipeline Projects** <br>
   Simplify permits and approvals to move pipeline projects to completion faster.

4. **Support Deeply Affordable Units (0–30% AMI)** <br>
   Offer more funding and incentives for developers to serve the lowest-income households.

5. **Use Data to Guide Policy** <br>
   Continue using housing data to track performance, guide investments, and target neighborhoods most in need.

---

##  Tools and Technologies

* **MySQL** – Data cleaning and preparation
* **Excel / CSV** – Raw data source
* **Power BI** – Dashboard creation and data visualization

---

## Data Cleaning Process

The dataset was cleaned and prepared in **MySQL** before analysis.
Steps included:

1. Imported the dataset using the Table Data Import Wizard.
2. Inspected table structure and column types using `SELECT` queries.
3. Checked for duplicate records using window functions.
4. Checked and handled missing or NULL values.
5. Inspected text formats using `TRIM()`, `UPPER()`, and `REPLACE()` functions.
6. Validated data accuracy before visualizing in Power BI.


---

##  Repository Contents

* [ Raw and cleaned datasets](https://github.com/promiserex/eluepromise-portfolio/tree/main/data) → Raw and cleaned datasets (Excel/CSV)
* [affordable housing data cleaning.sql ](https://github.com/promiserex/eluepromise-portfolio/blob/main/affordable%20housing%20data%20cleaning.sql) → MySQL cleaning and transformation queries
* [Affordable Housing Dashboard](https://github.com/promiserex/eluepromise-portfolio/blob/main/Affordable%20Housing%20Dashboard.pbix) → Power BI 
