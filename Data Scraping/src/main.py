import hsr_scraper as hsr
import json

#Memperoleh data stats karakter
character_stats_dict = hsr.character_stats_scraper()
with open("character_stats.json", "w") as f1:
    json.dump(character_stats_dict, f1, indent=1)   #Menuliskan hasilnya ke file "character_stats.json"

#Memperoleh data materials karakter
character_materials_dict = hsr.character_materials_scraper()
with open("character_materials.json", "w") as f2:
    json.dump(character_materials_dict, f2, indent=1)   #Menuliskan hasilnya ke file "character_materials.json"

#Memperoleh data stats light cones
light_cones_dict = hsr.light_cones_scraper()
with open("light_cones_stats.json", "w") as f3:
    json.dump(light_cones_dict, f3, indent=1)   #Menuliskan hasilnya ke file "light_cones_stats.json"

#Memperoleh data paths
paths_dict = hsr.paths_scraper()
with open("paths.json", "w") as f4:
    json.dump(paths_dict, f4, indent=1) #Menuliskan hasilnya ke file "paths.json"

#Memperoleh data elements
elements_dict = hsr.elements_scraper()
with open("elements.json", "w") as f5:
    json.dump(elements_dict, f5, indent=1)  #Menuliskan hasilnya ke file "elements.json"

#Memperoleh data prefered light cones tiap karakter
prefered_light_cones_dict = hsr.prefered_pair()
with open("prefered_pairs.json", "w") as f6:
    json.dump(prefered_light_cones_dict, f6, indent=1)  #Menuliskan hasilnya ke file "prefered_pairs.json"

#Memperoleh data nama material
materials_dict = hsr.materials_scraper()
with open("materials.json", "w") as f7:
    json.dump(materials_dict, f7, indent=1)