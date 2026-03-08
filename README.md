
# Quantitative Research Methods – Regression Analysis Assignment

This project contains an econometric analysis conducted in **R** to test hypotheses about racial signals, political context, and user characteristics in online connection requests. The analysis applies **linear regression models** to evaluate how these factors influence:

1. The probability that a connection request is accepted.
2. The number of follow-up messages sent after acceptance.

The study uses **Linear Probability Models (LPM)** and **Ordinary Least Squares (OLS)** regression techniques.

---

# Project Structure

```
├── README.md
├── analysis.R
├── Assignment2_data.xlsx
└── QRM Individual Assignment.pdf
```

**Files**

* `analysis.R` – R script containing the regression models and data processing.
* `Assignment2_data.xlsx` – Dataset used for the analysis.
* `QRM Individual Assignment.pdf` – Full assignment report including hypothesis testing and interpretation.
* `README.md` – Project documentation.

---

# Research Questions

The project evaluates the following hypotheses:

### Acceptance Probability

**H1:**
Receiving a connection request from a profile signaling **Black racial identity** decreases the probability of acceptance compared to a profile signaling **White racial identity**.

**H2:**
The negative effect of Black racial signals is **stronger in Republican-leaning states**.

**H3:**
Higher **education levels** increase the probability that a connection request is accepted.

### Follow-Up Communication

**H4:**
Among accepted requests, profiles signaling **Black racial identity receive fewer follow-up messages** than White profiles.

**H5:**
The negative effect of racial signals on follow-up messages is **stronger in Republican-leaning states**.

---

# Methods

Two regression models are estimated.

## 1. Linear Probability Model (Binary Dependent Variable)

Dependent variable:

* `accepted` – 1 if the connection request was accepted, 0 otherwise.

Independent variables:

* `profile_race` – racial signal of sender (1 = Black, 0 = White)
* `rep_state` – receiver located in Republican-leaning state (1 = yes)
* `profile_race:rep_state` – interaction term
* `gender` – receiver gender (1 = Female)
* `education` – categorical education level

Estimated regression equation:

```
ACC = 0.30 
      - 0.05 * profile_race
      - 0.03 * rep_state
      - 0.04 * profile_race * rep_state
      + 0.00 * gender
      + 0.02 * education_medium
      + 0.06 * education_high
```

---

## 2. OLS Model (Quantitative Dependent Variable)

Dependent variable:

* `num_messages` – number of follow-up messages sent after accepting the request.

Independent variables:

* `profile_race`
* `rep_state`
* `profile_race:rep_state`
* `gender`
* `education`

Estimated regression equation:

```
N.MES = 1.23
        - 0.15 * profile_race
        - 0.08 * rep_state
        + 0.07 * profile_race * rep_state
        + 0.08 * gender
        + 0.05 * education_medium
        + 0.13 * education_high
```

---

# Key Results

### Acceptance Model

* **H1 supported:** Black racial signal reduces acceptance probability by **5 percentage points**.
* **H2 supported:** The negative effect becomes stronger in **Republican-leaning states**.
* **H3 supported:** Higher education increases the probability of accepting a request.

### Messaging Model

* **H4 supported:** Profiles signaling Black identity receive **0.15 fewer follow-up messages** on average.
* **H5 not supported:** The interaction effect with Republican states is **not statistically significant**.

---

# Technologies Used

* **R**
* `readxl`
* `dplyr`
* Linear Regression (`lm()`)

---

# How to Run the Analysis

1. Install required packages in R:

```r
install.packages("readxl")
install.packages("dplyr")
```

2. Load the dataset and run the script:

```r
source("analysis.R")
```

3. The regression summaries will be displayed in the R console.

