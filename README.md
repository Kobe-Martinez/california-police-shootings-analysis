# Police Shootings Data Analysis

This project provides a comprehensive analysis of fatal police shootings in California, focusing on the top 5 cities with the highest occurrences. Utilizing R for advanced data visualization and statistical analysis, it examines correlations between socioeconomic factors such as poverty, income, and education levels with police shootings. The project also explores racial disparities and demographic trends in victimization.


## Table of Contents

- [Features](#features)
- [Usage](#usage)
- [Code Structure](#code-structure)
- [Requirements](#requirements)
- [File Outputs](#file-outputs)
- [License](#license)
- [Important Note](#important-note)

## Features

- **Data Cleaning and Preprocessing**
  - Filters data for California's top 5 cities with the most police shootings.
  - Handles missing values and converts variables to numeric for analysis.

- **Visualization Techniques**
  - **Bar Charts**: Display racial composition and poverty rates of the top cities.
  - **Scatter Plots**: Show relationships between graduation rates and poverty.
  - **Histograms**: Highlight the age distribution of victims by race.
  - **Boxplots**: Compare median ages of victims across different races.

- **Statistical Insights**
  - Explores the correlation between poverty rates, graduation rates, and police shootings.
  - Examines racial disparities in victimization.

## Usage

1. **Prepare the Data**
   - Place the necessary datasets (e.g., `PoliceKillingsUS.csv`, `MedianHouseholdIncome2015.csv`, `PercentagePeopleBelowPovertyLevel.csv`, etc.) in the working directory.

2. **Run the Scripts**
   - Execute the following scripts in RStudio or another R environment:
     - `Racial_Composition_Analysis.R`
     - `Graduation_vs_Poverty_Correlation.R`
     - `Victim_Age_Distribution.R`
     - `Median_Household_Income_Analysis.R`
     - `Poverty_Rates_Analysis.R`
     - `Deaths_By_Race_Analysis.R`

3. **Output**
   - Visualizations and models are saved as PDF files in the working directory.

## Code Structure

- **Racial_Composition_Analysis.R**
  - Bar chart showing racial composition in the top 5 cities with the most police shootings.

- **Graduation_vs_Poverty_Correlation.R**
  - Scatter plot visualizing the relationship between graduation and poverty rates.

- **Victim_Age_Distribution.R**
  - Histogram and boxplot visualizing age distribution and median ages of victims by race.

- **Median_Household_Income_Analysis.R**
  - Point plot displaying median household incomes for the top 5 cities.

- **Poverty_Rates_Analysis.R**
  - Horizontal bar chart of poverty rates in the most dangerous cities.

- **Deaths_By_Race_Analysis.R**
  - Bar chart illustrating distribution of deaths by race in the top cities.

## Requirements

- **R Environment**: Preferably RStudio.
- **Packages**:
  - `GISTools`
  - `RColorBrewer`
  - `Cairo`

## File Outputs

- `Racial_Composition_Analysis.pdf`: Racial composition by city.
- `Graduation_vs_Poverty_Correlation.pdf`: Poverty vs. graduation rate correlation.
- `Victim_Age_Distribution.pdf`: Victim age distribution and median ages by race.
- `Median_Household_Income_Analysis.pdf`: Median household income by city.
- `Poverty_Rates_Analysis.pdf`: Poverty rates in top 5 cities.
- `Deaths_By_Race_Analysis.pdf`: Deaths by race in top cities.

## License

This project is licensed under the MIT License. See the LICENSE file for details.

## Important Note

This project is a study of socioeconomic and racial disparities linked to police shootings in California. It serves as an educational resource to foster understanding of how data visualization can illuminate complex societal issues.

