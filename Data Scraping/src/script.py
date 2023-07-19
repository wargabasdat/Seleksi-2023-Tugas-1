import requests
from bs4 import BeautifulSoup
import json

URL = "https://glints.com/id/lowongan-kerja"
page = requests.get(URL)

soup = BeautifulSoup(page.content, "html.parser")
results = soup.find(id="app")
job = results.find_all("div", class_="JobCardsc__JobcardContainer-sc-hmqj50-0 kWccWU CompactOpportunityCardsc__CompactJobCardWrapper-sc-dkg8my-0 kwAlsu compact_job_card")

data = []  # List to store job data

for i in job:
    title = i.find("h3", class_="CompactOpportunityCardsc__JobTitle-sc-dkg8my-7 jJvzUD").text.strip()
    company = i.find("a", class_="CompactOpportunityCardsc__CompanyLink-sc-dkg8my-8 btWyBR").text.strip()
    other = i.find_all("div", class_="CompactOpportunityCardsc__OpportunityInfo-sc-dkg8my-13 cwvfMn")
    location = other[0].text.strip().split(", ")
    kecamatan = location[0]
    kota = location[1]
    provinsi = location[2]
    negara = location[3]
    salary = other[1].text.strip()
    experience = other[2].text.strip()
    education = other[3].text.strip()
    others = i.find("a", class_="CompactOpportunityCardsc__CardAnchorWrapper-sc-dkg8my-17 cLLjmr job-search-results_job-card_link").find_next()
    category = others["data-gtm-job-category"]
    company_id = others["data-gtm-job-company-id"]
    job_id = others["data-gtm-job-id"]
    job_idx = others["data-gtm-job-idx"]
    
    # Create a dictionary to store the job data
    job_data = {
        "job_idx": job_idx,
        "job_id": job_id,
        "title": title,
        "category": category,
        "company_id": company_id,
        "company": company,
        "kecamatan" : kecamatan,
        "kota" : kota,
        "provinsi": provinsi,
        "negara": negara,
        "salary": salary,
        "experience": experience,
        "education": education
    }
    
    data.append(job_data)  # Add the job data to the list

# Save the data to a JSON file
with open("job_data.json", "w") as file:
    json.dump(data, file, indent=4)

print("Data saved to job_data.json file.")
