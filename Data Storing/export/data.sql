-- Create the Job table
CREATE TABLE Job (
  job_idx INT PRIMARY KEY,
  job_id VARCHAR(255),
  title VARCHAR(255),
  category VARCHAR(255),
  company_id INT,
  location_id INT,
  salary VARCHAR(255),
  experience VARCHAR(255),
  education VARCHAR(255),
  FOREIGN KEY (company_id) REFERENCES Company(company_id),
  FOREIGN KEY (location_id) REFERENCES Location(location_id)
);

-- Create the Company table
CREATE TABLE Company (
  company_id INT PRIMARY KEY,
  company VARCHAR(255)
);

-- Create the Location table
CREATE TABLE Location (
  location_id INT PRIMARY KEY,
  kecamatan VARCHAR(255),
  kota VARCHAR(255),
  provinsi VARCHAR(255),
  negara VARCHAR(255)
);

-- Insert data into the Company table
INSERT INTO Company (company_id, company)
VALUES
    ('14593abb-661f-466c-8b16-079a0e7b9357', 'PT. PILAR UTAMA TRANSINDO'),
    ('220191ea-f9db-4e08-ac3b-5b0c1e1830f6', 'PT Zkteco Security Indonesia'),
    ('89707f33-221e-4b46-930a-a8dd888e4fee', 'PT Indotruck Utama'),
    ('7de93279-4d0d-4804-abdf-16394a8f145d', 'PT Jago Bahasa Inspira'),
    ('e1aabbd7-60fc-4923-823f-2969a73dfb9a', 'Idein Branding & Advertising'),
    ('e2802b13-e147-4fee-acd5-45237b16c7f5', 'PT Indium Dinamika Solusindo'),
    ('b0d8ddc6-2851-418f-bb78-0c1d0e890d03', 'Pt Login Megastore'),
    ('6f629c51-e65e-4e4e-9d18-cc0b79fbd3cf', 'Trdfin Support Service Pvt Ltd'),
    ('0bcb1ac4-e008-45d6-ad94-79b278245087', 'OTT InfoTech'),
    ('5c8412be-3a21-497e-a47b-c716fcdf3716', 'PT VPlus Platinum 8 Indonesia'),
    ('fa7bf843-ba5a-4136-8428-ee3b3f3afc87', 'PT. Sumber Makmur Surya Perkasa'),
    ('4bd4a98f-3dd9-4275-9045-8f910939b788', 'PT Mega Kapuas Dinamik'),
    ('5522a527-d8ae-4a8e-9999-8ce7699b677c', 'SDIT Bina Mujtama'),
    ('4e90ef17-85d9-4e98-a8b6-c356d0fb43b2', 'Livit International'),
    ('5039e469-96ce-43e2-8b49-254265b12a64', 'SIMGROUP'),
    ('a43162aa-23a5-4158-b5d1-361b1118b648', 'Peluangkerjaku');

-- Insert data into the Location table
INSERT INTO Location (location_id, kecamatan, kota, provinsi, negara)
VALUES
    (1, 'Semarang Utara', 'Semarang', 'Jawa Tengah', 'Indonesia'),
    (2, 'Penjaringan', 'Jakarta Utara', 'DKI Jakarta', 'Indonesia'),
    (3, 'Cilincing', 'Jakarta Utara', 'DKI Jakarta', 'Indonesia'),
    (4, 'Pare', 'Kab. Kediri', 'Jawa Timur', 'Indonesia'),
    (5, 'Cengkareng', 'Jakarta Barat', 'DKI Jakarta', 'Indonesia'),
    (6, 'Menteng', 'Jakarta Pusat', 'DKI Jakarta', 'Indonesia'),
    (7, 'Sumur Bandung', 'Bandung', 'Jawa Barat', 'Indonesia'),
    (8, 'Pancoran', 'Jakarta Selatan', 'DKI Jakarta', 'Indonesia'),
    (9, 'Ilir Talo', 'Kab. Seluma', 'Bengkulu', 'Indonesia'),
    (10, 'Babul Rahmah', 'Kab. Aceh Tenggara', 'Nanggroe Aceh Darussalam', 'Indonesia'),
    (11, 'Makasar', 'Jakarta Timur', 'DKI Jakarta', 'Indonesia'),
    (12, 'Nongsa', 'Batam', 'Kepulauan Riau', 'Indonesia'),
    (13, 'Setiabudi', 'Jakarta Selatan', 'DKI Jakarta', 'Indonesia'),
    (14, 'Pancoran', 'Jakarta Selatan', 'DKI Jakarta', 'Indonesia'),
    (15, 'Medan Area', 'Medan', 'Sumatera Utara', 'Indonesia'),
    (16, 'Pademangan', 'Jakarta Utara', 'DKI Jakarta', 'Indonesia'),
    (17, 'Genteng', 'Surabaya', 'Jawa Timur', 'Indonesia'),
    (18, 'Dolo', 'Kab. Sigi', 'Sulawesi Tengah', 'Indonesia'),
    (19, 'Kejaksan', 'Cirebon', 'Jawa Barat', 'Indonesia'),
    (20, 'Bumi Raya', 'Kab. Morowali', 'Sulawesi Tengah', 'Indonesia'),
    (21, 'Bojong Gede', 'Kab. Bogor', 'Jawa Barat', 'Indonesia'),
    (22, 'Denpasar Barat', 'Denpasar', 'Bali', 'Indonesia'),
    (23, 'Tallo', 'Makassar', 'Sulawesi Selatan', 'Indonesia'),
    (24, 'Tatanga', 'Palu', 'Sulawesi Tengah', 'Indonesia'),
    (25, 'Semarang Tengah', 'Semarang', 'Jawa Tengah', 'Indonesia');

