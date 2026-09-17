# Software Engineering Practices & Principles: Comprehensive Study Notes
--

## Table of Contents
1. [Software Offerings & Cloud Architecture Stack](#1-software-offerings--cloud-architecture-stack)
2. [Software Industry, Licensing & Intellectual Property](#2-software-industry-licensing--intellectual-property)
3. [Software Engineering Teams & Organizational Roles](#3-software-engineering-teams--organizational-roles)
4. [Software Development Life Cycle & Modern Agile Frameworks](#4-software-development-life-cycle--modern-agile-frameworks)
5. [Continuous Integration & Continuous Delivery (CI/CD)](#5-continuous-integration--continuous-delivery-cicd)
6. [DevOps Ecosystem & Operational Tooling](#6-devops-ecosystem--operational-tooling)
7. [MLOps: Machine Learning Operations](#7-mlops-machine-learning-operations)
8. [Software Productivity & Engineering Metrics](#8-software-productivity--engineering-metrics)
9. [Technical Debt & The Debt Quadrant](#9-technical-debt--the-debt-quadrant)
10. [Software Development Waste](#10-software-development-waste)
11. [Quick Exam Revision Summary & Glossary](#11-quick-exam-revision-summary--glossary)

---

## 1. Software Offerings & Cloud Architecture Stack

Modern software engineering relies heavily on cloud service models that define boundaries between vendor management and client management.

```
+-------------------------------------------------------------+
|               SaaS (Software as a Service)                  |  Hosted Applications
+-------------------------------------------------------------+
|               FaaS (Function as a Service)                  |  Serverless Event Handlers
+-------------------------------------------------------------+
|               DaaS / STaaS (Data & Storage as a Service)    |  Managed Persistence
+-------------------------------------------------------------+
|               PaaS (Platform as a Service)                  |  Runtimes, Frameworks, DBs
+-------------------------------------------------------------+
|               IaaS (Infrastructure as a Service)            |  VMs, Storage, Virtual Nets
+-------------------------------------------------------------+
|               On-Premises Infrastructure                    |  Physical Facilities & Iron
+-------------------------------------------------------------+
```

### 1.1 The Cloud Service Models Breakdown

| Model | What is Managed by Cloud Vendor | What is Managed by Customer / Engineers | Real-World Examples |
| :--- | :--- | :--- | :--- |
| **IaaS** *(Infrastructure as a Service)* | Physical DC, cooling, physical networking, server virtualization, raw disks. | Operating System (OS), networking rules, security patches, runtime, app logic, data. | AWS EC2, Google Compute Engine, Rackspace, OpenStack. |
| **PaaS** *(Platform as a Service)* | Hardware, virtualization, OS, runtime environment, base software patching. | Application code, database schema, software configurations. | AWS Elastic Beanstalk, Azure App Service, Google App Engine, OpenShift. |
| **SaaS** *(Software as a Service)* | Everything: infra, runtime, updates, backup, uptime SLA, core security. | User access policies, app data input, feature toggles. | Office 365, Google Workspace, Slack, Salesforce, Zendesk. |
| **FaaS** *(Serverless)* | Micro-virtualization, ephemeral runtime execution, scaling to zero, triggers. | Discrete function logic, triggered event bindings. | AWS Lambda, Google Cloud Functions, Azure Functions, Apache OpenWhisk. |
| **DaaS & STaaS** *(Data & Storage as a Service)* | Sharding, high availability replication, disk maintenance, distributed indexing. | Data schema/records, queries, read/write permissions. | AWS S3, DynamoDB, Google Cloud Storage, BigQuery, Azure Blob, CouchDB. |

---

## 2. Software Industry, Licensing & Intellectual Property

Choosing an open-source or proprietary software license dictates how source code can be used, adapted, modified, and commercialized.

### 2.1 The Licensing Spectrum

```
[ Public Domain ] ---> [ Permissive FOSS ] ---> [ Copyleft FOSS ] ---> [ Freeware ] ---> [ Proprietary ]
(Zero restrictions)     (Attribute & do what     ("Share-alike" /      (Free binary,      (All rights
                         you want)               must stay open)       closed source)     reserved)
```

### 2.2 Detailed Comparison Table

| Property / Right | Public Domain | Permissive FOSS (e.g., BSD, MIT, Apache) | Copyleft FOSS (e.g., GPL, AGPL) | Freeware | Proprietary (Closed Source) |
| :--- | :---: | :---: | :---: | :---: | :---: |
| **Copyright Retained?** | **No** | **Yes** | **Yes** | **Yes** | **Yes** |
| **Right to Perform & Display?** | Yes | Yes | Yes | Yes | Yes |
| **Right to Copy?** | Yes | Yes | Yes | Often / Qualified | No (except backup) |
| **Right to Modify?** | Yes | Yes | Yes | No | No |
| **Right to Distribute?** | Yes | Yes | Yes (under same license) | Often | No |
| **Right to Sublicense?** | Yes | Yes | No | No | No |
| **Source Code Mandatory?** | No | Optional / Not enforced | **Yes (must be open)** | No | No |
| **Creator Liable for Bugs?** | No | No | No | No | As contract dictates |
| **Derivative Re-licensing?** | Allowed | Can re-license as proprietary | Must stay Copyleft | Not Applicable | Prohibited |
| **Canonical Examples** | SQLite, ImageJ | Apache 2.0, ToyBox, MIT, BSD | Linux Kernel, GIMP, OBS | Winamp, IrfanView | Windows, Spotify, Tidal |

### 2.3 Key Legal Terms
* **Copyleft (Reciprocal License):** Requires any derivative work to be distributed under the same license terms if published. Prevents proprietary enclosure of open source.
* **Permissive License:** Grants wide freedom with minimal restrictions, usually only requiring developer copyright attribution and a disclaimer of liability.
* **Creative Commons (CC):** Primarily designed for media, documentation, designs, and content rather than executable software binaries.

---

## 3. Software Engineering Teams & Organizational Roles

Modern high-performing engineering teams feature cross-functional, collaborative skill sets balancing product direction, architecture, and deployment quality.

```
               +-----------------------------+
               |  Product Manager (PM)       |
               |  Business Analyst (BA)      |
               +--------------+--------------+
                              | Requirements & Prioritization
                              v
   +--------------------------+--------------------------+
   | Engineering Manager (EM) & Technical Lead (Tech Lead) |
   +--------------------------+--------------------------+
                              | Architecture & Delivery
                              v
   +------------------+-------------------+--------------------+
   | Software Devs    | UI/UX Designers   | QA / Test Eng.     |
   | (Frontend, Back) | (Prototypes/UX)   | (E2E/Automation)   |
   +------------------+-------------------+--------------------+
                              ^
                              | Process Optimization
               +--------------+--------------+
               | Scrum Master / Agile Coach  |
               +-----------------------------+
```

### 3.1 Role & Responsibility Matrix

1. **Product Manager (PM):** Owns the *“What”* and *“Why”*. Represents the customer, drives product strategy, sets roadmaps, and determines backlog priority.
2. **Business Analyst (BA):** Translates high-level business goals into fine-grained functional and technical requirements for engineers.
3. **UI/UX Designer:** Researches user journeys, creates interactive wireframes, tests accessibility, and establishes design systems.
4. **Engineering Manager (EM):** Focuses on people management, career development, operational health, and cross-team resource alignment.
5. **Team / Technical Lead:** Senior individual contributor (IC) who drives technical design decisions, unblocks developers, reviews critical code, and enforces conventions.
6. **Software Architect:** Oversees multi-system macro-architecture, scalability patterns, distributed system guarantees, and technological selection.
7. **Software Developers / Engineers:** Designs, writes, tests, debugs, and maintains application code.
8. **QA Engineer / Software Development Engineer in Test (SDET):** Develops automation testing frameworks, regression suites, performance harnesses, and monitors verification gates.
9. **Scrum Master / Agile Delivery Lead:** Facilitates team ceremonies, removes impediments, protects team capacity, and coaches the team on Lean/Agile values.

---

## 4. Software Development Life Cycle & Modern Agile Frameworks

### 4.1 The Scrum Process
Scrum is an iterative, incremental framework designed for rapid inspection and adaptation in 1 to 4-week timeboxes called **Sprints**.

```
[ Product Backlog ] 
       |
       v (Sprint Planning Meeting)
[ Sprint Backlog ]
       |
       v
+-------------------------------------------------------------+
|                     SPRINT (1-4 WEEKS)                      |
|                                                             |
|   Plan  --->  Design  --->  Develop  --->  Test  ---> Deploy|
|    ^                                                    |   |
|    +------------- [ Daily Scrum (24h) ] <---------------+   |
+-------------------------------------------------------------+
       |
       +---> [ Sprint Review ]       --> Product Demo & Feedback
       +---> [ Sprint Retrospective] --> Process Improvement
       +---> [ Potentially Shippable Increment ]
```

* **Core Ceremonies:**
  * **Sprint Planning:** Team commits to backlog items and creates the Sprint Goal.
  * **Daily Standup (Daily Scrum, 15 min):** Synchronizes progress: *What was done yesterday? What will be done today? What blockers exist?*
  * **Sprint Review:** Stakeholder-facing demonstration of completed user stories.
  * **Sprint Retrospective:** Internal reflection on processes, tools, and dynamics to improve in the next sprint.

---

### 4.2 Kanban & Flow Optimization
Unlike Scrum’s fixed timeboxes, Kanban emphasizes continuous delivery, visualizing workflow, and restricting **Work-In-Progress (WIP)**.

```
+---------------+---------------+---------------+---------------+---------------+-----------+
|    BACKLOG    | READY TO DEV  |  IN PROGRESS  |  CODE REVIEW  |   IN TESTING  |   DONE    |
| (Prioritized) | (Refined)     | (WIP Max: 3)  | (WIP Max: 2)  | (WIP Max: 2)  | (Shipped) |
+---------------+---------------+---------------+---------------+---------------+-----------+
|  Story #101   |  Story #104   |  Story #106   |  Story #108   |  Story #110   | Story #98 |
|  Story #102   |  Story #105   |  Story #107   |               |  Story #111   | Story #99 |
|  Story #103   |               |               |               |               |           |
+---------------+---------------+---------------+---------------+---------------+-----------+
|<------------------------------ Total Lead Time ------------------------------>|
                |<---------------- Cycle Time ----------------->|
```

* **WIP Limits:** Enforced caps on simultaneous items in a state. Forces teams to swarm and unblock downstream bottlenecks before pulling new items.
* **Lead Time:** Clock time elapsed from user story creation to final production delivery.
* **Cycle Time:** Clock time elapsed from active work start to completion.

---

### 4.3 Scaled Agile Framework (SAFe 5.1)
When agile expands to hundreds of engineers, enterprise frameworks coordinate delivery alignment:

* **Agile Release Train (ART):** Long-lived team of agile teams (50–125 people) that plans, commits, and executes iterations together.
* **Program Increment (PI) Planning:** Cadence-based, face-to-face planning event where teams map dependencies, mitigate risks, and commit to objectives.
* **Continuous Delivery Pipeline (CDP):** Four interconnected elements:
  1. *Continuous Exploration (CE):* Understanding market/customer needs.
  2. *Continuous Integration (CI):* Developing, building, and validating features.
  3. *Continuous Deployment (CD):* Moving features safely into production environments.
  4. *Release on Demand:* Exposing functionality to users when business value dictates.

---

## 5. Continuous Integration & Continuous Delivery (CI/CD)

The CI/CD pipeline automates verification, packaging, testing, and deployment from raw source code to running customer software.

```
====================== BUILD PIPELINE (CI) ======================
[Developers] ---> [Version Control (Git)] 
                        |
                        v
                 [Auto Compile & Lint] 
                        |
                        v
                 [Package Binaries / Containers] 
                        |
                        v
                 [Automated Unit Tests] 
                        |
                        v
                 [Automated Integration / UI Tests]
                        |
===================== RELEASE PIPELINE (CD) =====================
                        v
            [Package with Release Instructions]
                        |
                        v
            [Automated Infrastructure / Orchestration]
                        |
                        v
            [Staging / Test Environment Deployment]
                        |
                        v
            [Regression, Smoke & Acceptance Testing]
                        |
                        v
            [Production Release / General Availability]
```

### 5.1 CI vs CD vs Continuous Deployment

| Concept | What It Automates | Manual Interventions |
| :--- | :--- | :--- |
| **Continuous Integration (CI)** | Code checkout, compilation, container build, unit tests, static code analysis. | Pull Request approval / Code review. |
| **Continuous Delivery (CD)** | Automatic release packaging and automated deployment to Staging/Pre-production. | **Manual human click** to approve final release to Production. |
| **Continuous Deployment** | Completely automated end-to-end pipeline straight through to Production. | **Zero manual steps**; failed tests automatically abort deployment. |

---

## 6. DevOps Ecosystem & Operational Tooling

DevOps bridges the historical silos between development teams (writing code) and IT operations teams (maintaining stability).

```
          [PLAN] (Jira, Confluence)
             |
             v
          [CODE] (Git, GitHub, GitLab)
             |
             v
          [BUILD] (Gradle, Webpack, Docker)
             |
             v
          [TEST] (JUnit, Jest, Playwright, Selenium)
             |
             +---------------------+
                                   | (CI -> CD Transition)
                                   v
                             [RELEASE] (Jenkins, ArgoCD, GitHub Actions)
                                   |
                                   v
                             [DEPLOY] (Kubernetes, Terraform, Ansible)
                                   |
                                   v
                             [OPERATE] (AWS, GCP, Linux Systems)
                                   |
                                   v
                             [MONITOR] (Prometheus, Datadog, Splunk)
                                   |
                                   +--> Loops back into [PLAN]
```

### 6.1 Tooling Taxonomy by Phase

* **Plan & Collaborate:** Jira, Confluence, Trello, Asana, Slack, Miro.
* **Source Control & Code Review:** Git, GitHub, GitLab, Bitbucket.
* **Build & Package:** Maven, Gradle, Webpack, npm, Docker, JFrog Artifactory.
* **Automated Testing:** JUnit, Jest, PyTest, Selenium, Playwright, Cypress.
* **CI Orchestration:** Jenkins, GitHub Actions, GitLab CI, CircleCI, TeamCity.
* **Configuration & Infrastructure as Code (IaC):** Terraform, Ansible, Chef, Puppet, CloudFormation.
* **Container Orchestration & GitOps:** Kubernetes (K8s), ArgoCD, Helm.
* **Observability, APM & Logging:** Datadog, Prometheus, Grafana, Splunk, New Relic, ELK Stack (Elasticsearch, Logstash, Kibana).

---

## 7. MLOps: Machine Learning Operations

Machine Learning Operations (MLOps) extends DevOps principles to machine learning lifecycles, recognizing that ML systems depend on three interrelated vectors: **Code, Data, and Models**.

```
              +------------------------------------------+
              |           MLOps Convergence              |
              |                                          |
              |       +--------+      +---------+        |
              |       |   ML   | <--> |   DEV   |        |
              |       +--------+      +---------+        |
              |            \              /              |
              |             v            v               |
              |               +---------+                |
              |               |   OPS   |                |
              |               +---------+                |
              +------------------------------------------+
```

### 7.1 The Three Pillars of MLOps

```
   [ DATA PIPELINE ]          [ CODE PIPELINE ]           [ MODEL PIPELINE ]
          |                          |                            |
  Ingestion & Cleansing      Feature Engineering          Hyperparameter Tuning
  Feature Store Versioning   Unit & Lint Tests            Distributed Training
  Data Drift Tracking        Container Build              Model Registry
          \                          |                           /
           \                         |                          /
            +------------------------+-------------------------+
                                     |
                                     v
                       [ Automated Serving / Endpoint ]
                                     |
                                     v
                  [ Continuous Monitoring & Model Drift Checks ]
                                     |
                  (Re-trigger Automated Training Pipeline)
```

### 7.2 DevOps vs MLOps Distinct Challenges

| Dimension | Standard DevOps | MLOps (Machine Learning Operations) |
| :--- | :--- | :--- |
| **Core Artifact** | Compiled source code & binary assets. | Code + Dynamic Datasets + Model Weights / Hyperparameters. |
| **Version Control** | Git commits for code. | Git (code) + DVC/Feature Store (data) + Model Registry (MLflow/Weights & Biases). |
| **Testing Scope** | Unit, integration, and UI regression tests. | Data validation, schema verification, model drift, fairness, evaluation accuracy. |
| **Degradation Mode** | Crashes, latency spikes, software exceptions. | **Silent degradation:** data drift, conceptual drift, model decay over time. |
| **Key Roles** | Software Engineers, QA, DevOps Engineers. | Data Scientists, Data Engineers, ML Engineers, MLOps Engineers. |

---

## 8. Software Productivity & Engineering Metrics

To measure engineering performance and developer well-being without relying on counterproductive metrics (e.g., lines of code), teams use three industry-standard frameworks:

### 8.1 DORA Metrics (DevOps Research and Assessment, 2018)
Identifies four core metrics that separate elite software delivery teams from low performers:

1. **Deployment Frequency (DF):** How often an organization successfully releases to production (e.g., multiple times per day vs monthly).
2. **Lead Time for Changes:** Time taken for a commit to go from pull-request creation to running in production.
3. **Change Failure Rate (CFR):** Percentage of deployments that cause production failure, requiring rollbacks, hotfixes, or patches.
4. **Mean Time to Recovery (MTTR) / Restore Service:** Clock time needed to restore full functionality when a production incident occurs.

---

### 8.2 SPACE Framework (2021)
Developed by GitHub, Microsoft Research, and Storey et al. to provide a holistic, multidimensional evaluation of developer productivity:

* **S - Satisfaction and Well-being:** Team happiness, burn-out prevention, autonomy, and tooling comfort.
* **P - Performance:** System quality, customer impact, uptime, and business outcomes.
* **A - Activity:** Counts of executed actions (commits, reviews, issues resolved, deployments).
* **C - Communication and Collaboration:** Speed and clarity of peer reviews, knowledge sharing, and onboarding efficiency.
* **E - Efficiency and Flow:** Minimize interruptions, uninterrupted focus blocks, low context switching.

---

### 8.3 Flow Metrics (Project to Product, 2018)
Aligns delivery flow directly with business value:

* **Flow Velocity:** Number of Flow Items (Features, Defects, Risks, Debts) completed over a given period.
* **Flow Efficiency:** Ratio of active working time to total elapsed lead time ($\text{Active Work Time} / \text{Total Lead Time}$).
* **Flow Time:** Elapsed time from work item start to production verification.
* **Flow Load:** Total volume of active and waiting work items across the value stream (WIP).
* **Flow Distribution:** Proportion of work allocated between **Features, Defects, Technical Debt, and Risks (Security)**.

---

## 9. Technical Debt & The Debt Quadrant

**Technical Debt** (coined by Ward Cunningham) describes the implied cost of future rework caused by choosing an easy, fast solution now instead of a better, sustainable architecture.

### 9.1 Martin Fowler's Technical Debt Quadrant

```
                         DELIBERATE
                              ^
                              |
       "We don't have         |        "We'll deal with
        time to design."      |         it later; ship now."
                              |
RECKLESS <--------------------+--------------------> PRUDENT
                              |
       "We don't know         |        "Now we understand how
        what we're doing."    |         we should have done it."
                              |
                              v
                         INADVERTENT
```

### 9.2 The Four Quadrants Explored

1. **Deliberate & Reckless:**  
   * *Mindset:* “We have no time for architecture, unit tests, or standards. Just write sloppy code and force it through.”  
   * *Consequence:* High interest, brittle systems, instant production instability.

2. **Deliberate & Prudent:**  
   * *Mindset:* “We need to validate this market feature now to survive. We will ship a lean, imperfect implementation and immediately schedule a refactoring sprint.”  
   * *Consequence:* Calculated business compromise with clear repayment intentions.

3. **Inadvertent & Reckless:**  
   * *Mindset:* “What is dependency injection? What are unit tests? What is database indexing?”  
   * *Consequence:* Caused by developer inexperience or poor engineering leadership. Dangerous because the team is blind to their own debt.

4. **Inadvertent & Prudent:**  
   * *Mindset:* “We built the cleanest design possible with the knowledge we had at the start. One year later, business domain learnings reveal an even better design pattern.”  
   * *Consequence:* Natural evolution of complex software architecture over time.

---

## 10. Software Development Waste

Waste refers to any software engineering activity, delay, or barrier that consumes time and resources without adding direct customer value.

```
+-----------------------------------------------------------------------------------+
|                           9 TYPES OF SOFTWARE WASTE                               |
+------------------------------------+----------------------------------------------+
| 1. Building Wrong Feature/Product  | Delivering features that users ignore.       |
| 2. Mismanaging the Backlog         | Duplicated, stale, or untriaged stories.     |
| 3. Rework                          | Fixing defects caused by unclear specs.      |
| 4. Unnecessarily Complex Solutions | Over-engineering and gold-plating systems.   |
| 5. Extraneous Cognitive Load       | Complex tooling and impenetrable code bases. |
| 6. Psychological Distress          | Burnout, toxicity, and crunch cultures.      |
| 7. Knowledge Loss                  | Brain drain when key engineers leave.        |
| 8. Waiting / Multitasking          | Blocked dependencies and context switching.  |
| 9. Ineffective Communication       | Misaligned silos and unshared information.   |
+------------------------------------+----------------------------------------------+
```

### 10.1 Descriptions and Mitigation Strategies

1. **Building the Wrong Feature or Product:** Building software nobody uses.  
   * *Remedy:* Early user research, minimum viable products (MVPs), continuous user feedback.
2. **Mismanaging the Backlog:** Hoarding hundreds of stale tickets, duplicated user requests, and outdated ideas.  
   * *Remedy:* Relentless backlog grooming, archiving tickets older than 90 days, keeping backlogs focused.
3. **Rework:** Having to rewrite code because requirements changed abruptly or quality was subpar.  
   * *Remedy:* Clear Definition of Ready (DoR), automated acceptance criteria, pair programming.
4. **Unnecessarily Complex Solutions (Gold Plating):** Implementing complicated microservice architectures when a simple modular monolith was sufficient.  
   * *Remedy:* Follow YAGNI (*You Aren't Gonna Need It*) and KISS (*Keep It Simple, Stupid*).
5. **Extraneous Cognitive Load:** Forcing developers to navigate convoluted codebases, cryptic variable names, and chaotic environments.  
   * *Remedy:* Clean code standards, comprehensive documentation, and unified dev containers.
6. **Psychological Distress:** Stress, psychological unsafety, and crunch deadlines.  
   * *Remedy:* Blameless postmortems, sustainable work hours, and psychological safety.
7. **Knowledge Loss:** Undocumented code and tribal knowledge leaving the organization when an engineer departs.  
   * *Remedy:* Architectural Decision Records (ADRs), pair programming, and automated documentation generators.
8. **Waiting and Multitasking:** Pausing for code reviews, long CI build runs, or switching across four projects in a day.  
   * *Remedy:* Accelerated CI pipelines, strict WIP limits, and dedicated team focus blocks.
9. **Ineffective Communication:** Misunderstandings between PMs, developers, and QA engineers.  
   * *Remedy:* Cross-functional teams, direct daily communication, and shared sprint objectives.

---

## 11. Quick Exam Revision Summary & Glossary

* **IaaS vs PaaS vs SaaS:** You manage the OS in IaaS; the vendor manages the OS/runtime in PaaS; the vendor manages everything in SaaS.
* **Permissive vs Copyleft:** Permissive (MIT/BSD/Apache) allows proprietary derivative closures. Copyleft (GPL) forces all derivative software to remain open-source.
* **DORA Metrics:** Lead Time, Change Failure Rate, Deployment Frequency, Mean Time to Recovery.
* **Scrum Pillars:** Transparency, Inspection, and Adaptation.
* **Martin Fowler’s Debt Quadrant:** Evaluated along **Deliberate vs Inadvertent** and **Reckless vs Prudent**.
* **MLOps Core Trinity:** Systems driven by **Code + Data + Models**.
