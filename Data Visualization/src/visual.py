import os
import json
import pandas as pd
import matplotlib.pyplot as plt

path = 'D:/aslab/Basdat/seleksi 1/Seleksi-2023-Tugas-1/Data Scraping/data/data.json'
path_visualisasi = 'D:/aslab/Basdat/seleksi 1/Seleksi-2023-Tugas-1/Data Visualization/visualisasi/'
with open(path) as json_file:
    data = json.load(json_file)

df_match = pd.DataFrame(data['match_info'])
to_int = ["assist_A", "steal_A", "block_A", "turnover_A", "pts_off_turnover_A", "assist_B", "steal_B", "block_B", "turnover_B", "pts_off_turnover_B"]
df_match[to_int] = df_match[to_int].astype(int)

school = "SMA GLORIA 1 SURABAYA"
df_team_A = df_match.loc[(df_match["team_A"] == school) & (df_match["type"] == "Girls")]
total_asssist = df_team_A["assist_A"].sum()
total_steal = df_team_A["steal_A"].sum()
total_block = df_team_A["block_A"].sum()
total_turnover = df_team_A["turnover_A"].sum()
total_pts_off_turnover = df_team_A["pts_off_turnover_A"].sum()

df_team_B = df_match.loc[(df_match["team_B"] == school) & (df_match["type"] == "Girls")]
total_asssist += df_team_A["assist_B"].sum()
total_steal += df_team_A["steal_B"].sum()
total_block += df_team_A["block_B"].sum()
total_turnover += df_team_A["turnover_B"].sum()
total_pts_off_turnover += df_team_A["pts_off_turnover_B"].sum()

sum = [total_asssist, total_steal, total_block, total_turnover, total_pts_off_turnover]
label = ["Assist", "Steal", "Block", "Turnover", "Pts_Off_Turnover"]

# pie chart
plt.figure(figsize=(8,8))
plt.pie(sum, labels=label, autopct="%1.1f%%", startangle=90)
plt.title("STATISTIK PERTANDINGAN SMA GLORIA 1 SURABAYA (GIRLS)", fontsize=15)
save_path = os.path.join(path_visualisasi, 'Visualisasi_Pertandingan_Gloria1.png')
plt.savefig(save_path)