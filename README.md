# Retail Cross-Selling Optimization: Market Basket Analysis

## Project Overview
This project applies unsupervised machine learning to a large-scale retail dataset to identify strong product associations and develop actionable business strategies. By utilizing Market Basket Analysis, the goal of this project is to provide data-backed recommendations for cross-selling, upselling (promotional bundling), and warehouse operational efficiencies.

## Dataset
* **Size:** 33,541 unique retail transactions
* **Scope:** 5,249 unique products 
* **Structure:** Transactional data converted into a sparse matrix for algorithmic processing.

## Methodology
The **Apriori algorithm** was deployed to mine frequent itemsets and extract high-confidence association rules. 
* Hyperparameters (Minimum Support, Minimum Confidence, and Minimum Length) were iteratively tuned to eliminate statistical noise and prevent model overfitting.
* Evaluated output rules based on **Lift** and **Confidence** metrics to ensure bi-directional complementary relationships between items.

## Tech Stack
* **Language:** R
* **Libraries:** `arules` (for Apriori algorithm execution), `gridExtra` (for data frame visualization and PDF rendering)
* **Techniques:** Unsupervised Machine Learning, Sparse Matrices, Hyperparameter Tuning

## Key Business Insights
The algorithm successfully extracted 98 highly reliable association rules. Key strategic applications include:
1. **Dynamic Cross-Selling:** Recommending complementary items (e.g., matching paper goods or hardware) at online checkout based on high-lift bi-directional rules.
2. **Promotional Bundling (Upselling):** Creating premium multi-piece sets (e.g., 3-piece playhouse bundles) targeted at customers viewing individual components.
3. **Warehouse Optimization:** Grouping highly associated products within the same physical picking zones to reduce order fulfillment times.

## Repository Contents
* `retail_project.R`: The core R script containing the data processing, matrix construction, and Apriori algorithm execution.
* `Top_10_Rules.pdf`: A clean, visual data frame export of the highest-performing rules based on the Lift metric.
* `Executive_Summary.pdf`: A brief business analysis translating the mathematical metrics into concrete retail strategies.
