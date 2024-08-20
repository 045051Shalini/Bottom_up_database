# Bottom_up_database
It contain RDBM files for Property registration form using bottom up approach

BDDA_SQL_Bottom-up
Database Description:
The Property Management Database is designed to store and manage information about properties, property owners, property managers, and their corresponding registration details. The database is structured to capture key information about vacant properties and their management for official record-keeping purposes. This database facilitates efficient tracking, management, and reporting of property registration status, owner details, and emergency contact information.

Database Structure Overview:
The database contains four main tables:

-Property

-Property_Owner

-Property_Manager

-Registration

These tables are interlinked using relationships and foreign key constraints to ensure data integrity and efficient querying.

Relationships Between Tables:
-Property ↔ Property_Owner: Many-to-One (M:1) relationship: Many properties can have one property owner.

-Property ↔ Property_Manager: Many-to-One (M:1) relationship: Many properties can be managed by one property manager.

-Registration ↔ Property: Many-to-One (M:1) relationship: Each registration record is associated with a single property. However, a property can have multiple registrations over time.

Data Usage Scenarios:
-Property Management: The database allows efficient tracking of vacant properties, including registration, ownership, and management details.

-Compliance Monitoring: Ensures that vacant properties are properly registered and monitored, with emergency contacts available for quick communication.

-Utility and Condition Tracking: Tracks the utility status (e.g., water, gas, electricity) and the condition (winterized or not) of vacant properties.

-Reporting: Facilitates easy reporting on the registration status of properties, ownership details, and other critical information for local authorities.
