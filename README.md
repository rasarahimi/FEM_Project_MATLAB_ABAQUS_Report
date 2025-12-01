# FEM Project — MATLAB & ABAQUS Analysis

This repository contains a Finite Element Analysis (FEA) of a fixed-middle-roller beam subjected to a static perpendicular load.  
The analysis was performed using:

- **MATLAB** (custom beam stiffness code)
- **ABAQUS/CAE** (2D wire beam model)
- **Analytical Euler–Bernoulli beam theory**

The project includes full documentation, numerical results, and visualizations.

---

## 📄 Project Files

| File | Description |
|------|-------------|
| `FEM_Project_Code.m` | MATLAB script for beam stiffness matrix, boundary conditions, and solution |
| `FEM_Project_Abaqus.cae` | ABAQUS model file (2D wire beam setup) |
| `FEM_Project_Abaqus.jnl` | ABAQUS journal (command log) |
| `FEM_Project_Report.pdf` | Complete project report including theory, calculations, and comparisons |
| `README.md` | Project documentation (this file) |

---

## 🧮 Analytical vs FEM Comparison

The beam was analyzed using classical Euler–Bernoulli relations and simulated using ABAQUS.

### 🔹 **Analytical Results**
- Vertical displacement at midpoint: **1.875 × 10⁻³ m**
- Rotation at right end: **−8.036 × 10⁻³ rad**

(Values extracted from the analytical equations included in the report.)

### 🔹 **ABAQUS FEM Results**
- Vertical displacement at midpoint: **1.887 × 10⁻³ m**
- Rotation at right end: **−8.062 × 10⁻³ rad**

These results show excellent agreement, confirming the correctness of the analytical solution and FEM model.

---

## 🛠 Tools & Methods Used

- **MATLAB R2023b**  
  - 2-node Euler–Bernoulli beam elements  
  - Local & global stiffness assembly  
  - Boundary condition enforcement  
  - Reaction force and displacement extraction  

- **ABAQUS/CAE 2020**  
  - 2D wire beam  
  - Elastic isotropic material  
  - Static General step  
  - 30-element mesh  

---

## 📘 Full Report

See **`FEM_Project_Report.pdf`** for:
- Introduction & theory  
- Beam derivations  
- MATLAB formulation  
- ABAQUS modeling screenshots  
- Numerical results  
- Conclusion  

---

## 👤 Author
**Rasa Rahimi Behboud**  
Spring 2024  
Finite Element Analysis Project  
