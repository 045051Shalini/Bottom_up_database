# Bottom_up_database Normalization
The ERD diagram you shared for property management and registration seems fairly well structured, but here’s a breakdown of its normalization:

# First Normal Form (1NF):
1NF requires that each column contains only atomic (indivisible) values and that there are no repeating groups.

Property Table:
Parcel Tax ID and Property Type seem atomic, but ensure that utilities (Water, Gas, Electricity, etc.) are stored as ENUM or individual Boolean columns, which it seems to be.
Property Owner Table:
The owner information (name, address, contact) is atomic, meaning each piece of information (address, contact number) is broken into separate fields.
Property Manager Table:
Similar to Property Owner, ensure company name, contact person, and phone number are stored individually.

# Second Normal Form (2NF):
2NF eliminates partial dependencies, meaning every non-prime attribute must depend on the whole primary key.

Property Table:
Property ID is the primary key, and all attributes (Parcel Tax ID, Property Type, Utilities) depend entirely on it. So, this table satisfies 2NF.
Property Owner Table:
The Owner ID is the primary key, and attributes like name, address, and email all fully depend on it.
Property Manager Table:
Similarly, Manager ID is the primary key, and all other attributes depend fully on it.
Registration Table:
Here, the Property ID and Registration ID are used properly, ensuring all attributes (fee, date) depend on the primary key.

# Third Normal Form (3NF):
In 3NF, every non-key attribute must depend only on the primary key and not on other non-key attributes.

Property Table:
The attributes are all related to the property itself and do not depend on each other.
Property Owner and Property Manager:
These tables are well-formed, as there is no transitive dependency. All fields depend on their respective primary keys (Owner ID, Manager ID).
Additional Observations:
Referential Integrity:
There are foreign key relationships, such as between property_owner and property, and between property_manager and property. These ensure that each property is associated with an owner and possibly a manager, ensuring referential integrity.
Enums:
For attributes like property_type and utilities, using ENUM or predefined lists would help ensure data consistency.
Summary:
The diagram largely meets 1NF, 2NF, and 3NF standards.
There may be further refinements depending on your specific use case (e.g., using separate tables for utilities if you need complex relationships for those).
The registration form you provided corresponds well to the structure of the database, covering all necessary attributes like property details, owner, manager, and registration fee.



# Following structure for Property registration is finalised

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
