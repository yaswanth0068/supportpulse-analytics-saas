import pandas as pd
import sqlite3

df = pd.read_csv('../Dataset/Cleaned/support_tickets_cleaned.csv')
conn = sqlite3.connect('../SQL/supportpulse.db')
df.to_sql('tickets', conn, if_exists='replace', index=False)
conn.close()
print("Loaded into SQL/supportpulse.db, table 'tickets'")