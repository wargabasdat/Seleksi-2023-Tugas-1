import os
import json
import pandas as pd
import matplotlib.pyplot as plt

path = 'D:/aslab/Basdat/seleksi 1/Seleksi-2023-Tugas-1/Data Scraping/data/data.json'
path_visualisasi = 'D:/aslab/Basdat/seleksi 1/Seleksi-2023-Tugas-1/Data Visualization/visualisasi/'
with open(path) as json_file:
    data = json.load(json_file)

df_match = pd.DataFrame(data['match_info'])
to_int = ["assist_A", "steal_A", "block_A", "turnover_A", "pts_off_turnover_A"]
df_match[to_int] = df_match[to_int].astype(int)

school = "SMA GLORIA 1 SURABAYA"
df_team_A = df_match.loc[(df_match["team_A"] == school) & (df_match["type"] == "Girls")]
to_int = ["2pts_A", "3pts_A", "free_throw_A"]

def split(value):
    made, attempt = value.split("/")
    return int(made)

for column in to_int:
    df_team_A[f"{column}_made"] = df_team_A[column].apply(split)

total_match = len(df_team_A)
idx = range(total_match)
width = 0.35

# stacked bar
plt.figure(figsize=(10,6))
plt.bar(idx, df_team_A["pts_off_turnover_A"], width, label="points off to", color="orange")
for column in to_int:
    plt.bar(idx, df_team_A[f"{column}_made"], width, bottom=df_team_A["pts_off_turnover_A"], label=f"{column} made") 

plt.xlabel("Match")
plt.ylabel("Total")
plt.title("TOTAL SKOR SMA GLORIA 1 SURABAYA (GIRLS) DBL SEASON 2022")
plt.legend()
plt.xticks(idx, [f"Match {i+1}" for i in range(total_match)])
save_path = os.path.join(path_visualisasi, 'Visualisasi_Skor_Gloria1.png')
plt.savefig(save_path)

total_asssist = df_team_A["assist_A"].sum()
total_steal = df_team_A["steal_A"].sum()
total_block = df_team_A["block_A"].sum()
total_turnover = df_team_A["turnover_A"].sum()

sum = [total_asssist, total_steal, total_block, total_turnover]
label = ["Assist", "Steal", "Block", "Turnover"]

# pie chart
plt.figure(figsize=(8,8))
plt.pie(sum, labels=label, autopct="%1.1f%%", startangle=90)
plt.title("STATISTIK PERTANDINGAN SMA GLORIA 1 SURABAYA (GIRLS)", fontsize=15)
save_path = os.path.join(path_visualisasi, 'Visualisasi_Pertandingan_Gloria1.png')
plt.savefig(save_path)