# [![Tapestry-branding-logo](https://github.com/tapestry-pipeline/tapestry-cli/blob/main/front_end/app/build/static/media/tapestry_logo_color.c2bd66fd.png)][github]

[![shields.io npm version badge](https://img.shields.io/npm/v/tapestry-pipeline)][npm]
[![shields.io npm license badge](https://img.shields.io/npm/l/tapestry-pipeline)][npm]
[![shields.io custom website link badge](https://img.shields.io/static/v1?label=website&message=tapestry-pipeline.github.io&color=blue)][website]

## Overview
Tapestry is an open-source orchestration framework for the deployment of user entity data pipelines. It allows users to easily configure and launch an end-to-end data pipeline hosted on Amazon Web Services. Our automated solution combines best-in-class tools to create a warehouse-centric data stack, offering built-in data ingestion, transformation, and newly emerging data syncing (also known as "reverse ETL") technologies. Our inclusion of a reverse ETL component solves the "last mile" problem by providing the ability to operationalize collected user data in near real-time.

[Read our case study to learn more about how we built Tapestry](https://tapestry-pipeline.github.io/).

## What is DBT?
  [DBT](https://docs.getdbt.com/docs/introduction), also known as Data Build Tool,  is a SQL-Based transformation tool that Tapestry utilizes during the `tapestry kickstart` command. It enables non-developers to create data models with SQL-like `SELECT` statements; which DBT wraps with SQL to generate views or tables in the data warehouse.
  
  Once you have data loaded into a data warehouse, you can transform that data in various ways; like combining data from multiple sources into one table; removing duplicate entries, changing column names, and copying only the particular fields you need from one table into a new table.


## How does Tapestry use DBT?
  Tapestry uses DBT as its transformation tool. For ease of use, Tapestry gives you the necessary files and folders to create a fully functional example DBT project. While some of the included files, like the data model (`models/_sources/email_model.sql`), are made specifically for use with our `kickstart command`, you can build upon this one or use it as an example to customize your own.

  During the `tapestry kickstart` command, data is extracted from Zoom and Salesforce and then loaded into Snowflake, the data warehouse. While `tapestry kickstart` is running, the user is prompted to visit this DBT README URL for further instructions on how to configure a DBT Cloud account. While all the pipeline resources will still be provisioned, no data will make it out of the warehouse during `tapestry kickstart`, unless DBT Cloud is set up when prompted. The data that's loaded into Snowflake from Zoom and Salesforce needs to be transformed by DBT to be combined into one table and to match the schema that Mailchimp requires for the data to be synced.


## DBT Core vs DBT Cloud?
  While DBT Core is an open-source command line tool, we recommend the use of DBT Cloud with Tapestry. DBT Cloud offers greater ease of use for both developers and non-developers and offers a simple to understand UI. DBT Cloud offers a free tier that offers full access for one developer seat.

## How does Tapestry help set up DBT Cloud?
  Here, in this repo, we give you the exact files, including a data model, needed to transform your data while running `tapestry kickstart `. Even after your pipeline has been fully deployed, whether with `tapestry kickstart` or even `tapestry deploy`, these DBT project files can be helpful as a base to build more models, which allows for fully customizable data transformations. 

  We also walk you through how to set up your DBT Cloud account and how to correctly connect DBT with Snowflake via the DBT Cloud Console.

  
## Getting Started
  ## Who is this tutorial for?
  -  It's directly meant for anyone that is in the middle of setting up a data pipeline by running Tapestry's  `kickstart` command and has been prompted to 'Configure DBT' by reviewing Tapestry's DBT Github repository. 
  -  This walkthrough can also be used as a helpful example of how to set up DBT Cloud with Snowflake or another cloud data warehouse.

  
### Prerequisites
  - If using this tutorial while in the middle of running `tapestry kickstart`, all of the requirements specified [in Tapestry's readme](https://github.com/tapestry-pipeline/tapestry-cli) should have already been installed.
  - Otherwise, you just need an email and a Github account to set up a DBT cloud account

### Steps for Configuring DBT:
  - Watch this quick video tutorial for how to sign up for DBT, and configure it to connect with Snowflake. Assuming you're in the middle of running `tapestry kickstart`, you will have a new table called `email_model` that is now properly cleaned and formatted to send data to Mailchimp. The `email_model` table pulls and transforms data from the Salesforce `TAPESTRY_CONTACT` table and the Zoom `TAPESTRY_WEBINAR_REGISTRANTS` table.




--------
[npm]: https://www.npmjs.com/package/tapestry-pipeline
[website]: https://tapestry-pipeline.github.io/
[github]: https://github.com/tapestry-pipeline
[tapestry-cli]: https://github.com/tapestry-pipeline/tapestry-cli
[tapestry-dashboard]: https://github.com/tapestry-pipeline/tapestry-dashboard




### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Learn more about dbt cloud [in the docs](https://docs.getdbt.com/docs/dbt-cloud/cloud-overview)
- Read our [Case Study](https://tapestry-pipeline.github.io/) about Tapestry


