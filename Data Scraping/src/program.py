from selenium import webdriver
from selenium.webdriver.common.by import By
import json
import time

#Fungsi untuk mengambil data dari 1 laman website 
def getdata(url,driver):
    result = [] #inisiasi array result

    #akses ke website
    driver.get(url)
    driver.implicitly_wait(10)

    #Mengambil data
    shadow_root = driver.find_element(By.TAG_NAME,'container-listing-doctor').shadow_root
    shadow_text1 = shadow_root.find_element(By.CLASS_NAME,'container')
    doctors = shadow_text1.find_elements(By.TAG_NAME,'card-item-list-mobile')

    #iterasi untuk setiap data
    for doctor in doctors:
        doc = doctor.shadow_root

        #Info Dokter
        info = doc.find_element(By.CLASS_NAME,'d_panel_card_info')

        #Ambil nama dokter
        name = info.find_element(By.TAG_NAME,'div').text

        #Ambil nama rumah sakit
        details = info.find_elements(By.TAG_NAME,'alo-label')
        detail = details[1].text
        namars, kecamatan, kota = parse_hospital(detail)
        
        #Ambil berapa yang udah buat janji
        janji = info.find_element(By.TAG_NAME,'booking-count-mobile').text.split(" ")[0]

        #Ulasan
        ulasan = doc.find_elements(By.CLASS_NAME,'info_el')[0].text

        #Rating
        data = ulasan.splitlines()
        rating = None
        total = None
        if (len(data) != 0 ):
            rating = data[1]
            total = data[2].replace("(","").replace(")","")
            
        #Harga
        price = None
        harga = doc.find_elements(By.CLASS_NAME,'info_el')[1].text
        hargaparse = harga.splitlines()
        if (len(hargaparse) != 0):
            price = hargaparse[1].replace("Rp","").replace(".","")

        #Daftarkan ke list
        result.append({'nama': name, 'harga': price, 'rating': rating, 'total_rating': total, 'jumlah_booking': janji, 'rumah_sakit': namars, 'kecamatan': kecamatan, 'kota': kota})
    return result
    
#Memisahkan setiap informasi yang terdapat dalam elemen rumah sakit
def parse_hospital(rumahsakit):
    listdata = rumahsakit.split(", ")
    name = listdata[0]
    if (len(listdata) == 3):
        kecamatan = listdata[1]
        kota = listdata[2]
    elif (len(listdata) == 2):
        kecamatan = None
        kota = listdata[1]
    return name,kecamatan,kota

#ALGORITMA UTAMA
options = webdriver.ChromeOptions()
options.add_experimental_option("detach",True)
options.add_argument("user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36")
driver = webdriver.Chrome(options=options)

#inisialisasi array hasil
listresult = []

#iterasi untuk tiap laman web
for i in range(1,16):
    url = f"https://www.alodokter.com/cari-dokter/dokter-umum?page={i}"
    data = getdata(url,driver)
    for result in data:
        listresult.append(result)
    time.sleep(5)

#Menyimpan data ke file JSON
with open('Data Scraping/data/doctor.json', 'w') as file:
    json.dump(listresult, file)

driver.quit()