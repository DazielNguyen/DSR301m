![02-Data Science with R—Student Performance Prediction cover](images/02-Data Science with R—Student Performance Prediction.png)

# Data Science with R — Student Performance Prediction

A data science portfolio project exploring the factors associated with student
performance, study habits, and mental health. The repository contains the
DSR301m project work only; unrelated Coursera materials are intentionally kept
out of the public repository.

## Project overview

The analyses use regression and ensemble-learning approaches to investigate
three main questions:

- Which factors are most useful for predicting exam scores?
- How well can student habits predict mental-health ratings?
- Which behaviours are associated with daily study time?

The work covers exploratory data analysis, preprocessing, feature selection,
model training, hyperparameter tuning, evaluation, and result visualisation.

## Repository structure

```text
DSR301m/
├── projects/
│   ├── main_projects/    # End-to-end project notebooks
│   ├── student_habits/   # Study-time and mental-health analyses
│   └── exam_score/       # Exam-score analysis
├── models/                   # Saved trained models (.rds)
├── scripts/                  # R scripts and local notebook helpers
├── assets/                   # Project figures
├── notebooks/                # Supporting experiments
└── data/                     # Dataset documentation
```

Local CSV datasets are excluded from Git. To reproduce an analysis, place the
required dataset in `data/` and update any machine-specific path in the notebook
to point to that directory.

## Main work

- **Project Part 1:** data exploration, cleaning, and visual analysis.
- **Project Part 2:** predictive modelling for exam score, mental health, and
  study hours.
- **Student habits:** individual R/Python experiments with linear regression,
  polynomial regression, random forest, gradient boosting, XGBoost, SVR, and
  stacked models.
- **Exam score:** focused regression analysis and model comparison.

## Tools and techniques

- R, Python, and Jupyter Notebook
- Data preprocessing and exploratory data analysis
- Regression, ensemble models, and hyperparameter tuning
- MSE, RMSE, and R² model evaluation
- ggplot2, Matplotlib, and Seaborn visualisation

## Running the notebooks

1. Install R or Python and Jupyter, depending on the selected notebook.
2. Install the packages imported by that notebook.
3. Add the required CSV files under `data/`.
4. Replace legacy Google Drive or absolute local paths with a relative path such
   as `data/students_habit2.csv`.
5. Open a notebook from `projects/` and run its cells in order.

## Contributors

- Anh Duy — exam-score analysis
- Công Khanh — study-hours analysis
- Hoàng Anh — mental-health analysis
- Quang Khải — mental-health prediction