-- Insert data into the Job table
INSERT INTO Job (job_idx, job_id, title, category, company_id, location_id, salary, experience, education)
VALUES
    (0, 'a6d41aa0-8e74-4be2-9adc-9b7a4d60282a', 'SEO Specialist', 'Marketing', '14593abb-661f-466c-8b16-079a0e7b9357', 1, 'Perusahaan tidak menampilkan gaji', 'Kurang dari setahun', 'Minimal Diploma (D1 - D4)'),
    (1, '6bdcac80-1448-46fb-adf8-070a0e2a3993', 'Sales Manager', 'Business Development & Sales', '220191ea-f9db-4e08-ac3b-5b0c1e1830f6', 2, 'Perusahaan tidak menampilkan gaji', '1 – 3 tahun', 'Minimal Sarjana (S1)'),
    (2, '37650df7-0978-4011-b3f0-d7e54a19afd3', 'Sales Support Officer', 'Business Development & Sales', '89707f33-221e-4b46-930a-a8dd888e4fee', 3, 'Perusahaan tidak menampilkan gaji', '1 – 3 tahun', 'Minimal Sarjana (S1)'),
    (3, '64fbb2e2-dc25-4487-acd9-efc1c4af2deb', 'Social Media Specialist', 'Marketing', '7de93279-4d0d-4804-abdf-16394a8f145d', 4, 'Perusahaan tidak menampilkan gaji', '1 – 3 tahun', 'Minimal Diploma (D1 - D4)'),
    (4, '8e355096-adc5-4263-8b13-f740b099f5b9', 'Sales Executive', 'Business Development & Sales', 'e1aabbd7-60fc-4923-823f-2969a73dfb9a', 5, 'Perusahaan tidak menampilkan gaji', '1 – 3 tahun', 'Minimal Sarjana (S1)'),
    (5, '148cf8e2-77e3-4ff6-b435-92bf992e81ad', 'Agen Asuransi', 'Akuntansi & Keuangan', 'e2802b13-e147-4fee-acd5-45237b16c7f5', 6, 'USD3.000.000 - 5.000.000', '1 – 3 tahun', 'Minimal Sarjana (S1)'),
    (6, '55021bd6-f165-414d-93ee-35d07bc9bc15', 'Manager Marketing', 'Marketing', 'b0d8ddc6-2851-418f-bb78-0c1d0e890d03', 7, 'Perusahaan tidak menampilkan gaji', '3 – 5 tahun', 'Minimal Sarjana (S1)'),
    (7, 'e11cb92f-8557-4b1e-aa8c-6c6b62b87d8b', 'Freelance Trade finance professional', 'Akuntansi & Keuangan', '6f629c51-e65e-4e4e-9d18-cc0b79fbd3cf', 8, 'Perusahaan tidak menampilkan gaji', '', 'Minimal Sarjana (S1)'),
    (8, '45109377-5db2-4f83-b4c8-ddedb36fffdf', 'Freelance Trade finance professional', 'Akuntansi & Keuangan', '6f629c51-e65e-4e4e-9d18-cc0b79fbd3cf', 9, 'Perusahaan tidak menampilkan gaji', '', 'Minimal Sarjana (S1)'),
    (9, 'bc5ae372-6b5d-4696-a397-83820e53bb03', 'Freelance Trade finance professional', 'Akuntansi & Keuangan', '6f629c51-e65e-4e4e-9d18-cc0b79fbd3cf', 10, 'Perusahaan tidak menampilkan gaji', '', 'Minimal Sarjana (S1)'),
    (10, '5ba0e0fc-d09a-40cb-8237-c386c78bb3bf', 'Customer Sales Support 行销客服', 'Business Development & Sales', '0bcb1ac4-e008-45d6-ad94-79b278245087', 11, 'IDR22.000.000 - 25.000.000', 'Kurang dari setahun', 'Minimal SMP'),
    (11, '09587705-697e-4fad-9db2-cd35c11464ae', 'Account Executive 会计助理', 'Business Development & Sales', '0bcb1ac4-e008-45d6-ad94-79b278245087', 12, 'USD1.100 - 1.400', 'Kurang dari setahun', 'Minimal Diploma (D1 - D4)'),
    (12, '9414dd3a-28f6-4fd9-b08c-178d2370ff19', 'Client Advisor', 'Business Development & Sales', '5c8412be-3a21-497e-a47b-c716fcdf3716', 13, 'IDR2.000.000 - 500.000.000', '1 – 3 tahun', 'Minimal SMA/SMK'),
    (13, '0ea1b2e7-6389-45ac-818e-259499d276ee', 'Account Executive 会计助理', 'Business Development & Sales', '0bcb1ac4-e008-45d6-ad94-79b278245087', 14, 'USD1.000 - 1.400', 'Kurang dari setahun', 'Minimal SMA/SMK'),
    (14, '4b79898c-a733-43de-b5d1-e10512e733c2', 'Account Executive 会计助理', 'Business Development & Sales', '0bcb1ac4-e008-45d6-ad94-79b278245087', 15, 'USD1.000 - 1.400', 'Kurang dari setahun', 'Minimal SMA/SMK'),
    (15, '31653272-8a90-4793-b318-2287768ab972', 'Customer Service Representative 行销客服', 'Customer Service', '0bcb1ac4-e008-45d6-ad94-79b278245087', 16, 'USD1.000 - 1.400', 'Kurang dari setahun', 'Minimal SMA/SMK'),
    (16, '023e63cc-9976-4215-9f4f-40a5bd1d46d6', 'Desain Grafis (Internship)', 'Lainnya', '4bd4a98f-3dd9-4275-9045-8f910939b788', 17, 'Perusahaan tidak menampilkan gaji', 'Kurang dari setahun', 'Minimal SMA/SMK'),
    (17, '997a6f26-99d8-4d13-a1d5-66fe4b9acc44', 'Procurement Staff', 'Purchasing, Procurement & Trade', 'fa7bf843-ba5a-4136-8428-ee3b3f3afc87', 18, 'Perusahaan tidak menampilkan gaji', 'Kurang dari setahun', 'Minimal Sarjana (S1)'),
    (18, '0af2ede4-e668-41c8-9d32-c378d8b280b5', 'Trade Finance Professional', 'Akuntansi & Keuangan', '6f629c51-e65e-4e4e-9d18-cc0b79fbd3cf', 19, 'Perusahaan tidak menampilkan gaji', '', 'Minimal Sarjana (S1)'),
    (19, 'e5f7c1bb-a13a-4190-a7b9-99ff843c98e3', 'Freelance Trade Finance Professional', 'Akuntansi & Keuangan', '6f629c51-e65e-4e4e-9d18-cc0b79fbd3cf', 20, 'Perusahaan tidak menampilkan gaji', '', 'Minimal Sarjana (S1)'),
    (20, '660e85c1-e092-46c6-8b4c-077cd1935283', 'Freelance Trade Finance Professional', 'Akuntansi & Keuangan', '6f629c51-e65e-4e4e-9d18-cc0b79fbd3cf', 21, 'Perusahaan tidak menampilkan gaji', '', 'Minimal Sarjana (S1)'),
    (21, 'af28ea85-c0f3-4c61-98dc-8df4fdac71f4', 'Guru Piket', 'Pendidikan & Pelatihan', '5522a527-d8ae-4a8e-9999-8ce7699b677c', 22, 'Perusahaan tidak menampilkan gaji', 'Kurang dari setahun', 'Minimal Sarjana (S1)'),
    (22, 'efc8861e-697e-4768-9740-bd6df3608662', 'Marketing and Business Development Intern', 'Lainnya', '4e90ef17-85d9-4e98-a8b6-c356d0fb43b2', 23, 'Perusahaan tidak menampilkan gaji', 'Kurang dari setahun', 'Minimal Sarjana (S1)'),
    (23, '2da82fee-11f9-4c83-8e11-fccec8c54e9d', 'Technical Engineering Intern', 'Lainnya', '4e90ef17-85d9-4e98-a8b6-c356d0fb43b2', 23, 'Perusahaan tidak menampilkan gaji', 'Kurang dari setahun', 'Minimal Sarjana (S1)'),
    (24, 'af08e7a6-ae74-46d6-9e2d-803e705f46f4', 'Junior Software Engineer', 'Pengembangan Perangkat Lunak', '5039e469-96ce-43e2-8b49-254265b12a64', 24, 'Perusahaan tidak menampilkan gaji', '1 – 3 tahun', 'Minimal Diploma (D1 - D4)'),
    (25, '33e0a67d-5201-4d39-a15b-527c16912ed3', 'Mechanical Engineer', 'Teknik', 'a43162aa-23a5-4158-b5d1-361b1118b648', 25, 'Perusahaan tidak menampilkan gaji', '1 – 3 tahun', 'Minimal Sarjana (S1)');

COMMIT;
