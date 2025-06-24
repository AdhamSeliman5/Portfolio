## 📘 Student Score Prediction

A beginner-friendly machine learning project that uses **Simple Linear Regression** to predict student exam scores based on the number of hours studied. This project is based on a real dataset and is ideal for understanding the fundamentals of supervised learning.

---

### 🔍 Objective

To build a regression model that learns the relationship between study time and performance, then uses this model to predict exam scores for unseen data.

---

### 📁 Dataset

- **Name:** Student Scores Dataset  
- **Source:** [Kaggle Dataset](https://www.kaggle.com/datasets/shubham47/students-score-dataset-linear-regression)  
- **Features:**  
  - `Hours` – Number of study hours  
  - `Scores` – Exam score out of 100

---

### 📌 Project Steps

1. **Data Import and Exploration**  
2. **Data Visualization**  
3. **Train-Test Split (80/20)**  
4. **Model Training using Scikit-learn's LinearRegression**  
5. **Prediction & Evaluation** (MAE and R² Score)  
6. **Visualization of Regression Line**  
7. **Saving the Model with joblib**

---

### 📊 Model Performance

- **Mean Absolute Error:** ~6.45  
- **R² Score:** 0.95  
  > Indicates that 95% of the variance in exam scores can be explained by hours studied.

---

### 💡 Example Prediction

```python
# Predict score for a student who studied 5.5 hours
reg.predict([[5.5]])  # Output: ~predicted score
```

---

### 🛠️ Tech Stack

- Python 🐍  
- Pandas & NumPy  
- Matplotlib & Seaborn  
- Scikit-learn  
- Jupyter Notebook

---

### 📌 Run It Yourself
  
```bash
# Clone the repo
git clone https://github.com/yourusername/student-score-prediction.git

# Open in Jupyter Notebook or VS Code and run the notebook
