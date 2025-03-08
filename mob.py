#Analyzing the data
import pandas as pd
df=pd.read_csv(r"C:\Users\anbur\OneDrive\Desktop\sales\Mobiles _Dataset.csv")
#print(df.head())
#print(df.info())
#print(df.isnull().sum())
#print(df.columns)
#print(df.duplicated())
 #Cleaning the data
    #removing duplicates
df.drop_duplicates(inplace=True)
#filling null values

# Check percentage of missing values
#missing_percentage = (df.isnull().sum() / len(df)) * 100
#print(missing_percentage)

#replacing categorical missing values with mode
categorical_cols = ["Company Name", "Model Name", "Processor"]
for col in categorical_cols:
   df[col] = df[col].fillna(df[col].mode()[0])  # Reassign column

#replacing numerical column with median(as it may have outliers)
#1 removing the INR,PKR IN NUMBERIC FIELDS
price_columns = [
    'Launched Price (Pakistan)',
    'Launched Price (India)',
    'Launched Price (China)',
    'Launched Price (USA)',
    'Launched Price (Dubai)'
]
for col in price_columns:
    df[col] = df[col].astype(str).str.replace(r'[^\d.]', '', regex=True)  # Remove currency symbols and commas
    df[col] = pd.to_numeric(df[col], errors='coerce')  # Convert to numeric, setting invalid values to NaN
    df[col] = df[col].fillna(df[col].median())

#for replacing the null values of launched year
df["Launched Year"] = df["Launched Year"].fillna(df["Launched Year"].mode()[0])
#print(df.isnull().sum())
#doing again
categorical_cols = ["Mobile Weight", "RAM", "Front Camera", "Back Camera", "Battery Capacity", "Screen Size"]
for col in categorical_cols:
   df[col] = df[col].fillna(df[col].mode()[0])  # Fill with most frequent value (mode)

price_cols = ["Launched Price (Pakistan)", "Launched Price (India)",
              "Launched Price (China)", "Launched Price (USA)", "Launched Price (Dubai)"]

# Convert prices to numeric (remove non-numeric symbols)
for col in price_cols:
   df[col] = df[col].replace(r'[^\d.]', '', regex=True)  # Remove symbols
   df[col] = pd.to_numeric(df[col], errors='coerce')  # Convert to float
   df[col] = df[col].fillna(df[col].median())  # Fill missing with median
print(df.isnull().sum())
print(df.info())

# Define price columns
price_cols = ["Launched Price (Pakistan)", "Launched Price (India)",
              "Launched Price (China)", "Launched Price (USA)", "Launched Price (Dubai)"]

# Function to remove non-numeric characters
df[price_cols] = df[price_cols].replace(r'[^0-9.]', '', regex=True).astype(float)


# Cleaning numerical columns
df["Battery Capacity"] = df["Battery Capacity"].str.replace("mAh", "").str.replace(",", "").astype(float)

# If missing values exist, fill them with mean/median before converting
df["Battery Capacity"].fillna(df["Battery Capacity"].median())

df["Mobile Weight"] = df["Mobile Weight"].str.replace("g", "").astype(float)
print(df.describe())  # Summary for numerical columns
print(df.info())  # Check data types and null values
df.to_csv(r"C:\Users\anbur\OneDrive\Desktop\cleaned_mobile_data.csv", index=False)





