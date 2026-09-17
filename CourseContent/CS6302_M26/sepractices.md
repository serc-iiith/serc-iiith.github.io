# Software Engineering Practices (PG – Monsoon 2026)
**Course Notes & Comprehensive Reference Guide**  

---

## 1. Cloud Software Offerings & Service Models

Cloud computing provides scalable compute, storage, and networking over the internet, categorized by the level of abstraction managed by the vendor versus the consumer.

### Primary Cloud Models

*   **IaaS (Infrastructure as a Service):** Delivers raw computing resources (virtual machines, physical storage, and networking). The provider maintains the physical plant, virtualization, and hardware; the consumer configures the operating system, middleware, runtime, and applications.
    *   *Examples:* Amazon EC2, Google Compute Engine, Rackspace, OpenStack, Apache CloudStack, IBM SoftLayer.
*   **PaaS (Platform as a Service):** Provides a managed development and deployment environment. The vendor handles server OS, runtime patching, and scaling; developers only supply application code and data configurations.
    *   *Examples:* AWS Elastic Beanstalk, Google App Engine, Microsoft Azure App Services, OpenShift Origin, Cloud Foundry, Heroku.
*   **SaaS (Software as a Service):** Delivers complete, turnkey applications accessible over a browser or API. The provider manages the entire underlying technical stack.
    *   *Examples:* Office 365, Google Workspace (GSuite), Slack, Zendesk, Salesforce, SugarCRM, Acquia.

### Specialized As-a-Service Models

*   **FaaS (Function as a Service / Serverless):** Event-driven execution of ephemeral, stateless code blocks billed by millisecond compute duration.
    *   *Examples:* AWS Lambda, Google Cloud Functions, Apache OpenWhisk, Fn Project.
*   **DaaS (Database as a Service):** Managed database instances with automated provisioning, replication, backup, and high availability.
    *   *Examples:* Amazon DynamoDB, AWS RDS, Google Cloud SQL, Cloud Datastore, CouchDB, CockroachDB, Cassandra, Azure SQL Database.
*   **STaaS (Storage as a Service):** Scalable, accessible object and block storage APIs.
    *   *Examples:* Amazon S3, Google Cloud Storage, Zadara Storage, Azure Blob Storage, Apple iCloud, OneDrive, Dropbox, OwnCloud, Cozy.io.

### Shared Responsibility Matrix

| Layer / Responsibility | Traditional On-Premise | IaaS | PaaS | SaaS |
| :--- | :--- | :--- | :--- | :--- |
| **Applications** | Customer | Customer | Customer | **Vendor** |
| **Data & Access** | Customer | Customer | Customer | Customer / Config |
| **Runtime & Middleware** | Customer | Customer | **Vendor** | **Vendor** |
| **Operating System** | Customer | Customer | **Vendor** | **Vendor** |
| **Virtualization** | Customer | **Vendor** | **Vendor** | **Vendor** |
| **Compute / Storage / Network**| Customer | **Vendor** | **Vendor** | **Vendor** |
| **Physical Facility / Plant** | Customer | **Vendor** | **Vendor** | **Vendor** |

---

## 2. Software Industry, Licensing & Open-Source Models

Software licenses define legal permissions, obligations, copyright boundaries, and restrictions on modification, redistribution, and commercial use.

### Comparative Rights Matrix

| Rights Granted | Public Domain | Permissive FOSS (e.g., BSD, MIT, Apache) | Copyleft FOSS (e.g., GNU GPL) | Freeware | Proprietary Commercial |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Copyright Retained?** | **No** | **Yes** | **Yes** | **Yes** | **Yes** |
| **Right to Perform?** | Yes | Yes | Yes | Yes | Yes |
| **Right to Display?** | Yes | Yes | Yes | Yes | Yes |
| **Right to Copy?** | Yes | Yes | Yes | Often | **No** |
| **Right to Modify?** | Yes | Yes | Yes | **No** | **No** |
| **Right to Distribute?** | Yes | Yes | Yes (under same license) | Often | **No** |
| **Right to Sublicense?** | Yes | Yes | **No** | **No** | **No** |
| **Source Code Availability**| As author dictates | Permitted / Open | **Must be Open** | Closed / Binaries | Closed Source |
| **Creator Bug Liability?** | **No** | **No** | **No** | **No** | As dictated by contract/EULA |
| **Re-licensing Freedom?** | As user wants | Can release as proprietary | **Cannot relicense as proprietary** | None | Strictly vendor-governed |
| **Commercial Restrictions?** | None | Permitted | Permitted (under copyleft) | Free of charge only | Strictly vendor-governed |
| **Representative Examples** | SQLite, ImageJ | BSD, MIT, Apache 2.0, ToyBox | Linux Kernel, GIMP, OBS | IrfanView, Winamp | MS Windows, Spotify, Tidal, xSplit |

### Core Licensing Categories

*   **Public Domain:** The creator forfeits all copyright claims. The code can be modified, sold, or incorporated into closed systems without restriction or attribution.
*   **Permissive Licenses (BSD, MIT, Apache 2.0):** Grant maximum flexibility. Developers can modify and redistribute code commercially or bundle it into proprietary software, requiring only copyright and attribution preservation.
*   **Copyleft Licenses (GPL):** Enforce reciprocal freedom. Any derivative work or linked extension incorporating copyleft code must be open-sourced under identical license terms.
*   **Creative Commons (CC):** Applied predominantly to creative media, tutorials, datasets, and documentation.
*   **Proprietary Licenses:** The vendor retains full copyright and source code exclusivity; users purchase a restrictive license to operate the compiled binary under explicit End User License Agreements (EULA).

---

## 3. Software Engineering Team Roles & Functions

High-performing software delivery teams consist of specialized, cross-functional roles that manage distinct phases of the product and engineering lifecycle.
