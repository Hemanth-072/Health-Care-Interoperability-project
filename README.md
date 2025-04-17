# Health-Care-Interoperability-project
# The Fibrillin Genies Interoperability Project  

**INFO‑B‑581: Health Informatics Standards and Terminology**  
**Professor:** Saptarshi Purkayastha  
**PS1–PS4 (Project Sprints 1–4)  
**Group 6:** The Fibrillin Genies  
- Hemanth Sai Kumar Gaddam  
- Puja Darshana Mishra  
- Priyanka Kuta Reddy  
- Sanjana Rajan  

---

📖 Table of Contents

1. [Project Overview](#project-overview)  
2. [Sprint 1: Use Case Selection](#sprint-1-use-case-selection)  
3. [Sprint 2: Problem Analysis & Modelling](#sprint-2-problem-analysis--modelling)  
4. [Sprint 3: CDA Implementation](#sprint-3-cda-implementation)  
5. [Sprint 4: XSLT‑Driven Interoperability](#sprint-4-xslt-driven-interoperability)  
6. [Repo Structure](#repo-structure)  
7. [Getting Started](#getting-started)  
8. [Cloning Our GitHub Repo](#cloning-our-github-repo)  
9. [References](#references)  

---

## 📝 Project Overview  

We demonstrate end‑to‑end interoperability for a genetic testing use case: a 34‑year‑old male with pectus excavatum, long fingers, flat feet, and joint hypermobility is referred for **FBN1** genetic testing. The lab identifies the **c.7039_7040del (p.Met2347fs)** variant. Results flow back to the clinician for diagnosis.  

We cover four sprints:  
1. **Use Case Selection**  
2. **Problem Analysis & Modelling**  
3. **CDA Document Creation & Viewing**  
4. **XSLT‑Based Data Transformation**  

---

## 🚀 Sprint 1: Use Case Selection  

- **Team Name:** The Fibrillin Genies  
- **Course:** INFO‑B‑581 (Health Informatics Standards & Terminology)  
- **Use Case:**  
  > A 34‑year‑old male with a history of rib cage defect (Pectus excavatum), long fingers, flat feet, and double‑jointedness. Clinician orders FBN1 genetic testing → Lab finds c.7039_7040del positive → Results returned → Diagnosis made.  

- **Standards & Terminologies Chosen:**  
  - **SNOMED CT** for clinical findings  
  - **ICD‑10** for diagnoses  
  - **HPO** for phenotypic terms  
  - **LOINC** for laboratory/genetic tests  

- **Clinical Elements Identified:**  
  1. Medical History (phenotypes)  
  2. Genetic Testing (FBN1 variants)  
  3. Diagnosis  

---

## 📊 Sprint 2: Problem Analysis & Modelling  

- **Modelling Languages:** UML (Class Diagram) & BPMN (Process Diagram)  
- **UML Class Diagram:**  
  - Entities: Patient, Provider, Lab, TestResultInterpretation, EHR  
  - Key relationships and multiplicities (e.g. Provider 1..* ↔ Patient 1..*)  
- **BPMN Workflow:**  
  1. Patient schedules appointment  
  2. Reception confirms/reschedules  
  3. Clinician assesses & orders genetic test  
  4. Lab performs test & returns results  
  5. Clinician reviews results & delivers diagnosis  
- **Interoperability Layers:**  
  - **Syntactic:** Standard message formats & protocols  
  - **Semantic:** Shared code systems (SNOMED CT, LOINC, ICD‑10)  
  - **Organizational & Process:** Defined roles & handoffs  

---

## 📑 Sprint 3: CDA Implementation  

- We authored a **C‑CDA** (Continuity of Care Document) instance containing all use‑case data (patient demographics, encounters, problems, procedures, results, consultation notes).  
- **Files:**  
  - `cda/PS3‑FibrillinGenies_CCD.xml` (full CDA template)  
  - `cda/Screenshot_of_CDA_Viewer.png` (CDA Viewer screenshot)  

---

## 🔄 Sprint 4: XSLT‑Driven Interoperability  

**Goal:** Transform the CDA into the payloads each system needs.  

- **System A: OpenMRS** (EMR, accepts **JSON**)  
- **System B: OpenELIS** (LIMS, accepts **XML**)  

### Sections & XSLTs  

| Section           | Purpose                                             | CDA → OpenMRS JSON            | OpenMRS JSON → OpenELIS XML      |
|-------------------|-----------------------------------------------------|--------------------------------|-----------------------------------|
| **Patient Details** | Demographics & identifiers                         | `xslt/PatientDetails.xsl`      | `xslt/patdetailsSysB.xsl`         |
| **Encounters**      | Visit date/time, type, location, providers         | `xslt/encounter.xsl`           | N/A                               |
| **Problem List**    | Active findings (pectus excavatum, etc.)           | `xslt/ProblemList.xsl` + `xslt/problemlist.json` | N/A      |
| **Procedures**      | Genetic test order (FBN1)                          | `xslt/Procedure.xsl`           | `xslt/ProceSysB.xsl`              |
| **Results**         | Genetic test outcomes (positive/negative)          | `xslt/Results.xsl`             | `xslt/ResultsSysB.xsl`            |

---

## 📂 Repo Structure  

/. ├── docs/ │ └── HST‑PS4‑FibrillinGenies.docx ├── cda/ │ ├── PS3‑FibrillinGenies_CCD.xml │ └── Screenshot_of_CDA_Viewer.png ├── xslt/ │ ├── PatientDetails.xsl │ ├── patdetailsSysB.xsl │ ├── encounter.xsl │ ├── ProblemList.xsl │ ├── problemlist.json │ ├── Procedure.xsl │ ├── ProceSysB.xsl │ ├── Results.xsl │ └── ResultsSysB.xsl └── README.md


---

## ⚙️ Getting Started  

1. **Clone this repo**  
   
       git clone https://github.com/Hemanth-072/Health-Care-Interoperability-projects.git
   cd Health-Care-Interoperability-projects

    Install an XSLT processor (e.g. Oxygen XML, Saxon).

    Run transformations:

        Patient → OpenMRS JSON

saxon -s:cda/PS3‑FibrillinGenies_CCD.xml \
      -xsl:xslt/PatientDetails.xsl \
      -o:out/patient.json

Patient JSON → OpenELIS XML

        saxon -it -xsl:xslt/patdetailsSysB.xsl \
              -val:input=out/patient.json \
              -o:out/patient_sysb.xml

        Repeat for encounter.xsl, ProblemList.xsl, Procedure.xsl, Results.xsl and their System B counterparts.

🔗 Cloning Our GitHub Repo

You can always get the latest source and files by cloning:

git clone https://github.com/Hemanth-072/Health-Care-Interoperability-projects.git

📚 References

    OpenMRS Product Overview: https://openmrs.org/product/

    OpenELIS Global LIMS: https://openelis-global.org/

    HL7 C‑CDA R2 Implementation Guide

    Visual Paradigm UML & BPMN tutorials
