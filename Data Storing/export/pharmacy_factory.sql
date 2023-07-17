--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    customer_id character varying(15)[] NOT NULL,
    number character varying(15)[] NOT NULL,
    address text
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- Name: customer_drugstore; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_drugstore (
    customer_id character varying(15)[] NOT NULL,
    drugstore_id character varying(15)[] NOT NULL,
    drugstorename character varying(30)[] NOT NULL
);


ALTER TABLE public.customer_drugstore OWNER TO postgres;

--
-- Name: customer_hospital; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_hospital (
    customer_id character varying(15)[] NOT NULL,
    hospital_id character varying(10)[] NOT NULL,
    hospital_name character varying(20)[] NOT NULL
);


ALTER TABLE public.customer_hospital OWNER TO postgres;

--
-- Name: customer_personal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_personal (
    customer_id character varying(15)[] NOT NULL,
    first_name character varying(20)[],
    last_name character varying(30)[]
);


ALTER TABLE public.customer_personal OWNER TO postgres;

--
-- Name: drug; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.drug (
    name text NOT NULL,
    weight real,
    description text,
    categories text
);


ALTER TABLE public.drug OWNER TO postgres;

--
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee (
    employee_id character varying(10)[] NOT NULL,
    first_name character varying(20)[] NOT NULL,
    last_name character varying(30)[] NOT NULL,
    phone_number character varying(15)[],
    address text,
    dateofbirth date
);


ALTER TABLE public.employee OWNER TO postgres;

--
-- Name: transaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transaction (
    drug_name text NOT NULL,
    employee_id character varying(10)[] NOT NULL,
    customer_id character varying(15)[] NOT NULL,
    "time" timestamp without time zone NOT NULL
);


ALTER TABLE public.transaction OWNER TO postgres;

--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer (customer_id, number, address) FROM stdin;
\.


--
-- Data for Name: customer_drugstore; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_drugstore (customer_id, drugstore_id, drugstorename) FROM stdin;
\.


--
-- Data for Name: customer_hospital; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_hospital (customer_id, hospital_id, hospital_name) FROM stdin;
\.


--
-- Data for Name: customer_personal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_personal (customer_id, first_name, last_name) FROM stdin;
\.


--
-- Data for Name: drug; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.drug (name, weight, description, categories) FROM stdin;
1-Palmitoyl-2-oleoyl-sn-glycero-3-(phospho-rac-(1-glycerol))	749.02	A synthetic lung surfactant used to treat infant respiratory distress syndrome.	\N
1,2-Benzodiazepine	144.177	Benzodiazepine is under investigation for the prevention of Delirium and C.Surgical Procedure; Cardiac. Benzodiazepine has been investigated for the treatment of Obesity, Sleep Apnea, Obstructive, and Disorders of Gallbladder, Biliary...	Benzazepines
1,2-Distearoyllecithin	790.161	Not Annotated	Glycerophosphates
1,2-icosapentoyl-sn-glycero-3-phosphoserine	842.064	Not Annotated	\N
2-mercaptobenzothiazole	167.251	Not Annotated	Standardized Chemical Allergen
2,2'-Dibenzothiazyl disulfide	332.47	2,2'-Dibenzothiazyl disulfide is approved for use within allergenic epicutaneous patch tests which are indicated for use as an aid in the diagnosis of allergic contact dermatitis (ACD) in persons 6...	Latex Hypersensitivity
4-(Isopropylamino)diphenylamine	226.323	4-(Isopropylamino)diphenylamine is approved for use within allergenic epicutaneous patch tests which are indicated for use as an aid in the diagnosis of allergic contact dermatitis (ACD) in persons 6 years...	Antioxidants
5-O-phosphono-alpha-D-ribofuranosyl diphosphate	390.0696	The key substance in the biosynthesis of histidine, tryptophan, and purine and pyrimidine nucleotides.	Pentosephosphates
Abacavir	286.3323	An antiviral nucleoside reverse transcriptase inhibitor used in combination with other antiretrovirals for the treatment of HIV.	Anti-HIV Agents
Abametapir	184.242	A pediculicide metalloproteinase used topically in the treatment of head lice infection.	Antiparasitic Products, Insecticides and Repellents
Abarelix	1416.09	For palliative treatment of advanced prostate cancer.	Hormone Antagonists
Abemaciclib	506.606	A medication used to treat HR+ HER2- advanced or metastatic breast cancer.	Cyclin-dependent kinase (CDK) inhibitors
Abiraterone	349.509	An antiandrogen used in the treatment of prostate cancer.	Androstenes
Abrocitinib	323.42	A kinase inhibitor used to treat moderate-to-severe atopic dermatitis in adults.	Agents for Dermatitis, Excluding Corticosteroids
Acalabrutinib	465.517	A Bruton tyrosine kinase inhibitor used to treat mantle cell lymphoma, chronic lymphocytic leukemia, and small lymphocytic lymphoma.	Bruton's tyrosine kinase (BTK) inhibitors
Acamprosate	181.21	A medication used to maintain alcohol abstinence in patients with alcohol dependence.	Alcohol Deterrents
Acarbose	645.608	An alpha-glucosidase inhibitor used in adjunctly with diet and exercise for the management of glycemic control in patients with type 2 diabetes mellitus.	Glycoside Hydrolase Inhibitors
Acebutolol	336.4259	A selective β1-receptor antagonist used for the management of hypertension and ventricular premature beats in adults.	Antihypertensive Agents
Aceclidine	169.224	Aceclidine has been marketed in Europe but has not been used clinically in the United States. It is used in the treatment of open-angle glaucoma and is a parasympathomimetic agent.	Parasympathomimetics
Aceclofenac	354.18	Aceclofenac is indicated for the relief of pain and inflammation in osteoarthritis, rheumatoid arthritis and ankylosing spondylitis.	Acetic Acid Derivatives and Related Substances
Acemetacin	415.83	A NSAID indicated in the treatment of pain and inflammation.	Acetic Acid Derivatives and Related Substances
Acenocoumarol	353.3255	An anticoagulant drug used in the prevention of thromboembolic diseases in infarction and transient ischemic attacks, as well as management of deep vein thrombosis and myocardial infarction.	Vitamin K Antagonists
Acetaminophen	151.1626	An analgesic drug used alone or in combination with opioids for pain management, and as an antipyretic agent.	Anilides
Acetarsol	275.0903	An anti infective used to treat a wide variety of infections in the body.	Arsenicals
Acetazolamide	222.245	A carbonic anhydrase inhibitor used to treat edema from heart failure or medications, certain types of epilepsy, and glaucoma.	Sulfonamides
Acetic acid	60.052	An antimicrobial agent used to treat susceptible infections of the external auditory canal.	Organic Acids
Acetohexamide	324.395	Used in the management of diabetes mellitus type 2 (adult-onset).	Sulfonylureas
Acetohydroxamic acid	75.0666	A synthetic urea derivative used to treat urea splitting bacterial infections of the urinary tract.	Enzyme Inhibitors
Acetophenazine	411.56	For the treatment of disorganized and psychotic thinking. Also used to help treat false perceptions (e.g. hallucinations or delusions.)	Phenothiazines With Piperazine Structure
Acetyl sulfisoxazole	309.34	Acute, recurrent or chronic urinary tract infections (primarily pyelonephritis, pyelitis and cystitis) due to susceptible organisms (usually Escherichia coli, Klebsiella-Enterobacter, staphylococcus, Proteus mirabilis and, less frequently, Proteus vulgaris) in the...	Sulfonamides
Acetylcarnitine	203.238	An acetylated form of the amino acid derivative L-carnitine that assists in mitochondrial fatty acid metabolism. It is under investigation as a treatment for numerous conditions, including neuropathy, depression, and dementia.	Nootropic Agents
Acetylcholine	146.2074	A parasympathomimetic neurotransmitter used to induce miosis of the iris in seconds after delivery of the lens in cataract surgery, in penetrating keratoplasty, iridectomy and other anterior segment surgery where rapid miosis may be required.	Parasympathomimetics
Acetylcysteine	163.195	A medication that can be used as a mucolytic in patients with certain lung conditions and as an antidote for acetaminophen overdose.	Antidote for Acetaminophen Overdose
Acetyldigitoxin	806.9757	Used for fast digitalization in congestive heart failure.	Digitalis Glycosides
Acetylene	26.038	A component of a medical gas indicated for lung function testing.	Alkynes
Acetylsalicylic acid	180.1574	A salicylate used to treat pain, fever, inflammation, migraines, and reducing the risk of major adverse cardiovascular events.	Platelet Aggregation Inhibitors Excl. Heparin
Acipimox	154.125	A niacin derivative used in Fredrickson type IIb and type IV hyperlipoproteinemia.	Nicotinic Acid and Derivatives
Acitretin	326.4293	An oral retinoid used in the treatment of severe psoriasis.	Retinoids for Treatment of Psoriasis
Aclidinium	484.651	An inhaled long-acting anticholinergic used as a maintenance bronchodilator in patients with chronic obstructive pulmonary disease (COPD).	Agents producing tachycardia
Acrivastine	348.4382	An antihistamine agent used for the symptomatic relief of seasonal allergic rhinitis such as sneezing, rhinorrhea, pruritus, lacrimation, and nasal congestion.	Histamine H1 Antagonists
Activated charcoal	12.011	A gastric decontamination agent used in emergency clinical settings as a antidote to treat poisonings following excessive oral ingestion of certain medications or poisons.	Charcoal Preparations
Acyclovir	225.2046	A guanosine analog used to treat herpes simplex, varicella zoster, herpes zoster.	Nucleosides and Nucleotides Excl. Reverse Transcriptase Inhibitors
Adagrasib	604.13	A KRAS inhibitor indicated for the treatment of locally advanced or metastatic KRAS G12C-mutated non-small cell lung cancer in patients who have received at least one prior systemic therapy.	Antineoplastic Agents
Adapalene	412.5201	A third-generation topical retinoid with anti-comedogenic, comedolytic, and anti-inflammatory properties used to treat acne vulgaris in adolescents and adults.	Retinoids for Topical Use in Acne
Adefovir dipivoxil	501.4705	A nucleotide analog used to treat chronic hepatitis B.	Nucleoside and Nucleotide Reverse Transcriptase Inhibitors
Ademetionine	398.44	S-Adenosylmethionine (SAMe) is used as a drug in Europe for the treatment of depression, liver disorders, fibromyalgia, and osteoarthritis. It has also been introduced into the United States market as...	Amino Acids and Derivatives
Adenine	135.1267	A purine base which forms a component of DNA among other functions and is present in many multivitamins.	Purines
Adenosine	267.2413	A medication used in myocardial perfusion scintigraphy and to treat supraventricular tachycardia.	Agents producing tachycardia
Adenosine phosphate	347.2212	For nutritional supplementation, also for treating dietary shortage or imbalance	Adenine Nucleotides
Adiphenine	311.425	Not Annotated	Acids, Carbocyclic
Afamelanotide	1646.8452	An injectable subcutaneous implant used to mitigate phototoxicity secondary to erythropoietic protoporphyria (EPP).	Protectives Against UV-Radiation for Systemic Use
Afatinib	485.938	An antineoplastic agent used for the treatment of locally advanced or metastatic non-small cell lung cancer (NSCLC) with non-resistant EGFR mutations or resistance to platinum-based chemotherapy.	Epidermal growth factor receptor (EGFR) tyrosine kinase inhibitors
Agomelatine	243.301	Agomelatine is indicated to treat major depressive episodes in adults.	Melatonin, agonists
Ajmaline	326.4326	An antiarrhythmic used to manage a variety of forms of tachycardias.	Antiarrhythmics, Class Ia
Alatrofloxacin	558.518	A fluoroquinolone antibiotic used to treat a variety of bacterial infections.	Anti-Infective Agents
Albendazole	265.331	A benzimidazole anthelmintic used to treat parenchymal neurocysticercosis and other helminth infections.	Benzimidazole Derivatives
Alcaftadine	307.3895	A H1 histamine receptor antagonist for ophthalmic use to prevent itching associated with allergic conjunctivitis.	Histamine H1 Antagonists
Alclofenac	226.66	Alclofenac is indicated in rheumatology, in particular for the treatment of rheumatoid arthritis, ankylosing spondylitis and, as an analgesic, in painful arthritic pathologies.	Acetic Acid Derivatives and Related Substances
Alclometasone	408.916	A topical corticosteroid used to relieve the symptoms of corticosteroid-responsive dermatoses.	Corticosteroids, Moderately Potent (Group II)
Alcloxa	314.55	Not Annotated	\N
Alectinib	482.6166	A kinase inhibitor used to treat anaplastic lymphoma kinase positive metastatic non small cell lung cancer.	Anaplastic lymphoma kinase (ALK) inhibitors
Alendronic acid	249.096	A bisphosphonate drug that prevents osteoclastic bone resorption which is used for the prevention and treatment of osteoporosis.	Bisphosphonates
Alfacalcidol	400.6371	A vitamin D analogue used for the management of hypocalcemia, secondary hyperparathyroidism, and osteodystrophy in patients with chronic renal failure, as well as some types of rickets and osteomalacia.	Bone Density Conservation Agents
Alfentanil	416.5172	An opioid agonist used to induce and maintain anesthesia, as well as an analgesic.	Opioid Anesthetics
Alfuzosin	389.4488	An alpha-1 adrenergic antagonist used in the symptomatic management of benign prostatic hypertrophy (BPH).	Adrenergic alpha-1 Receptor Antagonists
Alginic acid	0	Indicated for the management of gastric reflux, reflux oesophagitis, hiatus hernia, heartburn (including heartburn of pregnancy) and similar gastric distress .	Alginates
Alimemazine	298.446	An antihistamine agent used to prevent and relieve allergic conditions which cause pruritus and other allergic skin conditions, including urticaria.	Neurotoxic agents
Aliskiren	551.7583	A direct renin inhibitor used to manage hypertension.	Antihypertensive Agents Indicated for Hypertension
Alitretinoin	300.4351	A vitamin A derivative used to treat Kaposi's sarcoma and used off label to treat chronic hand eczema and psoriasis.	Agents for Dermatitis, Excluding Corticosteroids
Allantoin	158.1154	An ingredient used in skin care products to relieve irritation and protect minor cuts, scrapes, and burns.	Dermatologicals
Alloin	418.398	Not Annotated	Laxatives
Allopurinol	136.1115	A xanthine oxidase inhibitor used to reduce urinary and serum uric acid concentrations in patients with gout, recurrent calcium oxalate calculi, and various malignancies.	Preparations Inhibiting Uric Acid Production
Almasilate	280.445	Almasilate is indicated for use as an antacid for the neutralization of excess stomach acid . It is subsequently also used for the symptomatic treatment of diseases where it is...	Pharmaceutic Aids
Almitrine	477.5522	For the treatment of chronic obstructive pulmonary disease.	Respiratory System Agents
Almotriptan	335.464	A 5-HT1B/1D receptor agonist used to treat migraines.	Selective Serotonin 5-HT1 Receptor Agonists
Alogliptin	339.3916	A dipeptidyl peptidase-4 (DPP-4) inhibitor used to treat hyperglycemia in patients with type 2 diabetes mellitus.	DPP-IV Inhibitors
Alosetron	294.351	A 5-HT3 antagonist used to treat diarrhea-predominant IBS.	Gastrointestinal Agents
Alpelisib	441.47	Alpelisib is indicated in combination with fulvestrant to treat postmenopausal women, and men, with advanced or metastatic breast cancer. This cancer must be hormone receptor (HR)-positive, human epidermal growth factor...	Phosphatidylinositol-3-kinase (Pi3K) inhibitors
alpha-Amyl cinnamaldehyde	202.2921	alpha-Amyl cinnamaldehyde is used in allergenic testing.	Perfume
alpha-Arbutin	272.253	Not Annotated	\N
alpha-Linolenic acid	278.4296	A polyunsaturated omega-3 fatty acid found in many supplements.	Fatty Acids, Omega-3
alpha-Tocopherol acetate	0	A form of vitamin E used to treat and prevent vitamin deficiencies.	Antioxidants
alpha-Tocopherol succinate	530.79	A form of vitamin E used to treat and prevent vitamin deficiencies.	Antioxidants
Alprazolam	308.765	A triazolobenzodiazepine with intermediate onset commonly used to treat panic disorders and generalized anxiety in addition to anxiety associated with depression.	Anti-Anxiety Agents
Carboplatin	371.254	A alkylating agent used to treat advanced ovarian cancer.	Coordination Complexes
Alprostadil	354.487	A prostaglandin E1 agonist used for the treatment of erectile dysfunction and as an adjunct for its diagnosis.	Drugs Used in Erectile Dysfunction
Altretamine	210.2794	An antineoplastic agent used in palliative treatment of persistent or recurrent ovarian cancer.	Antineoplastic Agents
Aluminium	26.9815	A metallic element that has the atomic number 13, atomic symbol Al, and atomic weight 26.98.	Aluminium Compounds
Aluminium phosphate	121.9529	Not Available	Aluminium Compounds
Aluminum acetate	204.1136	A medication used for temporary relief of skin irritation.	Acids, Acyclic
Aluminum chloride	133.341	Indicated for the control of minor hemorrhage during dental restorative procedures.\\nIndicated to reduce underarm perspiration.	Aluminium Compounds
Aluminum chlorohydrate	192.46	A compound used as an antiperspirant.	Medicated Dressings With Antiinfectives
Aluminum chlorohydrex propylene glycol	0	Aluminum chlorohydrex propylene glycol is a complex consisting of Aluminum Chorohydrate and propylene glycol (PG). It is an antiperspirant active ingredient found in antiperspirant drug products for over-the-counter human use.	\N
Aluminum hydroxide	78.0036	An antacid used for the symptomatic relief of heartburn, acid indigestion, and sour stomach.	Aluminium Compounds
Aluminum oxide	101.96	Aluminum oxide has a chemical formula Al2O3. It is amphoteric in nature, and is used in various chemical, industrial and commercial applications. It is considered an indirect additive used in...	Aluminium Compounds
Aluminum sesquichlorohydrate	0	An antiperspirant used to reduce sweating.	Alkalies
Aluminum subacetate	162.0769	A medication used to prevent infection and treat irritation around the rectum.	Astringents
Aluminum sulfate	342.151	A medication used to prevent infections and to treat minor bleeding.	Adjuvants, Immunologic
Aluminum zirconium octachlorohydrex gly	263.74	An antiperspirant used to reduce sweating.	\N
Aluminum zirconium pentachlorohydrate	0	Aluminum zirconium pentachlorohydrate is a common active ingredient in personal care products as an antiperspirant agent. Its main mechanism of action is through blocking the pores via formation of polymer...	\N
Aluminum zirconium pentachlorohydrex gly	0	Aluminum zirconium pentachlorohydrex gly, or Aluminum Zirconium Tetrachlorohydrex Glycine, is commonly used as an antiperspirant in many deodorant products. It is a coordination complex of Aluminum Zirconium pentachlorohydrate and glycine....	\N
Aluminum zirconium tetrachlorohydrex gly	0	An antiperspirant used to reduce sweating.	\N
Aluminum zirconium trichlorohydrex gly	0	Aluminum zirconium trichlorohydrex gly is a common active ingredient in deodorant and antiperspirant products for the over-the-counter use. It is consisted of a mixture of monomeric and polymeric Zr4+ and...	\N
Alverine	281.4351	A smooth muscle relaxant used to relieve abdominal pain associated with gastrointestinal conditions like heartburn, flatulence, and Irritable Bowel Syndrome.	Parasympatholytics
Alvimopan	424.5326	An opioid antagonist used to reduce healing time of the upper and lower gastrointestinal tract following surgical procedures that involve bowel resection with primary anastomosis.	Peripheral Opioid Receptor Antagonists
Amantadine	151.2487	A medication used to treat dyskinesia in Parkinson's patients receiving levodopa, as well as extrapyramidal side effects of medications.	Adamantane Derivatives
Ambenonium	537.565	A cholinesterase inhibitor that targets both muscarinic and nicotinic receptors indicated for the treatment of myasthenia gravis.	Parasympathomimetics
Ambrisentan	378.428	A selective type A endothelin receptor antagonist used to treat primary pulmonary arterial hypertension and pulmonary arterial hypertension based on diagnostic classifications.	Antihypertensives for Pulmonary Arterial Hypertension
Ambroxol	378.108	A medication indicated for airway secretion clearance therapy.	Anesthetics, Local
Amcinonide	502.5717	A topical corticosteroid used in the treatment of inflammation and pruritus due to a variety of dermatoses.	Corticosteroids, Potent (Group III)
Amifampridine	109.132	A voltage gated potassium channel blocker used to treat Lambert-Eaton myasthenic syndrome.	Potassium Channel Blockers
Amifostine	214.223	A cytoprotective adjuvant used for reduction in the cumulative renal toxicity in patients with ovarian cancer and moderate to severe xerostomia in patients undergoing post-operative radiation treatment for head and neck cancer.	Detoxifying Agents for Antineoplastic Treatment
Amikacin	585.6025	An aminoglycoside used to treat infections caused by more resistant strains of Gram negative bacteria and some Gram positive bacteria.	Aminoglycoside Antibacterials
Amiloride	229.627	A pyrizine compound used to treat hypertension and congestive heart failure.	Acid Sensing Ion Channel Blockers
Amiloxate	248.322	Indicated as an active sunscreen agent.	Acids, Carbocyclic
Aminobenzoic acid	137.136	A drug used to reduce the progression of penile deviation in Peyronie's Disease in adults.	Protectives Against UV-Radiation for Topical Use
Aminocaproic acid	131.1729	An antifibrinolytic agent used to induce clotting postoperatively.	Amino Acids
Aminoglutethimide	232.2783	An adrenocortical steroid synthesis inhibitor used in the treatment of Cushing's syndrome.	Aromatase Inhibitors
Aminohippuric acid	194.1873	A hippuric acid derivative injection utilized in the measurement of effective renal plasma flow (ERPF) and functional capacity of the renal excretory system.	Tests for Renal Function and Ureteral Injuries
Aminolevulinic acid	131.1299	A porphyrin precursor used to treat actinic keratosis of the face, scalp, and upper extremities, as well as to visualize a glioma.	Sensitizers Used in Photodynamic/radiation Therapy
Aminophenazone	231.2936	An analgesic drug used to treat acute migraine attacks in combination with ergotamine and caffeine.	Pyrazolones
Aminophylline	420.4264	A bronchodilator consisting of theophylline that is used for the treatment of bronchospasm due to asthma, emphysema and chronic bronchitis.	Xanthines and Adrenergics
Aminosalicylic acid	153.1354	An aminosalicylate drug used to induce remission in ulcerative colitis.	Aminosalicylic Acid and Derivatives
Amiodarone	645.3116	A class III antiarrhythmic indicated for the treatment of recurrent hemodynamically unstable ventricular tachycardia and recurrent ventricular fibrillation.	Cytochrome P-450 CYP1A2 Inhibitors
Amisulpride	369.479	A dopamine D2 receptor antagonist used in the treatment of acute and chronic schizophrenia, and in the prevention and treatment of postoperative nausea and vomiting in adults.	Benzamides and benzamide derivatives
Avapritinib	498.57	A selective tyrosine kinase inhibitor being investigated for the treatment of multidrug resistant gastrointestinal tumors.	Kinase Inhibitor
Amitriptyline	277.4033	A tricyclic antidepressant indicated in the treatment of depressive illness, either endogenous or psychotic, and to relieve depression associated anxiety.	Non-Selective Monoamine Reuptake Inhibitors
Amitriptylinoxide	293.41	A tricyclic antidepressant indicated in the treatment of depressive disorders.	Agents that produce hypertension
Amlexanox	298.2934	Used as a paste in the mouth to treat aphthous ulcers (canker sores).	Anti-Allergic Agents
Amlodipine	408.876	A calcium channel blocker used to treat hypertension and angina.	ACE Inhibitors and Calcium Channel Blockers
Ammonia	0	Indicated for use as a smelling salt to treat or prevent fainting.\\n(when radiolabelled) Indicated for diagnostic PET imaging of the myocardium under rest or pharmacologic stress conditions to evaluate...	Gases
Ammonia N-13	16.03	A radioactive diagnostic agent used in PET (positron emission tomography) scans.	Radioactive Diagnostic Agent
Ammonium carbonate	96.086	An expectorant indicated to treat a cough and phlegm.	Alkalies
Ammonium chloride	53.491	Expectorant in cough syrups.\\nThe ammonium ion (NH4+) in the body plays an important role in the maintenance of acid-base balance. The kidney uses ammonium (NH4+) in place of sodium...	Electrolyte Solutions
Ammonium lactate	107.1085	An inorganic compound used for the symptomatic treatment of dry, scaly skin (xerosis) and ichthyosis vulgaris and for temporary relief of itching associated with these conditions.	alpha-Hydroxy Acid
Amobarbital	226.2722	A barbiturate derivative used for the induction of sedation during procedures, short-term management of insomnia, and acute management of refractory tonic-clonic seizures.	Barbiturates, Plain
Amodiaquine	355.861	An antimalarial drug.	Aminoquinolines
Amorolfine	317.517	A morpholine derivative commonly applied as a lacquer for onychomycosis but is also used for superficial dermatomycosis.	Antifungal Agents
Amoxapine	313.781	A tricyclic antidepressant used in the treatment of neurotic or reactive depressive disorders and endogenous or psychotic depression.	Non-Selective Monoamine Reuptake Inhibitors
Amoxicillin	365.404	A penicillin derivative used for the treatment of infections caused by gram-positive bacteria, in particular streptococcal bacteria causing upper respiratory tract infections.	Penicillins With Extended Spectrum
Amphetamine	135.2062	A CNS stimulant and sympathomimetic agent indicated for the treatment of Attention Deficit Hyperactivity Disorder (ADHD).	Centrally Acting Sympathomimetics
Amphotericin B	924.079	An antifungal used to treat fungal infections in neutropenic patients, cryptococcal meningitis in HIV infection, fungal infections, and leishmaniasis.	Anti-Bacterial Agents
Ampicillin	349.405	A penicillin derivative used for the treatment of a variety of infections caused by gram-positive and gram-negative bacteria as well as some anaerobes.	Penicillins With Extended Spectrum
Amprenavir	505.627	A protease inhibitor used to treat HIV infection.	Anti-HIV Agents
Amrinone	187.198	A positive inotropic agent and phosphodiesterase inhibitor used in the management of treatment of congestive heart failure.	Phosphodiesterase Inhibitors
Amsacrine	393.459	A cytotoxic agent used to induce remission in acute adult leukemia that is not adequately responsive to other agents.	Aminoacridines
Amyl Nitrite	117.1463	A fast acting vasodilator used for rapid relief of angina pectoris.	Antidotes
Amylmetacresol	178.275	An antiseptic used to treat infections in the mouth and throat.	Anti-Infective Agents, Local
Amylocaine	235.327	A local and topical anaesthetic agent.	Acids, Carbocyclic
Anagrelide	256.088	A platelet-reducing agent used to treat thrombocythemia, and its related complications, secondary to myeloproliferative neoplasms.	Agents producing tachycardia
Anastrozole	293.3663	A competitive, selective, non-steroidal aromatase inhibitor used as adjuvant therapy for the treatment of hormone receptor-positive breast cancer in postmenopausal women.	Antineoplastic Agents, Hormonal
Anethole	148.205	An excipient added to medications for flavouring.	Flavoring Agents
Anethole trithione	240.35	A medication used to treat dry mouth associated with medication or radiotherapy of the head and neck.	Various Alimentary Tract and Metabolism Products
Anidulafungin	1140.2369	An antifungal used in the treatment of several types of candida infections.	Antifungal Agents
Anileridine	352.4699	An opioid analgesic used to treat moderate to severe pain.	Opioid Anesthetics
Anisindione	252.2647	For the prophylaxis and treatment of venous thrombosis and its extension, the treatment of atrial fibrillation with embolization, the prophylaxis and treatment of pulmonary embolism, and as an adjunct in...	Indans
Anisotropine methylbromide	362.345	For use in conjunction with antacids or histamine H2-receptor antagonists in the treatment of peptic ulcer, to reduce further gastric acid secretion and delay gastric emptying.	Agents producing tachycardia
Antazoline	265.3529	An antihistamine agent used for the symptomatic treatment of nasal congestion and allergic conjunctivitis.	Antiallergic Agents, Excl. Corticosteroids
Anthralin	226.231	An anthracene used to treat stable plaque psoriasis.	Antracen Derivatives
Antipyrine	188.2258	An antipyretic agent used for the symptomatic treatment of acute otitis media, most commonly in combination with benzocaine.	Analgesics and Anesthetics
Antrafenine	588.5435	Antrafenine is used as an anti-inflammatory and analgesic agent for the relief of mild to moderate pain.	Agents that produce hypertension
Apalutamide	477.44	An androgen receptor inhibitor used to treat non-metastatic castration-resistant and metastatic castration-sensitive prostate cancer.	Antiandrogens
Apixaban	459.4971	An anticoagulant used for the prophylaxis of stroke and systemic embolism in nonvalvular atrial fibrillation, and deep vein thrombosis(DVT) leading to pulmonary embolism(PE), including in patients after a hip or knee replacement surgery.	Direct factor Xa inhibitors
Apomorphine	267.3224	A morphine derivative D2 dopamine agonist used to treat hypomobile off episodes of advanced Parkinson's disease.	Drugs Used in Erectile Dysfunction
Apraclonidine	245.109	An alpha adrenergic agonist used to treat raised intraocular pressure.	Sympathomimetics in Glaucoma Therapy
Apremilast	460.5	A non-steroidal medication used for the treatment of inflammatory conditions such as psoriasis and psoriatic arthritis.	Selective Immunosuppressants
Aprepitant	534.4267	A substance P/neurokinin 1 receptor antagonist used to treat nausea and vomiting caused by chemotherapy and surgery.	Antiemetics
Apronalide	184.239	Apronalide is approved in Japan. Apronalide has been withdrawn from the market in many other countries due to patient development of thrombocytopenic purpura .	Amides
Arbutamine	317.3795	Used to elicit acute cardiovascular responses (cardiac stumulant), similar to those produced by exercise, in order to aid in diagnosing the presence or absence of coronary artery disease (CAD) in...	Adrenergic and Dopaminergic Agents
Arbutin	272.2512	Indicated for over-the-counter use for epidermal hyperpigmentation in various skin conditions, such as melasma, freckles, and senile lentigines.	Glucosides
Ardeparin	0	For prevention of deep vein thrombosis, which may result in pulmonary embolism, following knee surgery.	Anticoagulants
Arformoterol	344.4049	A beta-2 adrenergic agonist and bronchodilator used for long-term, symptomatic treatment of reversible bronchoconstriction in patients with chronic obstructive pulmonary disease (COPD), including chronic bronchitis and emphysema.	Agents producing tachycardia
Argatroban	508.64	A synthetic direct thrombin inhibitor used for the prevention and treatment of thrombosis related to heparin use.	Anticoagulants
Aripiprazole	448.385	An atypical antipsychotic used in the treatment of a wide variety of mood and psychotic disorders, such as schizophrenia, bipolar I, major depressive disorder, irritability associated with autism, and Tourette's syndrome.	Agents producing tachycardia
Aripiprazole lauroxil	660.72	An antipsychotic used to treat schizophrenia in adults.	Agents that produce hypertension
Armodafinil	273.35	A stimulant used to improve wakefulness in adult patients with excessive sleepiness associated with obstructive sleep apnea, narcolepsy, or shift work disorder.	Centrally Acting Sympathomimetics
Arsenic trioxide	197.84	A chemotherapeutic agent used in the treatment of refractory or relapsed acute promyelocytic leukemia in patients with prior retinoid and anthracycline chemotherapy.	Arsenicals
Artemether	298.3746	An antimalarial agent used in combination with lumefantrine for the treatment of acute uncomplicated malaria caused by Plasmodium falciparum.	Artemisinin and derivatives
Artemotil	312.406	Artemotil, also known as β-arteether, is a semi-synthetic derivative of artemisinin and a fast acting blood schizonticide specifically indicated for the treatment of chloroquine-resistant Plasmodium falciparum malaria and cerebral malaria...	Artemisinin and derivatives
Artenimol	284.352	For the treatment of uncomplicated Plasmodium falciparum infection in adults, children, and infants aged 6 months and up weighing over 5 kg [FDA Label]. Used in combination with DB13941.	Artemisinin and derivatives
Artesunate	384.425	Artesunate is an artemesinin derivative indicated for the initial treatment of severe malaria.	Artemisinin and derivatives
Articaine	284.374	A local anesthetic used for inducing local, infiltrative, or conductive anesthesia in both simple and complex dental procedures.	Amides
Arzoxifene	475.6	Investigated for use/treatment in breast cancer, osteoporosis, and endometrial cancer.	Sulfur Compounds
Asciminib	449.84	An inhibitor of ABL/BCR-ABL1 tyrosine kinase for the treatment of patients with Philadelphia chromosome-positive CML, including those with the T315I mutation.	Bcr-Abl Tyrosine Kinase Inhibitors
Ascorbic acid	176.1241	A vitamin used to correct vitamin C deficiency and to increase the intestinal absorption of iron.	Organic Acids
Ascorbyl phosphate	0	Ascorbyl phosphate is a synthetic form of Vitamin C and is found in different salt forms such as magnesium ascorbyl phosphate and sodium ascorbyl phosphate. These salts are present in...	Vitamin C and analogues
Asenapine	285.77	An atypical antipsychotic used to treat patients with bipolar I disorder and patients with schizophrenia.	Diazepines, Oxazepines, Thiazepines and Oxepines
Asparagine	132.1179	Used for nutritional supplementation, also for treating dietary shortage or imbalance.	Amino Acids, Basic
Aspartic acid	133.1027	An amino acid commonly found as a component in total parenteral nutrition.	Amino Acids, Acidic
Astemizole	458.5703	A second generation antihistamine used to treat allergy symptoms.	Anti-Allergic Agents
Asunaprevir	748.286	An NS3 protease inhibitor used to treat hepatitis C genotype 1b.	Antivirals for treatment of HCV infections
Ataluren	284.242	A medication used for the treatment of Duchenne muscular dystrophy.	Musculo-Skeletal System
Atazanavir	704.8555	An antiviral protease inhibitor used in combination with other antiretrovirals for the treatment of HIV.	HIV Protease Inhibitors
Atenolol	266.3361	A synthetic beta-1 selective blocker used in the management of hypertension and chronic angina, and to reduce mortality in known or suspected myocardial infarction in hemodynamically stable patients.	Beta blocking agents and calcium channel blockers
Atogepant	603.525	An oral CGRP antagonist used for the preventative therapy of episodic migraine headaches.	Calcitonin Gene-Related Peptide Receptor Antagonists
Atomoxetine	255.3547	A selective norepinephrine reuptake inhibitor (SNRI) used in the management of Attention Deficit Hyperactivity Disorder (ADHD).	Agents producing tachycardia
Atorvastatin	558.6398	An HMG-CoA reductase inhibitor used to lower lipid levels and reduce the risk of cardiovascular disease including myocardial infarction and stroke.	Anticholesteremic Agents
Atosiban	994.19	An inhibitor of oxytocin and vasopressin used to delay imminent preterm birth in pregnant adult women displaying specific clinical observations.	Hormone Antagonists
Atovaquone	366.837	An antimicrobial indicated for the prevention and treatment of Pneumocystis jirovecii pneumonia (PCP) and for the prevention and treatment of Plasmodium falciparum malaria.	Biguanides
Atractylodes japonica root	0	Not Annotated	\N
Atracurium	0	A neuromuscular blocker indicated to relax muscles during mechanical ventilation under general anesthesia or intubation.	Benzylisoquinolines
Atracurium besylate	1243.49	A non-depolarizing neuromuscular blocker used to facilitate endotracheal intubation and relax skeletal muscles during surgery.	Benzylisoquinolines
Atropine	289.3694	A muscarinic antagonist used to treat poisoning by muscarinic agents, including organophosphates and other drugs.	Belladonna Alkaloids, Tertiary Amines
Attapulgite	412.684	A veterinary antidiarrheal agent used to treat non-infectious diarrhea in animals.	Antidotes
Auranofin	678.484	An antirheumatic used to treat active, progressive, or destructive forms of inflammatory arthritis.	Gold Preparations
Aurothioglucose	392.18	A gold compound used in the treatment of rheumatoid arthritis.	Gold Preparations
Avacopan	581.656	An orally bioavailable complement 5a receptor (C5aR) antagonist for the treatment of severe anti-neutrophil cytoplasmic (auto)antibody (ANCA)-associated vasculitis.	Selective Immunosuppressants
Avanafil	483.951	A phosphodiesterase-5 (PDE5) inhibitor used to treat erectile dysfunction.	Drugs Used in Erectile Dysfunction
Avatrombopag	649.65	A thrombopoietin receptor agonist used to treat thrombocytopenia in patients with chronic liver disease who are scheduled to undergo a procedure.	Receptors, Thrombopoietin, agonists
Avibactam	265.24	A non-β-lactam β-lactamase inhibitor used in combination with ceftazidime for the treatment of complicated intra-abdominal infections, complicated urinary tract infections, and hospital or ventilator-acquired pneumonia.	beta-Lactamase Inhibitors
Avobenzone	310.393	A sunscreen agent found in sunscreens that absorbs UV rays.	Sunscreen Agents
Axitinib	386.47	An oral VEGFR and kinase inhibitor used for the treatment of advanced renal cell carcinoma after failure of one prior systemic therapy.	Protein Kinase Inhibitors
Azacitidine	244.2047	A pyrimidine nucleoside analogue used to treat certain subtypes of myelodysplastic syndrome.	Pyrimidine Analogues
Azatadine	290.4021	An H1 receptor antagonist used to treat perennial and allergic rhinitis as well as eustachian tube congestion.	Anticholinergic Agents
Azathioprine	277.263	An immunosuppressant used to prevent renal transplant rejection, treat rheumatoid arthritis, Crohn's disease, and ulcerative colitis.	Antimetabolites
Azelaic acid	188.2209	A saturated dicarboxylic acid used to treat mild to moderate acne vulgaris.	Acids, Acyclic
Azelastine	381.898	A histamine H1-receptor antagonist used intranasally to treat allergic and vasomotor rhinitis and in an ophthalmic solution to treat allergic conjunctivitis.	Antiallergic Agents, Excl. Corticosteroids
Azilsartan medoxomil	568.5336	An angiotensin II receptor blocker used to treat hypertension alone or in combination with other antihypertensive agents, such as chlorthalidone.	Angiotensin II receptor blockers (ARBs) and diuretics
Azithromycin	748.9845	A macrolide antibiotic used to treat a variety of bacterial infections.	Macrolides
Azlocillin	461.492	For the treatment of infections caused by Pseudomonas aeruginosa, Escherichia coli, and Haemophilus influenzae.	Penicillins With Extended Spectrum
Aztreonam	435.433	A beta-lactam antibiotic used to treat select aztreonam sensitive gram negative bacteria.	Anti-Bacterial Agents
Bacampicillin	465.52	An ampicillin prodrug used to treat various susceptible bacterial infections in the body, such as respiratory infections and skin and subcutaneous tissue infections.	Penicillins With Extended Spectrum
Bacitracin	1422.693	A cyclic polypeptide antibiotic used to prevent wound infections, treat pneumonia and empyema in infants, and to treat skin and eye infections.	Anti-Bacterial Agents
Baclofen	213.661	A GABA-ergic agonist used to manage severe spasticity of cerebral or spinal origin in adult and pediatric patients.	GABA-B Receptor Agonists
Baloxavir marboxil	571.55	A polymerase acidic endonuclease inhibitor used to treat uncomplicated influenza.	Antiviral Agents
Balsalazide	357.3175	An aminosalicylate used to treat ulcerative colitis.	Salicylates
Baricitinib	371.42	A Janus kinase inhibitor used to treat moderate to severe rheumatoid arthritis that has responded poorly to at least one TNF antagonist.	Selective Immunosuppressants
Barium sulfate	233.39	A contrast agent used for CT scans of the gastrointestinal tract.	Barium Sulfate Containing X-Ray Contrast Media
Bazedoxifene	470.613	A selective estrogen receptor modulator (SERM) used to treat moderate to severe vasomotor symptoms in menopause and osteoporosis alone or in combination with conjugated estrogens.	Selective Estrogen Receptor Modulators
Beclomethasone dipropionate	521.042	An inhaled corticosteroid used as maintenance treatment in the prophylaxis of asthma attacks.	Corticosteroids Acting Locally
Bedaquiline	555.505	A diarylquinoline antimycobacterial used in combination with other antibacterials to treat pulmonary multidrug resistant tuberculosis (MDR-TB).	Diarylquinoline Antimycobacterial
Belinostat	318.35	A histone deacetylase (HDAC) inhibitor used for the treatment of patients with relapsed or refractory peripheral T-cell lymphoma (PTCL).	Histone deacetylase (HDAC) inhibitors
Belumosudil	452.518	An oral inhibitor of rho-associated coiled-coil-containing protein kinases (ROCK) used in the treatment of chronic graft-versus-host disease (GVHD).	Selective Immunosuppressants
Belzutifan	383.34	An inhibitor of hypoxia-inducible factor 2α used as an antineoplastic in the treatment of certain cancers associated with von Hippel-Lindau (VHL) disease.	Antineoplastic Agents
Bemiparin	0	An ultra-low molecular weight heparin (ultra-LMWH) used to prevent thromboembolism following surgery and extracorporeal clotting during dialysis.	Anticoagulants
Bemotrizinol	627.826	An ingredient used in sunscreen to block UVA and UVB radiation.	Sunscreen Agents
Bempedoic acid	344.492	A drug used in conjunction with lifestyle modification and/or other agents for the treatment of refractory hypercholesterolemia.	Adenosine Triphosphate-Citrate Lyase Inhibitor
Benazepril	424.4895	An ACE inhibitor prodrug used to treat hypertension.	ACE Inhibitors and Calcium Channel Blockers
Bendamustine	358.263	An antineoplastic agent used for the treatment of chronic lymphocytic leukemia (CLL) and indolent B-cell non-Hodgkin lymphoma (NHL) that has progressed following rituximab therapy.	Nitrogen Mustard Analogues
Bendazac	282.299	A non-steroidal anti-inflammatory drug (NSAID) available as an eye drop for the treatment of cataracts and as a topical cream for the treatment of dermatitis, eczema, hives, skin ulcers and other inflammatory skin conditions.	Anti-Inflammatory Agents, Non-Steroidal
Bendroflumethiazide	421.415	A diuretic used to suppress lactation and to treat hypertension and edema.	Low-Ceiling Diuretics and Potassium-Sparing Agents
Benfotiamine	466.45	A derivative of thiamine thought to be useful in the management of diabetic neuropathy, although evidence is lacking.	Vitamin B Complex
Benorilate	313.309	Not Annotated	Salicylic Acid and Derivatives
Benoxaprofen	301.724	The use of benoxaprofen, formerly marketed as Oraflex tablets, was associated with fatal cholestatic jaundice among other serious adverse reactions. The holder of the approved application voluntarily withdrew Oraflex tablets...	Propionates
Benperidol	381.451	A neuroleptic butyrophenone derivative indicated in the treatment of psychoses, manic episodes, and psychomotor agitation.	Butyrophenone Derivatives
Benserazide	257.246	A medication used to treat Parkinson's disease, parkinsonism, and restless leg syndrome.	Anti-Parkinson Drugs
Bentonite	0	Not Annotated	Aluminum Silicates
Bentoquatam	0	Used to prevent or reduce the severity of allergic contact dermatitis due to urushiol, the allergenic resin of poison ivy, poison oak, and poison sumac.	Dermatologicals
Benzalkonium	0	An antiseptic agent used as a preservative in medications or as a disinfectant in cleaning products.	Medicated Dressings With Antiinfectives
Benzatropine	307.4293	An anticholinergic drug used to treat Parkinson's disease (PD) and extrapyramidal symptoms, except tardive dyskinesia.	Ethers of Tropine or Tropine Derivatives
Benzethonium	412.637	A medication used as to clean hands and clean minor cuts and scrapes.	Quaternary Ammonium Compounds
Benzhydrocodone	403.478	Benzyhydrocodone is indicated, in combination with acetaminophen, for the short-term management of acute pain requiring opioid therapy.	Opioids
Benziodarone	518.089	Benziodarone is a uricostatic and a uricosuric agent which is sold also under the name Amplivex-Labaz. It is used in the treatment of gout . It was withdrawn from France...	Uricosuric Agents
Benznidazole	260.253	A trypanocidal agent used to treat Chagas disease.	Nitroimidazole Derivatives
Benzocaine	165.1891	A topical local anesthetic used for the temporary relief of pain and itching associated with minor burns, sunburn, scrapes and insect bites or minor skin irritations.	Anesthetics for Topical Use
Benzoic acid	122.123	An antimicrobial food additive.	Tests for Gastric Secretion
Benzoin	212.2439	No approved therapeutic indications.	Acetophenones
Benzonatate	603.7419	A non-narcotic oral antitussive drug used to suppress coughing.	Antitussive Agents
Benzoyl peroxide	242.2268	An antibacterial and anti-inflammatory agent used for the symptomatic treatment of mild to moderate acne vulgaris and rosacea.	Peroxides
Benzphetamine	239.3553	A sympathomimetic used to manage exogenous obesity short term.	Agents producing tachycardia
Benzthiazide	431.937	For the treatment of high blood pressure and management of edema.	Sulfonamides
Benzydamine	309.413	A locally-acting NSAID indicated for the symptomatic relief of pain in acute sore throat and for the symptomatic relief of oropharyngeal mucositis caused by radiation therapy.	Antiinflammatory Preparations, Non-Steroids for Topical Use
Benzyl alcohol	108.1378	An antiparasitic agent used for the topical treatment of head lice infestation in patients 6 months of age and older.	Anesthetics, Local
Benzyl benzoate	212.2439	A topical treatment for scabies and lice.	Insecticides
Benzylparaben	228.247	Benzylparaben is used in allergenic testing.	Standardized Chemical Allergen
Benzylpenicillin	334.39	A penicillin used for the treatment of infections caused by gram-positive cocci, in particular streptococcal infections. This form of penicillin is typically used in intravenous or long-acting injectable formulations due to poor oral absorption.	Beta-Lactamase Sensitive Penicillins
Benzylpenicilloyl polylysine	626.765	A penicillin derivative used to determine penicillin allergies.	Acetamides
Bepotastine	388.888	An ophthalmic H1 antagonist used to treat itchiness associated with allergic conjunctivitis.	Anti-Allergic Agents
Bepridil	366.5396	For the treatment of hypertension, and chronic stable angina (classic effort-associated angina).	Antiarrhythmic agents
Berberine	336.3612	An alkaloid from Hydrastis canadensis L., Berberidaceae. It is also found in many other plants. It is relatively toxic parenterally, but has been used orally for various parasitic and fungal...	Berberine Alkaloids
Berotralstat	562.573	An inhibitor of plasma kallikrein used for prophylaxis of angioedema attacks in patients with hereditary angioedema.	Plasma Kallikrein Inhibitor
Besifloxacin	393.84	A fluoroquinolone antibiotic agent used for the treatment of bacterial conjunctivitis.	Fluoroquinolones
Beta carotene	536.888	A vitamin A precursor found in various nutritional supplements and health products.	Protectives Against UV-Radiation for Systemic Use
Betahistine	136.1943	An antivertigo agent used for the reduction of episodes of vertigo association with Ménière's disease.	Histamine Agonists
Betaine	117.1463	A methyl group donor used for the treatment of homocystinuria to decrease elevated homocysteine blood levels.	Acid Preparations
Betamethasone	392.4611	A systemic corticosteroid used to relieve inflammation in various conditions, including but not limited to allergic states, dermatologic disorders, gastrointestinal diseases, and hematological disorders.	Corticosteroids Acting Locally
Betamethasone phosphate	472.446	A fast acting ester prodrug of a corticosteroid used to treat inflammatory conditions.	Glucocorticoids
Betaxolol	307.4278	A cardioselective beta blocking agent commonly used to treat hypertension and elevated intraocular pressure (when administered ophthalmically).	Beta Blocking Agents, Selective
Betazole	111.1451	For use clinically to test gastric secretory function.	Tests for Gastric Secretion
Bethanechol	161.2221	A muscarinic agonist used to treat postoperative and postpartum nonobstructive functional urinary retention and neurogenic atony of the bladder with retention.	Choline Esters
Bethanidine	177.2462	For the treatment of hypertension.	Guanidine Derivatives
Betiatide	367.38	Not Annotated	\N
Betrixaban	451.91	A Factor Xa inhibitor used for prophylaxis of venous thromboembolism in hospitalized patients.	Direct factor Xa inhibitors
Betulinic Acid	456.711	Betulinic Acid has been used in trials studying the treatment of Dysplastic Nevus Syndrome.	Agents that produce hypertension
Bexagliflozin	464.94	A sodium-glucose co-transporter 2 inhibitor used to improve glycemic control in patients with type 2 diabetes mellitus.	Blood Glucose Lowering Agents
Bexarotene	348.4779	A retinoid drug used for cutaneous manifestations of T-cell lymphoma in patients who have not responded well to previous systemic therapy.	Retinoids for cancer treatment
Bezafibrate	361.819	A lipid-lowering fibrate used in the management of primary and secondary hyperlipidaemia, when there is a lack of clinical improvement following lifestyle modifications or correction of the underlying disorder.	Fibric Acids
Bicalutamide	430.373	An androgen receptor inhibitor used to treat Stage D2 metastatic carcinoma of the prostate.	Antiandrogens
Bicisate	324.45	A compound complexed with technetium 99 used in single photon emission computerized tomography to localize a stroke.	Diagnostic Agents
Bictegravir	449.386	An integrase inhibitor used to treat HIV infections.	Antiinfectives for Systemic Use
Bifonazole	310.3917	An azole antifungal drug used to treat fungal skin infections, such as dermatomycosis.	Imidazole and Triazole Derivatives
Biguanide	101.113	Biguanide has been investigated for the treatment of Diabetes Mellitus.	Blood Glucose Lowering Agents
Bilastine	463.622	A peripheral histamine H1-antagonist used to treat seasonal allergic rhinitis and chronic spontaneous urticaria.	Antihistamines for Systemic Use
Bimatoprost	415.5656	A prostaglandin analog used to treat hypotrichosis of the eyelashes and intraocular pressure in open angle glaucoma or ocular hypertension.	Amides
Binimetinib	441.233	A medication used to treat metastatic melanoma with specific mutations.	Mitogen-activated protein kinase (MEK) inhibitors
Bioallethrin	302.414	Bioallethrin was used for lice and scabies infestation. Other pyrethroids are now used in place of bioallethrin.	Pyrethrines, Incl. Synthetic Compounds
Biotin	244.311	A B-complex vitamin found in many multivitamin products.	Vitamins
Biperiden	311.4611	A muscarinic receptor antagonist used to treat parkinsonism and control extrapyramidal side effects of neuroleptic drugs.	Tertiary Amines
Birch bark extract	0	A herbal medicinal product used to treat partial thickness wounds.	Anti-Inflammatory Agents
Bisacodyl	361.3906	A stimulant laxative used for the temporary relief of occasional constipation and cleansing of the colon as a preparation for colonoscopy in adults.	Enemas
Bismuth subcitrate potassium	780.654	A colloid used for the treatment of peptic ulcer and gastro-esophageal reflux disease (GERD).	Neurotoxic agents
Bismuth subgallate	394.091	A medication used to deodorize flatulence and stools as well as hemostasis in soft tissue surgery.	Neurotoxic agents
Bismuth subnitrate	1461.98	A medication used as an antacid.	Neurotoxic agents
Bismuth subsalicylate	362.0926	An antidiarrheal and anti-inflammatory agent used for symptomatic treatment of nausea, indigestion, upset stomach, diarrhea, and other temporary discomforts of the stomach and gastrointestinal tract.	Neurotoxic agents
Bisoctrizole	658.891	An absorber of UVA and UVB radiation used in sunscreen.	Sunscreen Agents
Bisoprolol	325.443	A beta-1 adrenergic blocking agent used to prevent myocardial infarction and heart failure and to treat mild to moderate hypertension.	Antihypertensive Agents
Bisoxatin	333.343	For use in the treatment of constipation in the absence of bowel obstruction and for surgical preparation of the colon .	Contact Laxatives
Bisphenol A diglycidyl ether	340.4129	Not Annotated	Carcinogens
Bithionol	356.052	Bithionol, formerly marketed as an active ingredient in various topical drug products, was shown to be a potent photosensitizer with the potential to cause serious skin disorders. Approvals of the...	Preparations Containing Sulfur
Bivalirudin	2180.2854	A direct thrombin inhibitor used to treat heparin-induced thrombocytopenia and to prevent thrombosis during percutaneous coronary intervention.	Anticoagulants
Bleomycin	1415.552	A chemotherapy agent used to treat various malignancies, including head and neck malignancy, lymphoma, and testicular tumors, among others.	Antibiotics, Antineoplastic
Boceprevir	519.6767	A hepatitis C virus NS3/4A protease inhibitor used in combination with other medications to treat chronic hepatitis C genotype 1 infection. Boceprevir is not indicated as monotherapy.	Antivirals for treatment of HCV infections
Boric acid	61.833	No FDA- or EMA-approved therapeutic indications on its own.	Anti-Infective Agents
Bortezomib	384.237	A proteasome inhibitor used to treat multiple myeloma in patients who have not been successfully treated with at least two previous therapies.	Boronic Acids
Bortezomib D-mannitol	530.39	Not Annotated	Proteasome Inhibitors
Boscalid	343.207	Boscalid has been investigated for the treatment of OSDI, Glaucoma, Staining, Schirmers, and Disease Severity, among others.	Benzene Derivatives
Bosentan	551.614	A dual endothelin receptor antagonist used to treat pulmonary arterial hypertension.	Antihypertensives for Pulmonary Arterial Hypertension
Bosutinib	530.446	An antineoplastic agent used for the treatment of chronic, accelerated, or blast phase Philadelphia chromosome-positive (Ph+) chronic myelogenous leukemia (CML) in adults with inadequate clinical response to other treatments.	Bcr-Abl Tyrosine Kinase Inhibitors
Bretylium	243.163	A norepinephrine release inhibitor used for the prophylaxis and therapy of ventricular fibrillation, as well as the treatment of life-threatening ventricular arrhythmias.	Adrenergic Antagonists
Brexanolone	318.4935	Brexanolone is a synthetic neuroactive steroid gamma-aminobutyric acid A (GABA(a)) receptor positive modulator indicated for the treatment of postpartum depression (PPD) in adult women [FDA Label][A176080, A176083, F4063, F4066, F4072].	Anesthetics
Brexpiprazole	433.57	A serotonin–dopamine activity modulator used in the treatment of major depressive disorder as an adjunct, schizophrenia, and agitation associated with dementia due to Alzheimer’s disease.	Agents that produce hypertension
Brigatinib	584.1	An anaplastic lymphoma kinase inhibitor used to treat anaplastic lymphoma kinase positive metastatic non small cell lung cancer.	Anaplastic lymphoma kinase (ALK) inhibitors
Brilliant blue G	854.02	A disclosing agent used in ophthalmological surgery to stain the internal limiting membrane (ILM).	Indicators and Reagents
Brilliant green cation	385.574	An ingredient used in topical medications to prevent infections of the umbilical cord.	Anti-Infective Agents, Local
Brimonidine	292.135	An alpha-2 adrenergic agonist used to treat glaucoma and ocular hypertension, as well as facial erythema in rosacea.	Sympathomimetics in Glaucoma Therapy
Brincidofovir	561.701	An oral lipid prodrug of cidofovir used in the treatment of human smallpox disease.	Nucleosides and Nucleotides Excl. Reverse Transcriptase Inhibitors
Brinzolamide	383.507	A carbonic anhydrase inhibitor used for the reduction of elevated intraocular pressure in patients with ocular hypertension or open-angle glaucoma.	Sulfonamides
Brivaracetam	212.2887	An anticonvulsant used for the treatment of partial-onset seizures that functions by binding to synaptic vesicle glycoprotein 2A (SV2A) in the brain.	Anticonvulsants
Brivudine	333.135	A drug used to treat herpes zoster.	Nucleosides and Nucleotides Excl. Reverse Transcriptase Inhibitors
Bromazepam	316.153	A short-acting benzodiazepine with intermediate onset commonly used to treat panic disorders and severe anxiety.	Anti-Anxiety Agents
Bromfenac	334.165	An NSAID used to treat postoperative pain and inflammation of the eye.	Anti-Inflammatory Agents, Non-Steroidal
Bromhexine	376.13	A mucolytic drug used to decrease the viscosity of mucus in the airway, enhancing mucus clearance.	Aniline Compounds
Bromocriptine	654.595	A dopamine D2 receptor agonist used for the treatment of galactorrhea due to hyperprolactinemia and other prolactin-related conditions, as well as in early Parkinsonian Syndrome.	Prolactine Inhibitors
Bromodiphenhydramine	334.251	For management of symptoms related to hay fever and other types of allergy and used to help bring up phlegm, thin secretions, and make a cough productive.	Aminoalkyl Ethers
Bromothalonil	265.936	Bromothalonil is approved for use within allergenic epicutaneous patch tests which are indicated for use as an aid in the diagnosis of allergic contact dermatitis (ACD) in persons 6 years...	Allergens
Bromotheophylline	259.063	Bromotheophylline is used as a diuretic and also, in combination with DB00316, it is used for the relief of temporary water weight gain, bloating, swelling and full feeling associated with...	Xanthine derivatives
Bromperidol	420.322	A first-generation butyrophenone antipsychotic used in the treatment of schizophrenia and other psychotic manifestations.	Butyrophenone Derivatives
Brompheniramine	319.239	A histamine H1 antagonist used to treat coughs, upper respiratory symptoms, and nasal congestion associated with allergies and the common cold.	Substituted Alkylamines
Bronopol	199.988	An antimicrobial compound used as a biocide and preservative.	Anti-Infective Agents
Brown iron oxide	0	Not Annotated	\N
Bucetin	223.272	Bucetin is an analgesic and antipyretic medication which was approved for use in Germany but was withdrawn from the market in 1986 due to renal toxicity caused by the medication.	Anilides
Buclizine	433.028	An antihistamine and antiemetic drug for the treatment of allergy symptoms and prevention of nausea and vomiting.	Piperazine Derivatives
Budesonide	430.5339	A corticosteroid used to treat Crohn's disease, asthma, COPD, hay fever and allergies, and ulcerative colitis.	Corticosteroids Acting Locally
Bufexamac	223.272	An NSAID used to treat skin conditions like atopic eczema and inflammatory dermatoses.	Acetic Acid Derivatives and Related Substances
Bumadizone	326.396	Bumadizone has been approved for use in Germany and Austria, it is a drug with anti-inflammatory, antipyretic, and analgesic properties, and was marketed for the treatment of both rheumatoid arthritis...	Acetic Acid Derivatives and Related Substances
Bumetanide	364.416	A sulfamyl diuretic used to treat edema in congestive heart failure, hepatic and renal disease, and nephrotic syndrome.	High-Ceiling Diuretics and Potassium-Sparing Agents
Bupivacaine	288.4277	A local anesthetic used in a wide variety of superficial and invasive procedures.	Amides
Buprenorphine	467.6401	A partial opioid agonist used for management of severe pain that is not responsive to alternative treatments. Also used for maintenance treatment of opioid addiction.	Drugs Used in Opioid Dependence
Bupropion	239.741	A norepinephrine and dopamine reuptake inhibitor used in the treatment of major depressive disorder (MDD), seasonal affective disorder (SAD), and as an aid to smoking cessation.	Centrally Acting Antiobesity Products
Buserelin	1239.447	A LHRH agonist used for the palliative treatment of hormone-dependent advanced carcinoma of the prostate gland in males and treatment of endometriosis in females.	Gonadotropin-releasing hormone agonist
Buspirone	385.5031	An anxiolytic agent used for short-term treatment of generalized anxiety and second-line treatment of depression.	Azaspirodecanedione Derivatives
Busulfan	246.302	An alkylating agent used to treat chronic myelogenous leukemia.	Alkanesulfonates
Butabarbital	212.2456	A barbiturate drug used as a sedative and hypnotic.	Anticholinergic Agents
Butacaine	306.45	Not Annotated	Anesthetics, Local
Butalbital	224.2563	A barbiturate drug used for symptomatic treatment of tension-type headache in various combinations with acetaminophen, aspirin, caffeine, and codeine.	Barbiturates
Butamben	193.246	Anesthesia of mucus membranes other than the eyes.	Anesthetics, Local
Butaperazine	409.59	Butaperazine was approved in 1967 , and possibly discontinued in the 1980s .	Phenothiazines With Piperazine Structure
Butenafine	317.4672	A topical antifungal used to treat tinea versicolor, tinea pedis, tinea cruris, and tinea corporis.	Antifungal Agents
Butobarbital	212.2456	For the treatment of insomnia.	Barbiturates, Plain
Butoconazole	411.776	An imidazole antifungal used to treat vulvovaginal candidiasis.	Imidazole Derivatives
Butorphanol	327.4605	An opioid agonist-antagonist used to treat moderate to severe pain.	Morphinan Derivatives
Butriptyline	0	Butriptyline is a tricyclic antidepressant which has been used in Europe since 1974. It is the isobutyl side chain homologue of amitriptyline.	Non-Selective Monoamine Reuptake Inhibitors
Butylene glycol	90.121	Not Annotated	Alcohols
Butylparaben	194.2271	Not Annotated	Standardized Chemical Allergen
Butylscopolamine	360.473	An antispasmodic and anticholinergic agent used for the symptomatic treatment of abdominal cramping and pain.	Belladonna Alkaloids, Semisynthetic, Quaternary Ammonium Compounds
C11-12 isoparaffin	0	C11-12 isoparaffin is a mixture of branched chain hydrocarbons with 11C or 12C's in the alkyl chain. It is found in cosmetic and personal care products as solvents or skin...	\N
Cabazitaxel	835.9324	An antineoplastic agent used for the treatment of hormone-refractory metastatic prostate cancer previously treated with a docetaxel-containing treatment regimen.	Taxoids
Cabergoline	451.6043	A dopamine receptor agonist used for the treatment of hyperprolactinemic conditions due to various causes.	Prolactine Inhibitors
Cabotegravir	405.358	An HIV-1 integrase inhibitor used for treatment and pre-exposure prophylaxis of HIV-1 infection.	HIV Integrase Inhibitors
Cabozantinib	501.514	A tyrosine kinase inhibitor used to treat advanced renal cell carcinoma, hepatocellular carcinoma, and medullary thyroid cancer.	Protein Kinase Inhibitors
Caffeine	194.1906	A stimulant present in tea, coffee, cola beverages, analgesic drugs, and agents used to increase alertness. It is also used in to prevent and treat pulmonary complications of premature birth.	Tests for Gastric Secretion
Calcifediol	400.6371	An active metabolite of vitamin D used to treat hyperparathyroidism as well as to combat hypocalcemia in dialysis patients.	Vitamins
Calcipotriol	412.6047	A topical synthetic vitamin D2 derivative used in the treatment of plaque psoriasis.	Vitamin D and Analogues
Calcitriol	416.6365	An active metabolite of vitamin D that is used to treat hyperparathyroidism and is also used in dialysis patients to combat hypocalcemia.	Bone Density Conservation Agents
Calcium acetate	158.166	A phosphate binder used in patients with end-stage renal disease (ESRD) to prevent elevated phosphate levels and resulting ectopic calcification and secondary hyperparathyroidism.	Drugs for Treatment of Hyperkalemia and Hyperphosphatemia
Calcium alginate	0	Not Annotated	Local Hemostatics
Calcium ascorbate	390.31	Not Available	Antioxidants
Calcium carbimide	80.103	Calcium carbimide has not been approved by the FDA but the intended indication is for the treatment of alcoholism. This medication was marketed in Canada, United Kingdom and Europe under...	Drugs Used in Alcohol Dependence
Calcium carbonate	100.087	An ionic compound used as a calcium supplement or antacid used for the symptomatic relief of heartburn, acid indigestion, and sour stomach.	Calcium Compounds
Calcium chloride	110.984	An ionic compound used for the treatment of hypocalcemia and hyperkalemia, and as an antidote to magnesium intoxication due to overdosage of magnesium sulfate.	Acidifying Agents
Calcium citrate	498.432	An ingredient found in a variety of supplements and vitamins.	Calcium Compounds
Calcium glubionate anhydrous	592.513	A calcium salt indicated in the treatment of hypocalcemia, hyperkalemia, lead poisoning, and as an adjunct in the treatment of exudative skin conditions.	Calcium Salts
Calcium glucoheptonate	490.425	A calcium supplement combined with calcium gluconate to treat hypocalcemia and maintain calcium levels.	Acids, Acyclic
Calcium gluconate	430.372	An ingredient found in a variety of supplements and vitamins, and is used to lower potassium in the blood or treat magnesium poisoning.	Calcium Salts
Calcium glycerophosphate	210.135	An medication used to treat low levels of phosphate or calcium, as well as an ingredient in dental products to prevent dental caries.	Glycerophosphates
Calcium lactate	218.218	An ingredient found in a variety of nutritional products.	Calcium Salts
Calcium levulinate	270.294	This new application of calcium is intended for use as a food fortifier, to fortify foods like sauces, condiments, beer, beverages, soft drinks, milk and milk products, soy milk and...	Calcium Salts
Calcium Phosphate	310.177	A compound used in supplements and antacids.	Biocompatible Materials
Calcium phosphate dihydrate	172.086	For use as an over the counter calcium and phosphate supplement, antacid, or a source of calcium and phosphate in toothpaste [FDA Label] .	Acids
Calcium polycarbophil	0	A bulk forming laxative used to treat constipation.	Bulk-Forming Laxatives
Calcium saccharate	248.2	Pharmaceutic Aid (Stabilizer)	Sugar Acids
Calcium threonate	310.268	No approved therapeutic indications.	Acids, Acyclic
Calcium undecylenate	406.62	Not Annotated	\N
Calfactant	0	A lung surfactant for the prophylaxis of respiratory distress syndrome in high-risk infants.	Pulmonary Surfactants
Camphor	152.2334	A compound used topically to help relieve pain and also as a topical antiseptic. May also be used in vaporizers to help suppress coughing. This medication should not be swallowed.	Anti-Infective Agents, Local
Canagliflozin	444.516	A sodium-glucose co-transporter 2 (SGLT2) inhibitor used to manage hyperglycemia in type 2 diabetes mellitus (DM). Also used to reduce the risk of major cardiovascular events in patients with established cardiovascular disease and type 2 DM.	Glucosides
Candesartan cilexetil	610.671	An angiotensin receptor blocker used to treat hypertension, systolic hypertension, left ventricular hypertrophy, and delay progression of diabetic nephropathy.	Angiotensin II Antagonists and Diuretics
Candicidin	1109.317	Used in the topical treatment of vulvovaginal candidiasis.	Anti-Bacterial Agents
Cangrelor	776.35	A P2Y12 platelet receptor antagonist used during percutaneous coronary intervention to reduce the risk for periprocedural myocardial infarction (MI), repeat coronary revascularization, and stent thrombosis (ST).	Platelet Aggregation Inhibitors Excl. Heparin
Cannabidiol	314.469	An active cannabinoid used as an adjunctive treatment for the management of seizures associated with Lennox-Gastaut syndrome or Dravet syndrome and symptomatic relief of moderate to severe neuropathic pain or other painful conditions, like cancer.	Agents producing tachycardia
Canrenoic acid	358.478	An aldosterone antagonist used in primary hyperaldosteronism and other disorders related to aberrant aldosterone levels.	Mineralocorticoid Receptor Antagonists
Cantharidin	196.202	The only therapeutic use for which cantharidin is currently primarily indicated for is as an active ingredient in topical agents for treating common warts (verruca vulgaris), periungual warts, plantar warts,...	Benzofurans
Capecitabine	359.3501	A nucleoside metabolic inhibitor indicated to treat different gastrointestinal, including pancreatic cancer, and breast cancer.	Pyrimidine Analogues
Capmatinib	412.428	A kinase inhibitor targeting c-Met receptor tyrosine kinase in the treatment of non-small cell lung cancer with MET exon 14 skipping.	Kinase Inhibitor
Capreomycin	1321.4124	An aminoglycoside antibiotic used as an adjunct drug in tuberculosis.	Anti-Bacterial Agents
Capsaicin	305.4119	A topical analgesic agent used for the symptomatic relief of neuropathic pain associated with post-herpetic neuralgia, as well as other muscle and joint pain.	Capsaicin and Similar Agents
Captopril	217.285	An ACE inhibitor used for the management of essential or renovascular hypertension, congestive heart failure, left ventricular dysfunction following myocardial infarction, and nephropathy.	ACE Inhibitors and Diuretics
Carbamazepine	236.2686	An anticonvulsant used to treat various types of seizures and pain resulting from trigeminal neuralgia.	Carboxamide Derivatives
Carbamide peroxide	94.07	A medication used to loosen ear wax, whiten teeth, and clean oral wounds.	Anti-Infective Agents, Local
Carbamoylcholine	147.1955	A direct acting miotic agent administered ophthalmically to decrease intraocular pressure after cataract surgery, and to induce miosis during surgery.	Choline Esters
Carbenicillin	378.4	For the treatment of acute and chronic infections of the upper and lower urinary tract and in asymptomatic bacteriuria due to susceptible strains of bacteria.	Penicillins With Extended Spectrum
Carbetocin	988.161	An oxytocin agent used to control postpartum hemorrhage and bleeding after giving birth.	Oxytocin and Analogues
Carbidopa	226.2292	A dopa decarboxylase inhibitor used in combination with levodopa for the symptomatic treatment of idiopathic Parkinson disease and other conditions associated with parkinsonian symptoms.	Anti-Parkinson Drugs
Carbimazole	186.232	A drug used for the reduction of thyroid function.	Sulfur-Containing Imidazole Derivatives
Carbinoxamine	290.788	A first generation antihistamine used to treat allergic rhinitis, vasomotor rhinitis, allergic conjunctivitis, allergic reactions, and mild allergic reactions.	Aminoalkyl Ethers
Carbocisteine	179.194	A expectorant mucolytic used in the relief of respiratory of COPD and other conditions associated with increased mucus viscosity.	Expectorants
Carbocromen	361.438	Carbocromen was marketed for use in Germany as a vasodilator, however, it has been discontinued due to the risk of arrhythmia development .	Coumarins
Carbon dioxide	44.0095	A naturally-occurring gas used as a insufflation gas during minimally invasive surgeries to enlarge and stabilize body cavities to provide better visibility of the surgical area.	Medical Gases
Carbon monoxide	28.01	A gas used as a marker of respiratory status in spirometry tests.	Carbon Compounds, Inorganic
Carboprost tromethamine	489.65	A prostaglandin used to treat postpartum uterine hemorrhage due to atony when other methods of management have not been effective.	Prostaglandins
Carboxin	235.302	A systemic agricultural fungicide and seed treatment agent.	Anilides
Carboxymethylcellulose	0	A compound used as an ophthalmic lubricant.	Carboxymethylcellulose Sodium
Carfilzomib	719.9099	A proteasome inhibitor used either alone or in conjunction with a chemotherapy regimen to treat patients with relapsed or refractory multiple myeloma.	Proteasome Inhibitors
Carglumic acid	190.154	An analog of N-acetylglutamate (NAG) used for the treatment of acute and chronic hyperammonemia in patients with N-acetylglutamate synthase (NAGS) deficiency.	Amino Acids and Derivatives
Carindacillin	494.56	A penicillin antibiotic used to treat a variety of infections, but is no longer marketed in the USA.	Penicillins With Extended Spectrum
Cariprazine	427.41	An atypical antipsychotic used to treat schizophrenia and acute manic or mixed episodes due to bipolar I disorder.	Agents that produce hypertension
Carisoprodol	260.33	A centrally acting muscle relaxant used to relieve the discomfort associated with various musculoskeletal conditions.	Carbamic Acid Esters
Carmustine	214.05	An alkylating agent used in the treatment of various malignancies, including brain tumours and multiple myeloma, among others.	Nitrosoureas
Carprofen	273.714	For use as a pain reliever in the treatment of joint pain and post-surgical pain.	Agents that produce hypertension
Carteolol	292.3734	A beta adrenergic antagonist used to treat arrhythmia, angina, hypertension, and glaucoma.	Beta Blocking Agents, Non-Selective
Carvedilol	406.4742	A non selective beta-adrenergic antagonist used to treat mild to severe chronic heart failure, hypertension, and left ventricular dysfunction following myocardial infarction in clinically stable patients.	Alpha and Beta Blocking Agents
Caspofungin	1093.331	An echinocandin used to treat a variety of fungal infections.	Antifungal Agents
Cedazuridine	268.217	A cytidine deaminase inhibitor coadministered with the hypomethylating agent decitabine for the treatment of variable forms of myelodysplastic syndrome (MDS).	Cytidine Deaminase, antagonists & inhibitors
Cefaclor	367.807	A second generation cephalosporin used to treat a wide variety of infections in the body.	Anti-Bacterial Agents
Cefadroxil	363.388	A cephalosporin antibiotic used in the treatment of various bacterial infections, such as urinary tract infections, skin and skin structure infections, and tonsillitis.	Anti-Bacterial Agents
Cefalotin	396.438	A broad-spectrum cephalosporin antibiotic used for the treatment of serious bacterial infections in various locations, such as the urinary tract, skin, bone, and lower respiratory tract.	Anti-Bacterial Agents
Cefamandole	462.503	A beta-lactam antibiotic used in the treatment of various infections caused by susceptible strains of bacteria, such as lower respiratory infections, urinary tract infections, skin infections, and bone and joint infections.	Anti-Bacterial Agents
Cefamandole nafate	490.51	A second generation cephalosporin indicated in the prevention of infections during surgery.	Anti-Bacterial Agents
Cefapirin	423.463	A first generation cephalosporin indicated in the treatment of susceptible bacterial infections.	Anti-Bacterial Agents
Cefazolin	454.507	A broad-spectrum cephalosporin antibiotic mainly used for the treatment of skin bacterial infections and other moderate to severe bacterial infections in the lung, bone, joint, stomach, blood, heart valve, and urinary tract.	Anti-Bacterial Agents
Cefdinir	395.414	A third generation cephalosporin used to treat susceptible Gram negative and Gram positive bacterial infections.	Anti-Bacterial Agents
Cefditoren	506.578	A broad-spectrum third-generation cephalosporin antibiotic typically used to treat bacterial infections of the skin and respiratory tract.	Anti-Bacterial Agents
Cefepime	480.561	A fourth-generation cephalosporin antibiotic used in the treatment of infections caused by susceptible bacteria, such as pneumonia, urinary tract infections, and skin infections.	Anti-Bacterial Agents
Cefiderocol	752.21	A cephalosporin antibiotic used in complicated urinary tract infections.	Cephalosporins
Cefixime	453.45	A third generation cephalosporin used to treat susceptible Gram negative and Gram positive bacterial infections.	Anti-Bacterial Agents
Cefmenoxime	511.558	Used to treat female gynecologic and obstetric infections caused by susceptible aerobic (including the gonococcus) and anaerobic bacteria.	Anti-Bacterial Agents
Cefmetazole	471.534	A cephalosporin antibiotic used to treat a variety of bacterial infections.	Anti-Bacterial Agents
Cefonicid	542.566	For the treatment of bacterial infections caused by susceptible microorganisms.	Anti-Bacterial Agents
Cefoperazone	645.67	A broad-spectrum cephalosporin antibiotic used for the treatment of bacterial infections in various locations, including the respiratory tract, abdomen, skin, and female genital tracts.	Anti-Bacterial Agents
Ceforanide	519.554	For the treatment of infections caused by susceptible organisms.	Anti-Bacterial Agents
Cefotaxime	455.465	A third generation cephalosporin used to treat susceptible Gram negative and Gram positive bacterial infections.	Agents that reduce seizure threshold
Cefotetan	575.619	An antibiotic medication used for the prophylaxis and treatment of various bacterial infections, including urinary tract infections, bone and joint infection, and lower respiratory tract infections.	Anti-Bacterial Agents
Cefotiam	525.628	A cephalosporin antibiotic used to treat a variety of bacterial infections.	Anti-Bacterial Agents
Cefoxitin	427.452	A semi-synthetic, broad-spectrum antibiotic for parenteral administration used for the treatment of serious bacterial infections, such as urinary tract infection, blood infection, bone and joint infection, and lower respiratory tract infection.	Anti-Bacterial Agents
Cefpiramide	612.637	For treatment of severe infections caused by susceptible bacteria such as P. aeruginosa.	Anti-Bacterial Agents
Cefpirome	514.577	An antibiotic indicated in the treatment of a wide variety of infections in the body.	Anti-Bacterial Agents
Cefpodoxime	427.455	A third-generation cephalosporin antibiotic used in the treatment of various bacterial infections, including gonorrhea, community acquired pneumonia, and sinusitis.	Anti-Bacterial Agents
Cefprozil	389.426	A cephalosporin antibiotic used in the treatment of various bacterial infections, such as pharyngitis, tonsillitis, otitis media, and uncomplicated skin infections.	Anti-Bacterial Agents
Cefradine	349.405	A first-generation cephalosporin antibiotic used in the treatment of bacterial infections of the respiratory and urinary tracts and of the skin and soft tissues.	Anti-Bacterial Agents
Ceftaroline fosamil	684.67	An antibacterial agent used to treat various bacterial infections, such as acute bacterial skin and skin structure infections and community-acquired bacterial pneumonia.	Anti-Bacterial Agents
Ceftazidime	546.576	An injected broad-spectrum third-generation cephalosporin beta-lactam antibiotic used to treat or prevent a variety of bacterial infections, including pneumonia, gynecological infections, bone and joint infections, and septicemia, among others.	Anti-Bacterial Agents
Ceftibuten	410.425	A third-generation cephalosporin antibiotic commonly used in the treatment of acute bacterial exacerbations of chronic bronchitis (ABECB), acute bacterial otitis media, pharyngitis, and tonsillitis.	Anti-Bacterial Agents
Ceftizoxime	383.403	A third-generation cephalosporin antibiotic used in the treatment of various bacterial infections, including lower respiratory tract infection, urinary tract infection, and gonorrhea.	Anti-Bacterial Agents
Ceftobiprole	534.57	A cephalosporin antibiotic used to treat both community and hospital-acquired pneumonia caused by susceptible bacteria.	Anti-Bacterial Agents
Ceftobiprole medocaril	690.66	A cephalosporin indicated in the treatment of pneumonia.	Anti-Bacterial Agents
Ceftolozane	666.69	A cephalosporin antibiotic used to treat complicated intra-abdominal infections in combination with metronidazole, complicated urinary tract infections, and hospital-acquired pneumonia.	Anti-Bacterial Agents
Ceftriaxone	554.58	A broad-spectrum cephalosporin antibiotic used for the treatment of bacterial infections in various locations, such as in the respiratory tract, skin, soft tissue, and urinary tract.	Anti-Bacterial Agents
Cefuroxime	424.385	A cephalosporin indicated for the treatment of a variety of infections including acute bacterial otitis media, several upper respiratory tract infections, skin infections, urinary tract infections, gonorrhea, early Lyme disease, and impetigo.	Anti-Bacterial Agents
Celecoxib	381.372	An NSAID used to treat osteoarthritis, rheumatoid arthritis, acute pain, menstrual symptoms, and to reduce polyps is familial adenomatous polyposis.	COX-2 Inhibitors
Celiprolol	379.501	A beta-blocker for the management of hypertension and angina pectoris.	Antihypertensive Agents
Cenobamate	267.67	A small molecule drug indicated to treat partial onset seizures in adults.	Anticonvulsants
Cephalexin	347.389	A first generation cephalosporin used to treat certain susceptible bacterial infections.	Anti-Bacterial Agents
Cephaloglycin	405.425	For treatment of severe infections caused by susceptible bacteria.	Anti-Bacterial Agents
Ceritinib	558.135	An antineoplastic kinase inhibitor used to treat anaplastic lymphoma kinase (ALK)-positive metastatic non-small cell lung cancer (NSCLC) in patients with inadequate clinical response or intolerance to crizotinib.	Anaplastic lymphoma kinase (ALK) inhibitors
Cerivastatin	459.5503	A statin (or HMG CoA reductase inhibitor) used with dietary changes to decrease lipid levels and reduce the risk of cardiovascular events.	Hydroxymethylglutaryl-CoA Reductase Inhibitors
Certoparin	0	A low molecular weight heparin (LMWH) used to prevent blood clots, specifically deep vein thrombosis.	Anticoagulants
Ceruletide	1352.405	Caerulein is used in the treatment of paralytic ileus and as diagnostic aid in pancreatic malfunction.	Tests for Bile Duct Patency
Cetalkonium	360.649	An antiseptic used as a preservative or to treat certain topical infections.	Anti-Infective Agents, Local
Cetirizine	388.888	A selective Histamine-1 antagonist drug used in allergic rhinitis and chronic urticaria.	Piperazine Derivatives
Cetrimonium	284.5435	A compound that can be used as a topical antiseptic.	Medicated Shampoos
Cetrorelix	1431.038	A synthetic peptide antagonist of gonadotropin releasing hormone used to prevent luteinizing hormone surges in women undergoing assisted reproduction therapy.	Anti-Gonadotropin-Releasing Hormones
Cetyl alcohol	242.4406	No therapeutic indications in medicinal products. Indicated to be used as an indirect additive in food contact substances, or an ingredient in commercial or cosmetic products.	Alcohols
Cetylpyridinium	304.541	A compound used to reduce plaque and gingivitis, as well as whiten teeth.	Anti-Infective Agents
Cevimeline	199.313	A muscarinic agonist with parasympathomimetic activities that is used for the symptomatic treatment of dry mouth in patients with Sjögren's Syndrome.	Parasympathomimetics
Chenodeoxycholic acid	392.572	A bile acid used for the treatment of primary biliary cirrhosis.	Bile Acid Preparations
Chloral hydrate	165.403	A mild hypnotic used for experimental purposes that was previously used for the treatment of insomnia.	Central Nervous System Depressants
Chlorambucil	304.212	A chemotherapy agent used in the management of chronic lymphocytic leukemia and malignant lymphomas.	Nitrogen Mustard Analogues
Chloramphenicol	323.129	A broad spectrum antibiotic that is effective against a variety of susceptible and serious bacterial infections but is not frequently used because of its high risk of bone marrow toxicity.	Antiinfectives for Treatment of Acne
Chloramphenicol palmitate	561.54	Not Annotated	Alcohols
Chloramphenicol succinate	423.202	A broad-spectrum antibiotic agent used for the treatment of acute and severe infections caused by susceptible bacterial strains.	Anti-Bacterial Agents
Chlorcyclizine	300.826	Chlorcyclizine is a first generation phenylpiperazine class antihistamine used to treat urticaria, rhinitis, pruritus, and other allergy symptoms. Chlorcyclizine also has some local anesthetic, anticholinergic, and antiserotonergic properties, and can...	Piperazine Derivatives
Chlordiazepoxide	299.755	A benzodiazepine used to treat the withdrawal symptoms of acute alcoholism, to treat preoperative anxiety, and to treat anxiety over a short term period.	Anti-Anxiety Agents
Chlorhexidine	505.447	An antiseptic used to sterilize for surgeries and in healthcare practice, to reduce pocket depth in periodontitis, and to treat gingivitis.	Anti-Infective Agents, Local
Chloric acid	84.459	Not Annotated	Anions
Chlormerodrin	367.2	Previously used as a diuretic. The radiolabeled form has been used as a diagnostic and research tool.	Alkylmercury Compounds
Chlormerodrin Hg-197	363.57	Chlormerodrin Hg-197 is a radiolabelled form of chlormerodrin, an organomercury compound that was previously used as a diuretic. Its radiolabelled form was used as diagnostics in brain scans.	\N
Chlormezanone	273.736	Used in the management of anxiety and in the treatment of muscle spasm.	Oxazol, Thiazine, and Triazine Derivatives
Chlorobutanol	177.45	No approved therapeutic indications on its own.	Butanols
Chloroform	119.378	Chloroform is an organic small molecule, member of the family of the chloromethanes that presents a formula of CHCl3. It is a colorless, sweet-smelling, dense liquid that is produced on...	Hydrocarbons, Halogenated
Chloroprocaine	270.755	A local anesthetic agent indicated for intrathecal injection in adults for the production of subarachnoid block, spinal anesthesia, or ocular surface anesthesia.	Esters of Aminobenzoic Acid
Chloroquine	319.872	An antimalarial drug used to treat susceptible infections with P. vivax, P. malariae, P. ovale, and P. falciparum. It is also used for second line treatment for rheumatoid arthritis.	Aminoquinolines
Chlorothiazide	295.723	A thiazide diuretic used to treat hypertension and edema in congestive heart failure, hepatic cirrhosis, and corticosteroid and estrogen therapy.	Sulfonamides
Chloroxine	214.048	An antibacterial agent used for the treatment of dandruff and mild to moderately severe seborrheic dermatitis of the scalp.	Anti-Bacterial Agents
Chloroxylenol	156.61	An antimicrobial used to treat cuts, bites, stings, abrasions, and used as an antiseptic hand cleaner.	Phenol and Derivatives
Chlorphenesin	202.635	A phenol ether used to treat painful muscular conditions.	Muscle Relaxants, Centrally Acting Agents
Chlorphenesin carbamate	245.66	Not Annotated	Alcohols
Chlorpheniramine	274.788	A histamine-H1 receptor antagonist indicated for the management of symptoms associated with upper respiratory allergies.	Substituted Alkylamines
Chlorpromazine	318.864	A phenothiazine antipsychotic used to treat nausea, vomiting, preoperative anxiety, schizophrenia, bipolar disorder, and severe behavioral problems in children.	Phenothiazines With Aliphatic Side-Chain
Chlorpropamide	276.74	A sulfonylurea used in the treatment of non insulin dependent diabetes mellitus.	Sulfonylureas
Chlorprothixene	315.86	A thioxanthene antipsychotic.	Thioxanthene Derivatives
Chlorquinaldol	228.07	Chlorquinaldol was used historically as a topical antiseptic agent for skin infections. It maintains use in European countries as a combination vaginal tablet with promestriene for use in the treatment...	Anti-Infective Agents, Local
Chlortetracycline	478.88	The first tetracycline antibiotic most commonly used for veterinary purposes.	Anti-Bacterial Agents
Chlorthalidone	338.766	A diuretic used to treat hypertension or edema caused by heart failure, renal failure, hepatic cirrhosis, estrogen therapy, and other conditions.	Low-Ceiling Diuretics and Potassium-Sparing Agents
Chlorzoxazone	169.565	A drug with muscle relaxant properties that is used as an adjunct to physical therapy and analgesics to treat stiffness and pain caused by a variety of musculoskeletal conditions.	Oxazol, Thiazine, and Triazine Derivatives
Cholecalciferol	384.6377	A form of Vitamin D used in the treatment of specific medical conditions such as refractory rickets, hypoparathyroidism, and familial hypophosphatemia, as well as osteoporosis and chronic kidney disease.	Bone Density Conservation Agents
Cholecystokinin	0	For use as a diagnostic aid for evaluation of gallbladder disorders. It is also used in conjunction with secretin in pancreatic insufficiency .	Tests for Pancreatic Function
Cholesterol	386.6535	The principal sterol of all higher animals, distributed in body tissues, especially the brain and spinal cord, and in animal fats and oils.	Cholestenes
Cholestyramine	0	A bile acid sequestrant used as an adjunct in the reduction of elevated serum cholesterol in patients with primary hypercholesterolemia, and for the relief of pruritus associated with partial biliary obstruction.	Anion Exchange Resins
Cholic Acid	408.5714	A bile acid used for the treatment of bile acid synthesis disorders due to single enzyme defects and as an adjunctive treatment of peroxisomal disorders with disrupted liver function.	Bile Acid Preparations
Choline	104.1708	A nutrient found in a wide variety of vitamins including pre-natal formulations.	Salicylic Acid and Derivatives
Choline C 11	138.62	Choline C11 is indicated for its use in positron emission tomography (PET) imaging in patients with suspected prostate cancer recurrence and non-informative bone scintigraphy, computerized tomography or magnetic resonance imaging.[FDA...	Drugs that are Mainly Renally Excreted
Choline C-11	103.173	An imaging agent used in positron emission tomography imaging for suspected recurrent prostate cancer and non-informative bone scintigraphy, computerized tomography, or magnetic resonance imaging.	Radioactive Diagnostic Agent
Choline magnesium trisalicylate	539.814	Choline magnesium trisalicylate is used to reduce pain and inflammation caused by conditions such as arthritis. This medication is also used to treat fever in adults.	Agents that produce hypertension
Choline salicylate	241.287	The oral gel is indicated for the relief of pain and discomfort of common mouth ulcers, cold sores, denture sore spots, infant teething and mouth ulcers, and sore spots due...	Salicylic Acid and Derivatives
Chondroitin sulfate	0	Chondroitin sulfate, used with glucosamine, is indicated to alleviate pain and inflammation from primary osteoarthritis. This supplement is reported to improve joint function and slow disease progression. Osteoarthritis is characterized...	Chondroitin
Chromic chloride	158.355	A supplement to intravenous solutions given for total parenteral nutrition (TPN).	Antioxidants
Chromic nitrate	238.0108	Indicated for use as a supplement to intravenous solutions given for total parenteral nutrition (TPN), to maintain chromium serum levels and to prevent depletion of endogenous stores and subsequent deficiency...	Anions
Chromium	51.9961	An ingredient found in a variety of supplements and vitamins.	Metals, Heavy
Chromium Cr-51	50.9448	Chromium Cr-51 is an isotope of chromium that has been used as a radioactive label for decades. It is used as a diagnostic radiopharmaceutical agent in nephrology to determine glomerular...	Chromium Isotopes
Chromium gluconate	637.437	Indicated for use as a supplement to intravenous solutions given for total parenteral nutrition (TPN), to maintain chromium serum levels and to prevent depletion of endogenous stores and subsequent deficiency...	Drugs that are Mainly Renally Excreted
Chromium nicotinate	418.305	A medication used to treat chromium deficiencies and associated symptoms and also in total parenteral nutrition.	Nicotinic Acids
Chromium picolinate	418.3005	Chromium picolinate has a chemical formula CrPic3 and reddish-pink color. It is a coordination complex consisting of chromium(III) and picolinic acid. Chromium picolinate is used as a nutritional supplement for...	Iron Chelating Agents
Chromous sulfate	148.05	Indicated for use as a supplement to intravenous solutions given for total parenteral nutrition (TPN), to maintain chromium serum levels and to prevent depletion of endogenous stores and subsequent deficiency...	Drugs that are Mainly Renally Excreted
Chymotrypsin	0	A digestive enzyme supplement used as supportive therapy to manage the side effects associated with conventional chemotherapy, radiotherapy, and hormone therapy.	Enzymes
Cianidanol	290.2681	An antioxidant flavonoid, occurring especially in woody plants as both (+)-catechin and (-)-epicatechin (cis) forms.	Catechin
Ciclesonide	540.697	A glucocorticoid used in the symptomatic relief of nasal symptoms associated with seasonal and perennial allergic rhinitis in adults and adolescents.	Glucocorticoids
Ciclopirox	207.2689	A broad-spectrum topical antifungal agent used to treat mild to moderate onychomycosis of fingernails and toenails in immunocompetent patients.	Antifungal Agents
Cidofovir	279.187	An antiviral agent used to treat Cytomegalovirus (CMV) retinitis in patients with AIDS.	Nucleosides and Nucleotides Excl. Reverse Transcriptase Inhibitors
Cilastatin	358.453	A renal dehydropeptidase inhibitor used to prevent degradation of imipenem. Both medications are used together to treat a variety of infections.	Cyclopropanes
Cilazapril	417.4986	An ACE inhibitor used for the management of hypertension and heart failure.	ACE Inhibitors and Diuretics
Cilostazol	369.4607	An antiplatelet agent and vasodilator used for the symptomatic relief of intermittent claudication.	Platelet Aggregation Inhibitors Excl. Heparin
Cimetidine	252.339	A histamine H2 receptor antagonist used to manage GERD, peptic ulcer disease, and indigestion.	Anti-Ulcer Agents
Cinacalcet	357.412	A calcium sensing receptor agonist used to treat secondary hyperparathyroidism in chronic kidney disease and hypercalcemia in parathyroid carcinoma.	Calcimimetic Agents
Cinchocaine	343.4632	An anesthetic used for local or regional anesthesia.	Amides
Cinnamaldehyde	132.1592	Cinnamaldehyde is approved by the FDA for use within allergenic epicutaneous patch tests which are indicated for use as an aid in the diagnosis of allergic contact dermatitis (ACD) in...	Antimutagenic Agents
Cinnamyl alcohol	134.1751	Cinnamyl alcohol is approved by the FDA for use within allergenic epicutaneous patch tests which are indicated for use as an aid in the diagnosis of allergic contact dermatitis (ACD)...	Standardized Chemical Allergen
Cinnarizine	368.524	A drug used for the management of labyrinthine disorder symptoms, including vertigo, tinnitus, nystagmus, nausea, and vomiting.	Antivertigo Preparations
Cinoxacin	262.2182	For the treatment of initial and recurrent urinary tract infections in adults caused by the following susceptible microorganisms: Escherichia coli, Proteus mirabilis, Proteus vulgaris, Klebsiella species (including K. pneumoniae), and...	Anti-Infective Agents
Cinoxate	250.294	Not Annotated	Sunscreen Agents
Ciprofibrate	289.15	Not Annotated	Fibric Acids
Ciprofloxacin	331.3415	A second generation fluoroquinolone used to treat various susceptible bacterial infections.	Fluoroquinolones
Cisapride	465.945	A medication used to treat heartburn associated with GERD.	Propulsives
Cisatracurium	929.16	A skeletal muscle relaxant used to facilitate tracheal intubation, muscle relaxation in surgery, or mechanical ventilation.	Neuromuscular Blocking Agents
Cisplatin	300.05	A platinum based chemotherapy agent used to treat various sarcomas, carcinomas, lymphomas, and germ cell tumors.	Chlorine Compounds
Citalopram	324.3919	A selective serotonin reuptake inhibitor (SSRI) used in the treatment of depression.	Antidepressive Agents Indicated for Depression
Citicoline	488.324	An endogenous intermediate in the formation of phosphatidylcholine from choline which is thought to have neuroprotective effects.	Cytidine Diphosphate
Citric acid	192.1235	An anti-chelation additive used in blood collection tubes and as a flavoring and preservative agent in various cosmetic and pharmaceutical products.	Acid Preparations
Citrus bioflavonoids	0	Not Annotated	Chromones
Cladribine	285.687	A purine antimetabolite used for the management of relapsing forms of Multiple Sclerosis (MS), used in patients who have not responded to or who were unable to tolerate alternative MS drugs.	Purine Analogues
Clarithromycin	747.9534	A macrolide antibiotic used for the treatment of a wide variety of bacterial infections such as acute otitis, pharyngitis, tonsillitis, respiratory tract infections, uncomplicated skin infections, and helicobacter pylori infection.	Anti-Bacterial Agents
Clascoterone	402.531	An androgen receptor antagonist used for the topical treatment of acne vulgaris in patients 12 years of age and older.	Androgen Receptor Inhibitors
Clavulanic acid	199.1608	A beta lactamase inhibitor used to enhance the effectiveness of beta lactam antibiotics.	beta-Lactamase Inhibitors
Clemastine	343.89	An antihistamine with sedative and anticholinergic effects used to treat the symptoms of allergic rhinitis.	Aminoalkyl Ethers
Clenbuterol	277.19	A decongestant and bronchodilator used in a variety of respiratory conditions.	Selective Beta 2-adrenergic Agonists
Clevidipine	456.316	A dihydropyridine L-type calcium channel blocker used to lower blood pressure when oral antihypertensive therapy is not feasible or not desirable.	Dihydropyridine Derivatives
Clidinium	352.4467	A synthetic anticholinergic used to treat peptic ulcer disease, colicky abdominal pain, diverticulitis, and IBS.	Agents producing tachycardia
Clindamycin	424.98	A lincosamide antibiotic used to treat serious infections caused by susceptible anaerobic, streptococcal, staphylococcal, and pneumococcal bacteria.	Antiinfectives for Treatment of Acne
Clioquinol	305.5	An antifungal cream used to treat a variety of fungal infections.	Hydroxyquinoline Derivatives
Clobazam	300.74	A benzodiazepine used as adjunct treatment in seizures associated with Lennox-Gastaut syndrome.	Anticonvulsants
Clobetasol	410.907	Clobetasol is under investigation for the treatment of Scleroderma. Clobetasol has been investigated for the prevention of Psoriasis and Cutaneous Atrophy Due to Corticosteroids.	Corticosteroids, Very Potent (Group IV)
Clobetasol propionate	466.97	A corticosteroid used to treat corticosteroid-responsive dermatoses and plaque psoriasis.	Anti-Inflammatory Agents
Clobetasone	408.89	A corticosteroid used to treat dry eyes, eczema, and dermatitis.	Corticosteroids, Moderately Potent (Group II)
Clocortolone	410.907	A corticosteroid used to treat inflammatory and pruritic dermatoses of the scalp.	Corticosteroids, Moderately Potent (Group II)
Clodronic acid	244.892	A bisphosphonate used to treat osteoporosis in postmenopausal women, hypercalcemia of malignancy, and osteolysis.	Bisphosphonates
Clofarabine	303.677	A purine nucleoside used to treat relapsed or refractory acute lymphoblastic leukemia in patients 1 to 21 years old.	Purine Analogues
Clofazimine	473.396	A riminophenazine antimycobacterial used to treat leprosy.	Drugs for Treatment of Lepra
Clofedanol	289.8	An antitussive used for the symptomatic relief of acute cough caused by minor throat and bronchial irritation.	Alcohols
Clofibrate	242.699	A fibric acid derivative used to treat hypertriglyceridemia and high cholesterol.	Fibric Acids
Clomifene	405.96	A medication used to induce ovulation.	Ovulation Stimulants, Synthetic
Clomipramine	314.852	A tricyclic antidepressant used in the treatment of obsessive-compulsive disorder and disorders with an obsessive-compulsive component, such as depression, schizophrenia, and Tourette’s disorder.	Non-Selective Monoamine Reuptake Inhibitors
Clonazepam	315.711	A long-acting benzodiazepine with intermediate onset commonly used to treat panic disorders, severe anxiety, and seizures.	Anticonvulsants
Clonidine	230.094	An alpha-2 adrenergic agonist used to treat hypertension and severe cancer pain, among other conditions, and to treat withdrawal symptoms from various substances. It is also used to aid in the diagnosis of pheochromocytoma and to prevent migraines.	Imidazoline Receptor Agonists
Clopidogrel	321.822	An antiplatelet agent used to prevent blood clots in peripheral vascular disease, coronary artery disease, and cerebrovascular disease.	Platelet Aggregation Inhibitors Excl. Heparin
Clorazepic acid	314.723	A benzodiazepine used to treat anxiety, partial seizures, and alcohol withdrawal.	Anticonvulsants
Clothiapine	343.87	An atypical antipsychotic indicated in the treatment of acute psychosis, exacerbations of chronic psychosis, chronic psychosis, paranoid psychosis, and anxiety.	Diazepines, Oxazepines, Thiazepines and Oxepines
Clotiazepam	318.821	A thienodiazepine used to manage anxiety disorders and insomnia.	Benzodiazepines and benzodiazepine derivatives
Clotrimazole	344.837	A topical broad-spectrum antifungal agent used for the treatment of a wide variety of dermatophyte infections and candidiasis.	Antiinfectives and Antiseptics for Local Oral Treatment
Cloxacillin	435.881	An antibiotic agent used for the treatment of beta-hemolytic streptococcal and pneumococcal infections as well as staphylococcal infections.	Beta-Lactamase Resistant Penicillins
Clozapine	326.823	An atypical or second-generation antipsychotic drug used in treatment-resistant schizophrenia and to decrease suicide risk in schizophrenic patients.	Diazepines, Oxazepines, Thiazepines and Oxepines
Coal tar	0	Relieving itching, irritation, redness, dryness, scaling, and flaking of the skin caused by psoriasis, seborrhea, or eczema.	Keratolytic Agents
Cobalt	58.9332	A metal element used in various nutritional products.	Metals, Heavy
Cobalt chloride	129.839	Not Annotated	Antimutagenic Agents
Cobicistat	776.03	A CYP3A inhibitor used to increase the systemic exposure of atazanavir or darunavir in combination with other antiretroviral agents in the treatment of HIV-1 infection.	Anti-HIV Agents
Cobimetinib	531.318	An antineoplastic agent and selective inhibitor of the mitogen-activated extracellular kinase (MEK) pathway used to treat unresectable or metastatic melanoma.	Mitogen-activated protein kinase (MEK) inhibitors
Cocaine	303.3529	An ester local anesthetic used during diagnostic procedures and surgeries in or through the nasal cavities.	Analgesics and Anesthetics
Cocarboxylase	424.306	The coenzyme form of Vitamin B1 present in many animal tissues. It is a required intermediate in the pyruvate dehydrogenase complex and the ketoglutarate dehydrogenase complex.	Coenzymes
Codeine	299.3642	An opioid analgesic used to treat moderate to severe pain when the use of an opioid is indicated.	Natural Opium Alkaloids
Coenzyme M	142.197	A uroprotective agent used for the reduction and prophylaxis of oxazaphosphorine-induced toxicity in the urinary tract.	Detoxifying Agents for Antineoplastic Treatment
Colchiceine	385.416	Colchiceine is one of several metabolites of the anti-gout medication colchicine.	Alkaloids
Colchicine	399.443	An alkaloid used in the symptomatic relief of pain in attacks of gout and to treat the inflammatory symptoms of Familial Mediterranean Fever (FMF).	Preparations With No Effect on Uric Acid Metabolism
Colesevelam	0	A bile acid sequestrant used to lower LDL-C in adults with hyperlipidemia and pediatric patients with heterozygous familial hypercholesterolemia, and to improve glycemic control in type 2 diabetes.	Allylamine
Colestilan chloride	0	Colestilan is an ingredient in the EMA-withdrawn product BindRen.	Drugs for Treatment of Hyperkalemia and Hyperphosphatemia
Colestipol	0	A bile acid sequestrant used as an adjunct to diet and exercise to reduce LDL-C cholesterol levels in patients with primary hypercholesterolemia.	Anion Exchange Resins
Colfosceril palmitate	734.0389	A pulmonary surfactant used for the treatment of Respiratory Distress Syndrome (RDS) in premature infants.	Lung Surfactants
Colistimethate	1634.87	An antibiotic indicated for treatment of infections caused by susceptible strains of certain gram-negative bacilli. It is particularly useful for targeting sensitive strains of Pseudomonas aeruginosa.	Polymyxin-class Antibacterial
Colistin	1155.455	A polymyxin antibiotic used to treat bacterial infections caused by susceptible Gram negative bacteria.	Anti-Bacterial Agents
Conivaptan	498.5744	An antidiuretic hormone inhibitor used to raise serum sodium levels.	Antidiuretic Hormone Receptor Antagonists
Conjugated estrogens	0	A mixture of estrogens used in estrogen replacement therapy for menopause and hypoestrogenism, used in the treatment of various malignancies, and used in the treatment of postmenopausal osteoporosis.	Natural and Semisynthetic Estrogens, Plain
Copanlisib	480.529	A medication used to treat relapsed follicular lymphoma who have attempted at least two other treatments.	Phosphatidylinositol-3-kinase (Pi3K) inhibitors
Copper	63.546	A transition metal found in a variety of supplements and vitamins, including intravenous solutions for total parenteral nutrition (TPN).	Copper-containing Intrauterine Device
Copper Cu-64	63.9298	Copper-64 is a radiopharmaceutical usually found in the +2 oxidation state as the complexes including the +1 state tend to be more unstable. It is used in molecular radiotherapy and...	\N
Copper gluconate	453.841	An ingredient found in a variety of supplements and vitamins.	Sugar Acids
Copper oxodotreotide Cu-64	1497.55	A Cu labeled somatostatin analog used in positron emission tomography to detect certain types of neuroendocrine tumors.	Copper Radioisotopes
Cortisone acetate	402.4807	A steroid hormone used for the relief of the inflammatory and pruritic manifestations of corticosteroid-responsive dermatoses and endocrine disorders associated with inadequate production of steroid hormones.	Anti-Inflammatory Agents
Creatine	131.1332	For nutritional supplementation, also for treating dietary shortage or imbalance.	Amino Acids
Cresol	0	A dental disinfectant used to remove dental pulp.	Standardized Chemical Allergen
Crisaborole	251.05	A non-steroidal topical medication used for the treatment of mild-moderate atopic dermatitis.	Agents for Dermatitis, Excluding Corticosteroids
Crizotinib	450.337	A receptor tyrosine kinase inhibitor used to treat metastatic non-small cell lung cancer (NSCLC) where the tumors have been confirmed to be anaplastic lymphoma kinase (ALK), or ROS1-positive.	Anaplastic lymphoma kinase (ALK) inhibitors
Crofelemer	0	An antidiarrheal agent used for the symptomatic relief of drug-induced non-infectious diarrhea in adult patients with HIV/AIDS receiving antiretroviral therapy.	Antidiarrheals
Cromoglicic acid	468.3665	A medication used to treat asthma, allergic reactions of the eyes and nose, as well as other mast cell reactions.	Agents for Dermatitis, Excluding Corticosteroids
Crotamiton	203.2802	A topical scabicidal and antipruritic agent used for scabies eradication and for the relief of pruritus.	Pesticides
Cryptenamine	0	For the treatment of hypertension.	Antihypertensive Agents
Cupric Chloride	134.452	A transition metal found in a variety of supplements and vitamins, including intravenous solutions for total parenteral nutrition (TPN).	Elements
Cupric oxide	79.545	An ingredient found in a variety of supplements and vitamins.	Trace Elements
Cupric sulfate	159.609	A compound used as an intravenous copper supplement for Total Parenteral Nutrition (TPN).	Antidotes
Curcumin	368.3799	No approved therapeutic indications.	Antineoplastic Agents
CVac	0	Not Annotated	\N
Cyanocobalamin	1355.3652	A vitamin available in many formulations to correct vitamin B12 deficiency.	Corrinoids
Cyanocobalamin Co-57	1354.399	A diagnostic agent used for the diagnosis of pernicious anemia and other conditions related to malabsorption of vitamin B12.	Radioactive Diagnostic Agent
Cyanocobalamin Co-60	1356.389	Cyanocobalamin Co-60 is an analog of Vitamin B12 labeled with Co60. Cyanocobalamin Co-60 was used for the diagnosis of pernicious anemia, but now it is withdrawn from the market in...	\N
Cyclacillin	341.426	For the treatment of bacterial infections caused by susceptible organisms.	Anti-Bacterial Agents
Cyclandelate	276.3707	A vasodilator used for the treatment of various blood vessel diseases, such as claudication and arteriosclerosis.	Mandelic Acids
Cyclizine	266.3807	An antihistamine and antiemetic drug used for the prevention and treatment of nausea, vomiting, and dizziness associated with motion sickness, and vertigo.	Piperazine Derivatives
Cyclobenzaprine	275.3874	A skeletal muscle relaxant that works on the brainstem to treat muscle spasms of local origin.	Agents that reduce seizure threshold
Cycloguanil	251.715	Cycloguanil is the active metabolite of proguanil.	Biguanides
Cyclopenthiazide	379.87	Cyclopenthiazide is a thiazide diuretic with antihypertensive properties. In a double blind, randomized crossover study, cyclopenthiazide was effective in reducing diastolic blood pressure in mildly hypertensive non-insulin dependent diabetic patients...	Low-Ceiling Diuretics and Potassium-Sparing Agents
Cyclopentolate	291.3853	An anticholinergic used to cause mydriasis and cycloplegia for diagnostic testing.	Anticholinergic Agents
Cyclophosphamide	261.086	A nitrogen mustard used to treat lymphomas, myelomas, leukemia, mycosis fungoides, neuroblastoma, ovarian adenocarcinoma, retinoblastoma, and breast carcinoma.	Nitrogen Mustard Analogues
Cycloserine	102.0919	A broad-spectrum antibiotic used in the treatment of tuberculosis and certain urinary tract infections (UTI).	Anti-Bacterial Agents
Cyclosporine	1202.635	A steroid-sparing immunosuppressant used in organ and bone marrow transplants as well as inflammatory conditions such as ulcerative colitis, rheumatoid arthritis, and atopic dermatitis.	Calcineurin Inhibitors
Cyclothiazide	389.878	Cyclothiazide is indicated as adjunctive therapy in edema associated with congestive heart failure, hepatic cirrhosis, and corticosteroid and estrogen therapy. It is also indicated in the management of hypertension either...	Sulfonamides
Cycrimine	287.4397	For treatment and management of Parkinson's disease.	Agents producing tachycardia
Cyproheptadine	287.3981	A combined serotonin and histamine antagonist used in the treatment of allergic symptoms, for appetite stimulation, and off-label in the treatment of serotonin syndrome.	Agents producing tachycardia
Cyproterone acetate	416.938	A steroid used in combination with ethinyl estradiol to treat women with severe acne and symptoms of androgenization. Also used alone at much higher doses for palliative treatment of patients with prostate cancer	Antiandrogens and Estrogens
Cysteamine	77.149	A cystine depleting agent used to treat the effects of cystinosis.	Amino Acids and Derivatives
Cysteine	121.158	An amino acid commonly found as a component of total parenteral nutrition and used as an antidote for acetaminophen overdose.	Amino Acids, Neutral
Cystine	240.3	An oxidated derivative of the amino acid cysteine found in various nutritional products, acne treatments, and creams to treat cervical injury or inflammation.	Amino Acids, Diamino
Cytarabine	243.2166	A pyrimidine nucleoside analogue used to treat acute non-lymphocytic leukemia, lymphocytic leukemia, and the blast phase of chronic myelocytic leukemia.	Pyrimidine Analogues
D-alpha-Tocopherol acetate	472.7428	A form of vitamin E used to treat and prevent vitamin deficiencies.	Antioxidants
D-glucose	180.1559	A most commonly occurring isomer of glucose used as a carbohydrate supplementation in case of nutrient deprivation and metabolic disorders, such as hypoglycemia.	Glucose
D-Methionine	149.211	An amino acid found in mixture products used for nutrient supplementation.	\N
D-Serine	105.0926	A non-essential amino acid occurring in natural form as the L-isomer. It is synthesized from GLYCINE or THREONINE. It is involved in the biosynthesis of PURINES; PYRIMIDINES; and other amino...	\N
Dabigatran	471.521	Dabigatran is the active form of the orally bioavailable prodrug dabigatran etexilate.	Antithrombins
Dabigatran etexilate	627.7332	An anticoagulant used for the prevention of venous thromboembolic events or stroke in patients with recent elective hip or knee replacement surgery and atrial fibrillation.	Antithrombins
Dabrafenib	519.562	A kinase inhibitor used to treat patients with specific types of melanoma, non-small cell lung cancer, and thyroid cancer.	B-Raf serine-threonine kinase (BRAF) inhibitors
Dacarbazine	182.187	An antineoplastic agent used to treat malignant melanoma and Hodgkin's disease.	Alkylating Drugs
Daclatasvir	738.89	A direct-acting antiviral agent used to treat specific hepatitis C virus (HCV) infections in combination with other antiviral agents.	Antivirals for treatment of HCV infections
Dacomitinib	469.939	A medication used to treat non small cell lung cancer with EGFR exon 19 deletion of exon 21 L858R substitution.	Epidermal growth factor receptor (EGFR) tyrosine kinase inhibitors
Dactinomycin	1255.417	An actinomycin used to treat a wide variety of cancers.	Actinomycines
Dalbavancin	0	An antibacterial used to treat acute bacterial skin and skin structure infections (ABSSSI) caused by susceptible strains of Gram-positive bacteria.	Glycopeptide Antibacterials
Dalfampridine	94.1145	A potassium channel blocker used for the improvement of motor function in patients with multiple sclerosis (MS).	Aminopyridines
Dalfopristin	690.85	An antibiotic used with quinupristin to treat severe or life-threatening infections of vancomycin-resistant Enterococcus faecium (VREF), and skin infections caused by methicillin susceptible staphylococcus aureus or streptococcus pyogenes.	Anti-Bacterial Agents
Dalteparin	0	A low molecular weight heparin used for the prophylaxis of thrombotic events in certain patients and prevent acute cardiac ischemic events in patients with unstable angina and non-Q-wave myocardial infarction.	Anticoagulants
Danaparoid	0	A heparinoid with anticoagulant and antithrombotic activities used for the treatment of acute episode of Heparin-Induced Thrombocytopenia (HIT), and for prophylaxis in patients with a history of HIT.	Anticoagulants
Danazol	337.4553	A synthetic steroid and pituitary gonadotropin inhibitor used in the treatment of endometriosis and symptomatic treatment of severe pain and tenderness associated with benign fibrocystic breasts.	Antigonadotropins and Similar Agents
Dantrolene	314.257	A direct-acting skeletal muscle relaxant used for the treatment of management of the fulminant hypermetabolism of skeletal muscle leading to malignant hyperthermia crisis.	Dantrolene and Derivatives
Dantron	240.2109	A drug used to relieve acute and chronic inflammation of the oral cavity and oropharynx.	Contact Laxatives
Dapagliflozin	408.873	A sodium-glucose cotransporter 2 inhibitor used in the management of type 2 diabetes mellitus.	Sodium-glucose Cotransporter 2 (SGLT2) Inhibitors
Dapiprazole	325.4512	Used in the treatment of iatrogenically induced mydriasis produced by adrenergic (phenylephrine) or parasympatholytic (tropicamide) agents used in certain eye examinations.	Agents that produce hypertension
Daprodustat	393.44	A small-molecule hypoxia-inducible factor prolyl hydroxylase inhibitor used for the treatment of anemia in patients with chronic kidney disease.	Amino Acids
Dapsone	248.301	A sulfone drug used to treat acne vulgaris, Hansen's disease, and dermatitis herpetiformis.	Drugs for Treatment of Lepra
Daptomycin	1620.693	A cyclic lipopeptide antibiotic used to treat complicated skin and skin structure infections by susceptible Gram-positive bacteria and bacteremia due to Staphylococcus aureus.	Anti-Bacterial Agents
Daridorexant	450.93	A dual orexin receptor antagonist used to treat insomnia in adults.	Orexin Receptor Antagonists
Darifenacin	426.55	An M3 muscarinic receptor blocker used to treat urinary incontinence.	Drugs for Urinary Frequency and Incontinence
Darolutamide	398.85	An androgen receptor antagonist used for castration-resistant, non-metastatic prostate cancer and metastatic hormone-sensitive prostate cancer.	Antiandrogens
Darunavir	547.664	A HIV protease inhibitor used in the treatment of human immunodeficiency virus (HIV) infection in patients with history of prior antiretroviral therapies.	Sulfonamides
Dasabuvir	493.58	A direct-acting antiviral agent used to treat specific hepatitis C virus (HCV) infections in combination with other antiviral agents.	Antivirals for treatment of HCV infections
Dasatinib	488.006	A tyrosine kinase inhibitor used for the treatment of Philadelphia chromosome-positive acute lymphoblastic leukemia or chronic myeloid leukemia.	Bcr-Abl Tyrosine Kinase Inhibitors
Daunorubicin	527.5199	An anthracycline aminoglycoside used to induce remission of nonlymphocytic leukemia and acute lymphocytic leukemia.	Anthracyclines and Related Substances
Debrisoquine	175.2303	For the treatment of moderate and severe hypertension, either alone or as an adjunct, and for the treatment of renal hypertension.	Guanidine Derivatives
Decamethonium	258.4863	For use as a skeletal muscle relaxant	Neuromuscular Depolarizing Agents
Decitabine	228.2053	A chemotherapeutic pyrimidine nucleoside analogue used for the treatment of myelodysplastic syndromes (MDS) by inducing DNA hypomethylation and corresponding alterations in gene expression.	Pyrimidine Analogues
Deferasirox	373.3615	An iron chelator used to treat chronic iron overload caused by blood transfusions. Also used in patients with non-transfusion-dependent thalassemia syndromes, and in patients with elevated liver iron concentration and serum ferritin.	Benzoates
Deferiprone	139.1519	An iron chelator used to treat patients with transfusional iron overload caused by thalassemia syndromes.	Iron Chelating Agents
Deferoxamine	560.684	A chelating agent used to treat iron or aluminum toxicity and some blood transfusion dependent anemias.	Hydroxamic Acids
Deflazacort	441.524	A corticosteroid used to treat Duchenne muscular dystrophy.	Glucocorticoids
Degarelix	1632.29	A GnRH receptor antagonist used in the management of advanced prostate cancer.	Gonadotropin-releasing Hormone Antagonists
Dehydrocholic acid	402.531	No approved therapeutic indications.	Cholagogues and Choleretics
Delafloxacin	440.76	A fluoroquinolone antibiotic used to treat skin and skin structure infections.	Fluoroquinolones
Delamanid	534.492	An antibiotic used to treat multidrug resistant tuberculosis.	Antiinfectives for Systemic Use
Delavirdine	456.561	A non-nucleoside reverse transcriptase inhibitor used to treat HIV infection.	Non-Nucleoside Reverse Transcriptase Inhibitors
Demecarium	556.7797	For the topical treatment of chronic open-angle glaucoma.	Cholinesterase Inhibitors
Demeclocycline	464.853	A tetracycline antibiotic used to treat a wide variety of susceptible bacterial infections.	Anti-Bacterial Agents
Deoxycholic acid	392.572	A cytolytic agent injected subcutaneously to improve the appearance submental fat.	Cholagogues and Choleretics
Dequalinium	456.6654	A quaternary ammonium cation antimicrobial agent used to treat common infections of the mouth and throat, as well as vaginal candidiasis.	Anti-Infective Agents, Local
Deserpidine	578.6527	An alkaloid that has been used to manage hypertension.	Secologanin Tryptamine Alkaloids
Desflurane	168.0378	A general inhalation anesthetic for inpatient and outpatient surgery in adults.	Hydrocarbons, Halogenated
Desipramine	266.3807	A tricyclic antidepressant used in the treatment of depression.	Non-Selective Monoamine Reuptake Inhibitors
Deslanoside	943.0791	For the treatment and management of Congestive cardiac insufficiency, arrhythmias and heart failure.	Digitalis Glycosides
Desloratadine	310.821	A second generation tricyclic antihistamine used to treat seasonal and non seasonal allergic rhinitis, pruritus, and urticaria.	Anticholinergic Agents
Desmopressin	1069.22	A synthetic analog of vasopressin used to reduce renal excretion of water in central diabetes insipidus and nocturia.	Vasopressin and Analogues
Desogestrel	310.473	A synthetic progestin used in contraception, often in combination with ethinyl estradiol.	Progestogens and Estrogens, Sequential Preparations
Desonide	416.5073	A topical corticosteroid used for the symptomatic treatment of inflammatory and pruritic manifestations of corticosteroid responsive dermatoses.	Corticosteroids, Moderately Potent (Group II)
Desoximetasone	376.4617	A glucocorticoid used to treat inflammatory and pruritic corticosteroid-responsive dermatoses.	Corticosteroids, Potent (Group III)
Desoxycorticosterone acetate	372.505	Not Annotated	Desoxycorticosterone
Desvenlafaxine	263.3752	An antidepressant agent and SNRI used for the treatment of major depressive disorders in adults.	Agents producing tachycardia
Deucravacitinib	425.467	A TYK2 inhibitor being investigated as a treatment for psoriasis.	Selective Immunosuppressants
Deutetrabenazine	323.466	A vesicular monoamine transporter 2 inhibitor used for the symptomatic treatment of tardive dyskinesia and chorea associated with Huntington's disease.	Cytochrome P-450 CYP1A2 Substrates
Dexamethasone	392.4611	A glucocorticoid available in various modes of administration that is used for the treatment of various inflammatory conditions, including bronchial asthma, as well as endocrine and rheumatic disorders.	Corticosteroids for Local Oral Treatment
Dexamethasone acetate	434.4977	Commonly known as decadron, dexamethasone acetate is a glucocorticosteroid previously marketed in the USA for the treatment of inflammatory respiratory, allergic, autoimmune, and other conditions.[T797,L10695,L14348] Developed in 1957, dexamethasone is...	Anti-Inflammatory Agents
Dexamethasone metasulfobenzoate	576.63	An ophthalmic and auricular corticosteroid used with antibiotics for the treatment of otitis externa, blepharitis, and other inflammatory eye conditions.	Adrenal Cortex Hormones
Dexbrompheniramine	319.239	An antihistamine used to treat allergy symptoms including upper respiratory tract symptoms.	Substituted Alkylamines
Dexchlorpheniramine maleate	390.86	A first generation antihistamine used to treat allergic and vasomotor rhinitis, allergic conjunctivitis, and mild urticaria and angioedema.	Histamine H1 Antagonists
Dexfenfluramine	231.2573	For the management of obesity including weight loss and maintenance of weight loss in patients on a reduced calorie diet	Centrally Acting Antiobesity Products
Dexibuprofen	206.2808	A pharmacologically active enantiomer of racemic ibuprofen (NSAID) used to treat pain and inflammation.	Propionates
Dexketoprofen	254.2806	An NSAID that is the R(-)-enantiomer of racemic ketoprofen with analgesic and anti-inflammatory properties used for the treatment of mild to moderate pain.	Antiinflammatory Preparations, Non-Steroids for Topical Use
Dexlansoprazole	369.36	A proton pump inhibitor used to help gastrointestinal ulcers heal, to treat symptoms of gastroesophageal reflux disease (GERD), to eradicate Helicobacter pylori, and to treat hypersecretory conditions such as Zollinger-Ellison Syndrome.	Anti-Ulcer Agents
Dexmedetomidine	200.2795	An alpha-2 agonist used for sedation during various procedures.	Agents producing tachycardia
Dexmethylphenidate	233.3062	A norepinephrine-dopamine reuptake inhibitor used in the treatment of ADHD in conjunction with other therapies.	Centrally Acting Sympathomimetics
Dexpanthenol	205.2515	An alcoholic analogue of D-pantothenic acid that is used as a supplement or application to support a healthy epithelium and is also used to prevent vitamin deficiency in patients receiving total parenteral nutrition (TPN).	Vitamin B Complex
Dexrazoxane	268.2691	A cytoprotective drug used to prevent and improve cardiomyopathy associated with doxorubicin treatment for metastatic breast cancer.	Detoxifying Agents for Antineoplastic Treatment
Dextran	0	A low molecular weight dextran used as an adjunctive treatment of shock or impending shock due to hemorrhage, burns, surgery or other trauma, as well as the prophylaxis of venous thrombosis and pulmonary embolism during high-risk medical procedures.	Blood Substitutes and Plasma Protein Fractions
Dextroamphetamine	135.2062	A sympathomimetic agent used in the treatment of attention deficit hyperactivity disorder (ADHD) and narcolepsy.	Centrally Acting Sympathomimetics
Dextromethorphan	271.404	An NMDA receptor antagonist used to treat cases of dry cough.	Opium Alkaloids and Derivatives
Dextropropoxyphene	339.4712	An opioid analgesic used to treat mild to moderate pain.	Diphenylpropylamine Derivatives
Dextrose, unspecified form	0	A form of glucose used for caloric supply and the replenishment of fluid in total parenteral nutrition and other therapies as well as for the treatment of hypoglycemic episodes.	Caloric Agents
Dextrothyroxine	776.87	A thyroid hormone used to treat hyperlipidemia.	Amino Acids, Aromatic
Dezocine	245.3599	Indicated in the treatment of moderate to severe pain.	Analgesics
Diacerein	368.297	An slow-onset anthraquinone IL-1 inhibitor used in the treatment of degenerative joint diseases like osteoarthritis.	Anti-Inflammatory Agents
Diacetyl benzoyl lathyrol	522.638	Diacetyl benzoyl lathyrol is an active ingredient in whitening creams. It is also reported to be a skin conditioning agent.	\N
Diaminopropanol tetraacetic acid	322.27	Diaminohydroxypropanetetraacetic acid has been investigated for the treatment of Vascular Disease, Coronary Disease, Myocardial Ischemia, Coronary Restenosis, and Coronary Artery Disease, among others.	\N
Diamorphine	369.411	An opioid analgesic agent used in the relief of severe pain associated with surgical procedures, myocardial infarction or pain in the terminally ill and for the relief of dyspnea in acute pulmonary edema.	Drugs Used in Opioid Dependence
Diatrizoate	613.9136	An injected contrast agent used in radiology.	Watersoluble, Nephrotropic, High Osmolar X-Ray Contrast Media
Diazepam	284.74	A long-acting benzodiazepine with rapid onset commonly used to treat panic disorders, severe anxiety, alcohol withdrawal, and seizures.	Anti-Anxiety Agents
Diazolidinylurea	278.2194	An ingredient used in hospitals for disinfection.	Standardized Chemical Allergen
Diazoxide	230.671	A non diuretic benzothiadiazine indicated for the management of hypoglycemia in patients who produce an excess of insulin caused by a variety of conditions.	Sulfonamides
Dibekacin	451.521	Dibekacin is an aminoglycoside antibiotic marketed in Japan .	Anti-Bacterial Agents
Dibenzepin	295.386	Dibenzepin is approved for use in Europe.	Non-Selective Monoamine Reuptake Inhibitors
Dichloralphenazone	519.032	Dichloralphenazone is a sedative composed of chloral hydrate and phenazone. It is typically found in combination products Nodolor and Midrin containing isometheptene and acetaminophen used for the relief of tension...	Alcohols
Dichloroacetic acid	128.942	Dichloroacetic acid, often abbreviated DCA, is an acid analogue of acetic acid in which two of the three hydrogen atoms of the methyl group have been replaced by chlorine atoms....	Chloroacetates
Dichlorobenzene	0	Dichlorobenzene refers to any of, or a mixture of, three isomers consisting of benzene in which two of the hydrogen atoms are replaced by chlorine atoms: ortho-, meta-, and paradichlorobenzene....	Benzene Derivatives
Dichlorobenzyl alcohol	177.02	A medication used to treat a sore throat.	Anti-Infective Agents, Local
Dichromate	215.986	Not Annotated	Caustics
Diclofenac	296.149	An NSAID used to treat the signs and symptoms of osteoarthritis and rheumatoid arthritis.	Acetic Acid Derivatives and Related Substances
Diclofenamide	305.159	A carbonic anhydrase inhibitor used for the management of open-angle and secondary glaucoma, as well as acute angle-closure glaucoma in delayed pre-operative setting requiring a reduction in intraocular pressure.	Sulfonamides
Dicloxacillin	470.326	A penicillin used to treat penicillinase-producing bacterial infections that are susceptible to the drug.	Beta-Lactamase Resistant Penicillins
Dicoumarol	336.295	For decreasing blood clotting. Often used along with heparin for treatment of deep vein thrombosis.	Anticoagulants
Dicyclomine	309.4867	An antimuscarinic agent used to treat IBS.	Synthetic Anticholinergics, Esters With Tertiary Amino Group
Didanosine	236.2273	A reverse transcriptase inhibitor used to treat HIV.	Anti-HIV Agents
Didecyldimethylammonium	326.6232	A disinfectant and microbicidal agent used in a variety of products.	Quaternary Ammonium Compounds
Dienestrol	266.34	A non steroidal estrogen used to treat atrophic vaginitis and kraurosis vulvae.	Synthetic Estrogens, Plain
Dienogest	311.425	An oral progestin used for the treatment of endometriosis as monotherapy or contraception in combination with ethinylestradiol.	Pregnadien Derivatives
Diethylamino hydroxybenzoyl hexyl benzoate	397.515	Indicated for use as a sunscreen agent.	Amines
Diethylcarbamazine	199.2932	An anthelmintic used to treat filarial infections like Wuchereria bancrofti and Loa loa.	Piperazine and Derivatives
Diethylpropion	205.2961	An appetite suppressant used for the short term treatment of exogenous obesity in addition to calorie restriction.	Centrally Acting Antiobesity Products
Diethylstilbestrol	268.356	Used in the treatment of prostate cancer. Previously used in the prevention of miscarriage or premature delivery in pregnant women prone to miscarriage or premature delivery.	Synthetic Estrogens, Plain
Diethyltoluamide	191.2695	An insect repellant, also known as DEET.	Benzamides and benzamide derivatives
Difelikefalin	679.863	A kappa opioid receptor agonist used in the treatment of pruritus associated with chronic kidney disease in patients undergoing hemodialysis.	Kappa Opioid Receptor Agonist
Difenoxin	424.5341	An antidiarrheal agent used as an adjunct for the management of acute nonspecific diarrhea and acute exacerbations of chronic functional diarrhea.	Antipropulsives
Diflorasone	410.4515	A topical corticosteroid used to treat the symptoms of various inflammatory skin conditions that cause erythema, pruritus, and discomfort.	Corticosteroids, Potent (Group III)
Diflunisal	250.1976	An NSAID used to treat mild to moderate pain, inflammation, osteoarthritis, and rheumatoid arthritis.	Salicylic Acid and Derivatives
Difluocortolone	394.459	A topical corticosteroid used for the symptomatic treatment of inflammatory skin disorders like eczema, seborrheic eczema, lichen planus and psoriasis.	Corticosteroids, Potent (Group III)
Difluprednate	508.5515	A topical corticosteroid used for the symptomatic treatment of inflammation and pain associated with ocular surgery.	Corticosteroids, Potent (Group III)
Digitoxin	764.9391	A cardiac glycoside used in the treatment and management of congestive cardiac insufficiency, arrhythmias and heart failure.	Digitalis Glycosides
Digoxin	780.9385	A cardiac glycoside used in the treatment of mild to moderate heart failure and for ventricular response rate control in chronic atrial fibrillation.	Digitalis Glycosides
Dihydralazine	190.21	Dihydralazine is under investigation in clinical trial NCT00311974 (The Effect of Dihydralazine on Kidney Function and Hormones in Healthy Individuals).	Hydrazinophthalazine Derivatives
Dihydro-alpha-ergocryptine	577.726	A nootropic with an unknown mechanism of action indicated in individuals over sixty who manifest signs and symptoms of an idiopathic decline in mental capacity.	Cytochrome P-450 CYP3A Substrates
Dihydrocodeine	301.3801	An opioid analgesic agent used for the management of pain severe enough to require an opioid analgesic and for which alternative treatments are inadequate.	Natural Opium Alkaloids
Dihydroergocornine	563.699	A nootropic with an unknown mechanism of action indicated in individuals over sixty who manifest signs and symptoms of an idiopathic decline in mental capacity.	Agents that produce hypertension
Dihydroergocristine	611.743	An ergot alkaloid used to delay progressive mental decline in conditions like Alzheimer's.	Ergot Alkaloids and Derivatives
Dihydroergotamine	583.6774	An ergot alkaloid used in the acute treatment of migraine headache and cluster headache.	Ergot Alkaloids and Derivatives
Dihydrostreptomycin	583.596	Dihydrostreptomycin is an aminoglycoside antibiotic. In humans, the use of dihydrostreptomycin has been associated with ototoxicity. The FDA withdrew its approval for the use of all drug products containing dihydrostreptomycin...	Anti-Bacterial Agents
Dihydrotachysterol	398.6642	A synthetic analog of vitamin D that does not require renal activation like vitamin D2 or Vitamin D3.	Vitamin D and Analogues
Diiodohydroxyquinoline	396.954	Used in the treatment of amoebiasis.	Quinoline Derivatives
Diloxanide furoate	328.147	Diloxanide is used alone as a primary agent in the treatment of asymptomatic (cyst passers) intestinal amebiasis caused by Entamoeba histolytica. Diloxanide may also be used concurrently, or sequentially, with...	Amebicides
Diltiazem	414.518	A calcium channel blocker used to treat hypertension and to manage chronic stable angina.	Benzothiazepine Derivatives
Dimazole	293.43	Dimazole (diamthazole) is an antifungal. It was withdrawn in Franch in 1972 due to neuropsychiatric reactions.	Antifungals for Dermatological Use
Dimenhydrinate	469.97	A medication used to prevent and treat nausea, vomiting, vertigo, and motion sickness.	Aminoalkyl Ethers
Dimercaprol	124.225	A chelating agent used as an antidote to arsenic, gold, and mercury poisoning, as well as acute lead poisoning in combination with edetate calcium disodium.	Antidotes
Dimercaptosuccinic acid	182.218	Not Annotated	Antidotes
Dimethicone	0	An ingredient used to treat dry and irritated eyes.	Antifoaming Agents
Dimethicone 410	0	Dimethicone is approved as a transdermal drug delivery system. Dimethicone 410 is part of the simethicone element in Dow Corning Q7-2242 LVA which is an antifoam.[L2163, L2166] Some OTC's containing...	\N
Dimethyl fumarate	144.1253	A medication used to treat patients with the relapsing-remitting form of multiple sclerosis.	Dermatologicals
Dimethyl sulfoxide	78.133	A reversible mitogen-activated extracellular signal-regulated kinase-1 (MEK1) and MEK2 inhibitor used to treat certain types of melanoma, metastatic non-small cell lung cancer, and locally advanced or metastatic anaplastic thyroid cancer.	Cryoprotective Agents
Dimetindene	292.418	A 1st generation selective H1 antagonist used topically as an antipruritic and orally to treat allergies.	Antihistamines for Topical Use
Dimetotiazine	391.55	Dimetotiazine has considerable antiemetic &amp; serotonin antagonistic action used mainly in allergic skin conditions.	Histamine H1 Antagonists
Dinoprost	354.487	A medication used to induce a second trimester abortion.	Prostaglandins
Dinoprost tromethamine	475.616	Used for aborting second-trimester pregnancy (between the twelfth to eighteenth week of gestation) and in incomplete abortion or for therapeutic abortion in cases of intrauterine fetal death and congenital abnormalities...	Abortifacient Agents, Nonsteroidal
Dinoprostone	352.4651	A prostaglandin used to induce labor or abortion as well as to treat nonmetastatic gestational trophoblastic disease.	Prostaglandins
Dioctyldimonium	270.524	Not Annotated	Amines
Diosmin	608.5447	A citrus flavonoid medication used to support vascular health.	Flavonoids
Dioxybenzone	244.246	A benzophenone derivative used in sunscreens to block UVB and short-wave UVA radiation.	Sunscreen Agents
Dipentamethylenethiuram disulfide	320.55	Not Annotated	Standardized Chemical Allergen
Diphemanil	278.418	Used in the treatment of peptic ulcer, gastric hyperacidity, and hypermotility in gastritis and pylorospasm, and in the treatment of hyperhidrosis (excessive perspiration).	Synthetic Anticholinergics, Quaternary Ammonium Compounds
Diphenhydramine	255.3547	A H1 receptor antihistamine used in the treatment of seasonal allergies, and various allergic reactions including sneezing, runny nose, itchy/watery eyes, itching of nose or throat, pruritus, urticaria, insect bites/stings, and allergic rashes.	Aminoalkyl Ethers
Diphenidol	309.4452	An antiemetic agent used for the prevention and symptomatic treatment of nausea and vomiting associated with various conditions as Meniere's disease and surgery of the middle and inner ear.	Agents producing tachycardia
Diphenoxylate	452.5873	An antidiarrheal medication used with atropine to manage diarrhea.	Antipropulsives
Diphenylguanidine	211.268	Diphenylguanidine is approved for use within allergenic epicutaneous patch tests which are indicated for use as an aid in the diagnosis of allergic contact dermatitis (ACD) in persons 6 years...	Standardized Chemical Allergen
Diphenylpyraline	281.392	An antihistamine used for the treatment of allergic rhinitis, hay fever, and allergic skin disorders.	Aminoalkyl Ethers
Dipivefrin	351.4373	A prodrug of epinephrine used in ophthalmic solutions to reduce intraocular pressure in chronic open-angle glaucoma.	Sympathomimetics in Glaucoma Therapy
Dipotassium phosphate	174.1759	An ionic compound used for electrolyte replenishment and total parenteral nutrition (TPN) therapy.	Buffers
Dipyridamole	504.6256	A phosphodiesterase inhibitor used to prevent postoperative thromboembolic events.	Platelet Aggregation Inhibitors Excl. Heparin
Dipyrithione	252.31	Scalp dandruff	\N
Diroximel fumarate	255.226	A drug used for the treatment of relapsing forms of Multiple Sclerosis (MS).	Acids, Acyclic
Disopyramide	339.4745	A class 1A antiarrhythmic agent used to treat life-threatening ventricular arrhythmias.	Agents producing tachycardia
Disperse Blue 106	335.38	Disperse Blue 106 is used in allergenic testing.	Allergens
Distearyldimonium	551.064	Not Annotated	Adjuvants, Immunologic
Disulfiram	296.539	A carbamate derivative used to treat alcohol addiction.	Drugs Used in Alcohol Dependence
Ditiocarb zinc	361.948	Ditiocarb Zinc is approved for use within allergenic epicutaneous patch tests which are indicated for use as an aid in the diagnosis of allergic contact dermatitis (ACD) in persons 6...	Adjuvants, Immunologic
DL-alpha tocopheryl acetate	472.754	Not Annotated	Vitamin E
DL-alpha-Tocopherol	430.717	Not Annotated	Vitamin E
DL-dimyristoylphosphatidylcholine	677.945	DL-dimyristoylphosphatidylcholine is not an active pharmaceutical agent and has no indication.	Indicators and Reagents
DL-dimyristoylphosphatidylglycerol	666.874	DL-dimyristoylphosphatidylglycerol is not an considered an active pharmacological ingredient in pharmaceutical preparations and so has no official indications.	Glycerophosphates
DL-Methylephedrine	179.263	Used as an antitussive and decongestant .	Agents producing tachycardia
Dobutamine	301.3801	A beta-1 agonist used to treat cardiac decompensation in patients with organic heart disease or from cardiac surgery.	Adrenergic and Dopaminergic Agents
Docetaxel	807.8792	A taxoid antineoplastic agent used in the treatment of various cancers, such as locally advanced or metastatic breast cancer, metastatic prostate cancer, gastric adenocarcinoma, and head and neck cancer.	Taxoids
Doconexent	328.4883	An omega 3 fatty acid used in a variety of nutritional supplements to support central nervous system and cardiovascular health.	Fatty Acids, Omega-3
Docosanol	326.6	An antiviral used to treat orofacial herpes sores.	Antiviral Agents
Docusate	422.577	A medication used to treat constipation associated with dry, hard stools, or opioid induced constipation.	Enemas
Dofetilide	441.565	A class III antiarrhythmic drug used for the maintenance of normal sinus rhythm and cardioversion in cases of atrial fibrillation and atrial flutter.	Antiarrhythmics, Class III
Dolasetron	324.38	An antinauseant and antiemetic used in chemotherapy and postoperatively.	Antiemetics
Dolutegravir	419.3788	An antiviral agent used for the treatment of HIV-1 infections in combination with other antiretroviral agents.	HIV Integrase Inhibitors
Domiphen	334.567	Anti-infective (topical), it is used for the treatment of Acute Infectious Dental Diseases and other conditions.	Antiinfectives and Antiseptics for Local Oral Treatment
Domperidone	425.911	A dopamine receptor antagonist used as a peristaltic stimulant and anti-emetic agent for dyspepsia, indigestion, epigastric pain, nausea, and vomiting.	Propulsives
Donepezil	379.492	An acetylcholinesterase inhibitor used to treat the behavioral and cognitive effects of Alzheimer's Disease and other types of dementia.	Cholinesterase Inhibitors
Dopamine	153.1784	A catecholamine neurotransmitter used to treat hemodynamic imbalances, poor perfusion of vital organs, low cardiac output, and hypotension.	Adrenergic and Dopaminergic Agents
Dopexamine	356.5017	Dopexamine has been used in trials studying the diagnostic and treatment of Free Flap, Oral Cancer, Hypotension, Septic Shock, and Head and Neck Cancer.	Adrenergic and Dopaminergic Agents
Doravirine	425.749	A non-nucleoside reverse transcriptase inhibitor used in combination with other antiretrovirals to treat HIV-1 infections.	Non-Nucleoside Reverse Transcriptase Inhibitors
Doripenem	420.504	An antibiotic of the penem class used to treat complicated intra-abdominal and urinary tract infections.	Anti-Bacterial Agents
Dorzolamide	324.44	A carbonic anhydrase inhibitor used to treat high intraocular pressure in ocular hypertension and open angle glaucoma.	Sulfonamides
Dosulepin	295.44	A tricyclic antidepressant commonly used only in patients for whom alternative therapies are ineffective due to its toxicity potential.	Non-Selective Monoamine Reuptake Inhibitors
Dotatate	1435.63	Not Annotated	Radioactive Diagnostic Agent
Dotatate gallium Ga-68	1500.54	Dotatate gallium 68 is one of the most prominent radiopharmaceuticals used in imaging with positron emission tomography. It binds to the somatostatin-2 receptor which is usually overexpressed in many neuroendocrine...	Gallium Radioisotopes
Doxacurium	1035.2223	A nondepolarizing neuromuscular blocking agent used as an adjunct to general anesthesia to facilitate tracheal intubation, and to provide skeletal muscle relaxation during surgical procedures.	Neuromuscular-Blocking Agents (Nondepolarizing)
Doxapram	378.5072	A short acting respiratory stimulant used to treat acute respiratory insufficiency in COPD patients.	Agents that produce hypertension
Doxazosin	451.4751	An alpha-1 adrenergic receptor used to treat mild to moderate hypertension and urinary obstruction due to benign prostatic hyperplasia.	Antihypertensive Agents
Doxepin	279.3761	A psychotropic agent used for the treatment of depression, anxiety, manic-depressive disorder, and insomnia.	Non-Selective Monoamine Reuptake Inhibitors
Doxercalciferol	412.6478	A synthetic vitamin D2 analog used to treat secondary hyperparathyroidism in patients with chronic kidney disease with or without therapy of dialysis.	Bone Density Conservation Agents
Doxorubicin	543.5193	A medication used to treat various cancers, including AIDS-associated Kaposi's Sarcoma and metastatic cancers.	Anthracyclines and Related Substances
Doxycycline	444.4346	A tetracycline antibiotic used to treat a wide variety of bacterial infections.	Antiinfectives and Antiseptics for Local Oral Treatment
Doxylamine	270.3694	An antihistamine used to treat insomnia and allergy symptoms and is used with pyridoxine in the treatment of nausea and vomiting in pregnancy.	Aminoalkyl Ethers
Drometrizole trisiloxane	501.849	An UV ray absorbing agent used in sunscreens to protect skin from UV radiation.	Compounds used in a research, industrial, or household setting
Dronabinol	314.4617	A synthetic delta-9-THC used in the treatment of anorexia and weight loss in HIV patients as well as nausea and vomiting in cancer chemotherapy.	Agents producing tachycardia
Dronedarone	556.756	An antiarrhythmic agent used in the reduce the risk of hospitalization in patients with paroxysmal or persistent atrial fibrillation.	Agents that produce hypertension
Droperidol	379.4274	A butyrophenone derivative and dopamine antagonist used to prevent and treat postoperative nausea and vomiting.	Butyrophenone Derivatives
Drospirenone	366.4932	A progestin used in oral contraceptive pills for the prevention of pregnancy and other conditions.	Mineralocorticoid Receptor Antagonists
Drostanolone propionate	360.538	For use in females, for palliation of androgenresponsive recurrent mammary cancer in women who are more than one year but less than five years postmenopausal.	Androstanes
Drotaverine	397.5072	A phosphodiesterase-4 inhibitor used to alleviate gastrointestinal and genitourinary smooth muscle spasms.	Papaverine and Derivatives
Droxidopa	213.189	A medication used to treat symptomatic neurogenic orthostatic hypotension (nOH) caused by dopamine beta-hydroxylase deficiency, non-diabetic autonomic neuropathy and primary autonomic failure caused by conditions such as Parkinson's disease.	Adrenergic and Dopaminergic Agents
Duloxetine	297.415	A serotonin norepinephrine reuptake inhibitor used to treat generalized anxiety disorder, neuropathic pain, osteoarthritis, and stress incontinence.	Agents producing tachycardia
Durlobactam	277.25	Durlobactam is under investigation in clinical trial NCT03894046 (Study to Evaluate the Efficacy and Safety of Intravenous Sulbactam-ETX2514 in the Treatment of Patients With Infections Caused by Acinetobacter Baumannii-calcoaceticus Complex).	beta-Lactamase Inhibitors
Dutasteride	528.5297	An antiandrogenic compound that is used for the treatment of symptomatic benign prostatic hyperplasia (BPH) in adult males by inhibiting 5-alpha reductase.	Adrenergic alpha-Antagonists
Duvelisib	416.87	An inhibitor of phosphatidylinositol 3-kinase delta and gamma used to treat relapsed or refractory chronic lymphocytic leukemia or small lymphocytic lymphoma.	Phosphatidylinositol-3-kinase (Pi3K) inhibitors
Dyclonine	289.4125	An topical anesthetic used prior to examination to suppress the gag reflex or for pain relief from canker sores and fever blisters.	Anesthetics, Local
Dydrogesterone	312.4458	A synthetic progesterone for menstrual cycle regulation, infertility treatment, prevention of miscarriage, and other conditions.	Pregnadien Derivatives
Dyphylline	254.2426	A theophylline derivative used to treat asthma, bronchospasm, and COPD.	Xanthine derivatives
Ebastine	469.6576	A second generation H1-receptor antagonist useful in the treatment of allergic rhinitis and urticaria.	Histamine H1 Antagonists
Ecamsule	562.69	A sunscreen agent found in sunscreens that absorbs UV rays.	Sunscreen Agents
Echothiophate	256.323	An acetylcholinesterase inhibitor used in ophthalmic preparations to increase the drainage of intraocular fluid; most commonly used for the treatment of glaucoma.	Parasympathomimetics
Econazole	381.684	A topical antifungal used to treat tinea pedis, tinea cruris, tinea corporis, cutaneous candidiasis and tinea versicolor.	Imidazole and Triazole Derivatives
Edaravone	174.203	A free radical scavenger used to delay the progression of ALS.	Free Radical Scavengers
Edetate calcium disodium anhydrous	374.268	A chelating agent used to treat lead poisoning.	Anticoagulants
Edetate disodium anhydrous	336.2063	A polyvalent ion chelator indicated for emergency treatment of hypercalcemia and digitalis toxicity associated ventricular arrhythmias.	Calcium Binder
Edetic acid	292.2426	A chelating agent used to treat mercury and lead toxicity and some blood transfusion dependent anemias.	Acetates
Edotreotide gallium Ga-68	1486.55	A radioactive diagnostic agent used in PET scans for somatostatin receptor positive neuroendocrine tumors in adult and pediatric patients.	Gallium Radioisotopes
Edoxaban	548.06	A novel oral anticoagulant used for reducing the risk of stroke and systemic embolism (SE) in patients with nonvalvular atrial fibrillation (NVAF).	Direct factor Xa inhibitors
Edoxudine	256.258	A deoxythymidine analog used to treat herpetic keratitis.	Antiviral Agents
Edrophonium	166.2401	A cholinesterase inhibitor used to diagnose and evaluate myasthenia gravis.	Antidotes
Efavirenz	315.675	A non-nucleoside reverse transcriptase inhibitor used to treat HIV infection or prevent the spread of HIV.	Cytochrome P-450 CYP2B6 Inducers
Efinaconazole	348.398	An antifungal agent used to treat onychomycosis, a fungal infection of the nail.	Imidazole and Triazole Derivatives
Eflornithine	182.171	A medication used topically to reduce unwanted facial hair growth in women. The postulated mechanism of action is through irreversible inhibition of ornithine decarboxylase (ODC) in the skin.	Antineoplastic Agents
Elacestrant	458.646	An estrogen receptor antagonist used to treat ER-positive, HER2-negative, ESR1-mutated advanced or metastatic breast cancer with disease progression following at least one line of endocrine therapy.	Antineoplastic Agents
Elagolix	631.6	A gonadotropin releasing hormone receptor antagonist used to treat moderate to severe pain in endometriosis.	Anti-Gonadotropin-Releasing Hormones
Elbasvir	882.035	An antiviral and NS5A inhibitor used to treat hepatitis C infections.	Antivirals for treatment of HCV infections
Eletriptan	382.519	A triptan used for the treatment of migraines.	Selective Serotonin 5-HT1 Receptor Agonists
Elexacaftor	597.66	A small molecule CFTR corrector used in combination with tezacaftor and ivacaftor for the treatment of cystic fibrosis patients with one F508del-CFTR mutation.	Cystic Fibrosis Transmembrane Conductance Regulator Correctors
Eliglustat	404.551	A glucosylceramide synthase used to treat type 1 Gaucher disease in patients who are CYP2D6 extensive, intermediate, or poor metabolizers.	Various Alimentary Tract and Metabolism Products
Eltrombopag	442.4666	A thrombopoietin receptor agonist used to treat thrombocytopenia or aplastic anemia associated with various etiologies.	Thrombopoietin Receptor Agonist
Eluxadoline	569.662	A mixed mu-opioid receptor agonist used to treat irritable bowel syndrome with diarrhea.	Antipropulsives
Elvitegravir	447.884	An antiretroviral agent used in combination with other antiretrovirals for the treatment of HIV-1 infection in antiretroviral treatment-experienced adults.	Anti-HIV Agents
Emedastine	302.4145	A selective H1-receptor antagonist used topically to manage symptoms of allergic conjunctivitis.	Anti-Allergic Agents
Empagliflozin	450.91	An SGLT2 inhibitor used to manage type 2 diabetes mellitus.	Sodium-glucose Cotransporter 2 (SGLT2) Inhibitors
Emtricitabine	247.247	A nucleoside reverse transcriptase inhibitor used for the treatment and prophylaxis of HIV.	Anti-HIV Agents
Enalapril	376.4467	A prodrug of an ACE inhibitor used to treat hypertension and congestive heart failure.	ACE Inhibitors and Calcium Channel Blockers
Enalaprilat	348.3936	An antihypertensive agent used for the management of hypertension when oral therapy is not practical.	Angiotensin-Converting Enzyme Inhibitors
Enasidenib	473.383	An isocitrate dehydrogenase-2 inhibitor used to treat relapsed or refractory acute myeloid leukemia with an isocitrate dehydrogenase-2 mutation.	Isocitrate Dehydrogenase 2 Inhibitor
Encainide	352.4699	A voltage-gated sodium channel blocker used for management of atrial or ventricular fibrillation, atrial flutter, and ventricular tachycardia, that is no longer used due to proarrhythmic adverse effects.	Antiarrhythmic agents
Encorafenib	540.01	A kinase inhibitor used to treat unresectable or metastatic melanoma with specific mutations.	B-Raf serine-threonine kinase (BRAF) inhibitors
Enflurane	184.492	A halogenated inhalational anesthetic agent used for the induction and maintenance of anesthesia and for analgesia during labor and delivery.	Anesthetics, General
Enoxacin	320.3189	For the treatment of adults (≥18 years of age) with the following infections caused by susceptible strains of the designated microorganisms: (1) uncomplicated urethral or cervical gonorrhea due to Neisseria...	Anti-Bacterial Agents
Enoxaparin	0	A low molecular weight heparin used for the prophylaxis of deep vein thrombosis and ischemic complications of unstable angina and non-Q-wave myocardial infarction.	Heparin Group
Enoximone	248.301	A selective phosphodiesterase inhibitor indicated in the short term treatment of congestive heart failure.	Phosphodiesterase Inhibitors
Enprofylline	194.1906	Used in the management of symptoms of asthma. Also used in the treatment of peripheral vascular diseases and in the management of cerebrovascular insufficiency, sickle cell disease, and diabetic neuropathy.	Adenosine A2 Receptor Antagonists
Ensulizole	274.29	An ingredient used in sunscreens to absorb UVB radiation.	Acids
Entacapone	305.286	A selective reversible catechol-O-methyltransferase inhibitor for the treatment of Parkinson's disease.	Anti-Parkinson Drugs
Entecavir	277.2792	A nucleoside analogue used in the treatment of chronic hepatitis B for patients with active viral replication, histological evidence of active disease, or persistent elevations in liver transaminases.	Nucleoside and Nucleotide Reverse Transcriptase Inhibitors
Entrectinib	560.65	Entrectinib is indicated for the treatment of metastatic ROS1-positive non-small cell lung cancer in adults. Entrectinib is also indicated in adults and children over 12 years old for the treatment...	Protein Kinase Inhibitors
Enzacamene	254.373	An ingredient used in sunscreen to block UVB radiation.	Sunscreen Agents
Enzalutamide	464.436	A second-generation androgen receptor inhibitor used to treat castration-resistant prostate cancer and metastatic castration-sensitive prostate cancer.	Antiandrogens
Ephedrine	165.2322	An alpha and beta-adrenergic agonist indicated to treat hypotension under anesthesia, allergic conditions, bronchial asthma, and nasal congestion.	Adrenergic and Dopaminergic Agents
Epicriptine	577.726	A nootropic with an unknown mechanism of action indicated in individuals over sixty who manifest signs and symptoms of an idiopathic decline in mental capacity.	Alkaloids
Epinastine	249.3104	An H1 receptor antagonist used to prevent itching in allergic conjunctivitis.	Histamine H1 Antagonists
Epinephrine	183.2044	A hormone and neurotransmitter used to treat allergic reactions, to restore cardiac rhythm, and to control mucosal congestion, glaucoma, and asthma.	Adrenergic and Dopaminergic Agents
Halofantrine	500.424	An antimalarial used for the treatment of severe malaria.	Agents that reduce seizure threshold
Epirubicin	543.5193	An anthracycline topoisomerase II inhibitor used as an adjuvant to treating axillary node metastases in patients who have undergone surgical resection of primary breast cancer.	Anthracyclines and Related Substances
Eplerenone	414.4914	An aldosterone receptor antagonist used to improve survival of patients with symptomatic heart failure and to reduce blood pressure.	Antihypertensive Agents
Epoprostenol	352.4651	A vasodilator and platelet aggregation inhibitor used for the management of primary pulmonary hypertension and pulmonary hypertension in patients with heart failure.	Platelet Aggregation Inhibitors Excl. Heparin
Eprosartan	424.513	An ARB used to treat hypertension, diabetic nephropathy, and congestive heart failure.	Angiotensin II receptor blockers (ARBs) and diuretics
Eravacycline	558.563	A tetracycline antibiotic used to treat complicated intra-abdominal infections.	Tetracyclines
Erdafitinib	446.555	A fibroblast growth factor receptor tyrosine kinase inhibitor used to treat locally advanced or metastatic urothelial carcinoma.	Fibroblast growth factor receptor (FGFR) tyrosine kinase inhibitors
Erdosteine	249.307	A mucolytic agent used to treat conditions characterized by pathological mucus such as respiratory tract infections and chronic obstructive pulmonary disease (COPD).	Expectorants
Ergocalciferol	396.6484	A vitamin found in many supplement products.	Vitamins
Ergoloid mesylate	0	A nootropic with an unknown mechanism of action indicated in individuals over sixty who manifest signs and symptoms of an idiopathic decline in mental capacity.	Agents that produce hypertension
Ergometrine	325.4048	An ergot alkaloid used for the treatment of postpartum haemorrhage and post abortion hemorrhage in patients with uterine atony.	Ergot Alkaloids and Derivatives
Ergosterol	396.659	A steroid of interest both because its biosynthesis in FUNGI is a target of ANTIFUNGAL AGENTS, notably AZOLES, and because when it is present in SKIN of animals, ULTRAVIOLET RAYS...	Cholestenes
Ergotamine	581.6615	An alpha-1 selective adrenergic agonist vasoconstrictor used to treat migraines with or without aura and cluster headaches.	Ergot Alkaloids and Derivatives
Eribulin	729.908	A microtubule inhibitor used to treat metastatic breast cancer and metastatic or unresectable liposarcoma.	Microtubule Inhibitors
Erlotinib	393.4357	An EGFR tyrosine kinase inhibitor used to treat certain small cell lung cancers or advanced metastatic pancreatic cancers.	Epidermal growth factor receptor (EGFR) tyrosine kinase inhibitors
Ertapenem	475.515	A carbapenem antibiotic used for the treatment of moderate to severe infections caused by susceptible bacteria.	Anti-Bacterial Agents
Ertugliflozin	436.89	A SGLT2 inhibitor used to treat type 2 diabetes mellitus.	Sodium-glucose Cotransporter 2 (SGLT2) Inhibitors
Erythrityl tetranitrate	302.11	For the prevention of angina.	Organic Nitrates
Erythromycin	733.9268	A macrolide antibiotic used to treat and prevent a variety of bacterial infections.	Antiinfectives for Treatment of Acne
Escitalopram	324.3919	A selective serotonin re-uptake inhibitor used in the treatment of major depressive disorder (MDD), generalized anxiety disorder (GAD), and other select psychiatric disorders such as obsessive-compulsive disorder (OCD).	Antidepressive Agents Indicated for Depression
Esculin	340.284	As medication, esculin is sometimes used as a vasoprotective agent.\\nEsculin is also used in a microbiology laboratory to aid in the identification of bacterial species (especially Enterococci and Listeria),...	Coumarins
Esketamine	237.73	A NMDA receptor antagonist used for treatment-resistant depression.	Agents producing tachycardia
Eslicarbazepine	254.2839	An antiepileptic indicated as a monotherapy or adjunct therapy in the treatment of epilepsy.	Carboxamide Derivatives
Eslicarbazepine acetate	296.326	An anticonvulsant agent used as an adjunct to treat partial-onset seizures in patients with inadequate clinical response to conventional antiepileptic therapy.	Carboxamide Derivatives
Esmolol	295.374	A cardioselective beta-adrenergic blocker used for the short-term control of ventricular rate and heart rate in various types of tachycardia, including perioperative tachycardia and hypertension.	Beta Blocking Agents, Selective
Esomeprazole	345.416	A proton pump inhibitor used to treat GERD, reduce the risk of NSAID associated gastric ulcers, eradicate H. pylori, and to treat conditions causing gastric acid hypersecretion.	Propionates
Estazolam	294.738	A benzodiazepine used for the short-term management of insomnia.	Anti-Anxiety Agents
Esterified estrogens	0	A female hormone used to treat conditions related to estrogen deficiency and moderate to severe vasomotor menopausal symptoms in women.	Cytochrome P-450 CYP3A Substrates
Estetrol	304.3808	An estrogen used in combination with drospirenone for oral contraception.	Estrogens
Estradiol	272.382	An estrogenic steroid used to treat vasomotor symptoms of vulvar and vaginal atrophy in menopause, hypoestrogenism, prevention of postmenopausal osteoporosis, treatment of breast cancer, and advanced androgen-dependent carcinoma of the prostate.	Androgens and Estrogens
Estradiol acetate	314.4186	An estrogen used to treat vasomotor symptoms and moderate to severe vulvar and vaginal atrophy from menopause.	Estrogens
Estradiol benzoate	376.488	An estrogen indicated in combination with progesterone for the treatment of irregular menstruation.	Contraceptive Agents, Hormonal
Estradiol cypionate	396.5622	An estradiol prodrug used to treat vasomotor symptoms and hypoestrogenisms from hypogonadism.	Contraceptive Agents, Female
Estradiol dienanthate	496.732	An estrogen used in some combined hormonal oral contraceptives.	BCRP/ABCG2 Inhibitors
Estradiol valerate	356.4984	An estradiol prodrug used to treat some effects of menopause, hypoestrogenism, androgen dependant carcinoma of the prostate, and in combination products for endometriosis and contraception.	Estradiol Congeners
Estramustine	440.403	An antineoplastic agent used for the management of metastatic and/or progressive prostate cancer in palliative setting.	Alkylating Drugs
Estramustine phosphate	520.38	A nitrogen mustard linked to estradiol, usually as phosphate; used to treat prostatic neoplasms; also has radiation protective properties.	Antineoplastic Agents, Alkylating
Estriol	288.3814	A weak estrogen used to treat vaginal dryness and estrogen deficiency conditions, such as vaginitis and vulvar itching.	Natural and Semisynthetic Estrogens, Plain
Estrone	270.3661	An estrogen used to treat perimenopausal and postmenopausal symptoms.	Natural and Semisynthetic Estrogens, Plain
Estrone sulfate	350.429	An estrogen used as monotherapy or in several combination hormone replacement products for managing menopause symptoms and hormone disorders.	Contraceptive Agents, Hormonal
Eszopiclone	388.808	A sedative-hypnotic used in the treatment of insomnia, improving both the latency phase and the maintenance phase of sleep.	Drugs causing inadvertant photosensitivity
Etacrynic acid	303.138	A diuretic used to treat ascites and edema in congestive heart failure, liver cirrhosis, and renal disease.	Aryloxyacetic Acid Derivatives
Etafedrine	193.29	A beta-2 adrenoceptor agonist used to treat a cough associated with inflamed mucosa.	Agents producing tachycardia
Etelcalcetide	1048.26	A calcium sensing receptor agonist used to treat secondary hyperparathyroidism in patients with chronic kidney disease who require hemodialysis.	Calcium-sensing Receptor Agonist
Ethambutol	204.3098	An antituberculosis agent used in the prophylaxis and treatment of tuberculosis (TB).	Antimycobacterials
Ethanol	46.0684	For therapeutic neurolysis of nerves or ganglia for the relief of intractable chronic pain in such conditions as inoperable cancer and trigeminal neuralgia (tic douloureux), in patients for whom neurosurgical...	Antidotes
Ethanolamine oleate	343.5444	A mild sclerosing agent used in the treatment of esophageal varices with recent bleeding episodes.	Sclerosing Agents for Local Injection
Ethchlorvynol	144.6	A sedative hypnotic agent used for the short-term management of insomnia.	Central Nervous System Depressants
Ethinamate	167.205	Used for the short-term treatment of insomnia, however, it generally has been replaced by other sedative-hypnotic agents.	Acids, Acyclic
Ethinylestradiol	296.4034	An estradiol used as a contraceptive.	Natural and Semisynthetic Estrogens, Plain
Ethiodized oil	0	A contrast agent used in imaging procedures.	Non-Watersoluble X-Ray Contrast Media
Ethionamide	166.243	A second line antitubercular agent used to treat tuberculosis when other treatments have failed.	Thiocarbamide Derivatives
Ethoheptazine	261.3593	Ethoheptazine is marketed under the name Zactane. It is a phenazepine based opioid analgesic. It was invented in the 1950s and is related to other drugs such as proheptazine. Ethoheptazine...	\N
Ethosuximide	141.1677	An anticonvulsant used to treat petit mal seizures.	Succinimide Derivatives
Ethotoin	204.2252	A hydantoin antiepileptic used to control tonic-clonic and complex partial seizures.	Hydantoins
Ethyl chloride	64.514	A local anesthetic.	Anesthetics
Ethyl ferulate	222.2372	Not Annotated	Acids, Carbocyclic
Ethyl hydroxybenzoate	166.1739	Not Annotated	Standardized Chemical Allergen
Ethyl macadamiate	0	Ethyl macadamiate is derived from Macadamia terifolia seed oil. It is a non-volatile ester of ethyl alcohol and the fatty acids. Ethyl macadamiate is used in cosmetics and personal care...	\N
Ethyl salicylate	166.1739	A salicylate indicated in the treatment of sports related pain.	Acids, Carbocyclic
Ethylenediamine	60.0983	Ethylenediamine is approved for use within allergenic epicutaneous patch tests which are indicated for use as an aid in the diagnosis of allergic contact dermatitis (ACD) in persons 6 years...	Allergens
Ethylhexyl methoxycrylene	391.511	Ethylhexyl methoxycrylene is employed as a photostabilizing agent in various sunscreen products .	\N
Ethynodiol diacetate	384.5085	An oral contraceptive used to prevent pregnancy.	Contraceptives, Oral, Hormonal
Etidocaine	276.417	Etidocaine is marketed under the name Duranest. It is an injectable local anesthetic during surgery, labor, and delivery. Etidocaine has a long duration of activity, but has the main disadvantage...	Amides
Etidronic acid	206.0282	A bisphosphonate drug that prevents osteoclastic bone resorption; used for the prevention and treatment of osteoporosis.	Bisphosphonates
Etilefrine	181.2316	An adrenergic agonist primarily of α1 and β1 receptors used as an anti-hypotensive.	Adrenergic and Dopaminergic Agents
Etodolac	287.3535	An NSAID used to treat osteoarthritis and rheumatoid arthritis, as well as acute pain.	Acetic Acid Derivatives and Related Substances
Etofamide	427.28	Etofamide is used as an antiamoebic agent. Etofamide, under the brand name Kitnos, was marketed in Brazil by Pfizer but has been discontinued .	Dichloroacetamide Derivatives
Etomidate	244.289	A short-acting intravenous anesthetic indicated for the induction of anesthesia and supplementation of subpotent anesthesia during short operative procedures.	Agents producing tachycardia
Etonogestrel	324.4565	A long-acting synthetic derived progestin contraceptive used in various devices such as contraceptive rings and intradermal implants.	Contraceptive Agents, Female
Etoposide	588.5566	A podophyllotoxin derivative used to treat testicular and small cell lung tumors.	Podophyllotoxin Derivatives
Etoricoxib	358.842	A selective COX-2 inhibitor used to relieve moderate post-surgical dental pain as a short-term treatment and inflammatory and painful symptoms of various forms of arthritis.	Anti-Inflammatory Agents, Non-Steroidal
Etravirine	435.277	A non-nucleoside reverse transcriptase inhibitor (NNRTI) used in the treatment of HIV-1 infections in combination with other antiretroviral agents.	Non-Nucleoside Reverse Transcriptase Inhibitors
Eugenol	164.2011	A phenol used for the temporary relief of toothaches.	Allylbenzene Derivatives
Everolimus	958.24	A mammalian target of rapamycin (mTOR) kinase inhibitor used to treat various types of malignancies.	Mammalian target of rapamycin (mTOR) kinase inhibitors
Exametazime	272.393	Exametazime is a diagnostic radiopharmaceutical agent commonly used for the preparation of Tc99m Exametazime injection. It acts as a chelating agent for the radioisotope technetium-99m to form a cationic complex....	Ketones
Exemestane	296.4034	An aromatase inhibitor used to treat breast cancer in postmenopausal women after treatment with tamoxifen.	Antineoplastic Agents
Ezetimibe	409.4252	A cholesterol absorption inhibitor used to lower total cholesterol, LDL-C, Apo-B, and non-HDL-C in primary hyperlipidemia and familial cholesterolemia.	Anticholesteremic Agents
Ezogabine	303.3314	An antiepileptic agent used as an adjuvant treatment of partial-onset seizures.	Anticonvulsants
Famciclovir	321.3318	A nucleoside analog DNA polymerase inhibitor used for the treatment of recurrent cold sores and genital herpes in healthy patients and patients with HIV, and to manage herpes zoster.	Antiviral Agents
Famotidine	337.445	A histamine H2 receptor antagonist used to treat duodenal ulcers, benign gastric ulcers, GERD, and Zollinger-Ellison syndrome.	Anti-Ulcer Agents
Favipiravir	157.104	An antiviral used to manage influenza, and that has the potential to target other viral infections.	Antiviral Agents
Febuxostat	316.375	A xanthine oxidase inhibitor used for the management of chronic hyperuricemia in adults with gout who have an inadequate response or intolerance to allopurinol.	Preparations Inhibiting Uric Acid Production
Fedratinib	524.678	Fedratinib is indicated for the treatment of adult patients with intermediate-2 or high-risk primary or secondary (post-polycythemia vera or post-essential thrombocythemia) myelofibrosis.[L8090,L47016]	Janus-associated kinase (JAK) inhibitors
Felbamate	238.2399	An anticonvulsant used to treat severe epilepsy.	Anticonvulsants
Felodipine	384.254	A calcium channel blocker used to treat hypertension.	ACE Inhibitors and Calcium Channel Blockers
Fenbufen	254.2806	Fenbufen is a non-steroidal anti-inflammatory drug used primarily to treat inflammation in osteoarthritis, ankylosing spondylitis, and tendinitis. It can also be used to relieve backaches, sprains, and fractures. Fenbufen is...	Propionates
Fenfluramine	231.2573	Fenfluramine is a phenethylamine that is structurally similar to serotonin. Due to its ability to increase extracellular serotonin levels, modulate serotonergic and other neurologic receptors, and control neurotransmission, it is effective in treating pharmacoresistant seizures.	Centrally Acting Antiobesity Products
Fenofibrate	360.831	A peroxisome proliferator receptor alpha activator used to lower LDL-C, total-C, triglycerides, and Apo B, while increasing HDL-C in hypercholesterolemia, dyslipidemia, and hypertriglyceridemia.	Fibric Acids
Fenofibric acid	318.75	A fibrate used to treat severe hypertriglyceridemia, primary hypercholesterolemia, or mixed dyslipidemia.	Fibric Acids
Fenoldopam	305.756	A dopamine D1 receptor agonist used for the short term management of hypertension.	Adrenergic and Dopaminergic Agents
Fenoprofen	242.2699	An anti-inflammatory analgesic used to treat mild to moderate pain in addition to the signs and symptoms of rheumatoid arthritis and osteoarthritis.	Propionates
Fenoterol	303.3529	A beta-2 adrenergic agonist and bronchodilator used for the symptomatic treatment of asthma.	Selective Beta 2-adrenergic Agonists
Fenpropidin	273.464	Fenpropidin has been investigated for the treatment of Hernia.	Fungicides, Industrial
Fentanyl	336.4705	An opioid analgesic used in anesthesia, for breakthrough cancer pain, or round the clock pain management.	Opioid Anesthetics
Ferric ammonium citrate	264.997	Not Annotated	Paramagnetic Contrast Media
Ferric carboxymaltose	0	An iron replacement therapy used to treat iron deficiency anemia in children and adults with intolerance or inadequate clinical response to oral iron, and in adult patients who have non-dialysis dependent chronic kidney disease.	Parenteral Iron Replacement
Ferric cation	55.845	An iron supplement indicated in the treatment of iron deficiency anemia.	Parenteral Iron Replacement
Ferric chloride	162.204	Not Annotated	Caustics
Ferric derisomaltose	562.297	An iron injection used in the treatment of iron deficiency anemia.	Anemia, Iron-Deficiency
Ferric glycerophosphate	479.858	Not Annotated	\N
Ferric maltol	431.154	A complexed iron supplement used to treat iron deficiency in adults.	Iron Trivalent, Oral Preparations
Ferric pyrophosphate citrate	1321.571	A soluble iron compound used to maintain hemoglobin levels in patients undergoing hemodialysis.	Parenteral Iron Replacement
Ferric subsulfate	0	Ferric subsulfate is a stypic or hemostatic agent that causes agglutination of surface proteins resulting in local hemostasis. It has the chemical formula Fe4(OH)2(SO4)5. It is used after superficial skin...	Hemostatics
Ferric sulfate	489.93	A medication used as a coagulant and hemostatic agent.	Hematinics
Ferrous ascorbate	406.077	A medication used to treat iron-deficiency anemia.	Iron Bivalent, Oral Preparations
Ferrous asparto glycinate	0	Ferrous asparto glycinate is an iron-amino acid chelate. It is available as a dietary supplement used in the treatment of iron deficiency and iron deficiency anemia.	\N
Ferrous bisglycinate	203.963	Ferrous bisglycinate is a chelate that is used as a source of dietary iron. Forming a ring structure when reacting with glycine, ferrous bisglycinate acts as both a chelate and...	Amino Acids
Ferrous cysteine glycinate	371.2	An ingredient found in a variety of supplements and vitamins.	\N
Ferrous fumarate	169.901	A medication used to treat iron-deficiency anemia.	Iron Bivalent, Oral Preparations
Ferrous gluconate	446.139	A medication used to treat iron-deficiency anemia.	Iron Bivalent, Oral Preparations
Ferrous glycine sulfate	302.041	An iron supplement indicated in the treatment of iron deficiency and iron deficiency anemia.	Iron Bivalent, Oral Preparations
Ferrous succinate	171.917	An iron supplement indicated in the treatment of iron deficiency anemia.	Iron Bivalent, Oral Preparations
Ferrous sulfate anhydrous	151.908	An iron supplement used to prevent or treat iron deficiency anemia.	Anemia, Iron-Deficiency
Ferumoxides	0	Not Annotated	Contrast Media
Ferumoxsil	0	Not Annotated	Superparamagnetic Contrast Media
Ferumoxytol	231.531	An intravenous iron replacement product used to treat iron deficiency anemia (IDA) in patients with chronic kidney disease (CKD), or in patients who are unable to tolerate or who have not responded adequately to oral iron supplementation.	Ferric Compounds
Fesoterodine	411.5769	An antimuscarinic agent used in the treatment of overactive bladder with symptoms of urge urinary incontinence, urgency, and frequency.	Drugs for Urinary Frequency and Incontinence
Fexinidazole	279.31	An orally bioavailable 2-substituted 5-nitroimidazole used to treat early- and late-stage human African trypanosomiasis caused by Trypanosoma brucei gambiense.	Nitroimidazole Derivatives
Fexofenadine	501.6564	A selective H1-antagonist for the symptomatic treatment of seasonal allergic rhinitis and chronic idiopathic urticaria.	Anti-Allergic Agents
Fezolinetant	358.4	A non-hormonal drug used to treat moderate to severe vasomotor symptoms due to menopause	Cytochrome P-450 CYP1A2 Substrates
Fidaxomicin	1058.05	A macrolide antibiotic used to treat diarrhea associated with Clostridium difficile infection.	Anti-Bacterial Agents
Filgotinib	425.51	A Janus kinase (JAK) 1 selective inhibitor used to treat cases of rheumatoid arthritis that are unresponsive to conventional treatments.	Selective Immunosuppressants
Finafloxacin	398.394	Finafloxacin is indicated for the treatment of acute otitis externa (AOE) with or without an otowick, caused by susceptible strains of Pseudomonas aeruginosa and Staphylococcus aureus in patients age 1...	Anti-Bacterial Agents
Finasteride	372.5441	An antiandrogenic compound that is used for the treatment of symptomatic benign prostatic hyperplasia (BPH) and male pattern hair loss in adult males by inhibiting Type II 5-alpha reductase.	Adrenergic alpha-Antagonists
Fluoroestradiol F-18	289.381	A radiolabeled analog of estradiol used as a contrast agent in the PET imaging of estrogen receptor-positive breast cancer lesions.	Fluorine Radioisotopes
Finerenone	378.432	A nonsteroidal mineralocorticoid receptor antagonist indicated to lower the risk of eGFR decline, end stage kidney disease, cardiovascular death, heart attack, and hospitalization for heart failure in chronic kidney disease associated with type 2 diabetes.	Nonsteroidal Mineralocorticoid-Receptor Antagonist
Fingolimod	307.4708	A sphingosine 1-phosphate receptor modulator used to treat patients with the relapsing-remitting form of multiple sclerosis (MS) and studied to manage lung complications of COVID-19.	Selective Immunosuppressants
Flavin adenine dinucleotide	785.5497	A coenzyme form of vitamin B2 used in clinical conditions associated with vitamin B2 deficiency.	Adenine Nucleotides
Flavin mononucleotide	456.3438	A form of vitamin B2 used to restore riboflavin in anemia, migraine, alcoholism, and hyperhomocysteinemia.	Ribonucleotides
Flavone	222.2387	Not Available	Flavones
Flavoxate	391.4596	A muscarinic antagonist and spasmolytic used for the symptomatic relief of conditions associated with lack of muscle control in the bladder, such as dysuria, urgency, and nocturia.	Drugs for Urinary Frequency and Incontinence
Flecainide	414.3427	A class Ic antiarrhythmic agent used to manage atrial fibrillation and paroxysmal supraventricular tachycardias (PSVT).	Antiarrhythmic agents
Flibanserin	390.4021	A 5-HT receptor modulator used for the treatment of selected premenopausal women with acquired, generalized hypoactive sexual desire disorder (HSDD).	Agents that produce hypertension
Floctafenine	406.3552	An anti-inflammatory analgesic used to manage mild to moderate acute pain.	Agents that produce hypertension
Florbetaben (18F)	358.444	A radiopharmaceutical diagnostic agent used during Positron Emission Tomography (PET) imaging of the brain to estimate β-amyloid neuritic plaque density in adult patients to diagnose the causes of cognitive impairment.	Fluorine Radioisotopes
Florbetapir (18F)	359.432	A radiopharmaceutical diagnostic agent used during Positron Emission Tomography (PET) imaging of the brain to estimate β-amyloid neuritic plaque density in adult patients to diagnose the causes of cognitive impairment.	Fluorine Radioisotopes
Flortaucipir F-18	262.278	A small lipophilic tracer containing [18F]fluoride capable of crossing the blood-brain barrier and binding to aggregated tau protein; used in PET imaging for the diagnosis of Alzheimer's disease.	Contrast Media
Flosequinan	239.26	Flosequinan was approved in the USA and the UK for a year prior to being withdrawn from the market due to increased mortality in chronic heart failure patients, found in...	Quinolone Vasodilators
Flotufolastat F-18	1470.63	A radiopharmaceutical diagnostic agent used in PET imaging to visualize PSMA-positive lesions in men with prostate cancer with suspected metastasis or recurrence.	Diagnostic Radiopharmaceuticals
Floxuridine	246.1924	An antimetabolite used as palliative management for liver metastases of gastrointestinal malignancy.	Pyrimidine Analogues
Fluciclovine (18F)	132.125	A radiolabelled L-leucine derivative used to image tumors, especially in the prostate.	Radioactive Diagnostic Agent
Fluclorolone acetonide	487.39	Fluclorolone acetonide (INN) or flucloronide (USAN) is a topical corticosteroid. It is marketed under the brand names Cutanit and Topicon.	Adrenal Cortex Hormones
Flucloxacillin	453.872	A narrow spectrum penicillin antibiotic that exerts specific activity against Gram positive organisms in skin and soft tissue infections, except those caused by methicillin resistant staphylococcus aureus (MRSA).	Beta-Lactamase Resistant Penicillins
Fluconazole	306.2708	A triazole antifungal used to treat various fungal infections including candidiasis.	Imidazole and Triazole Derivatives
Flucytosine	129.0925	An antifungal indicated only to treat severe infections throughout the body caused by susceptible strains of Candida or Cryptococcus.	Antifungal Agents
Fludarabine	285.235	A purine analog antimetabolite that inhibits DNA synthesis.	Purine Analogues
Fludeoxyglucose (18F)	181.15	A radiopharmaceutical agent used for positron emission tomography (PET) imaging in oncology, cardiology, and neurology.	Deoxyglucose
Fludrocortisone	380.4504	A mineralocorticoid used to treat adrenocortical insufficiency and salt-losing adrenogenital syndrome.	Anti-Inflammatory Agents
Flufenamic acid	281.2299	An analgesic drug used to relieve pain associated with rheumatoid diseases.	Fenamates
Fluindione	240.233	Fluindione is under investigation for the treatment of Venous Thrombosis, Pulmonary Embolism, Permanent Atrial Fibrillation, and Anticoagulating Treatment on a Duration at Least 12-month-old Superior. Fluindione has been investigated for...	Anticoagulants
Flumazenil	303.2884	A benzodiazepine antagonist that is used for the complete or partial reversal of the sedative effects caused by benzodiazepines in various clinical settings, such as induced general anesthesia for diagnostic and therapeutic procedures.	Antidotes
Flumethasone	410.458	A corticosteroid used to treat contact dermatitis, atopic dermatitis, eczema, psoriasis, diaper rash, and other skin conditions.	Corticosteroids, Moderately Potent (Group II)
Flunarizine	404.4948	A selective calcium-entry blocker used as migraine prophylaxis in patients with severe and frequent episodes who have not responded adequately to more common treatments.	Antivertigo Preparations
Flunisolide	434.4977	An inhaled corticosteroid used as a prophylactic therapy in the maintenance treatment of asthma.	Anti-Asthmatic Agents
Flunitrazepam	313.2832	A benzodiazepine used to manage anxiety disorders and insomnia.	Benzodiazepines and benzodiazepine derivatives
Fluocinolone acetonide	452.4882	A corticosteroid used to treat skin conditions, eczematous otitis externa, diabetic macular edema, and non-infectious uveitis of the posterior segment of the eye.	Corticosteroids
Fluocinonide	494.5249	A high potency corticosteroid commonly used topically for a number of inflammatory skin conditions.	Corticosteroids, Potent (Group III)
Fluocortolone	376.4617	A glucocorticoid used topically for localized skin reactions and also orally for systemic use.	Corticosteroids
Fluorescein	332.3063	A dye used in angiography or angioscopy of the iris and retina.	Colouring Agents
Fluoride ion	18.9984	Having a chemical formula of F−, fluoride ion is the simplest inorganic, monatomic anion of fluorine with basic properties. It is considered a trace element. Fluoride ions are found in...	\N
Fluoride ion F-18	18.0015	A diagnostic radiopharmaceutical agent used as a bone imaging agent to delineate areas of altered osteogenesis.	Radioactive Diagnostic Agent
Fluorodopa (18F)	214.183	Fluorodopa F 18 is indicated for use with positron emission tomography (PET) to visualize dopaminergic nerve terminals in the striatum for the evaluation of adult patients with suspected Parkinsonian syndromes...	Fluorine Radioisotopes
Fluorometholone	376.4617	An ophthalmic corticosteroid used for the relief of inflammation located in both the palpebral and bulbar conjunctiva, the cornea, and the anterior segment of the globe of the eye.	Corticosteroids, Moderately Potent (Group II)
Fluorouracil	130.0772	A pyrimidine analog used to treat basal cell carcinomas, and as an injection in palliative cancer treatment.	Pyrimidine Analogues
Fluoxetine	309.3261	A selective serotonin reuptake inhibitor used to treat major depressive disorder, bulimia, OCD, premenstrual dysphoric disorder, panic disorder, and bipolar I.	Antidepressive Agents Indicated for Depression
Fluoxymesterone	336.4409	A synthetic androgenic anabolic steroid that used in the treatment of hypogonadism and delayed puberty in males, as well as breast neoplasms in women.	3-Oxoandrosten (4) Derivatives
Flupentixol	434.52	A thioxanthene neuroleptic used to treat schizophrenia and depression.	Thioxanthene Derivatives
Fluphenazine	437.522	A phenothiazine used to treat patients requiring long-term neuroleptic therapy.	Phenothiazines With Piperazine Structure
Fluprednisolone	378.44	A synthetic glucocorticoid with anti-inflammatory properties.	Anti-Inflammatory Agents
Flurandrenolide	436.5136	A corticosteroid used to treat corticosteroid-responsive dermatoses.	Corticosteroids, Potent (Group III)
Flurazepam	387.878	A long-acting benzodiazepine with a rapid onset of action that is commonly used to treat insomnia.	Central Nervous System Depressants
Flurbiprofen	244.2609	An NSAID used to treat the signs and symptoms of osteoarthritis and rheumatoid arthritis.	Antiinflammatory Preparations, Non-Steroids for Topical Use
Fluspirilene	475.5727	An antipsychotic agent used in the treatment of schizophrenia.	Diphenylbutylpiperidine Derivatives
Flutamide	276.2118	An antiandrogen used for locally confined stage B2-C and D-2 metastatic prostate carcinoma.	Antiandrogens
Flutemetamol (18F)	273.32	A radiopharmaceutical diagnostic agent used during Positron Emission Tomography (PET) imaging of the brain to estimate β-amyloid neuritic plaque density in adult patients to diagnose the causes of cognitive impairment.	Contrast Media
Fluticasone	444.51	A corticosteroid indicated in the treatment of corticosteroid responsive dermatoses, asthma, and COPD.	Corticosteroids, Potent (Group III)
Fluticasone furoate	538.576	An inhaled corticosteroid that can be used as maintenance treatment of asthma and/or chronic obstructive pulmonary disease (COPD) depending on the product. Also available as a nasal spray to manage symptoms of allergic rhinitis.	Glucocorticoids
Fluticasone propionate	500.571	A glucocorticoid used to treat asthma, inflammatory pruritic dermatoses, and nonallergic rhinitis.	Corticosteroids, Potent (Group III)
Fluvastatin	411.473	An HMG-CoA reductase inhibitor used to lower lipid levels and reduce the risk of cardiovascular disease including myocardial infarction and stroke.	Heptanoic Acids
Fluvoxamine	318.34	A selective serotonin-reuptake inhibitor used to treat obsessive-compulsive disorder.	Anti-Anxiety Agents
Folic acid	441.3975	A nutrient used to treat megaloblastic anemia and is found in many supplements.	Vitamins
Fomepizole	82.1038	An inhibitor of alcohol dehydrogenase used as an antidote in confirmed or suspected methanol or ethylene glycol poisoning.	Antidotes
Fondaparinux	1508.263	An anticoagulant used to prevent venous thromboembolism, to treat deep vein thrombosis, and to improve survival following myocardial infarction.	Anticoagulants
Formaldehyde	30.026	A naturally occurring hazardous organic compound used as a preservative in animal feed, cosmetic products, laboratory procedures, disinfection, and home building products.	Aldehydes
Formestane	302.4079	For the treatment of estrogen-receptor positive breast cancer in post-menopausal women.	Aromatase Inhibitors
Formoterol	344.4049	An inhaled long-acting beta2-adrenergic receptor agonist used as a bronchodilator in the management of asthma and COPD.	Agents producing tachycardia
Fosamprenavir	585.607	An antiretroviral agent used for the treatment and postexposure prophylaxis of human immunodeficiency virus (HIV-1) infection.	Anti-HIV Agents
Fosaprepitant	614.4066	An antiemetic drug used in combination with other antiemetic agents for the prevention of acute and delayed nausea and vomiting caused by chemotherapy.	Antiemetics
Foscarnet	126.0053	An antiviral used to treat CMV, HIV, and HSV infections.	Phosphonic Acid Derivatives
Fosdenopterin	363.223	An exogenous form of cyclic pyranopterin monophosphate (cPMP) used as a replacement substrate in patients with molybdenum cofactor deficiency (MoCD) type A.	Various Alimentary Tract and Metabolism Products
Fosfomycin	138.059	A broad spectrum antibiotic used to treat uncomplicated urinary tract infections.	Anti-Bacterial Agents
Fosinopril	563.672	An ACE inhibitor used to treat mild to moderate hypertension, congestive heart failure, and to slow the progression of renal disease in hypertensive diabetics.	ACE Inhibitors and Diuretics
Fosnetupitant	688.608	A medication used in combination with others to prevent chemotherapy associated nausea and vomiting.	Substance P/Neurokinin-1 Receptor Antagonist
Fosphenytoin	362.2739	An antiepileptic agent used for the management of generalized convulsive status epilepticus and prevention and treatment of seizures occurring during neurosurgery.	Anti-epileptic Agent
Fospropofol	288.2766	A sedative-­hypnotic agent indicated for monitored anesthesia care (MAC) sedation in adult patients undergoing diagnostic or therapeutic procedures.	Anesthetics, General
Fostamatinib	580.4595	A spleen tyrosine kinase inhibitor used to treat chronic immune thrombocytopenia after attempting one other treatment.	Amines
Fostemsavir	583.498	An antiretroviral HIV-1 attachment inhibitor targeted against the gp120 subunit within the HIV-1 gp160 envelope glycoprotein.	Anti-HIV Agents
Framycetin	614.6437	An aminoglycoside antibiotic used in various formulations and combinations with other agents to treat hemorrhoids, eye and ear infections, and to reduce nasal carriage of staphylococcus.	Medicated Dressings With Antiinfectives
Frovatriptan	243.3043	A 5-HT1B/1D receptor agonist used to treat migraines.	Selective Serotonin 5-HT1 Receptor Agonists
Fructose	180.1559	Not Available	Carbohydrates
Fulvestrant	606.78	An estrogen receptor antagonist used to treat HR+ breast cancer that may also be HER2-.	Anti-Estrogens
Furosemide	330.744	A loop diuretic used to treat hypertension and edema in congestive heart failure, liver cirrhosis, renal disease, and hypertension.	High-Ceiling Diuretics and Potassium-Sparing Agents
Fursultiamine	398.543	Compound used for therapy of thiamine deficiency. It has also been suggested for several non-deficiency disorders but has not yet proven useful. Fursultiamine is a vitamin B1 derivative.	Vitamin B Complex
Fusafungine	639.8204	Fusafungine is an antibiotic from Fusarium lateririum, and is used for the treatment of respiratory infections.	Anti-Bacterial Agents
Fusidic acid	516.7092	A topical antibacterial agent used to prevent and treat mild to moderate skin infections caused by susceptible bacteria.	Medicated Dressings With Antiinfectives
Futibatinib	418.457	A kinase inhibitor used to treat intrahepatic cholangiocarcinoma in previously treated adults.	Fibroblast growth factor receptor (FGFR) tyrosine kinase inhibitors
Gabapentin	171.2368	An anticonvulsant medication used in the management of peripheral neuropathic pains, postherpetic neuralgia, and partial-onset seizures.	Gabapentinoids
Gabapentin enacarbil	329.393	A gabapentin prodrug used to treat Restless Legs Syndrome (RLS) and postherpetic neuralgia (PHN).	Anti-epileptic Agent
Gadobenic acid	667.73	A gadolinium compound used as a contrast agent in MRIs.	Paramagnetic Contrast Media
Gadobutrol	604.72	A contrast agent used during diagnostic procedures to visualize disrupted areas of blood brain barrier (BBB) and/or abnormal vascularity of the central nervous system.	Paramagnetic Contrast Media
Gadodiamide	573.66	A gadolinium-based contrast agent used for the visualization of lesions with vascularity during magnetic resonance imaging (MRI) scans.	Paramagnetic Contrast Media
Gadofosveset trisodium	1003.85	An intravenous contrast agent used during magnetic resonance angiography (MRA) to evaluate aortoiliac occlusive disease (AIOD) in adults with peripheral vascular disease.	Paramagnetic Contrast Media
Gadolinium	157.25	Gadolinium is under investigation in Hypertension, ACUTE KIDNEY INJURY, and Chronic Kidney Disease. Gadolinium has been investigated for the basic science of CAD, Multiple Sclerosis, and Coronary Artery Disease.	Anti-Inflammatory Agents
Gadopentetic acid	547.58	A gadolinium compound used as a contrast agent in MRIs.	Paramagnetic Contrast Media
Gadopiclenol	970.1	A gadolinium-based contrast agent (GBCA) used with magnetic resonance imaging (MRI) to detect and visualize lesions with abnormal vascularity.	Contrast Media
Gadoteric acid	558.65	A diagnostic contrast agent used with magnetic resonance imaging to provide contrast enhancement for intracranial and spinal lesions with abnormal blood brain barrier or abnormal vascularity, and for whole body imaging.	Paramagnetic Contrast Media
Gadoteridol	558.68	A medication used to improve the contrast of MRI scans for better visualization.	Paramagnetic Contrast Media
Gadoversetamide	661.76	A gadolinium compound used as a contrast agent in MRI tests of the brain, spine, and liver.	Paramagnetic Contrast Media
Gadoxetic acid	681.75	A gadolinium-based contrast agent used in magnetic resonance imaging (MRI) to help characterize lesions in the liver.	Paramagnetic Contrast Media
Galactose	180.1559	There are limited therapeutic uses for which galactose is formally indicated. Some predominant indications include (a) the use of galactose to facilitate the construction of structurally and immunologically effective attenuated...	Tests for Liver Functional Capacity
Galantamine	287.3535	A cholinesterase inhibitor used to manage mild to moderate dementia associated with Alzheimer's Disease.	Amaryllidaceae Alkaloids
Gallamine triethiodide	891.5291	A nondepolarizing nerve blocker used in addition to anesthesia to cause skeletal muscle relaxation.	Agents producing tachycardia
Gallium chloride Ga-67	173.28	A radioactive isotope of gallium usually complexed with sodium citrate used to test for Hodgkin's disease, lymphoma, and bronchogenic carcinoma, and acute inflammatory lesions.	\N
Gallium citrate Ga-67	256.0279	A radiopharmaceutical agent used in the detection of the presence and extent of Hodgkin's disease, lymphoma, and bronchogenic carcinoma, as well as some acute inflammatory lesions.	Radioactive Diagnostic Agent
Gallium Ga-68 gozetotide	1011.909	A radiopharmaceutical agent used in the diagnosis of prostate-specific membrane antigen (PSMA) positive lesions in male patients during positron emission tomography.	Gallium Radioisotopes
Gallium nitrate	255.738	A medication indicated for cancer-related hypercalcemia.	Antineoplastic Agents
Gallium-68 PSMA	947.005	Not Annotated	\N
gamma-Aminobutyric acid	103.1198	The most common inhibitory neurotransmitter in the central nervous system.	Aminobutyrates
gamma-Hydroxybutyric acid	104.1045	Used as a general anesthetic, to treat conditions such as insomnia, clinical depression, narcolepsy, and alcoholism, and to improve athletic performance.	Adjuvants, Anesthesia
Gamolenic acid	278.4296	An ingredient found in a variety of nutritional products.	Fatty Acids, Omega-6
Ganaxolone	332.528	A neuroactive steroid GABA-A receptor modulator used for the treatment of seizures associated with CDKL5 deficiency disorder (CDD).	GABA Modulators
Ganciclovir	255.2306	A DNA polymerase inhibitor used to treat cytomegalovirus and herpetic keratitis of the eye.	Antiviral Agents
Ganirelix	1570.35	A GnRH antagonist used in assisted reproduction in women undergoing controlled ovarian hyperstimulation to control ovulation by inhibiting the premature LH surges.	Anti-Gonadotropin-Releasing Hormones
Gatifloxacin	375.3941	A fourth generation fluoroquinolone used to treat a wide variety of infections in the body.	Fluoroquinolones
Gaxilose	312.271	Gaxilose has been used in trials studying the diagnostic of Lactose Intolerance.	Carbohydrates
Gefitinib	446.902	A tyrosine kinase inhibitor used as first-line therapy to treat non-small cell lung carcinoma (NSCLC) that meets certain genetic mutation criteria.	Epidermal growth factor receptor (EGFR) tyrosine kinase inhibitors
Gelatin	0	Gelatin is used for weight loss and for treating osteoarthritis, rheumatoid arthritis, and brittle bones (osteoporosis). Some people also use it for strengthening bones, joints, and fingernails. Gelatin is also...	Blood Substitutes and Plasma Protein Fractions
Gemcitabine	263.1981	A nucleoside metabolic inhibitor used as adjunct therapy in the treatment of certain types of ovarian cancer, non-small cell lung carcinoma, metastatic breast cancer, and as a single agent for pancreatic cancer.	Pyrimidine Analogues
Gemeprost	394.552	A prostaglandin E1 analogue used for cervical dilation and, in combination with mifepristone, for pregnancy termination.	Prostaglandins
Gemfibrozil	250.3334	A lipid regulator that is used in the reduction of serum triglyceride levels in high-risk patients with hyperlipidemia.	Fibric Acids
Gemifloxacin	389.3809	A quinolone antibacterial agent used for the treatment of acute bacterial exacerbation of chronic bronchitis and mild to moderate community-acquired pneumonia caused by susceptible bacteria.	Anti-Bacterial Agents
Gentamicin	1390.728	An aminoglycoside used to treat a wide variety of aerobic infections in the body.	Anti-Infective Agents
Gentian violet cation	372.5258	An antiseptic violet dye used to prevent various infections, including fungal and bacterial infections.	Aniline Compounds
Geraniol	154.253	Geraniol is approved for use within allergenic epicutaneous patch tests which are indicated for use as an aid in the diagnosis of allergic contact dermatitis (ACD) in persons 6 years...	Standardized Chemical Allergen
Gestonorone caproate	414.586	Not Annotated	Norpregnenes
Gestrinone	308.4141	Endometriosis with or without accompanying sterility. Treatment is limited to a single course of 6 months duration per lifetime [L1699, L1700].	Antigonadotropins and Similar Agents
Gilteritinib	552.724	An AXL receptor tyrosine kinase inhibitor used to treat relapsed or refractory acute myeloid leukemia.	Protein Kinase Inhibitors
Gimeracil	145.54	A DPD inhibitor used as an adjunct to antineoplastic therapy to increase the systemic concentrations and therapeutic effectiveness of other antineoplastic agents.	Drugs that are Mainly Renally Excreted
Glasdegib	374.448	A sonic hedgehog receptor inhibitor used to treat newly diagnosed acute myeloid leukemia in patients over 75 years who cannot receive intense chemotherapy.	Hedgehog pathway inhibitors
Glecaprevir	838.87	A Hepatitis C NS3/4A protease inhibitor used to treat Hepatitis C.	Antivirals for treatment of HCV infections
Gliclazide	323.41	A sulfonylurea used to treat hyperglycemia in patients with type 2 diabetes mellitus.	Sulfonylureas
Glimepiride	490.62	A sulfonylurea drug used to treat type 2 diabetes mellitus.	Immunosuppressive Agents
Glipizide	445.535	A sulfonylurea medication used in Type 2 Diabetes to sensitize pancreatic beta cells and stimulate insulin release.	Sulfonylureas
Gliquidone	527.632	A sulfonylurea drug used in the management of diabetes mellitus type 2.	Sulfonylureas
Gluconic Acid	196.1553	An electrolyte supplement used in total parenteral nutrition.	Laxatives
Gluconolactone	178.14	A polyhydroxy acid used in the dissolution of calculi and used as an additive in various drug products to maintain consistency and other characteristics.	Calculi Dissolution Agent
Glucosamine	179.1711	A common ingredient in nutritional supplements used for the relief of joint pain.	Hexosamines
Glutamic acid	147.1293	An amino acid commonly found as a component in total parenteral nutrition.	Acid Preparations
Glutathione	307.323	For nutritional supplementation, also for treating dietary shortage or imbalance	Antidotes
Glutathione disulfide	612.631	An ingredient of ophthalmic irrigation solutions used during ophthalmological procedures.	Amino Acids, Peptides, and Proteins
Glutethimide	217.2637	For the treatment of insomnia.	Piperidinedione Derivatives
Glyburide	494.004	A sulfonylurea used in the treatment of non insulin dependent diabetes mellitus.	Sulfonylureas
Glycerin	92.0938	It is used as a solvent, emollient, pharmaceutical agent, and sweetening agent.	Enemas
Glycerol phenylbutyrate	530.6512	A nitrogen-binding agent used to manage patients with urea cycle disorders who cannot be sufficiently managed amino acid supplementation and/or dietary restrictions.	Various Alimentary Tract and Metabolism Products
Glycine	75.0666	An amino acid commonly used as a component of total parenteral nutrition and is also used as irrigation during surgery.	Amino Acids
Glycol salicylate	182.175	A salicylate used to treat mild to moderate muscle pain.	Acids, Carbocyclic
Glycolic acid	76.0514	Not Available	Keratolytic Agents
Glycopyrronium	318.4305	An anticholinergic agent used to treat hyperhidrosis, severe drooling, COPD, used with other medications to treat ulcers, and used in anesthesia.	Antihidrotics
Glycyrrhizic acid	822.942	Glycyrrhizic acid is widely applied in foods as a natural sweetener. As a therapeutic agent, is has been used in a vast variety of formulations as it is reported to...	Liver Therapy
Glymidine	309.341	Glycodiazine is used concomitantly with insulin for the treatment of noninsulin-dependent (type 2) diabetes mellitus.	Sulfonamides
Gonadorelin	1182.29	A synthetic GnRH used to test the function of gonadotropes and the pituitary.	Gonadotropin-releasing hormone agonist
Goserelin	1269.4105	A synthetic analog of luteinizing hormone-releasing hormone used to treat breast cancer and prostate cancer by reducing secretion of gonadotropins from the pituitary.	Gonadotropin-releasing hormone agonist
Gramicidin D	1811.253	A bactericidal antibiotic used in the treatment of dermatological and ophthalmic infections.	Anti-Bacterial Agents
Granisetron	312.417	A 5HT3 antagonist used to treat nausea and vomiting in cancer therapy and postoperatively.	Antiemetics
Grazoprevir	766.903	An antiviral and NS3/4A protease inhibitor used to treat hepatitis C infections.	Antivirals for treatment of HCV infections
Grepafloxacin	359.3947	A fluoroquinolone antibiotic used to treat various gram positive and gram negative bacterial infections.	Anti-Bacterial Agents
Griseofulvin	352.766	An antifungal agent used to treat a variety of superficial tinea infections and fungal infections of the fingernails and toes.	Antifungals for Systemic Use
Guaiacol	124.139	It is used medicinally as an expectorant, antiseptic, and local anesthetic. Guaiacol is used in traditional dental pulp sedation, and has the property of inducing cell proliferation; guaiacol is a...	Catechols
Guaifenesin	198.2158	An expectorant commonly found in OTC products for the symptomatic relief from congested chests and coughs associated with cold, bronchitis, and/or other breathing illnesses.	Expectorants
Guanabenz	231.082	An alpha-2 adrenergic agonist used to treat hypertension.	Agents producing tachycardia
Guanadrel	213.2768	Used to treat and control hypertension.	Antihypertensive Agents
Guanethidine	198.3085	An antihypertensive agent used in the management of moderate and severe hypertension, either alone or as an adjunct, and for the management of renal hypertension.	Guanidine Derivatives
Guanfacine	246.093	An alpha-2A adrenergic receptor agonist used to treat ADHD.	Imidazoline Receptor Agonists
Guanidine	59.0705	A strong organic base used to treat muscle weakness and fatigue associated with the myasthenic complications of Eaton-Lambert syndrome.	Acetylcholine Releasing Agent
Guanoxan	207.233	Guanoxan is an antihypertensive agent similar in its mechanism of action to guanethidine; may cause liver damage.\\nGuanoxan was approved in the UK but was withdrawn from the market due...	Guanidine Derivatives
Halazepam	352.738	Used to relieve anxiety, nervousness, and tension associated with anxiety disorders.	Benzodiazepines and benzodiazepine derivatives
Halcinonide	454.96	A corticosteroid used for the management and symptomatic relief of the inflammatory and pruritic manifestations of corticosteroid-responsive dermatoses.	Corticosteroids, Very Potent (Group IV)
Haloperidol	375.864	An antipsychotic agent used to treat schizophrenia and other psychoses, as well as symptoms of agitation, irritability, and delirium.	Butyrophenone Derivatives
Haloprogin	361.391	Used to treat fungal (Tinea) skin infections such as athlete's foot, jock itch, ringworm, and tinea versicolor.	Antifungal Agents
Halothane	197.382	A general inhalation anesthetic used for the induction and maintenance of general anesthesia.	Hydrocarbons, Halogenated
Hard fat	0	Not Annotated	Pharmaceutical Vehicles
Helium	4.0026	A gas used for medical conditions where there is a need for increased oxygen intake, such as upper airway obstruction in asthma and COPD.	Medical Gases
Heparin	0	An anticoagulant indicated for thromboprophylaxis and to treat thrombosis associated with a variety of conditions such as pulmonary embolism and atrial fibrillation.	Heparin Group
Hesperidin	610.5606	A bioflavonoid found in a variety of nutritional supplements that is touted to have various beneficial effects on blood vessel disorders and various other conditions.	Flavanones
Hetacillin	389.469	Hetacillin is a beta-lactam antibiotic prodrug used to treat bacterial infections. In the body it gets converted to ampicillin.	Penicillins With Extended Spectrum
Hexachlorophene	406.904	A chlorinated bisphenol antiseptic used as a surgical scrub and skin cleanser.	Phenol and Derivatives
Hexafluronium	502.745	Used as an adjunct with succinylcholine (or suxamethonium chloride) to prolong muscle relaxation and to prevent succinylcholine-induced muscle fasciculations.	Nicotinic Antagonists
Hexamidine	354.446	An antiseptic drug used for dermatomycoses and superficial bacterial infections alone or in combination with clotrimazole.	Anti-Infective Agents, Local
Hexaminolevulinate	215.293	An optical imaging agent used to perform Blue Light Cystoscopy (BLC™) in order to detect carcinoma of the bladder.	Carbon Radioisotopes
Hexetidine	339.6021	An topical antiseptic agent used for disinfection and prevention of bacterial, fungal and yeast infections of the oral and vaginal mucosa.	Antiinfectives and Antiseptics for Local Oral Treatment
Hexobendine	592.686	Hexobendine is a medication used to cause vasodilation, to treat several conditions including angina pectoris. It has not been approved in the United States or the United Kingdom, but has...	Hydroxybenzoate Ethers
Hexocyclium	317.496	The World Health Organization classifies hexocyclium as a drug for functional gastrointestinal disorders . Like other anti-muscarinic agents, hexocyclium was likely used to treat peptic ulcers or diarrhea.	Synthetic Anticholinergics, Quaternary Ammonium Compounds
Hexylcaine	261.3593	Used as a local anesthetic for surface application, infiltration or nerve block	Amines
Hexylresorcinol	194.2701	An ingredient used to relieve irritation, pain, and prevent infection.	Anthelmintics
Histamine	111.1451	An ingredient of topical drugs for the relief of joint pain or muscle aches and pains.	Tests for Gastric Secretion
Histrelin	1443.632	A GnRH agonist found in subcutaneous implants used for the treatment of pediatric patients with central precocious puberty and the palliative treatment of advanced prostate cancer.	Gonadotropin-releasing hormone agonist
Homatropine	275.348	An anticholinergic agent used to dilate the pupil, treat inflammation of the uveal tract, and suppress a cough.	Anticholinergic Agents
Homatropine methylbromide	370.281	A muscarinic receptor antagonist used to treat peptic ulcers, gastric ulcers, and duodenal ulcers.	Belladonna Alkaloids, Semisynthetic, Quaternary Ammonium Compounds
Homosalate	262.349	As ingredient in many sunscreen for protection against sunburn, skin aging and skin cancer.	Sunscreen Agents
Huperzine A	242.3162	Investigated for use/treatment in alzheimer's disease.	Cholinesterase Inhibitors
Hyaluronic acid	776.6486	A glycosaminoglycan used for the relief of joint pain, wound healing, ophthalmologic treatment, cosmetic treatment, and various other applications.	Viscoelastic Substances
Hydralazine	160.1759	An antihypertensive agent used for the management of essential hypertension or severe hypertension associated with conditions requiring immediate action, heart failure, and pre-eclampsia or eclampsia .	Hydrazinophthalazine Derivatives
Hydrochlorothiazide	297.739	A thiazide diuretic used to treat edema associated with a number of conditions, and hypertension.	Low-Ceiling Diuretics and Potassium-Sparing Agents
Hydrocodone	299.3642	An opioid agonist used as an analgesic and antitussive agent.	Opium Alkaloids and Derivatives
Hydrocortamate	475.6175	Used topically as an antiinflammatory in the treatment of steroid-responsive dermatoses	Cytochrome P-450 CYP3A Inducers
Hydrocortisone	362.4599	A glucocorticoid used to treat corticosteroid-responsive dermatoses, endocrine disorders, immune conditions, and allergic disorders.	Corticosteroids Acting Locally
Hydrocortisone acetate	404.4966	A corticosteroid used to treat inflammatory and pruritic corticosteroid-responsive dermatoses and ulcerative colitis.	Aerosols
Hydrocortisone butyrate	432.557	A corticosteroid used to treat inflammatory and pruritic corticosteroid-responsive dermatoses.	Corticosteroids, Moderately Potent (Group II)
Hydrocortisone cypionate	486.649	For the relief of the inflammatory and pruritic manifestations of corticosteroid-responsive dermatoses. Also used to treat endocrine (hormonal) disorders (adrenal insufficiency, Addisons disease). It is also used to treat many...	Corticosteroids
Hydrocortisone phosphate	442.445	A corticosteroid used to treat congenital adrenal hyperplasia, for emergency asthma treatment, hypersensitivity, and inflammation.	11-Hydroxycorticosteroids
Hydrocortisone probutate	488.613	A corticosteroid used to treat inflammatory and pruritic corticosteroid-responsive dermatoses.	Corticosteroids, Moderately Potent (Group II)
Hydrocortisone succinate	462.539	A corticosteroid used to treat severe allergic reactions, dermatologic diseases, endocrine disorders, gastrointestinal diseases, hematological disorders, neoplastic diseases, nervous system conditions, ophthalmic diseases, renal diseases, respiratory diseases, and rheumatic disorders.	Anti-Inflammatory Agents
Hydrocortisone valerate	446.5763	A corticosteroid used to treat inflammatory and pruritic corticosteroid-responsive dermatoses.	Corticosteroids
Hydroflumethiazide	331.292	A thiazide diuretic used to treat hypertension as well as edema due to congestive heart failure and liver cirrhosis.	Sulfonamides
Hydrogen fluoride	20.0063	A compound used in dentistry to prevent dental caries.	Acids, Noncarboxylic
Hydrogen peroxide	34.0147	A compound used as a disinfectant and sterilizer.	Antiinfectives and Antiseptics for Local Oral Treatment
Hydromorphone	285.3377	An opioid analgesic used to treat moderate to severe pain when the use of an opioid is indicated.	Natural Opium Alkaloids
Hydroquinone	110.1106	A topical brightening agent used for the treatment of skin disorders associated with hyperpigmentation including melasma, post-inflammatory hyperpigmentation, sunspots, and freckles.	Antioxidants
Hydrotalcite	619.973	An antacid indicated in the treatment of heartburn and excess gastric acid.	Antacids
Hydroxocobalamin	1346.3551	A synthetic form of vitamin B12 used to treat vitamin B12 associated disorders and cyanide poisoning.	Antidotes
Hydroxyamphetamine	151.2056	An indirectly acting sympathomimetic agent producing mydriasis for diagnostic purposes.	Adrenergic Agonists
Hydroxychloroquine	335.872	An antimalarial medication used to treat uncomplicated cases of malaria and for chemoprophylaxis in specific regions. Also a disease modifying anti-rheumatic drug (DMARD) indicated for treatment of rheumatoid arthritis and lupus erythematosus.	Aminoquinolines
Hydroxycitronellal	172.2646	Hydroxycitronellal is approved by the FDA for use within allergenic epicutaneous patch tests which are indicated for use as an aid in the diagnosis of allergic contact dermatitis (ACD) in...	Perfume
Hydroxyethyl cellulose	806.937	An ingredient used in formulations to alleviate irritation of the skin.	Ophthalmic Solutions
Hydroxyethyl ethylcellulose	0	Hydroxyethyl ethylcellulose modulates bacterial binding to salivary pellicle; moderately effective in preventing plaque formation.	Biopolymers
Hydroxyethyl Starch	0	A plasma volume substitute used to treat and prevent hypovolemia.	Blood Substitutes and Plasma Protein Fractions
Hydroxyprogesterone caproate	428.6041	A synthetic progestin used for the prevention of spontaneous preterm births in singleton pregnancies in women who have previously had a spontaneous preterm birth.	Antineoplastic Agents
Hydroxypropyl cellulose	0	A cellulose ether used to treat dry eyes.	Demulcent
Hydroxystilbamidine	280.331	Used in the treatment of nonprogressive blastomycosis of the skin and other mycoses.	Amidines
Hydroxyurea	76.0547	An antimetabolite used to treat sickle cell anemia crisis, resistant chronic myeloid leukemia, and Locally advanced squamous cell carcinomas of the head and neck (excluding the lip).	Antisickling Agents
Hydroxyzine	374.904	An antihistamine used to treat anxiety and tension associated with psychoneuroses, as well as allergic conditions such as pruritus and chronic urticaria.	Diphenylmethane Derivatives
Hyoscyamine	289.3694	An anticholinergic indicated to treat functional gastrointestinal disorders, biliary and renal colic, and acute rhinitis.	Belladonna Alkaloids, Tertiary Amines
Hypochlorite	51.452	An antimicrobial used to treat and prevent infections of the skin and tissue.	Acids, Noncarboxylic
Hypromellose	0	An ingredient used in a wide variety of medications, and is not an approved medication.	Viscoelastic Substances
Ibandronate	319.2289	A bisphosphonate used to treat osteoporosis in postmenopausal women.	Bisphosphonates
Ibrexafungerp	730.051	A triterpene antifungal indicated in the treatment of vulvovaginal candidiasis and prevention of recurrent vulvovaginal candidiasis in post-menarchal patients.	Antifungal Agents
Ibrutinib	440.507	An antineoplastic agent used to treat chronic lymphocytic leukemia, mantle cell lymphoma, and Waldenstrom's Macroglobulinemia.	Bruton's tyrosine kinase (BTK) inhibitors
Ibuprofen	206.2808	An NSAID and non-selective COX inhibitor used to treat mild-moderate pain, fever, and inflammation.	Antiinflammatory Preparations, Non-Steroids for Topical Use
Ibutilide	384.576	A class III antiarrhythmic agent used to correct atrial fibrillation and atrial flutter, which can be considered as an alternative to cardioversion.	Antiarrhythmic agents
Icatibant	1304.54	A bradykinin B2 receptor antagonist used to treat acute episodes of swelling and inflammation associated with hereditary angioedema (HAE).	Drugs Used in Hereditary Angioedema
Ichthammol	0	Ichthammol is also referred to as ammonium bituminosulfonate or ammonium bituminosulphonate. It is an ammonium salt of dark sulfonated shale oil (bituminous schists) produced via distillation of the oil followed...	Dermatologicals
Icodextrin	0	An iso-osmotic solution used for continuous peritoneal dialysis or automated peritoneal dialysis.	Dialysis Solutions
Icosapent	302.451	A polyunsaturated fatty acid, usually found in fish oils, that is used in many supplements.	Agents that produce hypertension
Icosapent ethyl	330.5042	An ethyl ester of eicosapentaenoic acid (EPA) that reduces synthesis and enhances clearance of triglycerides that is used to treat patients with severe hypertriglyceridemia.	Antiplatelet agents
Idarubicin	497.4939	An anthracycline antineoplastic agent used to treat acute myeloid leukemia (AML) in adults.	Anthracyclines and Related Substances
Idebenone	338.444	An analogue of ubiquinone used for the treatment of visual impairment in adolescent and adult patients with Leber’s Hereditary Optic Neuropathy (LHON).	Antioxidants
Idelalisib	415.432	An antineoplastic kinase inhibitor used to treat chronic lymphocytic leukemia (CLL), relapsed follicular B-cell non-Hodgkin lymphoma (FL), and relapsed small lymphocytic lymphoma (SLL).	Phosphatidylinositol-3-kinase (Pi3K) inhibitors
Idoxuridine	354.0985	A pyrimidine analog antiviral used for the treatment of viral eye infections, including herpes simplex keratitis.	Nucleosides and Nucleotides Excl. Reverse Transcriptase Inhibitors
Ifosfamide	261.086	An alkylating and immunosuppressive agent used in chemotherapy for the treatment of cancers, including testicular cancer, ovarian cancer, cervical cancer, osteocarcinoma, bladder cancer, small cell lung cancer, and non-Hodgkin's lymphoma.	Nitrogen Mustard Analogues
Iloperidone	426.4806	An atypical antipsychotic agent used for the acute treatment of schizophrenia in adults.	Agents that produce hypertension
Iloprost	360.494	A synthetic prostacyclin analog indicated to treat pulmonary arterial hypertension (PAH).	Platelet Aggregation Inhibitors Excl. Heparin
Imatinib	493.6027	A tyrosine kinase inhibitor used to treat a number of leukemias, myelodysplastic/myeloproliferative disease, systemic mastocytosis, hypereosinophilic syndrome, dermatofibrosarcoma protuberans, and gastrointestinal stromal tumors.	Bcr-Abl Tyrosine Kinase Inhibitors
Imidurea	388.297	Imidurea is an antimicrobial preservative used in cosmetics. It acts as a formaldehyde releaser.	Pharmaceutic Aids
Imipenem	299.346	A carbapenem antibiotic normally administered with cilastatin to treat a variety of infections.	Anti-Bacterial Agents
Imipramine	280.4073	A tricyclic antidepressant indicated for the treatment of depression and to reduce childhood enuresis.	Non-Selective Monoamine Reuptake Inhibitors
Imiquimod	240.3036	A toll-like receptor 7 agonist used to treat non hyperkeratotic, non hypertrophic actinic keratosis, basal cell carcinoma, genital or perianal warts, and condyloma acuminata.	Adjuvants, Immunologic
Indacaterol	392.4907	An inhaled long-acting beta-2 adrenergic agonist used to relax bronchial smooth muscle and improve symptoms and airflow obstruction caused by Chronic Obstructive Pulmonary Disease (COPD) and moderate to severe asthma.	Agents producing tachycardia
Indapamide	365.835	A thiazide diuretic used to treat hypertension as well as edema due to congestive heart failure.	Sulfonamides
Indecainide	308.4174	For the treatment of life-threatening dysrhythmias and sustained ventricular tachycardia.	\N
Indigotindisulfonic acid	422.389	A medication used to visualize ureteral orifices during cystoscopy and ureteral catheterization.	Tests for Renal Function and Ureteral Injuries
Indinavir	613.7895	A protease inhibitor used to treat HIV infection.	HIV Protease Inhibitors
Indium In-111 chloride	217.26	A diagnostic radiopharmaceutical agent used for radiolabelling monoclonal antibodies in preparations used for in vivo diagnostic imaging procedures.	Radioactive Diagnostic Agent
Indium In-111 oxyquinoline	543.364	A radiopharmaceutical diagnostic agent used for radiolabeling autologous leukocytes as an adjunct in the detection of inflammatory processes to which leukocytes migrate.	Radioactive Diagnostic Agent
Indium In-111 pentetate	501.23	A radiopharmaceutical diagnostic agent used for radionuclide cisternography.	Radioactive Diagnostic Agent
Indium In-111 pentetreotide	1472.41	Indium In 111 pentetreotide (Octreoscan) has been used in trials studying the diagnostic of SARCOIDOSIS, Solid Tumors, and cushing syndrome.	Indium (111In) Compounds
Indocyanine green	774.97	A diagnostic agent for vascular imagine and radiography of the eye, as well as liver function tests.	Coloring Agents
Indocyanine green acid form	753.99	A diagnostic agent used for the determination of cardiac output, hepatic function and liver blood flow, and for ophthalmic angiography.	Coloring Agents
Indomethacin	357.788	A nonsteroidal anti-inflammatory (NSAID) used for symptomatic management of chronic musculoskeletal pain conditions and to induce closure of a hemodynamically significant patent ductus arteriosus in premature infants.	Acetic Acid Derivatives and Related Substances
Indoramin	347.4534	Indoramin is a discontinued piperidine antiadrenergic drug with the trade names Baratol and Doralese. It is a selective alpha-1 adrenergic antagonist with no reflex tachycardia and direct myocardial depression action.	Adrenergic alpha-Antagonists
Infigratinib	560.475	An FGFR inhibitor used to treat locally advanced or metastatic cholangiocarcinoma in adults with a fibroblast growth factor receptor 2 (FGFR2) rearrangement.	Fibroblast growth factor receptor (FGFR) tyrosine kinase inhibitors
Ingenol mebutate	430.541	A topical agent used for the treatment of actinic keratosis.	Cell Death Inducer
Inosine pranobex	1115.249	A medication used to treat subacute sclerosing panencephalitis.	Acetanilides
Inositol	180.1559	An ingredient found in a variety of nutritional products.	Vitamins
Inositol nicotinate	810.732	A vasodilator and source of niacin found in dietary supplements.	Nicotinic Acid and Derivatives
Iobenguane	275.0896	A radiopharmaceutical agent used for the diagnosis of primary and metastatic pheochromocytoma or neuroblastoma.	Iodine (131I) Compounds
Iobenguane sulfate I-123	640.26	For use in the diagnostic imaging of adrenergically inervated tissues for the purposes of detecting metastatic pheochromocytoma or neuroblastoma [FDA Label]. Also used to assess the sympathetic inervation of the...	Radioactive Diagnostic Agent
Iobitridol	835.169	An iodine-based contrast agent used with X-ray or CT imaging.	Watersoluble, Nephrotropic, Low Osmolar X-Ray Contrast Media
Iocetamic acid	613.96	Iocetamic acid is a diagnostic aid (radiopaque medium)	Watersoluble, Hepatotropic X-Ray Contrast Media
Iodide	126.9045	Iodide has been investigated for the treatment of Goiter, Nodular.	Anions
Iodide I-123	122.9061	A radiopharmaceutical diagnostic agent used for the evaluation of the thyroid function and/or morphology.	Thyroid Diagnostic Radiopharmaceuticals
Iodide I-131	130.9067	A radioisotopic agent used for the treatment of hyperthyroidism and thyroid carcinomas that take up iodine.	Iodine (131I) Compounds
Iodine	253.8089	An ingredient of nutritional supplements that is also used for disinfection.	Iodine Products
Iodine povacrylex	0	An antiseptic agent used for disinfection of the skin prior to surgical procedures to prevent bacterial skin infections.	Anti-Infective Agents, Local
Iodipamide	1139.7618	A contrast agent used in cholangiography and cholecystography.	Watersoluble, Hepatotropic X-Ray Contrast Media
Iodixanol	1550.1819	A contrast agent used during coronary angiography, particularly in patients with renal dysfunction.	Watersoluble, Nephrotropic, Low Osmolar X-Ray Contrast Media
Iodoform	393.732	No approved therapeutic indications.	Medicated Dressings With Antiinfectives
Iodohippurate sodium I-123	323.054	Not Annotated	Diagnostic Radiopharmaceuticals
Iodohippurate sodium I-131	331.055	Not Annotated	Diagnostic Radiopharmaceuticals
Iofetamine I-123	299.189	Not Annotated	Iodine (123I) Compounds
Ioflupane I-123	427.291	A radiopharmaceutical used in single photon emission computed tomography (SPECT) brain imaging to help diagnose patients with suspected Parkinsonian syndromes.	Iodine (123I) Compounds
Iohexol	821.1379	A contrast agent for intrathecal administration used in myelography and contrast enhancement for computerized tomography.	Watersoluble, Nephrotropic, Low Osmolar X-Ray Contrast Media
Iomeprol	777.089	An iodine-based X-ray contrast agent.	Watersoluble, Nephrotropic, Low Osmolar X-Ray Contrast Media
Iopamidol	777.0853	A diagnostic imaging agent used for angiography throughout the cardiovascular system.	Watersoluble, Nephrotropic, Low Osmolar X-Ray Contrast Media
Iopanoic acid	570.9319	Iopanoic acid contains iodine and is useful as a contrast medium in cholecystography.	Watersoluble, Hepatotropic X-Ray Contrast Media
Iophendylate	416.3368	Iophendylate is used as a contrast agent to locate spinal tumors.	Non-Watersoluble X-Ray Contrast Media
Iopodic acid	597.961	An iodine containing cholecystography agent.	Watersoluble, Hepatotropic X-Ray Contrast Media
Iopromide	791.1119	An X-ray contrast agent used during various types of imaging tests such as angiography and contrast computed tomography (CT) imaging tests.	Watersoluble, Nephrotropic, Low Osmolar X-Ray Contrast Media
Iothalamic acid	613.916	A diagnostic contrast agent used in various medical imaging procedures, such as angiography, arthrography, and computed tomographic scans.	Watersoluble, Nephrotropic, High Osmolar X-Ray Contrast Media
Iotrolan	1626.242	Nonionic, isotonic contrast medium designed for intrathecal use.	Watersoluble, Nephrotropic, Low Osmolar X-Ray Contrast Media
Ioversol	807.115	A diagnostic contrast agent used in various medical imaging procedures, such as angiography, urography, and computed tomographic scans.	Watersoluble, Nephrotropic, Low Osmolar X-Ray Contrast Media
Ioxaglic acid	1268.886	A tri-iodinated benzoate contrast agent used in various radiological procedures including angiography, phlebography, urography, computed tomography (CT), and hysterosalpingography.	Watersoluble, Nephrotropic, Low Osmolar X-Ray Contrast Media
Ioxilan	791.116	A diagnostic contrast agent used in various medical imaging procedures, such as angiography, urography, and computed tomographic scans.	Watersoluble, Nephrotropic, Low Osmolar X-Ray Contrast Media
Ioxitalamic acid	643.942	A contrast agent used for CT scans of the abdomen and pelvis.	Watersoluble, Nephrotropic, High Osmolar X-Ray Contrast Media
Ipecac	0	An emetic agent used to induce vomiting in poisoning.	Antidotes
Ipratropium	332.463	An anticholinergic drug used in the control of symptoms related to bronchospasm in chronic obstructive pulmonary disease (COPD).	Agents producing tachycardia
Irbesartan	428.5294	An angiotensin receptor blocker used to treat hypertension, delay progression of diabetic nephropathy, and treat congestive heart failure.	Angiotensin II receptor blockers (ARBs) and calcium channel blockers
Irinotecan	586.678	An antineoplastic enzyme inhibitor used to treat metastatic carcinoma of the colon or rectum.	Topoisomerase 1 (TOP1) inhibitors
Iron	55.845	An essential element commonly used for the treatment of patients with documented iron deficiency.	Metals, Heavy
Iron Dextran	0	An iron supplement used to treat iron deficiency in patients who cannot take oral iron.	Dextrans
Iron isomaltoside 1000	0	Iron isomaltoside 1000 is under investigation in Iron Deficiency Anaemia. Iron isomaltoside 1000 has been investigated for the treatment and basic science of Anemia, Gastric Cancer, Esophageal Cancer, Chronic Kidney...	Hematinics
Iron protein succinylate	0	Not Annotated	Iron Trivalent, Oral Preparations
Iron sucrose	866.546	An compound used as a source of iron in patients with iron deficiency anemia associated with chronic kidney disease (CKD).	Drugs for Treatment of Hyperkalemia and Hyperphosphatemia
Isavuconazole	437.47	Indicated for patients 18 years of age and older for the treatment of invasive aspergillosis [FDA Label].\\nIndicated for patients 18 years of age and older for the treatment of...	Triazole and tetrazole derivatives
Isavuconazonium	717.77	A triazole antifungal used for the treatment of invasive aspergillosis and mucormycosis.	Antifungal Agents
Isoaminile	244.382	Isoaminile, an antitussive drug with a structure similar to methadone, is also an anticholinergic with both antimuscarinic and antinicotinic properties.	Antitussive Agents
Isocarboxazid	231.2505	A monoamine oxidase inhibitor used to treat enduring and debilitating symptoms of depression following inadequate clinical response to other antidepressant drugs.	Monoamine Oxidase Inhibitors, Non-Selective
Isoconazole	416.129	An imidazole antifungal used for superficial skin and vaginal infections.	Imidazole and Triazole Derivatives
Isoetharine	239.3107	For the treatment of asthma, wheezing, and chronic asthmatic bronchitis.	Selective Beta 2-adrenergic Agonists
Isoeugenol	164.204	Isoeugenol is approved by the FDA for use within allergenic epicutaneous patch tests which are indicated for use as an aid in the diagnosis of allergic contact dermatitis (ACD) in...	Standardized Chemical Allergen
Isoflurane	184.492	An inhaled general anesthetic used in surgery.	Hydrocarbons, Halogenated
Isoflurophate	184.1457	For use in the eye to treat certain types of glaucoma and other eye conditions, such as accommodative esotropia.	Cholinesterase Inhibitors
Isometheptene	141.2539	A sympathomimetic used to relieve painful spasms in combination with other agents such as caffeine and metamizole.	Agents producing tachycardia
Isoniazid	137.1393	An antibiotic used to treat mycobacterial infections; most commonly use in combination with other antimycobacterial agents for the treatment of active or latent tuberculosis.	Hydrazides
Isoprenaline	211.2576	A catecholamine non-selective beta-adrenergic agonist typically used to treat bradycardia and heart block.	Adrenergic and Dopaminergic Agents
Isopropamide	353.5209	A long-acting anticholinergic drug used to relieve symptoms of spastic and painful symptoms of gastrointestinal conditions and symptoms of flu, colds, and related conditions.	Synthetic Anticholinergics, Quaternary Ammonium Compounds
Isopropyl alcohol	60.095	An antiseptic and disinfectant used in a variety of clinical and domestic settings.	Propanols
Isopropyl myristate	270.4507	A polar skin moisturizer that is used to enhance skin penetration of drugs.	Fatty Acids
Isosorbide	146.1412	A vasodilator used for the prevention and treatment of angina pectoris due to coronary artery disease. It was previously used to reduce intraocular pressure.	Diuretics, Osmotic
Isosorbide dinitrate	236.1363	A vasodilator used to treat angina in coronary artery disease.	Organic Nitrates
Isosorbide mononitrate	191.1388	A nitrate used to prevent and treat angina and to treat angina caused by coronary artery disease.	Organic Nitrates
Isosulfan blue	545.69	A visual lymphatic imaging agent used during lymphography as an adjunct.	Coloring Agents
Isotretinoin	300.4351	A retinoid used to treat severe recalcitrant acne.	Retinoids for Topical Use in Acne
Isoxaflutole	359.32	Balance has been investigated for the treatment of Chronic Renal Failure and Peritoneal Membrane Disorder.	Membrane Proteins
Isoxicam	335.335	Isoxicam is a non-steroidal anti-inflammatory drug that is not marketed in the United States.	Agents that produce hypertension
Isoxsuprine	301.386	A beta-adrenergic agonist used in the symptomatic treatment of cerebrovascular insufficiency, peripheral vascular disease of arteriosclerosis obliterans, thromboangiitis obliterans (Buerger's disease) and Raynaud's disease.	2-Amino-1-Phenylethanol Derivatives
Isradipine	371.3871	A dihydropyridine calcium channel blocker used for the treatment of hypertension.	Dihydropyridine Derivatives
Istradefylline	384.436	A selective adenoside A2A receptor antagonist indicated in adjunct to levodopa and carbidopa for the treatment of Parkinson's Disease.	Adenosine A2 Receptor Antagonists
Itraconazole	705.633	An antifungal agent used for the treatment of various fungal infections in immunocompromised and non-immunocompromised patients, such as pulmonary and extrapulmonary blastomycosis, histoplasmosis, and onychomycosis.	Triazole and tetrazole derivatives
Ivabradine	468.594	A HCN channel blocker used to reduce the risk of hospitalization for worsening heart failure in adult patients and for treatment of stable symptomatic heart failure as a result of dilated cardiomyopathy in pediatric patients.	Benzazepines
Ivacaftor	392.4907	A cystic fibrosis transmembrane conductance regulator (CFTR) potentiator used alone or in combination products to treat cystic fibrosis in patients who have specific genetic mutations that are responsive to the medication.	Chloride Channel Agonists
Ivermectin	1736.185	An anti parasite medication used to treat head lice, onchocerciasis, strongyloidiasis, ascariasis, trichuriasis, and enterobiasis.	Avermectines
Ivosidenib	582.97	An isocitrate dehydrogenase-1 inhibitor used to treat acute myeloid leukemia and cholangiocarcinoma in adults with a susceptible IDH1 mutation.	Enzyme Inhibitors
Ixabepilone	506.7	A microtubule inhibitor administered in combination with capecitabine or alone in the treatment of metastatic or locally advanced breast cancer that has shown inadequate response to taxanes and anthracyclines.	Microtubule Inhibitors
Ixazomib	361.03	A monoclonal antibody used with other medications to treat multiple myeloma in patients who have received one other therapy already.	Proteasome Inhibitors
Kanamycin	484.4986	An aminoglycoside antibiotic agent used in the treatment of various infections caused by susceptible bacteria.	Anti-Bacterial Agents
Kaolin	258.156	A natural ingredient used for the short-term symptomatic treatment of various conditions including diarrhea, skin dryness, and minor skin bleeding.	Aluminum Silicates
Kappadione	422.084	Anticoagulant-induced prothrombin deficiency caused by coumadin or indanedione derivatives,\\nprophylaxis and therapy of hemorrhagic disease of the newborn, hypoprothrombinemia due to antibacterial therapy,\\nhypoprothrombinemia secondary to factors limiting absorption or...	\N
Kava	232.275	Not Available	\N
Ketamine	237.725	A rapid-acting general anesthetic and NMDA receptor antagonist used for induction of anesthesia diagnostic and surgical procedures typically in combination with a muscle relaxant.	Analgesics
Ketazolam	368.814	A long-acting benzodiazepine used to manage anxiety and insomnia.	Benzodiazepines and benzodiazepine derivatives
Ketoconazole	531.431	A broad spectrum antifungal used to treat seborrheic dermatitis and fungal skin infections.	Anticorticosteroids
Ketoprofen	254.2806	An NSAID used to treat rheumatoid arthritis, osteoarthritis, ankylosing spondylitis, dysmenorrhea, mild to moderate muscle pain, postoperative pain, and postpartum pain.	Antiinflammatory Preparations, Non-Steroids for Topical Use
Ketorolac	255.2686	An NSAID used to treat moderate to severe pain, rheumatoid arthritis, osteoarthritis, ankylosing spondylitis, menstrual disorders, and headaches.	Acetic Acid Derivatives and Related Substances
Ketotifen	309.425	A histamine H1 receptor blocker and mast cell stabilizer used to treat mild atopic asthma and allergic conjunctivitis.	Anti-Allergic Agents
Kinetin	215.2114	Kinetin is a cytokinin which are plant hormones promotes cell division and plant growth. It was shown to naturally exist in DNA of organisms including humans and various plants. While...	Cytokinins
Krypton Kr 81m	80.9166	Not Annotated	Diagnostic Radiopharmaceuticals
L-arginine	0	Not Annotated	Arginine
L-Glutamine	146.1445	An amino acid commonly found as a component in total parenteral nutrition.	Amino Acids and Derivatives
L-Lactic acid	90.0779	Not Annotated	Lactates
Labetalol	328.4055	An alpha and beta adrenergic antagonist used to treat hypertension, angina, and sympathetic overactivity syndrome.	Alpha and Beta Blocking Agents
Lacidipine	455.551	A lipophilic dihydropyridine calcium channel blocker with a slow onset of action used to treat hypertension.	Dihydropyridine Derivatives
Lacosamide	250.2936	An antiepileptic drug used to treat partial onset seizures in adults.	Acetamides
Lactic acid	90.0779	An emollient and keratolytic used agent in various cosmetic products and used as an additive in various pharmaceutical products for its antibacterial properties.	Organic Acids
Lactitol	344.3124	An orally administered osmotic laxative used to treat chronic idiopathic constipation.	Laxatives
Lactobacillus delbrueckii bulgaricus	0	Not Annotated	Probiotics
Lactose	342.2965	An additive and filler found in various products to maintain structure and consistency.	Disaccharides
Lactulose	342.2965	A disaccharide derivative of lactose used to treat constipation and portal systemic encephalopathy.	Disaccharides
Lamivudine	229.256	A reverse transcriptase inhibitor used to treat HIV and hepatitis B infections.	Anti-HIV Agents
Lamotrigine	256.091	A phenyltriazine antiepileptic used to treat some types of epilepsy and bipolar I disorder.	Agents producing tachycardia
Lanolin	0	An ingredient used in skin care products to relieve irritation.	Cosmetics
Lanolin alcohols	0	Lanolin alcohols are a complex combination of organic alcohols obtained by the hydrolysis of lanolin. It is administered as an ointment base with topical insulin and has shown to be...	Standardized Chemical Allergen
Lanreotide	1096.33	A somatostatin analog used for the treatment of unresectable, well- or moderately-differentiated, locally advanced or metastatic gastroenteropancreatic neuroendocrine tumors and acromegaly.	Acromegaly
Lansoprazole	369.361	A proton pump inhibitor used to help gastrointestinal ulcers heal, to treat symptoms of gastroesophageal reflux disease (GERD), to eradicate Helicobacter pylori, and to treat hypersecretory conditions such as Zollinger-Ellison Syndrome.	Anti-Ulcer Agents
Lanthanum carbonate	457.835	A phosphate binder indicated for the reduction of serum phosphate in patients with end stage renal disease.	Drugs for Treatment of Hyperkalemia and Hyperphosphatemia
Lapatinib	581.058	An antineoplastic agent and tyrosine kinase inhibitor used for the treatment of advanced or metastatic HER-positive breast cancer in patients who received prior chemotherapeutic treatments.	Human epidermal growth factor receptor 2 (HER2) tyrosine kinase inhibitors
Lapyrium	363.521	Used as a surfactant, antistatic agent, and biocide in cosmetic products .	Pyridines
Laropiprant	435.89	Laropiprant is an ingredient in the EMA-withdrawn product Pelzont.	Heterocyclic Compounds, Fused-Ring
Larotrectinib	428.444	A kinase inhibitor used to treat solid tumors with neurotrophic receptor tyrosine kinase gene fusion, are metastatic, high risk for surgery, or have no alternative treatments.	Protein Kinase Inhibitors
Lasmiditan	377.367	An oral 5HT1F agonist used for the acute treatment of migraine headache with or without aura.	Amides
Lasofoxifene	413.5512	Investigated for use/treatment in postmenopausal osteoporosis to reduce the risk of both vertebral and novertebral fractures, as well as address other postmenopausal conditions, including reduction in risk of breast cancer...	Selective Estrogen Receptor Modulators
Memantine	179.3018	An NMDA receptor antagonist used to treat moderate to severe dementia in Alzheimer's.	Cholinesterase Inhibitors
Latamoxef	520.473	Latamoxef is an oxacephem antibiotic usually grouped with the cephalosporins. It is used to treat bacterial infections. Latamoxef is primarily indicated in conditions like Bone and joint infection, GI infections,...	Anti-Bacterial Agents
Latanoprost	432.5928	An isopropyl ester prodrug used to treat increased intraocular pressure.	Antihypertensive Agents
Latanoprostene bunod	507.624	A prostaglandin analog used to reduce ocular hypertension or treat open-angle glaucoma.	Prostaglandins, Synthetic
Lauric acid	200.3178	Lauric acid is an inexpensive, non-toxic and safe to handle compound often used in laboratory investigations of melting-point depression. Lauric acid is a solid at room temperature but melts easily...	Fatty Acids
Laurocapram	281.484	Not Annotated	\N
Ledipasvir	888.9999	A direct-acting antiviral agent used to treat specific hepatitis C virus (HCV) infections in combination with other antiviral agents.	Antivirals for treatment of HCV infections
Lefamulin	507.73	A pleuromutilin antibacterial used to treat community-acquired bacterial pneumonia (CABP).	Anti-Bacterial Agents
Leflunomide	270.2073	A pyrimidine synthesis inhibitor indicated to treat rheumatoid arthritis.	Selective Immunosuppressants
Lemborexant	410.425	A dual orexin antagonist indicated for the treatment of sleep-onset and/or sleep maintenance insomnia.	Orexin Receptor Antagonists
Lenalidomide	259.2606	A thalidomide derivative used to treat multiple myeloma and anemia in low to intermediate risk myelodysplastic syndrome.	Angiogenesis Inhibitors
Leniolisib	450.466	A phosphoinositide 3-kinase-delta inhibitor that is used to treat activated phosphoinositide 3-kinase delta syndrome.	BCRP/ABCG2 Inhibitors
Lenvatinib	426.86	A receptor tyrosine kinase inhibitor used for the treatment of metastatic thyroid cancer, advanced renal cell carcinoma in combination with everolimus, and unresectable hepatocellular carcinoma.	Protein Kinase Inhibitors
Lercanidipine	611.7272	A calcium channel blocker for the management of hypertension.	ACE Inhibitors and Calcium Channel Blockers
Lesinurad	404.28	A uric acid 1 transporter inhibitor typically used in combination with a xanthine oxidase inhibitor to treat hyperuricemia associated with gout in patients with inadequate control of uric acid levels with xanthine oxidase inhibitor monotherapy.	Preparations Increasing Uric Acid Excretion
Letermovir	572.561	An antiviral medication used for prophylaxis in adult transplant recipients at risk of cytomegalovirus (CMV) infection and disease.	Antiviral Agents
Letrozole	285.3027	An aromatase inhibitor used to treat breast cancer in postmenopausal women.	Antineoplastic Agents
Leucovorin	473.446	A folate analog used to treat the toxic effects of methotrexate and other folate antagonists, to treat megaloblastic anemia, and to provide palliative treatment of colorectal cancer.	Detoxifying Agents for Antineoplastic Treatment
Leuprolide	1209.3983	A peptide-based GnRH receptor superagonist used for the palliative treatment of prostate cancer, uterine leiomyomata, endometriosis, and central precocious puberty.	Gonadotropin-releasing hormone agonist
Levacetylmethadol	353.4977	For the treatment and management of opiate dependence. It is sometimes used to treat severe pain in terminal patients.	Drugs Used in Opioid Dependence
Levallorphan	283.4079	For the complete or partial reversal of narcotic depression, including respiratory depression, induced by opioids.	Morphinans
Levamisole	204.291	Levamisole is a nicotinic receptor agonist used to treat helminth infections and some skin infections.	Imidazothiazole Derivatives
Levamlodipine	408.88	A calcium channel blocker used to treat hypertension.	Dihydropyridine Derivatives
Levetiracetam	170.212	A novel anticonvulsant agent used as an adjunct medication to manage partial onset, myoclonic, and generalized tonic-clonic seizures in patients with epilepsy.	Central Nervous System Depressants
Levmetamfetamine	149.237	Used over-the-counter for nasal congestion.	\N
Levobetaxolol	307.434	Used in the treatment of open-angle glaucoma and ocular hypertension [FDA Label].	Adrenergic Antagonists
Levobunolol	291.3853	A beta-adrenergic antagonist used for the reduction of elevated intraocular pressure in patients with ocular hypertension or open-angle glaucoma.	Adrenergic beta-Antagonists
Levobupivacaine	288.4277	A drug used for nerve block and anesthesia.	Amides
Levocabastine	420.528	A selective histamine H1 receptor antagonist indicated for the management of seasonal allergic conjunctivitis symptoms.	Antiallergic Agents, Excl. Corticosteroids
Levocarnitine	161.1989	A quaternary ammonium compound used to treat carnitine deficiency or to stimulate gastric and pancreatic secretions in hyperlipoproteinemia.	Amino Acids and Derivatives
Levocetirizine	388.89	An H1-receptor antagonist used to treat symptoms associated with chronic allergic rhinitis and uncomplicated cases of chronic idiopathic urticaria.	Piperazine Derivatives
Levodopa	197.1879	A dopamine precursor used in the management of Parkinson's disease, often in combination with carbidopa, as well as other conditions associated with parkinsonism.	Dopa and Dopa Derivatives
Levofloxacin	361.3675	A fluoroquinolone antibiotic used to treat infections caused by susceptible bacteria of the upper respiratory tract, skin and skin structures, urinary tract, and prostate, as well as for post-exposure treatment of inhaled anthrax and the plague.	Fluoroquinolones
Levoketoconazole	531.431	One of two enantiomeric forms of racemic ketoconazole that strongly inhibits multiple steroidogenic enzymes and is used for the symptomatic treatment of endogenous Cushing's syndrome.	Anticorticosteroids
Levoleucovorin	473.4393	A folate analog used after high dose methotrexate for osteosarcoma, to reduce the toxic effects of folate analogs, and with 5-fluorouracil in palliative treatment of advanced metastatic colorectal cancer.	Detoxifying Agents for Antineoplastic Treatment
Levomefolic acid	459.4558	A folate supplement used to prevent neural tube defects in pregnancy or folate deficiency.	Amino Acids
Levomenol	222.372	Levomenol has been known to elicit a number of potentially beneficial pharmacological effects, including anti-irritant, anti-inflammatory, and anti-microbial actions. Bisabolol is also demonstrated to enhance the percutaneous absorption of certain...	Biological Products
Levomenthol	156.2652	An organic compound used to treat mild to moderate muscle and joint pain.	Antipruritics
Levomilnacipran	246.348	A selective serotonin and norepinephrine reuptake inhibitor (SNRI) used to treat major depressive disorder (MDD).	Agents producing tachycardia
Levonordefrin	183.2044	A topical sympathomimetic amine found in local anesthetic products that is used for nasal decongestion or vasoconstriction during dental procedures.	Agents producing tachycardia
Menadiol diphosphate	334.1557	Not Annotated	Diterpenes
Levonorgestrel	312.4458	A progestin found in oral and IUD contraceptives and at higher doses in emergency contraceptives.	Contraceptives, Postcoital
Levorphanol	257.3706	An opioid analgesic used to treat moderate to severe pain.	Morphinans
Levosalbutamol	239.3107	A beta-2 adrenergic receptor agonist used to treat COPD and asthma.	Agents producing tachycardia
Levosimendan	280.2847	A calcium sensitizer indicated to treat acutely decompensated severe chronic heart failure.	Antiarrhythmic agents
Levothyroxine	776.87	A synthetic T4 hormone used to treat hypothyroidism that can be used along with surgery and radioiodine therapy to manage thyrotropin-dependent well-differentiated thyroid cancer.	Amino Acids, Aromatic
Lidocaine	234.3373	A local anesthetic used in a wide variety of superficial and invasive procedures.	Amides
Lidoflazine	491.627	Not Annotated	Calcium Channel Blockers
Lifitegrast	615.48	A medication used to treat dry eye disease.	Lymphocyte Function-Associated Antigen-1
Light green SF yellowish	792.848	Light green SF yellowish is a green triarylmethane dye that is used in the preparation of the staining solution which is widely used as a counterstain. It is used in...	Amines
Light mineral oil	0	An oil used to hydrate dry, itchy skin, hemorrhoids, and dry eyes.	Basic Ointments and Protectants
Linaclotide	1526.736	A guanylate cyclase-C agonist used to treat different types of constipation, such as irritable bowel syndrome-related constipation, idiopathic constipation, and functional constipation.	Guanylate Cyclase-C Agonist
Linagliptin	472.5422	A dipeptidyl peptidase-4 (DPP-4) inhibitor used to manage hyperglycemia in patients with type 2 diabetes mellitus.	DPP-IV Inhibitors
Lincomycin	406.54	An antibiotic indicated only for the treatment of serious infections and is typically reserved for use in cases of penicillin allergy or where penicillin is inappropriate.	Lincosamides
Lindane	290.83	An ectoparasiticide and ovicide used in the treatment of Pediculosis humanis capitis (head lice) and Phthirus pubis (crab lice).	Chlorine Containing Products
Linezolid	337.3461	An oxazolidinone antibiotic used to treat infections by susceptible strains of aerobic Gram-positive bacteria.	Agents that produce hypertension
Linoleic acid	280.4455	Not Annotated	Linoleic Acids
Linzagolix	508.42	A selective gonadotropin-releasing hormone (GnRH) receptor antagonist used for the symptomatic treatment of uterine fibroids.	Anti-Gonadotropin-Releasing Hormones
Liothyronine	650.9735	A thyroid hormone replacement therapy used to treat hypothyroidism, to suppress TSH, and to help in the diagnosis of hyperthyroidism.	l-Triiodothyronine
Liotrix	1471.8073	May be used to treat primary, secondary or tertiary hypothyroidism. May also be used to suppress thyroid stimulating hormone (TSH) secretion in patients with simple (nontoxic) goiter, subacute or chronic...	l-Triiodothyronine
Lipoic acid	206.326	For nutritional supplementation, also for treating dietary shortage or imbalance.	Various Alimentary Tract and Metabolism Products
Lisdexamfetamine	263.3785	A central nervous system (CNS) stimulant used to treat attention deficit hyperactivity disorder (ADHD) and moderate to severe eating disorders.	Centrally Acting Sympathomimetics
Lisinopril	405.4879	An ACE inhibitor used to treat hypertension, heart failure, and acute myocardial infarction.	ACE Inhibitors and Calcium Channel Blockers
Lisuride	338.4466	For the management of Parkinson's Disease	Ergot Alkaloids and Derivatives
Lithium carbonate	73.89	A medication used to treat manic episodes of bipolar disorder.	Antidepressive Agents
Lithium citrate	209.92	Lithium is used as a mood stabilizer, and is used for treatment of depression and mania. It is often used in bipolar disorder treatment.	Lithium Compounds
Lithium hydroxide	23.95	Used for tryptophan determinations in proteins &amp; foods.	Lithium Compounds
Lodoxamide	311.63	An ophthalmic agent used for the treatment of the ocular disorders referred to by the terms vernal keratoconjunctivitis, vernal conjunctivitis, and vernal keratitis.	Anti-Allergic Agents
Lofexidine	259.132	A centrally acting alpha2-adrenergic agonist used for the symptomatic treatment of acute opioid withdrawal syndrome to facilitate abrupt opioid discontinuation in adults.	Drugs Used in Opioid Dependence
Lomefloxacin	351.3479	A fluoroquinolone used to prevent and treat a wide variety of infections in the body.	Anti-Bacterial Agents
Lomitapide	693.7204	A microsomal triglyceride transfer protein inhibitor used to lower cholesterol associated with homozygous familial hypercholesterolemia (HoFH), reducing risk of cardiovascular events such as myocardial infarction and stroke.	Hypolipidemic Agents Indicated for Hyperlipidemia
Lomustine	233.695	An alkylating agent used as a part of chemotherapeutic regimens for the treatment of primary and metastatic brain tumors as well as refractory or relapsed Hodgkin's disease in addition to surgical and/or radiotherapeutic treatments.	Nitrosoureas
Lonafarnib	638.822	A potent farnesyl transferase inhibitor used to reduce mortality associated with Hutchinson-Gilford progeria syndrome (HGPS) and other progeroid laminopathies.	Various Alimentary Tract and Metabolism Products
Loperamide	477.038	A long acting antidiarrheal used to control nonspecific diarrhea and chronic diarrhea caused by inflammatory bowel disease, or gastroenteritis.	Antipropulsives
Lopinavir	628.8008	An HIV-1 protease inhibitor used in combination with ritonavir to treat human immunodeficiency virus (HIV) infection.	Cytochrome P-450 CYP3A Inhibitors
Loracarbef	349.769	Used to treat upper respiratory tract bacterial infections, chronic bronchitis, pneumonia, sinusitis, pharyntitis and tonsillitis, skin absceses, urinary tract infections and pyelonephritis caused by E. coli, S. pyogenes, S. aureus,...	Anti-Bacterial Agents
Loratadine	382.883	A second generation antihistamine used to manage the symptoms of allergic rhinitis.	Anti-Allergic Agents
Lorazepam	321.158	A short-acting benzodiazepine commonly used to treat panic disorders, severe anxiety, and seizures.	Anti-Anxiety Agents
Lorcaserin	195.69	A serotonin 2C receptor agonist used in conjunction with physical activity and calorie restriction for weight loss in obese patients with a body mass index (BMI) of 30 and above, and in overweight patients with weight-related comorbidities.	Centrally Acting Antiobesity Products
Lorlatinib	406.421	An anaplastic lymphoma kinase inhibitor used to treat anaplastic lymphoma kinase positive metastatic non small cell lung cancer.	Anaplastic lymphoma kinase (ALK) inhibitors
Lormetazepam	335.185	A benzodiazepine indicated in the treatment of anxiety and the induction of anesthesia.	Benzodiazepines and benzodiazepine derivatives
Lornoxicam	371.81	An NSAID indicated in the treatment of mild to moderate pain, as well as rheumatoid arthritis and osteoarthritis.	Oxicams
Lorpiprazole	405.469	In 2016, lorpiprazole was classified in the Chemical structure-related drug-like criteria of global approved drugs as an antipsychotic and anxiolytic. An antipsychotic is a medication used to treat a state...	Antidepressive Agents
Losartan	422.911	An angiotensin receptor blocker used to treat hypertension and diabetic nephropathy, and is used to reduce the risk of stroke.	Angiotensin II receptor blockers (ARBs) and calcium channel blockers
Loteprednol	394.889	A corticosteroid indicated in the treatment of pain and inflammation after cataract surgery.	Androstadienes
Loteprednol etabonate	466.96	A corticosteroid used to treat allergic conjunctivitis as well as inflammation and pain after ocular surgery.	Androstadienes
Lovastatin	404.5396	An HMG-CoA reductase inhibitor used to lower LDL cholesterol and reduce the risk of cardiovascular disease and associated conditions, including myocardial infarction and stroke.	Anticholesteremic Agents
Loxapine	327.808	A antipsychotic used for the treatment of schizophrenia.	Diazepines, Oxazepines, Thiazepines and Oxepines
Loxoprofen	246.3016	An NSAID used to treat pain and inflammation in musculoskeletal conditions.	Antiinflammatory Preparations, Non-Steroids for Topical Use
Lubiprostone	390.468	A prostaglandin derivative used to treat constipation caused by irritable bowel syndrome and opioid-use.	Chloride Channel Agonists
Luliconazole	354.27	A topical antifungal agent used to treat fungal infections.	Imidazole and Triazole Derivatives
Lumacaftor	452.414	A protein chaperone used in combination with ivacaftor for the treatment of cystic fibrosis in patients who are homozygous for the F508del mutation in the CFTR gene.	Amines
Lumateperone	393.506	A novel 2nd generation antipsychotic used to manage both positive and negative symptoms in patients with schizophrenia.	Butyrophenone Derivatives
Lumefantrine	528.94	An antimalarial agent used in combination with artemether for the treatment of acute uncomplicated malaria caused by Plasmodium falciparum.	Antiprotozoals
Lumefantrine co-artemether	6116.74	Lumefantrine Co-Artemether (Riamet) has been investigated for the treatment of Malaria, Malaria, Falciparum, Malaria in Pregnancy, Uncomplicated Malaria, and Uncomplicated Knowlesi Malaria. Lumefantrine Co-Artemether is a tablet formulation of artemether...	\N
Lumiracoxib	293.721	For the acute and chronic treatment of the signs and symptoms of osteoarthritis of the knee in adults.	COX-2 Inhibitors
Lurasidone	492.676	An atypical antipsychotic used to treat schizophrenia and depressive episodes associated with bipolar I disorder.	Indole Derivatives
Lurbinectedin	784.88	A chemotherapeutic DNA alkylating agent used in the treatment of metastatic small-cell lung cancer.	Alkylating Drugs
Lusutrombopag	591.54	A medication used to treat thrombocytopenia in patients with chronic liver disease scheduled to have a procedure.	Acids, Carbocyclic
Lutein	568.886	Xanthophylls are taken for nutritional supplementation, and also for treating dietary shortage or imbalance.	Xanthophylls
Lutetium Lu 177 dotatate	1609.55	A radiolabeled somatostatin analog used to treat somatostatin receptor positive gastroenteropancreatic neuroendocrine tumors.	Lutetium
Lutetium Lu-177	176.9438	Not Annotated	Elements
Lutetium Lu-177 vipivotide tetraxetan	1216.074	A radioligand therapeutic agent used to treat prostate-specific membrane antigen (PSMA)-positive metastatic castration-resistant prostate cancer in adults.	Radiopharmaceuticals
Lycopene	536.888	An ingredient found in a variety of supplements and vitamins.	Anti-Inflammatory Agents
Lymecycline	602.6328	A tetracycline antibiotic used for the treatment of acne vulgaris and other susceptible infections.	Tetracyclines
Lynestrenol	284.443	A progestin used for contraception and in the treatment of menstrual disorders.	Estren Derivatives
Lypressin	1056.23	Not Annotated	Vasopressin and Analogues
Lysine	146.1876	An amino acid commonly found as a component of total parenteral nutrition.	Amino Acids
Macimorelin	474.565	A medication used to treat adult growth hormone deficiency.	Tests for Pituitary Function
Macitentan	588.273	An endothelin receptor antagonist used to manage pulmonary arterial hypertension to delay disease progression.	Antihypertensives for Pulmonary Arterial Hypertension
Mafenide	186.232	An antimicrobial topical agent indicated for use as an adjunctive treatment to control bacterial infection when used under moist dressings over meshed autografts on excised burn wounds.	Sulfonamides
Magaldrate	1115.3	An antacid used to treat various conditions in the GI tract, such as esophagitis, duodenal and gastric ulcers, and gastroesophageal reflux.	Antacids With Antiflatulents
Magnesium	26.321	A medication used for many purposes including constipation, indigestion, magnesium deficiency, and pre-eclampsia.	Laxatives
Magnesium acetate	142.393	Not Available	Laxatives
Magnesium acetate tetrahydrate	214.453	An ionic compound used for electrolyte replenishment and total parenteral nutrition (TPN) therapy.	Laxatives
Magnesium Aluminum Silicate	0	Magnesium aluminum silicate is used as an over the counter antacid for the self-treatment of heartburn, sour stomach, or acid indigestion [FDA Label].	Pharmaceutic Aids
Magnesium ascorbate	374.537	Not Available	Antioxidants
Magnesium carbonate	84.314	An antacid used for symptomatic relief of heartburn, indigestion, and upset stomach.	Drugs for Treatment of Hyperkalemia and Hyperphosphatemia
Magnesium cation	24.305	Magnesium hydroxide is used primarily in Milk of Magnesia, a white aqueous, mildly alkaline suspension of magnesium hydroxide formulated at about 8%w/v. Milk of magnesia is primarily used to alleviate...	Calculi Dissolution Agent
Magnesium chloride	95.211	An ionic compound and source of magnesium used for electrolyte replenishment and conditions associated with magnesium deficiencies.	Electrolyte Solutions
Magnesium citrate	451.113	A laxative used in bowel preparation for colonoscopy or as a magnesium supplement.	Magnesium Compounds
Magnesium gluconate	450.629	A mineral supplement used to treat or prevent hypomagnesemia.	Magnesium Compounds
Magnesium glycinate	172.423	Magnesium glycinate is a magnesium salt of glycine that is available as dietary supplements as a source of magnesium. It is used in the treatment of magnesium deficiency.	Laxatives
Magnesium hydroxide	58.32	An inorganic compound used as a laxative and antacid.	Magnesium Compounds
Magnesium malate	156.376	Not Annotated	\N
Magnesium oxide	40.304	A compound commonly used as a laxative for the symptomatic relief of acid indigestion and upset stomach, and in health supplements for cardiovascular and neuromuscular health.	Magnesium Compounds
Magnesium silicate	100.387	Magnesium silicate is used to absorb moisture, prevent caking, and to improve the feel of a product. In the pharmaceutical companies, it is used as a dietary supplement, as part...	Magnesium Compounds
Magnesium sulfate	120.368	A drug used to treat convulsions during pregnancy, nephritis in children, magnesium deficiency, and tetany.	Electrolyte Solutions
Magnesium trisilicate	260.857	An antacid used for the symptomatic treatment of peptic ulcers.	Antacids
Malathion	330.358	A parasympathomimetic organophosphate used to treat head lice.	Cholinesterase Inhibitors
Mandelic acid	152.149	Mandelic acid is an approved aromatic, alpha hydroxy acid . Mandelic acid is used as an ingredient in cosmetics and drug products applied topically.	Anti-Infective Agents
Mangafodipir	691.382	An organ-specific paramagnetic contrast agent indicated for the imaging of the hepatobiliary system and detecting lesions in the liver and pancreas.	Paramagnetic Contrast Media
Manganese	54.938	A transition metal used for supplementation of manganese during Total Parenteral Nutrition (TPN).	Metals, Heavy
Manganese citrate	543.012	Not Annotated	\N
Manganese gluconate	445.232	An ingredient found in a variety of supplements and vitamins.	Acids, Acyclic
Manidipine	610.711	A dihydropyridine calcium channel blocker used to treat hypertension.	ACE Inhibitors and Calcium Channel Blockers
Mannitol	182.1718	A sugar alcohol used to test for asthma, to reduce intracranial and intraocular pressure, to measure glomerular filtration rate, and to manage pulmonary symptoms associated with cystic fibrosis.	Expectorants
Mannitol busulfan	338.34	Mm has been used in trials studying the treatment of Cocaine Dependence and Diabetes Mellitus, Type 2.	Agents causing hyperkalemia
Maprotiline	277.4033	A tetracyclic antidepressant used to treat depressive illness, major depressive disorder, bipolar disorder, and anxiety associated with depression.	Non-Selective Monoamine Reuptake Inhibitors
Maralixibat	674.96	An ileal bile acid transporter inhibitor indicated to treat cholestatic pruritus in patients with Alagille syndrome.	Ileal Bile Acid Transporter Inhibitor
Maraviroc	513.6655	A CCR5 co-receptor antagonist used with other antiretroviral medications to treat CCR5-tropic HIV-1 infection.	CCR5 Co-receptor Antagonist
Maribavir	376.23	A cytomegalovirus (CMV) pUL97 kinase inhibitor used for the treatment of refractory post-transplant CMV infection.	Antiviral Agents
Masoprocol	302.3649	Used for the treatment of actinic keratoses (precancerous skin growths that can become malignant if left untreated).	Antioxidants
Mavacamten	273.336	A myosin inhibitor used to treat obstructive hypertrophic cardiomyopathy.	Amines
Mazindol	284.74	A sympathomimetic used to treat obesity in combination with lifestyle modifications.	Centrally Acting Antiobesity Products
Mebendazole	295.2927	A benzimidazole anthelmintic used to treat helminth infections.	Benzimidazole Derivatives
Mebeverine	429.557	An antispasmodic used for the symptomatic treatment of stomach pain and spasms associated with irritable bowel syndrome and other gastrointestinal illnesses.	Synthetic Anticholinergics, Esters With Tertiary Amino Group
Mebrofenin	387.23	Not Annotated	Amines
Mebutamate	232.2768	Mebutamate is a sedative and anxiolytic drug with anti-hypertensive (blood pressure lowering) effects comparable to those of other barbiturates but is only around 1/3rd the potency of secobarbital as a...	Carbamates
Mecamylamine	167.2911	A nicotine antagonist used to treat moderate to severe essential hypertension and uncomplicated malignant hypertension.	Secondary and Tertiary Amines
Mechlorethamine	156.054	An antineoplastic agent used to treat Hodgkin's disease, lymphosarcoma, and chronic myelocytic or lymphocytic leukemia.	Nitrogen Mustard Analogues
Meclizine	390.948	A histamine H1 antagonist used to treat nausea, vomiting, and dizziness associated with motion sickness.	Piperazine Derivatives
Meclofenamic acid	296.149	An NSAID used to treat mild to moderate pain, primary dysmenorrhea, heavy menstrual blood loss, rheumatoid arthritis, and osteoarthritis.	Antiinflammatory Preparations, Non-Steroids for Topical Use
Mecobalamin	1344.3823	Not Available	Vitamin B Complex
Medical air	0	A mixture of gases that is primarily composed of nitrogen and oxygen used for respiratory support in a variety of conditions.	Medical Gases
Medifoxamine	257.333	Medifoxamine was marketed as an atypical antidepressant, with anxiolyitc properties in France, Spain, and Morrocco in the 1990s but was later withdrawn from the market due to it causing cases...	Amines
Medium-chain triglycerides	0	A source of essential fatty acids used as a source of calories in parenteral nutrition.	Lipids
Medrogestone	340.507	A progestin used as an adjunct to control secondary amenorrhea and dysfunctional bleeding in adolescent and adult females, and treat endometrial shedding in menopausal women.	Pregnadien Derivatives
Medronic acid	176.0023	Not Annotated	\N
Medroxyprogesterone acetate	386.5244	A progestin used as a contraceptive and in the treatment of secondary amenorrhea, abnormal uterine bleeding, pain from endometriosis, endometrial and renal carcinomas, paraphilia in males, and GnRH-dependent precocious puberty.	Pregnen (4) Derivatives
Medrysone	344.4877	A topical glucocorticoid applied ophthalmically for the treatment of various ocular inflammatory or allergic conditions.	Corticosteroids
Mefenamic acid	241.2851	An NSAID used to treat mild to moderate pain for no more than a week, and primary dysmenorrhea.	Fenamates
Mefloquine	378.3122	An antimalarial agent used in the prophylaxis and treatment of malaria caused by Plasmodium falciparum and Plasmodium vivax.	Antimalarial methanolquinolines
Megestrol acetate	384.516	A progestin that is administered orally to treat anorexia and cachexia or serious unexplained weight loss and is also used as an antineoplastic agent to treat certain types of malignancy.	Pregnadien Derivatives
Meglumine	195.215	An amino sugar found in iodinated contrast media.	Contrast Media
Melatonin	232.2783	An endogenous hormone produced by the pineal gland that regulates sleep-wake cycles and when provided exogenously has beneficial effects on sleep-onset latency; available as an over-the-counter supplement.	Melatonin Receptor Agonists
Meloxicam	351.401	An NSAID used to treat osteoarthritis in adults, rheumatoid arthritis in adults, and juvenile rheumatoid arthritis in pediatrics.	Amides
Melphalan	305.2	An alkylating antineoplastic agent used for high-dose conditioning prior to hematopoietic stem cell transplant in patients with multiple myeloma.	Nitrogen Mustard Analogues
Melphalan flufenamide	498.42	A melphalan prodrug used to treat relapsed or refractory multiple myeloma.	Nitrogen Mustard Analogues
Menadione	172.18	The primary known function of vitamin K is to assist in the normal clotting of blood, but it may also play a role in normal bone calcification.	Vitamin K
Menthol	156.269	Not Annotated	Antipruritics
Menthyl salicylate	276.376	For the temporary relief of pain associated with rheumatism, arthritis, neuralgia, sprains and strains of joints and muscles, lumbago and fibrositis .	Anti-Inflammatory Agents
Mepenzolate	340.436	A postganglionic parasympathetic inhibitor that was previously approved for improving the healing of gastric ulcers, but has been discontinued.	Synthetic Anticholinergics, Quaternary Ammonium Compounds
Meperidine	247.3327	An opioid agonist with analgesic and sedative properties used to manage severe pain.	Phenylpiperidine opioids
Mephenesin	182.219	A cresol glyceryl ether used to treat muscle spasticity in Parkinson's and Multiple Sclerosis.	Propylene Glycols
Mephentermine	163.2594	A sympathomimetic agent used in the treatment of hypotension.	Adrenergic and Dopaminergic Agents
Mephenytoin	218.2518	A phenylhydantoin used to treat refractory partial epilepsy.	Hydantoins
Mepivacaine	246.348	A local anesthetic used for local or regional analgesia or anesthesia.	Amides
Meprednisone	372.461	Not Annotated	Glucocorticoids
Meprobamate	218.2502	An anxiolytic drug used for the short-term management of anxiety symptoms.	Carbamates
Mepyramine	285.384	An antihistamine agent used for the symptomatic treatment of allergy, hypersensitivity reactions, and pruritic skin disorders.	Antihistamines for Topical Use
Mequinol	124.1372	A topical agent used in combination with tretinoin to treat solar lentigines.	Antioxidants
Meradimate	275.392	An ingredient used in sunscreens to absorb UV radiation.	Acids, Carbocyclic
Mercaptopurine	152.177	An antineoplastic agent used to treat acute lymphocytic leukemia.	Purine Analogues
Meropenem	383.463	A carbapenem antibiotic used to treat a wide variety of infections in the body.	Anti-Bacterial Agents
Mesalazine	153.1354	An aminosalicylate drug used to treat mild to moderate active ulcerative colitis and also to maintain remission once achieved.	Salicylates
Mesoridazine	386.574	A phenothiazine antipsychotic used to treat schizophrenia, organic brain disorders, alcoholism, and psychoneuroses.	Phenothiazines With Piperidine Structure
Mestranol	310.4299	A synthetic estradiol found in oral contraceptive pills for contraception and the treatment of other conditions in the female reproductive system, such as dysmenorrhea and dysfunctional uterine bleeding.	Contraceptives, Oral, Hormonal
Metacycline	442.424	For the treatment of acute bacterial exacerbations of chronic bronchitis	Tetracyclines
Metamfetamine	149.2328	A sympathomimetic agent used in the treatment of attention deficit hyperactivity disorder (ADHD) and exogenous obesity.	Centrally Acting Sympathomimetics
Metamizole	311.36	An antipyretic and analgesic drug used to relieve severe and persistent fever and pain.	Pyrazolones
Metaraminol	167.205	For the treatment and prevention of hypotension due to hemorrhage, spinal anesthesia, and shock associated with brain damage	Adrenergic and Dopaminergic Agents
Metaxalone	221.2524	A muscle relaxant used to treat muscle pain or spasm.	Central Nervous System Depressants
Metergoline	403.526	An ergot-derivative that acts as an antagonist at certain 5-HT receptor subtypes and as an agonist at dopamine receptors. It is often used in situations where inhibition of prolactin is desirable.	Prolactine Inhibitors
Metformin	129.1636	A biguanide antihyperglycemic used in conjunction with diet and exercise for glycemic control in type 2 diabetes mellitus. It is also used off-label for insulin resistance in polycystic ovary syndrome (PCOS).	Biguanides
Methacholine	160.234	A parasympathomimetic bronchoconstrictor used to diagnose bronchial hyperreactivity in subjects who do not have clinically apparent asthma.	Bronchoconstrictor Agents
Methadone	309.4452	An opioid analgesic indicated for management of severe pain that is not responsive to alternative treatments. Also used to aid in detoxification and maintenance treatment of opioid addiction.	Diphenylpropylamine Derivatives
Methantheline	340.436	For the treatment of peptic ulcer disease, irritable bowel syndrome, pancreatitis, gastritis, biliary dyskinesia, pylorosplasm, and reflex neurogenic bladder in children.	Synthetic Anticholinergics, Quaternary Ammonium Compounds
Methazolamide	236.26	A carbonic anhydrase inhibitor used to treat open angle glaucoma and acute angle closure glaucoma.	Sulfonamides
Methdilazine	296.43	Used for the symptomatic relief of hypersensitivity reactions and particularly for the control of pruritic skin disorders	Phenothiazine Derivatives
Methenamine	140.1863	A urinary tract antiseptic and antibacterial drug used for the prophylaxis and treatment of frequently recurring urinary tract infections requiring a long-term therapy.	Anti-Bacterial Agents
Methimazole	114.169	A thionamide antithyroid agent that inhibits the actions of thyroid peroxidase, leading to a reduction in thyroid hormone synthesis and amelioration of hyperthyroidism.	Sulfur-Containing Imidazole Derivatives
Methionine	149.211	An amino acid commonly found as a component in total parenteral nutrition.	Antidotes
Methocarbamol	241.2405	A CNS depressant indicated with rest, physical therapy and other treatments to control the discomfort associated with various acute musculoskeletal conditions.	Carbamic Acid Esters
Methohexital	262.3043	An anesthetic used to induce deep sedation.	Barbiturates, Plain
Methotrexate	454.4393	An antineoplastic agent used the treatment of a wide variety of cancers as well as severe psoriasis, severe rheumatoid arthritis, and juvenile rheumatoid arthritis.	Folic Acid Analogues
Methotrimeprazine	328.472	A phenothiazine used in the management of psychosis, particular those of schizophrenia, and manic phases of bipolar disorder.	Phenothiazines With Aliphatic Side-Chain
Methoxamine	211.2576	An alpha adrenergic agonist used to treat hypotension.	Adrenergic and Dopaminergic Agents
Methoxsalen	216.192	A furocoumarin used to treat psoriasis and vitiligo.	Psoralens for Systemic Use
Methoxyflurane	164.966	For use in the induction and maintenance of general anesthesia	Agents that produce hypertension
Methoxyphenamine	179.2588	Not Annotated	Non-selective Beta-adrenergic Agonists
Methscopolamine	318.392	Methscopolamine is a quaternary ammonium derivative of scopolamine and antagonist at muscarininc (mACh) receptors. Methscopolamine bromide is the most common form of the active ingredient in oral pharmaceutical products. The...	Belladonna Alkaloids, Semisynthetic, Quaternary Ammonium Compounds
Methscopolamine bromide	398.297	A muscarinic antagonist used to treat peptic ulcers, nausea, vomiting, and motion sickness.	Agents producing tachycardia
Methsuximide	203.2371	A succinimide anticonvulsant that increases the seizure threshold. Primarily used for childhood absence seizures. Functions by suppressing paroxysmal spike-and-wave patterns associated with lapses of consciousness in absence seizures.	Succinimide Derivatives
Methyl aminolevulinate	145.1564	A porphyrin precursor used to treat non-hyperkeratotic, non-pigmented actinic keratosis of the face and scalp.	Sensitizers Used in Photodynamic/radiation Therapy
Methyl nicotinate	137.136	A methyl ester of niacin used to treat muscle and joint pain.	Anti-Inflammatory Agents
Methyl salicylate	152.1473	A topical counter-irritant used for the symptomatic relief of acute musculoskeletal pain in the muscles, joints, and tendons.	Antirheumatic Agents
Methylcellulose	0	A compound used as a bulk forming laxative and is not an approved medication.	Bulk-Forming Laxatives
Methylchloroisothiazolinone	149.59	Methylchloroisothiazolinone is approved for use within allergenic epicutaneous patch tests which are indicated for use as an aid in the diagnosis of allergic contact dermatitis (ACD) in persons 6 years...	Anti-Infective Agents
Methyldopa	211.2145	A centrally-acting alpha-2 adrenergic agonist used to manage hypertension alone or in combination with hydrochlorothiazide, and to treat hypertensive crises.	Adrenergic alpha-2 Receptor Agonists
Methylene blue	319.85	An oxidation-reduction agent used for the treatment of pediatric and adult patients with acquired methemoglobinemia.	Tests for Gastric Secretion
Methylergometrine	339.4314	An ergot alkaloid used to prevent and control uterine atony and hemorrhage before and after delivery.	Agents that produce hypertension
Methylnaltrexone	356.441	A μ-opioid antagonist used for the treatment of opioid-induced constipation in palliative patients that are inadequately responding to laxative therapy.	Peripheral Opioid Receptor Antagonists
Methylparaben	152.1473	Methylparaben is used in allergenic testing.	Preservatives, Pharmaceutical
Methylphenidate	233.3062	A stimulant used in the management of Attention Deficit Hyperactivity Disorder (ADHD).	Centrally Acting Sympathomimetics
Methylphenobarbital	246.2619	For the relief of anxiety, tension, and apprehension, also used as an anticonvulsant for the treatment of epilepsy.	Barbiturates and Derivatives
Methylprednisolone	374.4706	A corticosteroid used to treat inflammation or immune reactions across a variety of organ systems, endocrine conditions, and neoplastic diseases.	Corticosteroids, Weak (Group I)
Methylprednisolone aceponate	472.578	A corticosteroid indicated in the treatment of corticosteroid-responsive dermatoses.	Corticosteroids, Potent (Group III)
Methylprednisolone hemisuccinate	474.55	A water soluble corticosteroid used to treat severe allergic reactions, dermatologic diseases, endocrine disorders, gastrointestinal diseases, hematological disorders, neoplastic diseases, nervous system conditions, ophthalmic diseases, renal diseases, respiratory diseases, and rheumatic disorders.	Anti-Inflammatory Agents
Methylprednisone	372.461	Methylprednisone has been used in trials studying the treatment of Leukemia, Rheumatoid Arthritis, Renal Transplantation, Kidney Transplantation, and Acute Lymphocytic Leukemia, among others.	Cytochrome P-450 CYP3A Substrates
Methyltestosterone	302.451	A synthetic anabolic steroid used for the replacement therapy in conditions associated with testosterone deficiencies in males, such as hypogonadism, and treatment of advancing inoperable metastatic breast cancer in females.	3-Oxoandrosten (4) Derivatives
Methyprylon	183.2475	For the treatment of insomnia.	Piperidinedione Derivatives
Methysergide	353.458	An ergot alkaloid used for the prophylaxis of migraine and cluster headaches.	Ergot Alkaloids and Derivatives
Meticillin	380.415	Used to treat infections caused by susceptible Gram-positive bacteria, particularly beta-lactamase-producing organisms such as Staphylococcus aureus that would otherwise be resistant to most penicillins.	Beta-Lactamase Resistant Penicillins
Meticrane	275.34	Meticrane is a diuretic medication. It has been marketed in Japan under the trade name Arresten and is used to lower blood pressure .	Sulfonamides
Metipranolol	309.4006	A beta-adrenergic antagonist used for the reduction of elevated intraocular pressure in patients with ocular hypertension or open-angle glaucoma.	Beta Blocking Agents, Non-Selective, and Thiazides
Metixene	309.468	Used for the symptomatic treatment of parkinsonism.	Tertiary Amines
Metoclopramide	299.796	An antiemetic agent and dopamine D2 antagonist used in the treatment of gastroesophageal reflux disease, prevention of nausea and vomiting, and to stimulate gastric emptying.	Propulsives
Metocurine	652.8189	Metocurine is a muscle relaxant.	Curare Alkaloids
Metocurine iodide	906.6279	For use as an anesthesia adjunct to induce skeletal muscle relaxation and to reduce the intensity of muscle contractions in convulsive therapy.	Neuromuscular-Blocking Agents (Nondepolarizing)
Metolazone	365.835	A thiazide-like diuretic used to treat hypertension.	Low-Ceiling Diuretics and Potassium-Sparing Agents
Metoprolol	267.3639	A beta-blocker used in the treatment of hypertension and angina, and used to reduce mortality due to myocardial infarction.	Antihypertensive Agents
Metrizoic acid	627.943	For use as a contrast medium .	Watersoluble, Nephrotropic, High Osmolar X-Ray Contrast Media
Metronidazole	171.154	A nitroimidazole used to treat trichomoniasis, amebiasis, inflammatory lesions of rosacea, and bacterial infections, as well as prevent postoperative infections.	Antiinfectives and Antiseptics for Local Oral Treatment
Metyrapone	226.2738	A steroid 11-beta-monooxygenase inhibitor used to test hypothalamic-pituitary ACTH function.	Tests for Pituitary Function
Metyrosine	195.2151	A tyrosine 3-monooxygenase inhibitor used to treat excessive sympathetic stimulation in pheochromocytoma.	Tyrosine Hydroxylase Inhibitors
Mexiletine	179.2588	A class 1B antiarrhythmic agent used in the treatment of documented ventricular arrhythmias that warrant treatment.	Antiarrhythmic agents
Mezlocillin	539.582	Used to treat serious gram–negative infections of the lungs, urinary tract, and skin.	Penicillins With Extended Spectrum
Mianserin	264.3648	A tetracyclic antidepressant with therapeutic activity similar to amitriptyline used to treat depression and anxiety.	Agents that produce hypertension
Micafungin	1270.274	An antifungal agent used for the treatment of candidemia, acute disseminated candidiasis, and certain other invasive Candida infections, and for the prophylaxis of Candida infections during stem cell transplantation.	Antifungal Agents
Miconazole	416.129	An azole antifungal with broad-spectrum activity used to treat fungal infections affecting the vagina, mouth and skin, including candidiasis.	Antiinfectives and Antiseptics for Local Oral Treatment
Microcrystalline cellulose	0	A polysaccharide with glucose units linked as in CELLOBIOSE. It is the chief constituent of plant fibers, cotton being the purest natural form of the substance. As a raw material,...	Biopolymers
Micronomicin	463.576	Micronomicin is an aminoglycoside antibiotic which is marketed in Japan, and sold under the brand names Sagamicin and Luxomicina.	Anti-Bacterial Agents
Midazolam	325.767	A short-acting benzodiazepine with rapid onset that is commonly used in seizures, anesthesia and anxiety disorders.	Adjuvants, Anesthesia
Midodrine	254.2823	An alpha-adrenergic agonist used to treat orthostatic hypotension.	Adrenergic and Dopaminergic Agents
Midostaurin	570.649	An antineoplastic agent used to treat high-risk acute myeloid leukemia (AML) with specific mutations, aggressive systemic mastocytosis (ASM), systemic mastocytosis with associated hematologic neoplasm (SM-AHN), or mast cell leukemia (MCL).	Protein Kinase Inhibitors
Mifamurtide	1277.515	A muramyl dipeptide derivative used to treat high grade, resectable, non-metastatic osteosarcoma after surgical resection.	Adjuvants, Immunologic
Mifepristone	429.5937	A cortisol receptor blocker used to treat Cushing's syndrome, and to terminate pregnancies up to 70 days gestation.	Progesterone Receptor Modulators
Migalastat	163.1717	An alpha-galactosidase A chaperone used for the treatment of Fabry disease in patients with an amenable galactosidase alpha gene (GLA) variant.	Various Alimentary Tract and Metabolism Products
Miglitol	207.2243	An oral alpha-glucosidase inhibitor used to improve glycemic control by delaying the digestion of carbohydrates.	Enzyme Inhibitors
Miglustat	219.278	A glucosylceramide synthase inhibitor used for the management of mild to moderate type I Gaucher disease for patients who are not candidates for whole enzyme replacement.	Various Alimentary Tract and Metabolism Products
Milnacipran	246.354	A selective serotonin and norepinephrine reuptake inhibitor (SNRI) used for the treatment of fibromyalgia and a short-term treatment of major depressive disorder.	Agents producing tachycardia
Milrinone	211.2194	A PDE-III inhibitor with inotropic, lusitropic, and vasodilatory properties used for the short-term treatment of acute decompensated heart failure.	Cardiotonic Agents
Miltefosine	407.576	An antileishmanial agent used to treat leishmaniasis, a group of disease caused by parasites of the Leishmania type.	Antineoplastic Agents
Minaprine	298.3828	For the treatment of depression	Agents that produce hypertension
Mineral oil	0	Mineral oil is not considered an active pharmacological ingredient in pharmaceutical preparations and so has no official indication. It is typically present in topical formulations as an emollient and occlusive...	Softeners, Emollients
Minocycline	457.4764	A tetracycline analog used to treat a wide variety of infections in the body.	Antiinfectives and Antiseptics for Local Oral Treatment
Minoxidil	209.2483	An antihypertensive vasodilating agent used for resistant hypertension that is symptomatic or has caused end organ damage.	Pyrimidine Derivatives
Mirabegron	396.506	A beta-3 adrenergic agonist used to treat overactive bladder and neurogenic detrusor overactivity.	Drugs for Urinary Frequency and Incontinence
Mirtazapine	265.3529	A tetracyclic antidepressant used in the treatment of major depression and is used off-label as a drug for insomnia and to increase appetite.	Agents that produce hypertension
Misoprostol	382.5341	A prostaglandin E1 analogue used to reduce the risk of NSAID-induced gastric ulcers and to terminate pregnancies.	Propionates
Mitapivat	450.56	A pyruvate kinase activator used to treat hemolytic anemia in adults with pyruvate kinase (PK) deficiency.	Sulfonamides
Mitomycin	334.3272	An antimetabolite used as an adjunct to ab externo (outside approach) eye surgeries for the treatment of glaucoma and used as a chemotherapeutic agent for various malignancies.	Alkylating Drugs
Mitotane	320.041	An adrenal cortex inhibitor used to treat adrenocortical tumors and Cushing's syndrome.	Antineoplastic Agents, Hormonal
Mitoxantrone	444.4809	A chemotherapeutic agent used for the treatment of secondary progressive, progressive relapsing, or worsening relapsing-remitting multiple sclerosis.	Anthracyclines and Related Substances
Mivacurium	1029.2607	A short-acting non-depolarizing neuromuscular blocking agent used to induce anesthesia during intubation and promote skeletal muscle relaxation during surgery or mechanical ventilation.	Agents producing tachycardia
Mizolastine	432.503	A second-generation non-sedating antihistamine used to treat symptoms of allergic rhinoconjunctivitis and urticaria.	Histamine H1 Antagonists, Non-Sedating
Mobocertinib	585.709	An oral kinase inhibitor targeted against EGFR and used in the treatment of NSCLC with EGFR exon 20 insertion mutations.	Epidermal growth factor receptor (EGFR) tyrosine kinase inhibitors
Moclobemide	268.739	A monoamine oxidase inhibitor used in the treatment of major depressive disorder and bipolar disorder.	Monoamine Oxidase A Inhibitors
Modafinil	273.35	A stimulant used to improve wakefulness in patients with sleep apnea, narcolepsy, or shift work disorder.	Centrally Acting Sympathomimetics
Moexipril	498.5681	An angiotensin converting enzyme inhibitor prodrug used to treat hypertension.	ACE Inhibitors and Diuretics
Molindone	276.374	An antipsychotic used to treat schizophrenia.	Indole Derivatives
Molsidomine	242.235	A long-acting vasodilator used to treat angina pectoris, including in association with left heart failure and acute myocardial infarction.	Morpholines
Molybdenum	95.94	An ingredient found in a variety of supplements and vitamins.	Metals, Heavy
Mometasone furoate	521.429	A corticosteroid used to treat asthma, allergic rhinitis, nasal congestion, nasal polyps, dermatitis, and pruritus.	Corticosteroids, Potent (Group III)
Monobenzone	200.2332	A hydroquinone derivative used to treat vitiligo.	Depigmenting Agents
Monomethyl fumarate	130.099	Not Annotated	Acids, Acyclic
Monopotassium phosphate	136.0855	An ionic compound used for electrolyte replenishment and total parenteral nutrition (TPN) therapy.	Buffers
Montelukast	586.183	A leukotriene receptor antagonist used as part of an asthma therapy regimen, to prevent exercise induced bronchoconstriction, and to treat seasonal allergic rhinitis.	Anti-Asthmatic Agents
Moricizine	427.517	An antiarrhythmic used to treat arrhythmias.	Neurotoxic agents
Morphine	285.3377	An opioid agonist used for the relief of moderate to severe acute and chronic pain.	Natural Opium Alkaloids
Morpholinylmercaptobenzothiazole	252.35	Not Annotated	Standardized Chemical Allergen
Moxidectin	639.83	Moxidectin is indicated for the treatment of river blindness, also called onchocerciasis, in patients aged 12 years and older. River blindness is caused by a parasitic worm Onchocerca volvulus and...	Insecticides
Moxifloxacin	401.4314	A fluoroquinolone antibiotic used to treat various bacterial infections.	Fluoroquinolones
Moxisylyte	279.38	By the WHO, moxisylyte is indicated for the symptomatic management of sequelae of cerebral infarction or hemorrhage. The cerebral infarction is characterized by the blockage of the artery either by...	Drugs Used in Erectile Dysfunction
Moxonidine	241.677	An imidazoline/α-2 receptor agonist used to treat hypertension, especially in cases where ACE inhibitors, β-blockers, calcium channel blockers, and thiazides are not appropriate or provide inadequate blood pressure control.	Imidazoline Receptor Agonists
Mupirocin	500.6222	An antibacterial ointment used to treat impetigo and secondary skin infections caused by Staphylococcus aureus and Streptococcus pyogenes.	Anti-Bacterial Agents
Muzolimine	272.13	Not Annotated	Pyrazolone Derivatives
Mycophenolate mofetil	433.4947	An inosine monophosphate dehydrogenase inhibitor used to prevent the rejection of kidney, heart, or liver transplants.	Antibiotics, Antineoplastic
Mycophenolic acid	320.3371	An immunosuppressant used to prevent organ transplant rejections.	Selective Immunosuppressants
Myrrh	0	FDA approved only for use in food. Historically used for indigestion, ulcers, colds, cough, asthma, bronchial congestion, arthritic pain, cancer, leprosy, and syphilis. It is also used orally as a...	Commiphora
N-Acetylglucosamine	221.2078	For the treatment and prevention of osteoarthritis, by itself or in combination with chondroitin sulfate.	Amino Sugars
N-acetyltyrosine	223.2252	An amino acid used in total parenteral nutrition.	Amino Acids
N-alkyl ethylbenzyl dimethyl ammonium (C12-C14)	0	N-alkyl C12-C14 dimethyl ethylbenzyl ammonium chloride is added to products to function as a cleaning agent, or as antimicrobial agents in disinfecting cleaning products .	\N
N-Cyclohexyl-N'-phenyl-1,4-phenylenediamine	266.388	N-Cyclohexyl-N'-phenyl-1,4-phenylenediamine is approved for use within allergenic epicutaneous patch tests which are indicated for use as an aid in the diagnosis of allergic contact dermatitis (ACD) in persons 6 years...	Standardized Chemical Allergen
N,N'-diphenyl-1,4-phenylenediamine	0	Not Annotated	Antioxidants
Nabilone	372.5408	A synthetic delta-9-THC used in the treatment of anorexia and weight loss in HIV patients as well as nausea and vomiting in cancer chemotherapy.	Agents producing tachycardia
Nabumetone	228.2863	An NSAID used to treat osteoarthritis and rheumatoid arthritis.	Agents that produce hypertension
NADH	665.441	A nutrient used in some supplement products.	Adenine Nucleotides
Nadolol	309.4006	A non-selective beta-adrenergic antagonist used for the management of arrhythmias, angina pectoris, and hypertension.	Beta Blocking Agents, Non-Selective
Nadroparin	0	A low molecular weight heparin used for the prophylaxis of thrombotic events and deep vein thrombosis, and prevent unstable angina and non-Q-wave myocardial infarction.	Anticoagulants
Nafarelin	1322.496	A gonadotropin releasing hormone agonist used to treat central precocious puberty.	Gonadotropin-releasing hormone agonist
Nafcillin	414.475	A penicillin derivative antibiotic used to treat susceptible staphylococcal infections.	Beta-Lactamase Resistant Penicillins
Naftazone	215.212	A naphthoquinone derivative indicated in the treatment of varicose veins, hemorrhoids, and superficial thrombophlebitis.	Hemostatics
Naftifine	287.3981	An antifungal agent used to treat infections of the Tinea, Trichophyton, and Epidermophyton species.	Allylamine Antifungal
Nalbuphine	357.4434	An opioid agonist-antagonist used to treat pain, for pre and postoperative analgesia, and for analgesia in labor and delivery.	Morphinan Derivatives
Naldemedine	570.646	An opioid antagonist used to to treat opioid-induced constipation.	Peripheral Opioid Receptor Antagonists
Nalidixic acid	232.2353	A quinolone antibiotic used to treat urinary tract infections.	4-Quinolones
Nalmefene	339.435	An opioid antagonist used to reduce alcohol consumption in adults with alcohol dependence and treat and prevent opioid overdose.	Drugs Used in Alcohol Dependence
Naloxegol	651.794	A peripherally-selective opioid antagonist used to treat opioid-induced constipation (OIC) in adult patients with chronic non-cancer pain.	Peripheral Opioid Receptor Antagonists
Naloxone	327.3743	An opioid receptor antagonist used to rapidly reverse an opioid overdose. Also included in some drug formulations as an abuse deterrent to prevent injection.	Antidotes
Naltrexone	341.4009	A narcotic antagonist used in opioid overdose.	Centrally Acting Antiobesity Products
Nandrolone decanoate	428.6472	An anabolic steroid indicated for the management of the anemia of renal insufficiency by increasing hemoglobin and red cell mass.	Anabolic Agents
Nandrolone phenpropionate	406.5571	For the treatment of refractory deficient red cell production anemias, breast carcinoma, hereditary angioedema, antithrombin III deficiency, fibrinogen excess, growth failure and Turner's syndrome. It is also indicated in the...	Anabolic Agents
Naphazoline	210.2744	A sympathomimetic vasoconstrictor used for the symptomatic relief of redness and itching of the eye, and nasal congestion.	Sympathomimetics Used as Decongestants
Naproxen	230.2592	An NSAID used to treat rheumatoid arthritis, osteoarthritis, ankylosing spondylitis, polyarticular juvenile idiopathic arthritis, tendinitis, bursitis, acute gout, primary dysmenorrhea, and mild to moderate pain.	Antiinflammatory Preparations, Non-Steroids for Topical Use
Naratriptan	335.464	A 5-HT1B/1D receptor agonist used to treat migraines.	Selective Serotonin 5-HT1 Receptor Agonists
Natamycin	665.733	A macrolide antifungal used to treat fungal infections of the eye.	Anti-Bacterial Agents
Nateglinide	317.429	A meglitinide used to treat non insulin dependent diabetes mellitus.	Cyclohexanes
NBI-98782	0	Not Annotated	\N
Nebivolol	405.435	A beta blocking agent used to treat hypertension and aid in the management of heart failure.	Antihypertensive Agents
Nedaplatin	303.181	Used in the treatment of non-small cell lung cancer, small cell lung cancer, oesophygeal cancer, and head and neck cancers .	Antineoplastic Agents
Nedocromil	371.3408	A pyrano quinoline used to treat allergic conjunctivitis.	Antiallergic Agents, Excl. Corticosteroids
Nefazodone	470.007	An antidepressant used in the treatment of depression.	Agents that produce hypertension
Nefopam	253.345	A non-opioid analgesic used for moderate to severe pain, especially post-surgical pain.	Analgesics
Nelarabine	297.2673	A purine nucleoside analog and antineoplastic agent used for the treatment of with acute T-cell lymphoblastic leukemia and T-cell lymphoblastic lymphoma with inadequate clinical response to prior chemotherapeutic treatments.	Purine Analogues
Nelfinavir	567.782	A viral protease inhibitor used in the treatment of HIV infection.	HIV Protease Inhibitors
Neomycin	0	An aminoglycoside antibiotic agent used orally and topically to treat a wide variety of infections in the body.	Antiinfectives and Antiseptics for Local Oral Treatment
Neon	20.1797	A diagnostic tracer gas used in pulmonary function tests.	Noble Gases
Neostigmine	223.2915	A cholinesterase inhibitor used in the symptomatic treatment of myasthenia gravis by improving muscle tone.	Parasympathomimetics
Nepafenac	254.2839	An ophthalmic NSAID used for the symptomatic treatment of pain and inflammation associated with cataract surgery.	Anti-Inflammatory Agents, Non-Steroidal
Neratinib	557.05	A protein kinase inhibitor used to treat breast cancer that over expresses the HER2 receptor.	Human epidermal growth factor receptor 2 (HER2) tyrosine kinase inhibitors
Netarsudil	453.542	A rho kinase inhibitor used to reduce intraocular pressure in patients with open angle glaucoma or ocular hypertension.	Prostaglandins, Synthetic
Netilmicin	475.587	An aminoglycoside used to treat a wide variety of infections in the body.	Anti-Bacterial Agents
Netupitant	578.603	An antiemetic agent used in combination with palonosetron to prevent acute and delayed vomiting and nausea caused by chemotherapy.	Substance P/Neurokinin-1 Receptor Antagonist
Nevirapine	266.2979	A non-nucleoside reverse transcriptase inhibitor used as part of a management regimen for HIV-1 virus infection.	Non-Nucleoside Reverse Transcriptase Inhibitors
Niacin	123.1094	A B vitamin used to treat hypertriglyceridemia and pellagra.	Nicotinic Acid and Derivatives
Niacinamide ascorbate	298.251	Not Available	Vitamin C and analogues
Nialamide	298.3397	Withdrawn from the Canadian, US, and UK markets in 1963 due to interactions with food products containing tyrosine.	Monoamine Oxidase Inhibitors
Nicardipine	479.525	A calcium channel blocker used for the short-term treatment of hypertension and chronic stable angina.	Dihydropyridine Derivatives
Nicergoline	484.386	An ergot derivative use for the treatment of symptoms associated with cerebrovascular abnormalities.	Ergot Alkaloids and Derivatives
Nickel sulfate	154.756	Nickel sulfate is used in allergenic testing.	Irritants
Niclosamide	327.12	An anthelmintic indicated in the treatment of beef, pork, fish, and dwarf tapeworm infections in adults and children.	Salicylic Acid Derivatives
Nicoboxil	223.272	A medication used to treat acute back pain.	Drugs that are Mainly Renally Excreted
Nicorandil	211.177	A vasodilatory drug that functions through potassium channels and intracellular cGMP concentrations commonly used to treat angina.	Antiarrhythmic agents
Nicotinamide	122.1246	An ingredient found in a variety of cosmetic products.	Vitamins
Nicotine	162.2316	A stimulatory alkaloid found in tobacco products that is often used for the relief of nicotine withdrawal symptoms and as an aid to smoking cessation.	Drugs Used in Nicotine Dependence
Nifedipine	346.3346	A dihydropyridine calcium channel blocker indicated for the management of several subtypes of angina pectoris, and hypertension.	Beta blocking agents and calcium channel blockers
Nifurtimox	287.29	An antiparasitic drug used for the treatment of Chagas disease (Trypanosoma cruzi infection).	Nitrofuran Derivatives
Nilotinib	529.5158	A kinase inhibitor used for the chronic phase treatment of Chronic Myeloid Leukemia (CML) that is Philadelphia chromosome positive and for the treatment of CML that is resistant to therapy containing imatinib.	Protein Kinase Inhibitors
Nilutamide	317.2207	An antineoplastic hormone used to treat prostate cancer.	Antiandrogens
Nilvadipine	385.3707	A calcium channel blocker used to manage arterial hypertension.	Dihydropyridine Derivatives
Nimesulide	308.31	A cyclooxygenase 2 inhibitor used to treat acute pain and primary dysmenorrhea.	Antiinflammatory Preparations, Non-Steroids for Topical Use
Nimodipine	418.4403	A calcium channel blocker used to improve neurological outcomes in patients with subarachnoid hemorrhage due to a ruptured intracranial aneurysm.	Dihydropyridine Derivatives
Nintedanib	539.6248	A triple angiokinase inhibitor indicated for the treatment of idiopathic pulmonary fibrosis, systemic sclerosis-associated interstitial lung disease, and in combination with docetaxel for non-small cell lung cancer.	Protein Kinase Inhibitors
Niraparib	320.396	A poly-ADP ribose polymerase inhibitor used to treat recurrent epithelial ovarian, fallopian tube, or primary peritoneal cancer responding to platinum based chemotherapy.	Poly (ADP-ribose) polymerase (PARP) inhibitors
Nirmatrelvir	499.535	An oral protease inhibitor with emergency use authorization for the treatment of mild-to-moderate COVID-19.	Viral Protease Inhibitors
Nisoldipine	388.4144	A calcium channel blocker used as monotherapy or combined with other drugs for the treatment of hypertension.	Dihydropyridine Derivatives
Nitazoxanide	307.282	A thiazolide anti-infective used to treat infections by protozoa, helminths, anaerobic bacteria, microaerophilic bacteria, and viruses.	Antiparasitic Agents
Nitisinone	329.2281	A hydroxyphenylpyruvate dioxygenase inhibitor used as an adjunct to dietary restrictions for the treatment of hereditary tyrosinemia type 1 (HT-1), which causes intolerance to tyrosine containing foods.	Various Alimentary Tract and Metabolism Products
Nitrazepam	281.2661	A long-acting benzodiazepine with intermediate onset commonly used to treat panic disorders, severe anxiety, insomnia, and seizures.	Anti-Anxiety Agents
Nitrendipine	360.3612	A dihydropyridine calcium channel blocker indicated in the treatment of arterial hypertension.	ACE Inhibitors and Calcium Channel Blockers
Nitric Oxide	30.0061	A vasodilating agent used in the treatment of hypoxic respiratory failure in premature neonates.	Bronchodilator Agents
Nitrite	46.0055	Nitrite is under investigation for the treatment of Heart Failure.	Anions
Nitrofural	198.1362	A topical antibacterial for the prevention and treatment of bacterial infections of the skin.	Medicated Dressings With Antiinfectives
Nitrofurantoin	238.159	An antibiotic used to treat urinary tract infections.	Nitrofuran Derivatives
Nitrogen	28.0134	A cryogenic agent used to treat various benign and malignant skin lesions.	Medical Gases
Nitroglycerin	227.0865	A nitrate vasodilator used to treat or prevent angina, heart failure, hypertension, and anal fissures.	Organic Nitrates
Nitroprusside	215.938	A direct acting vasodilator used to treat hypertension, to induce controlled hypotension to reduce postoperative bleeding, and to manage acute heart failure.	Nitroferricyanide Derivatives
Nitrous acid	47.0134	An iron binder used to reverse life-threatening acute cyanide poisoning.	Acids, Noncarboxylic
Nitrous oxide	44.0128	An inhalatory gas used as an adjunct to improve oxygenation and reduce the need for extracorporeal membrane oxygenation in certain neonates with hypoxic respiratory failure.	Agents that produce hypertension
Nizatidine	331.45	An H2 receptor antagonist used to treat GERD and a variety of ulcers.	Anti-Ulcer Agents
Nomegestrol	328.452	Nomegestrol is an ingredient in the EMA-authorised product Zoely.	Pregnadien Derivatives
Nomegestrol acetate	370.489	Nomegestrol acetate, also known as NOMAC, is a progestin used in oral contraceptives, menopausal hormone therapy, and for the treatment of gynecological disorders.	Progesterone Congeners
Nomifensine	238.3275	Nomifensine, formerly marketed as Merital capsules, was associated with an increased incidence of hemolytic anemia. The approved application holder removed Merital capsules from the market on January 23, 1986. FDA...	Dopamine Uptake Inhibitors
Nonoxynol-9	616.8235	A vaginal spermicide used for the non-hormonal contraception in conjunction with other modes of contraception.	Polyethylene Glycols
Norelgestromin	327.468	A progestin used for the prevention of pregnancy in women who elect to use a transdermal patch as a method of contraception.	Contraceptive Agents, Hormonal
Norepinephrine	169.1778	A sympathomimetic used in the control of blood pressure during various hypotensive states and as an adjunct treatment during cardiac arrest.	Adrenergic and Dopaminergic Agents
Norethisterone	298.4192	A synthetic second-generation progestin used for contraception, prevention of endometrial hyperplasia in hormone replacement therapy, and in the treatment of other hormone-mediated illnesses such as endometriosis.	Anti-Gonadotropin-Releasing Hormones
Norethynodrel	298.426	A synthetic progestational hormone with actions and uses similar to those of PROGESTERONE. It has been used in the treatment of functional uterine bleeding and endometriosis. As a contraceptive, it...	Contraceptives, Oral, Hormonal
Norfloxacin	319.3308	A broad-spectrum fluoroquinolone antibiotic with variable activity against gram-positive and gram-negative bacteria. Typically reserved for the treatment of UTIs due to accumulation in the urine.	Fluoroquinolones
Norflurane	102.032	Norflurane is under investigation in clinical trial NCT01673061 (Vapocoolant Spray for Numbing Small Boils Before Incision and Drainage).	Aerosol Propellants
Norgestimate	369.4971	A progesterone used as a contraceptive and to treat acne vulgaris.	Progestogens and Estrogens, Sequential Preparations
Norgestrel	312.453	A progestin used in combination with ethinyl estradiol for oral contraception and prevention of pregnancy in women.	Progestogens and Estrogens, Sequential Preparations
Normethadone	295.426	An opioid antitussive used to treat a cough associated with inflamed mucosa.	Opium Alkaloids and Derivatives
Nortriptyline	263.3767	A tricyclic antidepressant used in the treatment of depression.	Non-Selective Monoamine Reuptake Inhibitors
Noscapine	413.4205	A non-sedating isoquinoline alkaloid used primarily for its antitussive properties.	Opium Alkaloids and Derivatives
Novobiocin	612.6243	For the treatment of infections due to staphylococci and other susceptible organisms	Aminocoumarins
Noxytiolin	120.17	Local antibacterial that probably acts by releasing formaldehyde in aqueous solutions. It is used for THERAPEUTIC IRRIGATION of infected body cavities - bladder, peritoneum, etc. and as a spray for...	Anti-Infective Agents
Nylidrin	299.414	A vasodilator used to treat patients with peripheral vascular disorders, and elderly patients with symptoms associated with organic mental disorders.	2-Amino-1-Phenylethanol Derivatives
Nystatin	926.107	A polyene ionophore antifungal used to treat cutaneous, mucocutaneous, and gastrointestinal mycotic infections, particularly those caused by Candida species.	Antifungal Agents
Obeticholic acid	420.6252	A bile acid analog and farnesoid X receptor agonist used to treat primary biliary cholangitis in adult patients with inadequate clinical response or intolerance to UDCA.	Bile Acid Preparations
Octasulfur	256.52	An ingredient of various cosmetic preparations for its keratolytic, antifungal, and antibacterial properties.	Chalcogens
Octinoxate	290.3972	A sunscreen agent found in sunscreens that absorbs UV rays.	Protectives Against UV-Radiation for Topical Use
Octisalate	250.3334	Ingredient in sunscreens for protection against damage effects of sun light, provides protection from sunburns, aging and skin cancer.	Sunscreen Agents
Octocrylene	361.485	A sunscreen agent found in sunscreens that absorbs UV rays.	Sunscreen Agents
Odevixibat	740.93	An ileal sodium/bile acid cotransporter inhibitor indicated in the treatment of pruritus in patients with progressive familial intrahepatic cholestasis.	Ileal Bile Acid Transporter Inhibitor
Ofloxacin	361.3675	An antibacterial agent used for the treatment of bacterial infections in many parts of the body, including the respiratory tract, kidney, skin, soft tissue, and urinary tract.	Fluoroquinolones
Oftasceine	622.539	Oftasceine is also referred to as Fluorexon. It is used in ophthalmic solutions as a staining agent when fitting soft and hard lenses. It is a fluorescent dye or luminescent...	\N
Olanzapine	312.432	An antipsychotic drug used in the management of schizophrenia, bipolar 1 disorder, and agitation associated with these disorders.	Diazepines, Oxazepines, Thiazepines and Oxepines
Olaparib	434.4628	A poly (ADP-ribose) polymerase (PARP) inhibitor used to treat ovarian cancer, breast cancer, pancreatic cancer, and prostate cancer.	Poly (ADP-ribose) polymerase (PARP) inhibitors
Oleic Acid	282.4614	A naturally occurring fatty acid with antibacterial properties added to a variety of drug products.	Oleic Acids
Oliceridine	386.55	A biased opioid agonist indicated for the management of severe acute pain in adult patients. Through preferential activation of G-protein-coupled signalling pathways, oliceridine provides analgesic effect with a comparable or improved safety profile over conventional opioid agonists.	Ligands
Olmesartan	446.5016	An angiotensin receptor blocker (ARB) used in the treatment of hypertension.	Angiotensin II Antagonists and Calcium Channel Blockers
Olodaterol	386.448	A long-acting beta2-adrenergic agonist used in the management of chronic obstructive pulmonary disease (COPD), including chronic bronchitis and/or emphysema.	Agents producing tachycardia
Olopatadine	337.4122	A histamine H1 antagonist used to treat allergic conjunctivitis and rhinitis.	Antiallergic Agents, Excl. Corticosteroids
Olsalazine	302.239	An anti-inflammatory aminosalicylate used in the treatment of inflammatory bowel disease and ulcerative colitis.	Salicylates
Olutasidenib	354.79	An isocitrate dehydrogenase-1 (IDH1) inhibitor indicated for the treatment of patients with relapsed or refractory acute myeloid leukemia with a susceptible IDH1 mutation as detected by an FDA-approved test.	Antineoplastic Agents
Omacetaxine mepesuccinate	545.6213	A cephalotaxine used in the treatment of Chronic Myeloid Leukemia (CML) that is intolerant to or resistant to two or more tyrosine kinase inhibitors.	Antineoplastic Agents
Omadacycline	556.66	A tetracycline antibiotic used to treat community acquired bacterial pneumonia.	Tetracyclines
Omaveloxolone	554.723	A semisynthetic triterpenoid used to treat Friedreich’s ataxia in adults and adolescents 16 years and older.	Anti-Inflammatory Agents
Ombitasvir	894.127	A direct acting antiviral agent used in combination with other antiviral agents for the treatment of Hepatitis C Virus (HCV) infections.	Antivirals for treatment of HCV infections
Omega-3 fatty acids	0	An ingredient found in a variety of supplements and vitamins.	Liver Therapy
Omega-3-acid ethyl esters	0	A mixture of fatty acids used as an adjunct to diet to reduce triglyceride (TG) levels in adult patients with severe hypertriglyceridemia.	Fatty Acids, Omega-3
Omega-3-carboxylic acids	0	A medication used with other medications to lower triglyceride levels in adult patients with severe hypertriglyceridemia.	Fatty Acids, Omega-3
Omeprazole	345.416	A proton pump inhibitor used to treat GERD associated conditions such as heartburn and gastric acid hypersecretion, and to promote healing of tissue damage and ulcers caused by gastric acid and H. pylori infection.	2-Pyridinylmethylsulfinylbenzimidazoles
Omidenepag isopropyl	520.61	An agonist of the prostaglandin EP2 receptor indicated for the reduction of elevated intraocular pressure.	Antiglaucoma Agents
Ondansetron	293.363	A serotonin 5-HT3 receptor antagonist used to prevent nausea and vomiting in cancer chemotherapy and postoperatively.	Anti-Anxiety Agents
Opicapone	413.17	A catechol-O-methyltransferase inhibitor used as an adjunct treatment for Parkinson's Disease in adults currently receiving levodopa and a dopa decarboxylase inhibitor.	COMT Inhibitors
Opium	0	A medication used to treat moderate to severe pain.	Natural Opium Alkaloids
Orciprenaline	211.2576	A beta-2 adrenergic agonist used to treat bronchospasm, asthma, and COPD.	Non-selective Beta-adrenergic Agonists
Oritavancin	1793.101	An antibacterial agent used to treat acute bacterial skin and skin structure infections caused by susceptible Gram-positive bacteria.	Glycopeptide Antibacterials
Orlistat	495.7348	A reversible inhibitor of gastrointestinal lipases indicated for weight loss and weight maintenance.	Peripherally Acting Antiobesity Products
Ornithine	132.161	An amino acid commonly found as a component in total parenteral nutrition.	Liver Therapy
Orphenadrine	269.3813	A muscarinic antagonist used as an adjunct for the symptomatic relief of musculoskeletal pain and discomfort.	Ethers, Chemically Close to Antihistamines
Oseltamivir	312.4045	A neuraminidase inhibitor used in the prophylaxis and treatment of influenza.	Acetamides
Osilodrostat	227.242	An oral inhibitor of cortisol synthesis used to treat Cushing's disease by normalizing hypercortisolism.	Anticorticosteroids
Osimertinib	499.619	A tyrosine kinase inhibitor used in the treatment of certain types of non-small cell lung carcinoma.	Epidermal growth factor receptor (EGFR) tyrosine kinase inhibitors
Ospemifene	378.891	A non-hormonal estrogen receptor modulator (SERM) used to treat moderate to severe dyspareunia, a symptom of vulvar and vaginal atrophy, due to menopause.	Selective Estrogen Receptor Modulators
Oteracil	157.0843	A chemotherapy agent used in combination with tegafur, cisplatin and gimeracil to treat advanced gastric cancer.	Triazines
Oteseconazole	527.403	An azole antifungal used to prevent recurrent vulvovaginal candidiasis in females who are not of reproductive potential.	Triazole and tetrazole derivatives
Ouabain	584.6525	For the treatment of atrial fibrillation and flutter and heart failure	Strophanthus Glycosides
Oxacillin	401.436	A penicillin antibiotic used to treat a number of susceptible bacterial infections.	Beta-Lactamase Resistant Penicillins
Oxaliplatin	397.294	A platinum based chemotherapy agent used to treat carcinoma of the colon or rectum or stage III colon cancer.	Coordination Complexes
Oxamniquine	279.3348	For treatment of Schistosomiasis caused by Schistosoma mansoni	Quinoline Derivatives and Related Substances
Oxandrolone	306.4397	An androgenic hormone used to treat muscle loss from prolonged corticosteroid treatment and to treat bone pain associated with osteoporosis.	Androstan Derivatives
Oxaprozin	293.3166	An NSAID used to treat osteoarthritis, rheumatoid arthritis, and juvenile rheumatoid arthritis.	Propionates
Oxatomide	426.564	An antihistamine indicated in the treatment and prevention of allergic symptoms.	Piperazine Derivatives
Oxazepam	286.713	An intermediate-acting benzodiazepine with slow onset commonly used to treat panic disorders, severe anxiety, alcohol withdrawals, and insomnia.	Anti-Anxiety Agents
Oxcarbazepine	252.268	An anti-epileptic used in the treatment of partial-onset seizures.	Carboxamide Derivatives
Oxeladin	335.4809	Withdrawn from the Canadian, US, and UK markets in 1976 due to carcinogenicity.	Antitussive Agents
Oxetacaine	467.654	An antacid used to treat gastritis, peptic ulcer disease, heartburn, esophagitis, hiatus hernia, and anorexia.	Anesthetics, Local
Oxiconazole	429.12	A topical antifungal used to treat a variety of dermatophyte infections.	Imidazole and Triazole Derivatives
Oxidronic acid	192	Oxidronic acid is a diagnostic skeletal imaging agent used to demonstrate areas of altered osteogenesis in adult and pediatric patients.	Organophosphonates
Oxilofrine	181.235	An amphetamine used to treat a cough associated with inflamed mucosa.	Alcohols
Oxitriptan	220.2246	A naturally occurring amino acid that is used to manage post-hypoxic myoclonus.	Antidepressive Agents
Oxolamine	245.326	A medication indicated in the treatment of a cough or upper respiratory tract inflammation.	Antitussive Agents
Oxprenolol	265.348	A non-selective beta-adrenergic antagonist used to treat hypertension, angina pectoris, arrhythmias, and anxiety.	Beta Blocking Agents, Non-Selective
Oxtriphylline	283.3268	A bronchodilator used for the treatment of asthma, bronchitis, COPD, and emphysema.	Xanthine derivatives
Oxybenzone	228.2433	A sunscreen agent found in sunscreens that absorbs UV rays.	Sunscreen Agents
Oxybuprocaine	308.4158	A local anesthetic used in ophthalmology.	Anesthetics for Topical Use
Oxybutynin	357.4864	An antimuscarinic agent that reduces detrusor muscle activity, relaxing the bladder and preventing the urge to void.	Drugs for Urinary Frequency and Incontinence
Oxycodone	315.3636	An opioid used in the management of moderate to severe pain.	Natural Opium Alkaloids
Oxygen	31.9988	An essential element for human survival used in clinical conditions in which there is a lack of oxygen, such as, but not limited to, anoxia, hypoxia or dyspnea.	Medical Gases
Oxymetazoline	260.3746	An alpha-1A adrenoceptor agonist used to treat nasal congestion, allergic reactions of the eye, and facial erythema associated with rosacea.	Sympathomimetics Used as Decongestants
Oxymetholone	332.484	An anabolic steroid used for the treatment of types of anemia, such as acquired aplastic anemia, congenital aplastic anemia, myelofibrosis, and the hypoplastic anemias.	Androstan Derivatives
Oxymorphone	301.3371	An opioid analgesic used in the management of moderate-to-severe pain and for analgesic therapies.	Natural Opium Alkaloids
Oxyphenbutazone	324.3737	A nonsteroidal anti-inflammatory drug (NSAID) no longer commonly used for the symptomatic relief of musculoskeletal pain.	Anti-Inflammatory Agents, Non-Steroidal
Oxyphencyclimine	344.4479	A drug used to treat smooth muscle spasticity.	Synthetic Anticholinergics, Esters With Tertiary Amino Group
Oxyphenisatin acetate	401.418	Oxyphenisatin acetate is the pro-drug of oxyphenisatin (3,3-bis(4-hydroxyphenyl)-1H-indol-2-one). The FDA withdrew its approval for the use of oxyphenisatin acetate due to safety reasons.	Indoles
Oxyphenonium	348.4996	For the treatment of visceral spasms	Synthetic Anticholinergics, Quaternary Ammonium Compounds
Oxyquinoline	145.158	A medication used in combination with other medications to restore vaginal pH.	Antiinfectives and Antiseptics for Local Oral Treatment
Oxytetracycline	460.434	A tetracycline antibiotic used to treat a wide variety of susceptible bacterial infections.	Anti-Bacterial Agents
Ozanimod	404.47	A sphingosine 1-phosphate receptor modulator being studied to treat Multiple Sclerosis (MS) and inflammatory bowel disease (IBD).	Selective Immunosuppressants
Ozenoxacin	363.417	A quinolone antibiotic used to treat impetigo caused by susceptible bacteria.	Topoisomerase Inhibitors
P-nitrobiphenyl	199.209	Pnb has been used in trials studying the treatment of Pelvic Organ Prolapse.	\N
p-Phenylenediamine	108.144	Not Annotated	Antigens, Bacterial
p-tert-Butylphenol-formaldehyde resin (low molecular weight)	0	P-Tert-Butylphenol-Formaldehyde Resin (Low Molecular Weight) is approved for use within allergenic epicutaneous patch tests which are indicated for use as an aid in the diagnosis of allergic contact dermatitis (ACD)...	Standardized Chemical Allergen
Paclitaxel	853.9061	A taxoid chemotherapeutic agent used as first-line and subsequent therapy for the treatment of advanced carcinoma of the ovary, and other various cancers including breast and lung cancer.	Taxoids
Pacritinib	472.589	A kinase inhibitor used for the treatment of primary and secondary myelofibrosis in adult patients with significantly reduced platelet counts.	Janus-associated kinase (JAK) inhibitors
Padeliporfin	840.26	A vascular-acting photosensitizer used to treat low-risk prostate cancer in adults.	Sensitizers Used in Photodynamic/radiation Therapy
Padimate O	277.408	An ingredient used in sunscreens to absorb UV radiation.	Sunscreen Agents
Pafolacianine	1326.49	An optical imaging agent indicated in adult patients with ovarian cancer as an adjunct for intraoperative identification of malignant lesions.	Molecular Probes
Palbociclib	447.5328	An endocrine-based chemotherapeutic agent used in combination with other antineoplastic agents to treat HER2-negative and HR-positive advanced or metastatic breast cancer.	Cyclin-dependent kinase (CDK) inhibitors
Paliperidone	426.4839	An atypical antipsychotic used in the treatment of schizophrenia and other schizoaffective or delusional disorders.	Agents that produce hypertension
Palmitic Acid	256.4241	A fatty used as a food additive and emollient or surfactant in cosmetics.	Enzyme Inhibitors
Palonosetron	296.414	A serotonin antagonist used in the prophylaxis or management of vomiting that results from emetogenic chemotherapy, and for the management of postoperative nausea and vomiting.	Antiemetics
Palovarotene	414.549	A selective agonist of retinoic acid receptor gamma (RARγ) used to reduce heterotopic ossification in patients with Fibrodysplasia Ossificans Progressiva (FOP).	Benzene Derivatives
Pamidronic acid	235.0695	A bisphosphonate used to treat Paget's disease, to treat hypercalcemia of malignancy, and to treat osteolytic bone lesions.	Antineoplastic Agents
Pancuronium	572.8619	A neuromuscular blocker used as an adjunct to general anesthesia to facilitate tracheal intubation and to provide skeletal muscle relaxation during surgery or mechanical ventilation.	Androstanols
Panobinostat	349.434	A non-selective histone deacetylase inhibitor used to treat multiple myeloma in combination with other antineoplastic agents.	Histone deacetylase (HDAC) inhibitors
Pantethine	554.721	A naturally occurring compound derived from panthothenic acid. It acts as an intermediate in endogenous coenzyme A synthesis and is used as a dietary supplement to treat hypertriglyceridemia.	Alimentary Tract and Metabolism
Panthenol	205.254	An ingredient used in skin, hair care, and nutritional products but is not an approved medication.	Vitamin B Complex
Pantoprazole	383.37	A proton pump inhibitor used to treat erosive esophagitis, gastric acid hypersecretion, and to promote healing of tissue damage caused by gastric acid.	2-Pyridinylmethylsulfinylbenzimidazoles
Pantothenic acid	219.235	A vitamin B5 found in various nutritional supplements.	Vitamins
Papaverine	339.385	An alkaloid used to treat many types of smooth muscle spasms such as vascular spasms associated with acute myocardial infarction and angina pectoris, as well as visceral spasms.	Drugs Used in Erectile Dysfunction
Parachlorophenol	128.556	An antibacterial agent used to prevent infections in root canals.	Anti-Infective Agents, Local
Paraldehyde	132.1577	A central nervous system depressant previously used to control convulsions due to various clinical causes, including tetanus, status epilepticus, and convulsive drugs.	Hypnotics and Sedatives
Paramethadione	157.1671	Used for the control of absence (petit mal) seizures that are refractory to treatment with other medications.	Oxazolidine Derivatives
Paramethasone acetate	434.504	Not Annotated	Fused-Ring Compounds
Parecoxib	370.422	A selective COX-2 inhibitor and NSAID used for the short-term management of perioperative pain.	COX-2 Inhibitors
Pargyline	159.2276	For the treatment of moderate to severe hypertension.	MAO Inhibitors and Diuretics
Paricalcitol	416.6365	A vitamin D analog used to treat hyperparathyroidism associated with stage 3 or greater chronic kidney disease.	Bone Density Conservation Agents
Paritaprevir	765.89	A direct acting antiviral agent used in combination with other antiviral agents for the treatment of Hepatitis C Virus (HCV) infections.	Antivirals for treatment of HCV infections
Parnaparin	0	A low molecular weight heparin (LMWH) used to prevent blood clots, specifically deep vein thrombosis.	Anticoagulants
Paromomycin	615.6285	An aminoglycoside antibiotic used in the treatment of acute and chronic intestinal amebiasis, and as an adjunct for the management of hepatic coma.	Anti-Bacterial Agents
Paroxetine	329.3654	A selective serotonin reuptake inhibitor used to treat major depressive disorder, panic disorder, OCD, social phobia, generalized anxiety disorder, the vasomotor symptoms of menopause, and premenstrual dysphoric disorder.	Agents producing tachycardia
Parthenolide	248.3175	Parthenolide has been used in trials studying the diagnostic of Allergic Contact Dermatitis.	Asteraceae
Pasireotide	1047.2062	A somatostatin analog used in the treatment of Cushing’s disease, specifically for those patients whom pituitary surgery is not appropriate.	Hormones
Patent Blue	561.69	A dye used to label lymphatic vessels, arterial territories, and lymph nodes prior to biopsy in some cancers.	Coloring Agents
Patiromer	0	A non-absorbable potassium binding polymer indicated for the treatment of hyperkalemia.	Potassium Binder
Pazopanib	437.518	An antineoplastic agent used in the treatment of advanced renal cell cancer and advanced soft tissue sarcoma in patients with prior chemotherapy.	Protein Kinase Inhibitors
PBT-434	302.16	Not Annotated	Heterocyclic Compounds, Fused-Ring
Pefloxacin	333.3574	An antibiotic used to treat a variety of bacterial infections.	Anti-Bacterial Agents
Peg-100 stearate	0	Not Annotated	Pegylated agents
Pemetrexed	427.4106	A folate analog used to treat mesothelioma and non-small cell lung cancer.	Folic Acid Analogues
Pemigatinib	487.508	A kinase inhibitor used to treat locally advanced or metastatic, unresectable cholangiocarcinoma in previously treated adult patients.	Fibroblast growth factor receptor (FGFR) tyrosine kinase inhibitors
Pemirolast	228.2101	A medication used to treat allergies such as hay fever and allergic conjunctivitis.	Mast Cell Stabilizers
Pemoline	176.172	A central nervous system (CNS) stimulant that was previously used to treat attention deficit hyperactivity disorder (ADHD) and narcolepsy.	Centrally Acting Sympathomimetics
Penbutolol	291.4284	A beta-adrenergic antagonist used for the management of mild to moderate arterial hypertension, alone or in combination with other antihypertensive agents.	Beta Blocking Agents, Non-Selective
Penciclovir	253.2578	A topical nucleoside polymerase inhibitor used in the treatment of recurrent herpes labialis.	Antiviral Agents
Penicillamine	149.211	A chelator used to treat Wilson's disease, cystinuria, and rheumatoid arthritis.	Penicillamine and Similar Agents
Pentaerythritol tetranitrate	316.1366	Used for the treatment of angina pectoris .	Organic Nitrates
Pentafluoropropane	134.049	Pentafluoropropane is under investigation in clinical trial NCT01673061 (Vapocoolant Spray for Numbing Small Boils Before Incision and Drainage).	Hydrocarbons, Fluorinated
Pentagastrin	767.9	A gastrin-like molecule used as a diagnostic aid for the evaluation of gastric acid secretory function, gastric hypersecretion, and Zollinger-Ellison tumors.	Tests for Gastric Secretion
Pentamidine	340.4195	An antifungal agent used to treat Pneumocystis pneumonia in patients infected with HIV.	Antifungal Agents
Pentastarch	0	A plasma volume expander used as an adjunct in the management of shock due to hemorrhage, surgery, sepsis, burns or other trauma.	Plasma Substitutes
Pentazocine	285.431	An analgesic used to treat moderate to severe pain.	Benzomorphan Derivatives
Pentetic acid	393.349	DTPA is widely used in industry and medicine. As a medical agent, it is approved for its use in medical imaging and for the decorporation of internally deposited radionuclides. It...	Acetates
Pentetreotide	1394.58	A somatostatin receptor inhibitor, available in a kit with Indium-111, used as a contrast agent in the visualization of somatostatin receptor-positive neuroendocrine tumours.	Radiopharmaceuticals
Pentobarbital	226.2722	A barbiturate drug used to induce sleep, cause sedation, and control certain types of seizures.	Barbiturates, Plain
Pentolinium	240.428	Used to produce controlled hypotension during surgical procedures and in hypertensive crises.	Antihypertensive Agents
Pentosan polysulfate	602.497	A sulfated pentosyl polysaccharide used to treat bladder pain and discomfort due to interstitial cystitis.	Anticoagulants
Pentostatin	268.2691	An adenosine deaminase inhibitor used to treat hairy cell leukemia.	Adenosine Deaminase Inhibitors
Pentoxifylline	278.307	A methylxanthine derivative used to treat intermittent claudication caused by chronic occlusive arterial disease of the limbs.	Purine Derivatives
Pentoxyverine	333.472	A medication used to suppress a cough in the common cold, flu, bronchitis, and sinusitis.	Antitussive Agents
Peramivir	328.4072	An intravenous antiviral agent used to treat acute uncomplicated influenza in patients aged 2 years and older who are shown to be symptomatic for no more than two days.	Antiviral Agents
Perampanel	349.393	A non-competitive AMPA glutamate receptor antagonist used to treat partial-onset seizures with or without secondarily generalized seizures, and as adjunctive treatment of primary generalized tonic-clonic seizures in patients with epilepsy.	Noncompetitive AMPA Glutamate Receptor Antagonist
Perazine	339.5	A phenothiazine antipsychotic used in the acute and chronic treatment of psychotic disorders.	Phenothiazines With Piperazine Structure
Perboric acid	59.82	In the industry, sodium perborate is used as a disinfectant. It is also part of the ingredients for detergents, bleach powders, and personal care formulations. In cosmetic products, perboric acid...	Antiinfectives and Antiseptics for Local Oral Treatment
Perflexane	338.044	Not Annotated	Ultrasound Contrast Media
Perflubutane	238.028	Perflubutane has been used in trials studying the diagnostic of Liver Mass, Liver Diseases, Liver Metastasis, Portal Hypertension, and Peripheral Artery Disease. It is a cardiovascular drug designed to enable...	Contrast Media
Perfluorohexyloctane	432.269	A drug used to treat dry eye disease.	Hydrocarbons, Fluorinated
Perflutren	188.0193	A diagnostic medication to improve contrast during echocardiograms.	Contrast Media
Pergolide	314.488	A long-acting dopamine agonist that is uncommonly used for the management of Parkinson's disease, due to the risk for cardiac valvulopathy.	Dopamine Agonists
Perhexiline	277.4879	For the management of severe angina pectoris.	Calcium Channel Blockers
Periciazine	365.492	A phenothiazine used with other medications to treat aggressiveness, impulsiveness, and hostility associated with psychiatric conditions such as schizophrenia.	Phenothiazines With Piperidine Structure
Perindopril	368.4678	An ACE inhibitor prodrug used to treat hypertension, mild to moderate congestive heart failure, and to reduce cardiovascular risk in patients with hypertension or post-myocardial infarction.	ACE Inhibitors and Calcium Channel Blockers
Permethrin	391.288	An insecticide used to prevent infestation with Sarcoptes scabiei (scabies).	Pyrethrines, Incl. Synthetic Compounds
Perphenazine	403.969	A phenothiazine used to treat schizophrenia as well as nausea and vomiting.	Phenothiazines With Piperazine Structure
Petrolatum	0	For use as an over the counter skin protectant [FDA Label]. Commonly used to treat diaper rash and chapped lips [FDA Label] .	Emollients
Pexidartinib	417.82	An antitumor agent that is used for the treatment of rare disease tenosynovial giant cell tumors (TGCT) by inhibiting colony-stimulating factor 1 and its receptor.	Amines
Phenacemide	178.1879	Used to control certain seizures in the treatment of epilepsy.	Acetamides
Phenazopyridine	213.2385	A local anesthetic used for the symptomatic relief of pain, burning, urgency, frequency, and general discomfort caused by lower urinary tract irritations that are a result of infection, trauma, surgery, endoscopic procedures, or the passage of equipment or catheters.	Aminopyridines
Phendimetrazine	191.274	A sympathomimetic amine used as adjunct therapy for the short term management of exogenous obesity.	Agents producing tachycardia
Phenelzine	136.1943	A monoamine oxidase inhibitor used to treat atypical, nonendogenous, or neurotic depression.	Monoamine Oxidase Inhibitors, Non-Selective
Pheneticillin	364.42	Pheneticillin (or phenethicillin) is a penicillin antibiotic which is approved for use internationally.	Beta-Lactamase Sensitive Penicillins
Phenformin	205.2596	For the reatment of type II diabetes mellitus.	Biguanides
Phenindamine	261.3609	Used to treat sneezing, runny nose, itching, watery eyes, hives, rashes, itching, and other symptoms of allergies and the common cold.	Histamine H1 Antagonists
Phenindione	222.2387	For the treatment of pulmonary embolism, cardiomyopathy, atrial fibrillation and flutter, cerebral embolism, mural thrombosis, and thrombophili. Also used for anticoagulant prophylaxis.	Anticoagulants
Pheniramine	240.3434	An antihistamine used to treat allergic rhinitis and pruritus.	Antihistamines for Topical Use
Phenmetrazine	177.2429	Used as an anorectic in the treatment of obesity.	Agents producing tachycardia
Phenobarbital	232.2353	A long-lasting barbiturate and anticonvulsant used in the treatment of all types of seizures, except for absent seizures.	Barbiturates and Derivatives
Phenol	94.1112	An antiseptic and disinfectant used in a variety of settings.	Phenol and Derivatives
Phenolphthalein	318.3228	A drug used for symptomatic relief of constipation and bowel cleansing prior to medical procedures.	Contact Laxatives
Phenoxybenzamine	303.826	An alpha adrenergic antagonist used to treat pheochromocytoma and episodes of hypertension and sweating.	Agents that produce hypertension
Phenoxyethanol	138.166	An antiseptic used as a hand disinfectant or preservative in medications.	Anesthetics
Phenoxymethylpenicillin	350.39	A penicillin antibiotic used to prevent and treat mild to moderately severe infections in the respiratory tract, skin, and soft tissues.	Beta-Lactamase Sensitive Penicillins
Phenprocoumon	280.3178	An anticoagulant drug used for the prevention of thrombosis.	Anticoagulants
Phensuximide	189.2105	For the treatment of epilepsy.	Succinimide Derivatives
Phentermine	149.2328	A sympathomimetic anorectic agent used as a short-term adjunct therapy that is included in a regimen of weight reduction in cases of exogenous obesity.	Centrally Acting Antiobesity Products
Phentolamine	281.3523	An alpha adrenergic antagonist used to reverse soft tissue anesthesia.	Antidotes
Phenyl aminosalicylate	229.235	Not Annotated	Acids, Carbocyclic
Phenyl salicylate	214.2167	Pain and fever .	Acids, Carbocyclic
Phenylacetic acid	136.1479	An agent used as an adjunct to treat acute hyperammonemia and associated encephalopathy in adult and pediatric patients with deficiencies in enzymes of the urea cycle.	Various Alimentary Tract and Metabolism Products
Phenylalanine	165.1891	An amino acid commonly found as a component of total parenteral nutrition.	Amino Acids, Aromatic
Phenylbutazone	308.3743	An NSAID used to treat backache and ankylosing spondylitis.	Antiinflammatory Preparations, Non-Steroids for Topical Use
Phenylbutyric acid	164.2011	An agent indicated for the adjunctive therapy for the management of chronic urea cycle disorders due to deficiencies in specific enzymes, including the neonatal-onset deficiency and late-onset disease with a history of hyperammonemic encephalopathy.	Various Alimentary Tract and Metabolism Products
Phenylephrine	167.205	An alpha-1 adrenergic agonist used in the management of hypotension, generally in the surgical setting associated with the use of anesthetics.	Adrenergic and Dopaminergic Agents
Phenylethyl resorcinol	214.264	A tyrosinase inhibitor with skin-lightening activity.	Benzene Derivatives
Phenylpropanolamine	151.209	A sympathomimetic that was previously used in nasal decongestants and weight loss products, but has been withdrawn by the FDA due to safety risks and lack of efficacy.	Sympathomimetics
Phenyltoloxamine	255.361	A medication used to treat minor aches and pains.	Benzene Derivatives
Phenytoin	252.268	An anticonvulsant drug used in the prophylaxis and control of various types of seizures.	Anti-epileptic Agent
Phloxine B	829.63	For use in dental disclosing products, allowing for highlighting of bacterial placques.	Fluoresceins
Pholcodine	398.4953	An opioid antitussive used to suppress unproductive coughing.	Opium Alkaloids and Derivatives
Phosphoric acid	97.9952	An ingredient used for electrolyte replenishment and total parenteral nutrition (TPN) therapy, and for the relief of upset stomach associated with nausea.	Acid Etching, Dental
Phosphorus	30.9738	A medication indicated in the treatment of hypophosphatemia.	Elements
Phthalylsulfathiazole	403.43	A sulfonamide antibacterial indicated in the treatment of gastrointestinal infections.	Sulfonamides
Phylloquinone	450.6957	A fat soluble vitamin used to treat hemorrhagic conditions in infants and coumarin overdoses.	Hemostatics
Physostigmine	275.3461	A cholinesterase inhibitor used to treat glaucoma and anticholinergic toxicity.	Antidotes
Pibrentasvir	1113.201	A Hepatitis C NS5A inhibitor used to treat Hepatitis C.	Antivirals for treatment of HCV infections
Picosulfuric acid	437.44	A stimulant laxative used for cleansing of the colon as a preparation for colonoscopy in adults.	Laxatives
Pidolic acid	129.114	There is currently no clinically approved and/or marketed medicine that relies upon pidolic acid as an active ingredient for any formal therapeutic indication.\\nAlthough pidolic acid may be sold in...	Glutamates
Piflufolastat F 18	441.403	A radiopharmaceutical diagnostic agent used with PET to image PSMA-positive lesions for the diagnosis of metastatic or recurrent prostate cancer.	Fluorine Radioisotopes
Pilocarpine	208.2569	A muscarinic cholinergic agonist used on the eye to treat elevated intraocular pressure, various types of glaucoma, and to induce miosis. Also available orally to treat symptoms of dry mouth associated with Sjogren's syndrome and radiotherapy.	Parasympathomimetics
Pimavanserin	427.564	A second generation atypical antipsychotic used for the treatment of hallucinations and delusions caused by Parkinson's Disease.	Neurotoxic agents
Pimecrolimus	810.46	A topical calcineurin inhibitor used in the treatment of mild-moderate atopic dermatitis who are not candidates for other types of therapy due to previous lack of response or other reasons.	Agents for Dermatitis, Excluding Corticosteroids
Pimethixene	293.43	Pimethixene is approved for use in Brazil and is marketed under the trade name Muricalm. It is an anticholinergic used in the treatment of bronchitis.	Antihistamines for Systemic Use
Pimozide	461.5462	An antipsychotic used to manage debilitating motor and phonic tics in patients with Tourette's Disorder.	Diphenylbutylpiperidine Derivatives
Pinacidil	245.33	Pinacidil is a cyanoguanidine drug that acts by opening ATP-sensitive potassium channels, leading to peripheral vasodilatation of arterioles and decreasing peripheral vascular resistance. The above processes result in reduced blood...	Guanidine Derivatives
Pinaverium	511.52	A spasmolytic agent used for the symptomatic treatment of irritable bowel syndrome (IBS) and functional disorders of the biliary tract.	Calcium Channel Blockers
Pindolol	248.3208	A beta adrenoceptor antagonist used to treat hypertension, edema, ventricular tachycardias, and atrial fibrillation.	Beta Blocking Agents, Non-Selective
Pioglitazone	356.439	A thiazolidinedione used adjunctively with diet and exercise to normalize glycemic levels in adults with type 2 diabetes mellitus.	Peroxisome Proliferator Receptor gamma Agonist
Pipecuronium	602.8912	A nondepolarizing neuromuscular blocking agent used to relax muscles during anesthesia and surgical procedures.	Agents producing tachycardia
Piperacillin	517.555	A penicillin antibiotic combined with tazobactam to treat piperacillin-resistant, piperacillin/tazobactam­ susceptible, β-lactamase generating strains of several bacteria.	Penicillins With Extended Spectrum
Piperaquine	535.52	For the treatment of uncomplicated Plasmodium falciparum infection in adults, children, and infants aged 6 months and up weighing over 5 kg [FDA Label]. Used in combination with DB11638.	Anti-Infective Agents
Piperazine	86.1356	A medication used to treat roundworm and pinworm.	Piperazine and Derivatives
Piperonyl butoxide	338.4385	A pesticide used as a potentiator ingredient in the treatment of pediculosis (head lice, body lice or crabs) to boost efficacy of treatment.	Benzodioxoles
Pipobroman	356.054	For the treatment of polycythaemia vera and refractory chronic myeloid leukaemia.	Alkylating Drugs
Pipotiazine	475.667	An antipsychotic indicated for the management of chronic, non-agitated schizophrenic patients.	Phenothiazines With Piperidine Structure
Pipradrol	267.372	A central nervous stimulant ingredient in a product used to treat functional fatigue.	Central Nervous System Stimulants
Piracetam	142.1558	A nootropic cyclic GABA derivative used in myoclonus, sickle cell disease, alcohol dependence, and as a general cognitive enhancer.	Acetamides
Pirbuterol	240.2988	A beta-2 adrenergic agonist and bronchodilator used for the symptomatic treatment of asthma.	Selective Beta 2-adrenergic Agonists
Pirenzepine	351.4023	An antimuscarinic agent used to treat peptic ulcers, gastric ulcers, and duodenal ulcers.	Agents producing tachycardia
Piretanide	362.4	A loop diuretic used to manage essential arterial hypertension and edema cardiac, hepatic, and renal origin.	Sulfonamides
Pirfenidone	185.2218	An agent used for the treatment of idiopathic pulmonary fibrosis (IPF).	Analgesics
Piritramide	430.5851	A synthetic opioid used in the treatment of severe pain.	Diphenylpropylamine Derivatives
Piroxicam	331.346	An NSAID used to treat the symptoms of osteoarthritis and rheumatoid arthritis.	Antiinflammatory Preparations, Non-Steroids for Topical Use
Pirtobrutinib	479.436	A kinase inhibitor used to treat relapsed or refractory mantle cell lymphoma (MCL) after at least two lines of systemic therapy.	Enzyme Inhibitors
Pitavastatin	421.4608	An HMG-CoA reductase inhibitor used to lower lipid levels and reduce the risk of cardiovascular disease including myocardial infarction and stroke.	Hydroxymethylglutaryl-CoA Reductase Inhibitors
Pitolisant	295.85	An antagonist and inverse agonist at the histamine H3 receptor that is used to treat narcolepsy in adults.	Drugs causing inadvertant photosensitivity
Pivampicillin	463.547	An ampicillin prodrug used to treat a variety of infections.	Penicillins With Extended Spectrum
Pivmecillinam	439.569	A prodrug of the beta lactam antibiotic mecillinam, indicated for the treatment of uncomplicated urinary tract infections (UTIs).	Penicillins With Extended Spectrum
Pixantrone	325.372	An antineoplastic agent use to treat patients with relapsed or refractory aggressive Non-Hodgkin B-cell Lymphomas (NHL).	Anthracyclines and Related Substances
Pizotifen	295.44	A serotonin and tryptamine antagonist indicated for migraine prophylaxis.	Agents producing tachycardia
Plazomicin	592.691	An aminoglycoside antibiotic used to treat complicated urinary tract infections.	Agents that produce neuromuscular block (indirect)
Plecanatide	1681.89	A laxative used to treat chronic idiopathic constipation and IBS with constipation.	Gastrointestinal Agents
Plerixafor	502.782	A CXCR4 antagonist used in combination with granulocyte-colony stimulating factor to mobilize hematopoietic stem cells to the peripheral blood for collection and autologous transplantation in patients with non-Hodgkin’s lymphoma and multiple myeloma.	Anti-HIV Agents
Plicamycin	1085.1454	For the treatment of testicular cancer, as well as hypercalcemia and hypercalciuria associated with a variety of advanced forms of cancer.	Antineoplastic Agents
Podofilox	414.4053	A topical agent used for the treatment of external genital warts and perianal warts.	Antiviral Agents
Podophyllin	1693.67	A cytotoxic agent used for the removal of soft genital (venereal) warts (condylomata acuminata).	Antineoplastic Agents, Phytogenic
Sibutramine	279.848	A norepinephrine, serotonin and dopamine reuptake inhibitor indicated to assist with weight loss in obesity.	Centrally Acting Antiobesity Products
Polidocanol	582.8073	A sclerosing agent used for the treatment of uncomplicated spider veins and uncomplicated reticular veins, all less than 3 mm in diameter, in the lower extremity.	Sclerosing Agents for Local Injection
Polihexanide	0	Polihexanide has been used in trials studying the treatment, prevention, and supportive care of Caries, Neoplasm, Skin Diseases, Nail Diseases, and Dental Plaque, among others.	Biguanides and Amidines
Poloxamer 188	0	A medication used to clean wounds.	Excipients
Polydatin	390.388	Polydatin, or Piceid, is a natural precursor and glycoside form of resveratrol with a monocrystalline structure. While it is isolated from the bark of Picea sitchensis or Polygonum cuspidatum, polydatin...	Drugs, Chinese Herbal
Polyestradiol phosphate	0	Polymeric phosphoric acid ester of estradiol.	Estrogens
Polyethylene glycol	0	A laxative used to treat constipation and used for bowel preparation before colonoscopies and other procedures.	Electrolytes
Polyethylene glycol 300	0	Indicated as a lubricant in over-the-counter ophthalmic solutions to temporarily relieve redness, burning and irritation of the eyes.	Alcohols
Polyethylene glycol 400	0	An ingredient used in a wide variety of medications, and is not an approved medication.	Alcohols
Polymyxin B	1203.499	A polymyxin antibiotic used to treat a wide variety of infections in the body.	Anti-Bacterial Agents
Polyquaternium-10 (400 cps at 2%)	0	Polyquaternium-10 is a quaternized hydroxyethyl cellulose and a polycationic polymer. It is commonly found in cosmetics and personal care products to mainly reduce static electricity and form films.	\N
Polysilicone-15	0	Polysilicone-15 is used as an UV-filter in cosmetic sunscreen products as well as in other cosmetic products (like shampoos, conditioners, hairsprays, etc.) where it can confer photostability to the product(s)...	Sunscreen Agents
Polysorbate 20	0	Polysorbate 20 is a polysorbate-type nonionic surfactant used in many commercial, household and pharmaceutical products. It is composed of 20 repeated units of polyethylene glycol via ethoxylation. Polysorbate 20 is...	Excipients
Polysorbate 80	0	It is used as a solubilizer, antimicrobial preservative and disinfectant .	Excipients
Polythiazide	439.882	A thiazide diuretic used in the management of hypertension and treatment of edema.	Sulfonamides
Polyvinyl alcohol	0	A compound used as an ophthalmic lubricant.	Alcohols
Pomalidomide	273.2441	A thalidomide analogue used in combination with dexamethasone to treat patients with multiple myeloma.	Angiogenesis Inhibitors
Ponatinib	532.5595	A kinase inhibitor used to treat patients with various types of chronic myeloid leukemia (CML).	Bcr-Abl Tyrosine Kinase Inhibitors
Ponesimod	460.97	A sphingosine 1-phosphate receptor modulator indicated to treat relapsing multiple sclerosis.	Selective Immunosuppressants
Porfimer sodium	0	A hematoporphyrin derivative used to treat esophageal cancer, endobronchial cancer, and high grade dysplasia in Barrett's Esophagus.	Sensitizers Used in Photodynamic/radiation Therapy
Posaconazole	700.7774	A triazole antifungal drug that is used to treat invasive infections by Candida species and Aspergillus species in severely immunocompromised patients.	Triazole and tetrazole derivatives
Potassium	39.0983	A medication used to treat hypokalemic conditions and to clear the colon prior to colonoscopy.	Metals, Alkali
Potassium acetate	98.1423	A medication used to treat hypokalemia.	Electrolyte Solutions
Potassium alum	258.205	Potassium alum is considered safe by the FDA and its use is in homepathic or OTC products. Due to its presence in several different drugs, the main indications for the...	Adjuvants, Immunologic
Potassium aspartate	360.402	A potassium supplement used to treat hypokalemia or hyperammonemia.	Amino Acids, Acidic
Potassium bicarbonate	100.1151	An ingredient used as an antacid or to treat hypokalemia.	Potassium Salt
Potassium carbonate	138.2055	Potassium carbonate (K2CO3) is a white salt, soluble in water (insoluble in ethanol) which forms a strongly alkaline solution. It can be made as the product of potassium hydroxide's absorbent...	Alkalies
Potassium cation	39.0983	Potassium is used to regulate hypokalemia as a primary condition or secondary to other medical conditions.	Potassium Salt
Potassium chloride	74.551	A potassium salt used to treat hypokalemia.	Electrolyte Solutions
Potassium citrate	306.394	An agent used to manage renal tubular acidosis, hypocitraturic calcium oxalate nephrolithiasis, and uric acid lithiasis with or without calcium stones.	Calculi Dissolution Agent
Potassium gluconate	234.245	A potassium supplement indicated in the treatment and prevention of hypokalemia.	Alimentary Tract and Metabolism
Potassium hydroxide	56.1056	A disinfectant used to clean hands, skin, and surfaces.	Indicators and Reagents
Potassium Iodide	166.0028	An oral antithyroid agent used for the prevention of radioactive iodine uptake into the thyroid gland during a nuclear radiation emergency.	Antidotes
Potassium lactate	128.1683	Not Annotated	Electrolyte Solutions
Potassium nitrate	101.1032	A medication used to cauterize small wounds, remove granulation tissue, warts, and verrucae, and treat tooth sensitivity.	Explosive Agents
Potassium perchlorate	138.549	No current FDA- or EMA-approved therapeutic indications.	Perchlorates
Potassium sulfate	174.259	An osmotic laxative used to cleanse the colon before a colonoscopy.	Osmotic Laxatives
Povidone	0	When in complex with iodine, indicated for inducing antisepsis for prevention of infection in minor cuts, scrapes, and burns.	Pharmaceutic Aids
Povidone K30	0	When in complex with iodine, indicated for inducing antisepsis for prevention of infection in minor cuts, scrapes, and burns.	\N
Povidone-iodine	0	A topical antiseptic agent used for the treatment and prevention of infection in wounds.	Iodine Products
Practolol	266.3361	Used in the emergency treatment of cardiac arrhythmias.	Beta Blocking Agents, Selective
Pralatrexate	477.4726	An antineoplastic agent used for the treatment of relapsed or refractory peripheral T-cell lymphoma.	Folic Acid Analogues
Pralidoxime	137.1592	A cholinesterase reactivator used to treat organophosphate poisoning.	Antidotes
Pralsetinib	533.612	A RET receptor tyrosine kinase inhibitor for the treatment of metastatic RET-driven non-small cell lung cancer.	Antineoplastic Agents
Pramipexole	211.327	A non-ergot dopamine agonist used to treat the signs and symptoms of idiopathic Parkinson's disease and Restless Legs Syndrome (RLS).	Anti-Parkinson Drugs
Silanol	48.116	Silanol is an FDA-approved food contact substance that is commonly used in organosilicon chemistry and silicate mineralogy.	Silicon Compounds
Pramiracetam	269.389	Pramiracetam has been previously approved in some eastern European countries under the brand names Pramistar, Neupramir, and Remen. It was also previously approved in the United States with orphan drug...	Nervous System
Pramlintide	3949.44	An amylin analog used for the management of type 1 and type 2 diabetes mellitus as an adjunct to preprandial insulin therapy in patients without adequate glycemic control of insulin therapy.	Amylin Analog
Pramocaine	293.407	A local anesthetic and antipruritic agent found in various topical preparations.	Anesthetics for Topical Use
Prasterone	288.4244	A steroid formulated as a vaginal insert indicated for the treatment of moderate to severe dyspareunia associated with menopausal vulvar and vaginal atrophy.	Androgens and Estrogens
Prasterone enantate	400.603	An estrogen indicated for hormone replacement therapy in postmenopausal women.	17-Ketosteroids
Prasugrel	373.441	A P2Y12 platelet inhibitor used to reduce risk of thrombotic cardiovascular events in unstable angina or non-ST-elevation myocardial infarction (NSTEMI), and in patients with STEMI when managed with either primary or delayed PCI.	Platelet Aggregation Inhibitors Excl. Heparin
Pravastatin	424.5277	An HMG-CoA reductase inhibitor used to lower lipid levels and to reduce the risk of cardiovascular events, including myocardial infarction and stroke.	Anticholesteremic Agents
Prazepam	324.804	A benzodiazepine used to manage more severe forms of anxiety disorders.	Benzodiazepines and benzodiazepine derivatives
Praziquantel	312.4061	An anthelmintic medication used to treat a number of parasitic worm infections such as schistosomiasis.	Quinoline Derivatives and Related Substances
Prazosin	383.4011	An alpha-blocker that causes a decrease in total peripheral resistance and is used to treat hypertension.	Alpha-Adrenoreceptor Antagonists and Diuretics
Prednicarbate	488.577	A medium potency topical corticosteroid used to manage pruritus and inflammation associated with responsive skin conditions.	Corticosteroids, Potent (Group III)
Prednisolone	360.444	A glucocorticoid used to treat adrenocortical insufficiency, inflammatory conditions, and some cancers.	Antidotes
Prednisolone acetate	402.4807	A glucocorticoid used to treat a wide variety of endocrine, inflammatory, and immune conditions as well as for palliation of neoplastic conditions.	Anti-Inflammatory Agents
Prednisolone phosphate	440.429	A corticosteroid used to treat inflammation, immune reactions, as well as endocrine or neoplastic conditions.	Glucocorticoids
Prednisolone tebutate	458.587	Not Annotated	Fused-Ring Compounds
Prednisone	358.4281	A corticosteroid used to treat inflammation or immune-mediated reactions and to treat endocrine or neoplastic diseases.	Corticosteroids Acting Locally
Prednisone acetate	400.471	Not Annotated	Anti-Inflammatory Agents
Pregabalin	159.2261	An anticonvulsant drug used to treat neuropathic pain conditions and fibromyalgia, and for the treatment of partial onset seizures in combination with other anticonvulsants.	Gabapentinoids
Pregnenolone	316.4776	A 21-carbon steroid, derived from cholesterol and found in steroid hormone-producing tissues. Pregnenolone is the precursor to gonadal steroid hormones and the adrenal corticosteroids.	Hydroxycorticosteroids
Prenylamine	329.4779	Prenylamine was withdrawn from the Canadian, US, and UK markets in 1988 due to concerns regarding cardiac arrhythmias.	Adrenergic Agents
Pretomanid	359.2574	Part of a three-drug regimen used for the treatment of extensively drug-resistant and multidrug-resistant pulmonary tuberculosis.	Drugs for Treatment of Tuberculosis
Prilocaine	220.3107	A local anesthetic used in dental procedures.	Amides
Primaquine	259.3467	An antimalarial indicated to prevent relapse of vivax malaria.	Aminoquinolines
Primidone	218.2518	An antiepileptic used to treat grand mal, psychomotor, and focal epileptic seizures.	Barbiturates and Derivatives
Probenecid	285.359	A medication used to treat gouty arthritis, tophaceous gout, and hyperuricemia.	Preparations Increasing Uric Acid Excretion
Probucol	516.842	Used to lower LDL and HDL cholesterol.	Anticholesteremic Agents
Procainamide	235.3253	A medication used to treat life threatening ventricular arrhythmias.	Antiarrhythmic agents
Procaine	236.3101	A local anesthetic used for anesthesia, peripheral nerve block, and spinal nerve block.	Esters of Aminobenzoic Acid
Procaine benzylpenicillin	570.71	A local anesthetic and antibiotic combination for intramuscular injection to treat a variety of bacterial infections while reducing pain from a deep intramuscular injection.	Beta-Lactamase Sensitive Penicillins
Procaine merethoxylline	764.24	Not Annotated	\N
Procarbazine	221.2988	An antineoplastic agent indicated for the treatment of stage III and stage IV Hodgkin's disease in combination with other chemotherapeutic agents.	Methylhydrazines
Procaterol	290.363	A beta-2 adrenergic receptor agonist and bronchodilator used for the treatment of asthma and chronic obstructive pulmonary disease (COPD).	Selective Beta 2-adrenergic Agonists
Prochlorperazine	373.943	A phenothiazine derivative used in the treatment of schizophrenia and anxiety and to relieve severe nausea and vomiting.	Phenothiazines With Piperazine Structure
Procyclidine	287.4397	An antispasmodic drug used to treat parkinsonism of various types and in the treatment of extrapyramidal symptoms.	Tertiary Amines
Profenamine	312.472	An antidyskinetic phenothiazine used to treat the symptoms of Parkinson's disease.	Tertiary Amines
Proflavine	209.2465	A topical antiseptic agent used in wound dressings to prevent infections.	Aminoacridines
Progesterone	314.4617	A hormone used for a variety of functions, including contraception, control of abnormal uterine bleeding, maintenance of pregnancy, and prevention of endometrial hyperplasia.	Corpus Luteum Hormones
Proguanil	253.731	A medication indicated for prophylaxis and treatment of Plasmodium falciparum malaria.	Biguanides
Promazine	284.419	A phenothiazine used to manage schizophrenia.	Phenothiazines With Aliphatic Side-Chain
Promethazine	284.419	A first-generation antihistamine used for the treatment of allergic conditions, nausea and vomiting, and motion sickness.	Antidotes
Propafenone	341.444	A Class 1C antiarrhythmic agent used in the management of paroxysmal atrial fibrillation/flutter and ventricular arrhythmias.	Agents that produce hypertension
Propanoic acid	74.0785	An antimicrobial food additive.	Acids, Acyclic
Propantheline	368.4892	An antimuscarinic agent used to treat urinary incontinence, hyperhidrosis, as well as cramps and spasms of the stomach, intestines, and bladder.	Synthetic Anticholinergics, Quaternary Ammonium Compounds
Proparacaine	294.3892	A topical anesthetic used for ophthalmic practice.	Anesthetics, Local
Propiolactone	72.063	Propiolactone was used for vaccines, tissue grafts, surgical instruments, and enzymes, as a sterilant of blood plasma, water, milk and nutrient broth as a vapor-phase disinfectant in enclosed spaces. Its...	Disinfectants
Propiomazine	340.482	Propiomazine is largely used for its antihistamininc sleep inducing effects in treating insomnia.	Agents producing tachycardia
Propiverine	367.4813	An antimuscarinic agent used to treat urinary incontinence or increased urinary frequency or urgency.	Drugs for Urinary Frequency and Incontinence
Propofol	178.2707	A medication used in general anesthesia and for sedation.	Agents that produce hypertension
Propolis wax	0	Propolis wax is naturally produced by honeybees by mixing the resin or exudate collected from tree buds, sap flows, or other botanical sources with beeswax that contains fatty acids and...	\N
Propoxycaine	294.395	Propoxycaine is a local anesthetic medication. It was used beginning in the 1950s during dental procedures . It has been combined with procaine to accelerate its onset of action and...	Anesthetics, Local
Propranolol	259.3434	A non-selective beta adrenergic antagonist used to treat hypertension, angina, atrial fibrillation, myocardial infarction, migraine, essential tremor, hypertrophic subaortic stenosis, and pheochromocytoma.	Beta Blocking Agents, Non-Selective
Propyl alcohol	60.095	An antiseptic and disinfectant used in a variety of clinical and domestic settings.	Propanols
Propylene glycol	76.0944	A clear, colorless, viscous organic solvent and diluent used in pharmaceutical preparations.	Pharmaceutical Vehicles
Propylhexedrine	155.2804	It is used to provide temporary symptomatic relief of nasal congestion due to colds, allergies and allergic rhinitis.	Adrenergic Agonists
Propyliodone	447.011	Radiopaque medium usually in oil; used in bronchography.	Non-Watersoluble X-Ray Contrast Media
Propylparaben	180.2005	Propylparaben is used in allergenic testing.	Preservatives, Pharmaceutical
Propylthiouracil	170.232	A thiourea antithyroid agent used to treat hyperthyroidism.	Thiouracils
Protionamide	180.27	An antitubercular thioamide-derivative used in the treatment of multi-drug resistant (MDR) tuberculosis and leprosy.	Thiocarbamide Derivatives
Protirelin	362.3837	A synthetic analogue of thyrotropin-releasing hormone that has been used during diagnostic tests to evaluate function of the thyroid gland.	Tests for Thyreoidea Function
Protokylol	331.368	Protokylol is a β-adrenergic receptor agonist used as a bronchodilator in Europe and the United States.	Agents producing tachycardia
Protriptyline	263.3767	A tricyclic antidepressant that is indicated in the treatment of depression only under close clinical supervision.	Non-Selective Monoamine Reuptake Inhibitors
Proxibarbal	226.232	Proxibarbal is a derivative of barbiturates, which has been used to treat migraines. Proxibarbal was approved in France but was withdrawn from the market due to the risk of inducing...	Barbiturates, Plain
Prucalopride	367.87	A 5-HT4 receptor agonist indicated to treat adults with chronic idiopathic constipation.	Laxatives
Prussian blue	859.239	A chelating agent used to reduce the extent of systemic contamination with radioactive cesium and/or radioactive or non-radioactive thallium.	Antidotes
Pseudoephedrine	165.2322	An alpha and beta adrenergic agonist used to treat nasal and sinus congestion, as well as allergic rhinitis.	Sympathomimetics
Pyrantel	206.31	An anthelmintic used to treat helminth infections.	Tetrahydropyrimidine Derivatives
Pyrazinamide	123.1127	An antituberculosis agent used as a component of tuberculosis (TB) treatment.	Antimycobacterials
Pyridostigmine	181.2117	A cholinesterase inhibitor used for symptomatic treatment of myasthenia gravis and congenital myasthenic syndromes and to reverse neuromuscular blockade by nondepolarizing muscle relaxants.	Cholinesterase Inhibitors
Pyridoxal phosphate	247.1419	A vitamin available in many formulations to correct vitamin B6 deficiency.	Vitamins
Pyridoxine	169.1778	A vitamin used to correct vitamin B6 deficiency and to treat nausea during pregnancy.	Vitamins
Pyrimethamine	248.711	An antiparasitic drug used in the prevention and treatment of toxoplasmosis and malaria.	Antimalarial diaminopyrimidines
Pyrithione	127.16	An antimicrobial agent used for the treatment of dandruff and seborrheic dermatitis.	Antifungal Agents
Pyrophosphoric acid	177.9751	An ingredient of a radiopharmaceutical used to visualize bone abnormalities and cardiovascular abnormalities and also used as an ingredient in some products to prevent iron deficiency anemia.	Acids
Pyruvic acid	88.0621	An ingredient of a blood cell processing solution used to rejuvenate a unit of red blood cells (RBC) in preparation for transfusion.	Pyruvates
Pyrvinium	382.53	An anthelmintic agent used for the treatment of pinworm infestations.	Anthelmintics
Quaternium-15	251.156	Quaternium-15 is approved for use within allergenic epicutaneous patch tests which are indicated for use as an aid in the diagnosis of allergic contact dermatitis (ACD) in persons 6 years...	Preservatives, Pharmaceutical
Quazepam	386.794	A long-acting benzodiazepine used to manage insomnia.	Benzodiazepines and benzodiazepine derivatives
Quetiapine	383.507	A psychotropic agent used for the management of bipolar disorder, schizophrenia, and major depressive disorder.	Diazepines, Oxazepines, Thiazepines and Oxepines
Quinagolide	395.56	A dopamine D2 receptor agonist used for the treatment of hyperprolactinemia.	Prolactine Inhibitors
Quinapril	438.5161	An ACE inhibitor prodrug used to treat hypertension, congestive heart failure, and slow rate of progression of renal disease.	ACE Inhibitors and Diuretics
Quinestrol	364.5204	Used in hormone replacement therapy, treating symptoms of menopause such as hot flashes. Also used to treat breast and prostate cancer.	Estrogens
Quinethazone	289.739	Used to treat hypertension.	Sulfonamides
Quinidine	324.4168	A medication used to restore normal sinus rhythm, treat atrial fibrillation and flutter, and treat ventricular arrhythmias.	Agents producing tachycardia
Quinidine barbiturate	556.652	The administration of quinidine derivatives helps to observe various skin and mucosal reactions. A papulopurpuric eruption in a patient (without thrombopenia) can be developed who is taking quinidine phenylethyl barbiturate...	\N
Quinine	324.4168	An alkaloid used to treat uncomplicated Plasmodium falciparum malaria.	Antimalarial methanolquinolines
Quinupramine	304.437	Quinupramine has been approved in France under the brand name Kinupril, as an antidepressant .	Non-Selective Monoamine Reuptake Inhibitors
Sildenafil	474.576	A phosphodiesterase inhibitor used for the treatment of erectile dysfunction.	Drugs Used in Erectile Dysfunction
Quinupristin	1022.23	An antibiotic agent used in the treatment of serious vancomycin-resistant Enterococcus faecium bacteremia as well as complicated skin and skin structure infections.	Anti-Bacterial Agents
Rabeprazole	359.443	A proton pump inhibitor used to help gastrointestinal ulcers heal, to treat symptoms of gastroesophageal reflux disease (GERD), to eradicate Helicobacter pylori, and to treat hypersecretory conditions such as Zollinger-Ellison Syndrome.	Antiinflammatory Preparations, Non-Steroids for Topical Use
Racemethionine	149.211	A preparation of methionine that includes a mixture of D-methionine and L-methionine isomers.	Amino Acids
Racephedrine	165.236	Not Annotated	Adrenergic Agonists
Racepinephrine	0	A bronchodilator used to treat intermittent asthma.	Agents producing tachycardia
Radium Ra 223 dichloride	293.924	A radiopharmaceutical agent used to treat patients with castration-resistant prostate cancer, symptomatic bone metastases and no known visceral metastatic disease.	Antineoplastic Agents
Raloxifene	473.583	A selective estrogen receptor modulator that is used to prevent and treat osteoporosis and reduce the risk of invasive breast cancer in high-risk postmenopausal women.	Selective Estrogen Receptor Modulators
Raltegravir	444.4163	An antiretroviral agent used for the treatment of HIV infections in conjunction with other antiretrovirals.	Anti-HIV Agents
Raltitrexed	458.488	A folate analog thymidylate synthase inhibitor used in the treatment of advanced colorectal cancer.	Folic Acid Analogues
Ramelteon	259.3434	A melatonin receptor agonist used to treat insomnia.	Melatonin Receptor Agonists
Ramipril	416.5106	An ACE inhibitor used for the management of hypertension and the reduction of cardiovascular mortality following myocardial infarction in hemodynamically stable patients with clinical signs of congestive heart failure.	ACE Inhibitors and Calcium Channel Blockers
Ranitidine	314.4	A histamine H2 antagonist used to treat duodenal ulcers, Zollinger-Ellison syndrome, gastric ulcers, GERD, and erosive esophagitis.	Anti-Ulcer Agents
Ranolazine	427.5365	An anti-anginal drug used for the treatment of chronic angina.	Antianginal Agents
Rapacuronium	597.904	A nondepolarizing neuromuscular blocking agent used as an adjunct to general anesthesia to facilitate tracheal intubation, and to provide skeletal muscle relaxation during surgical procedures.	Agents producing tachycardia
Rasagiline	171.2383	An irreversible inhibitor of monoamine oxidase used for the symptomatic management of idiopathic Parkinson's disease as initial monotherapy and as adjunct therapy to levodopa.	Agents that produce hypertension
Rebamipide	370.79	A gastroprotective agent used in combination with other similar therapies (e.g. proton pump inhibitors) to treat gastritis and protect the gastric mucosa.	Anti-Ulcer Agents
Reboxetine	313.397	A drug used for the acute treatment of major depression and for maintenance therapy of depression.	Adrenergic Uptake Inhibitors
Regadenoson	390.354	A coronary vasodilator used in radionuclide myocardial perfusion imaging (MPI).	Adenosine A2 Receptor Agonists
Regorafenib	482.815	A kinase inhibitor used to treat patients with metastatic colorectal cancer, unresectable, locally advanced, or metastatic gastrointestinal stromal tumors, and hepatocellular carcinoma.	Protein Kinase Inhibitors
Relebactam	348.37	A beta-lactamase inhibitor used to prevent hydrolysis of beta-lactam antibiotics, leading to increased effectiveness.	beta-Lactamase Inhibitors
Relugolix	623.64	An oral GnRH receptor antagonist for androgen deprivation therapy in the treatment of advanced prostate cancer.	Anti-Gonadotropin-Releasing Hormones
Remdesivir	602.585	A nucleoside analog used to treat RNA virus infections including COVID-19.	Nucleosides and Nucleotides Excl. Reverse Transcriptase Inhibitors
Remifentanil	376.4467	An opioid analgesic used in anesthesia.	Opioid Anesthetics
Remimazolam	439.313	An ultra short-acting benzodiazepine used for the induction and maintenence of procedural sedation during short procedures.	Benzodiazepines and benzodiazepine derivatives
Remoxipride	371.269	An discontinued atypical antipsychotic selective for dopamine D2 receptors.	Benzamides and benzamide derivatives
Repaglinide	452.5857	A antihyperglycemic used to improve glycemic control in diabetes.	Glinide
Rescinnamine	634.716	For the treatment of hypertension.	Secologanin Tryptamine Alkaloids
Reserpine	608.6787	For the treatment of hypertension	Secologanin Tryptamine Alkaloids
Resorcinol	110.1106	Contemporary therapeutic uses for resorcinol primarily revolve around the use of the phenol derivative as an active ingredient in topical antiseptics [L2745, L2744, L40069, F61] or as topical antibacterial skin...	Root Canal Filling Materials
Resorcinol monoacetate	152.149	Not Annotated	Benzene Derivatives
Retapamulin	517.763	A topical antibiotic agent used for the treatment of impetigo caused by methicillin-susceptible Staphylococcus aureus or Streptococcus pyogenes.	Anti-Bacterial Agents
Revefenacin	597.76	An anticholinergic agent used to treat COPD.	Anticholinergic Agents
Reviparin	0	By the FDA, reviparin is indicated for the treatment of deep vein which may lead to pulmonary embolism in pediatric patients. It is also indicated for the long-term treatment of...	Anticoagulants
Rezafungin	1226.411	An echinocandin antifungal indicated in patients over 18 years old who have limited or no alternative options for the treatment of candidemia and invasive candidiasis.	Antifungal Agents
Ribavirin	244.2047	A guanosine nucleoside used to treat some forms of Hepatitis C.	Antivirals for treatment of HCV infections
Ribociclib	434.548	A kinase inhibitor used to treat HR+, HER2- advanced or metastatic breast cancer.	Cyclin-dependent kinase (CDK) inhibitors
Riboflavin	376.3639	A vitamin used to correct vitamin B2 deficiency.	Vitamins
Ribostamycin	454.4727	A broad spectrum aminoglycoside antibiotic on the list of WHO critical antimicrobials for human medicine.	Anti-Bacterial Agents
Rifabutin	847.0047	An antibiotic used to treat mycobacterium avium complex disease in patients with HIV.	Anti-Bacterial Agents
Rifampicin	822.9402	An antibiotic used to treat several types of mycobacterial infections including Mycobacterium avium complex, leprosy, and in combination with other antibacterials to treat latent or active tuberculosis.	Anti-Bacterial Agents
Rifamycin	697.778	An antibacterial used to treat traveler's diarrhea.	Anti-Bacterial Agents
Rifapentine	877.0307	An antibiotic agent used in the treatment of pulmonary tuberculosis.	Anti-Bacterial Agents
Silicon	28.085	A micronutrient indicated in nutritional products to treat or prevent silicon deficiencies.	Metalloids
Silicon dioxide	60.0843	An ingredient found in a variety of supplements and vitamins.	Hygroscopic Agents
Rifaximin	785.8785	A rifamycin-based non-systemic antibiotic used for the treatment of gastrointestinal bacterial infections, such as traveler's diarrhea and irritable bowel syndrome, and reduction of overt hepatic encephalopathy recurrence in adults.	Anti-Bacterial Agents
Rilmenidine	180.251	An I1-imidazoline receptor agonist used to treat hypertension.	Imidazoline Receptor Agonists
Rilpivirine	366.4185	A non-nucleoside reverse transcriptase inhibitor (NNRTI) used in combination with other antiretrovirals to specifically treat human immunodeficiency virus type 1 (HIV-1).	Non-Nucleoside Reverse Transcriptase Inhibitors
Riluzole	234.198	A glutamate antagonist used to treat amyotrophic lateral sclerosis.	Anticonvulsants
Rimantadine	179.3018	An RNA synthesis inhibitor used to prevent influenza A infection.	Cyclic Amines
Rimegepant	534.568	An oral CGRP receptor antagonist used for the acute treatment of migraines with or without aura in adults.	Calcitonin Gene-Related Peptide (CGRP) Antagonists
Rimexolone	370.533	A glucocorticoid used to treat inflammation of the eye.	Glucocorticoids
Rimonabant	463.787	For use in conjunction with diet and exercise for patients with a body mass index greater than 30 kg/m2, or patients wih a BMI greater than 27 kg/m2 with associated...	Agents producing tachycardia
Riociguat	422.4157	A stimulator of soluble guanylate cyclase indicated for the management of persistent or recurrent chronic thromboembolic pulmonary hypertension and pulmonary arterial hypertension.	Antihypertensives for Pulmonary Arterial Hypertension
Ripretinib	510.367	A kinase inhibitor used to treat advanced gastrointestinal stromal tumor (GIST).	Kinase Inhibitor
Risdiplam	401.474	An oral mRNA splicing modifier used in the treatment of spinal muscular atrophy (SMA).	BCRP/ABCG2 Substrates
Risedronic acid	283.1123	A bisphosphonate used to treat osteoporosis and Paget's disease.	Bisphosphonates
Risperidone	410.4845	A second-generation antipsychotic medication used to treat a number of mental health disorders including schizophrenia, bipolar mania, psychosis, or as an adjunct in severe depression.	Agents that produce hypertension
Ritiometan	286.33	Ritiometan is a nasal spray which is marketed by the name Nécyrane in France. It is indicated for use in viral rhinitis/ the common cold.	Nasal Preparations
Ritodrine	287.359	An adrenergic beta agonist used to treat premature labor.	Sympathomimetics, Labour Repressants
Ritonavir	720.944	An HIV protease inhibitor used in combination with other antivirals in the treatment of HIV infection.	Antivirals for treatment of HCV infections
Rivaroxaban	435.881	A factor Xa inhibitor used to treat deep vein thrombosis (DVT) and pulmonary embolism (PE). May also be used as thrombosis prophylaxis in specific situations.	Direct factor Xa inhibitors
Rivastigmine	250.3367	A cholinesterase inhibitor used to treat mild to moderate dementia in Alzheimer's and Parkinson's.	Cholinesterase Inhibitors
Rizatriptan	269.3449	A triptan used to treat migraines with or without aura.	Selective Serotonin 5-HT1 Receptor Agonists
Rocuronium	529.7742	A vecuronium analog used to facilitate tracheal intubation and to relax skeletal muscles during surgery.	Agents producing tachycardia
Rofecoxib	314.356	A COX-2 inhibitor NSAID used to treat osteoarthritis, rheumatoid arthritis, acute pain, primary dysmenorrhea, and migraine attacks.	COX-2 Inhibitors
Roflumilast	403.207	A selective phosphodiesterase-4 inhibitor indicated to decrease the risk of exacerbations in patients with severe chronic obstructive pulmonary disease (COPD) and to treat plaque psoriasis.	Phosphodiesterase 4 Inhibitors
Rolapitant	500.485	A neurokinin-1 (NK-1) receptor antagonist used in combination with other antiemetics for the prevention of delayed nausea and vomiting associated with emetogenic chemotherapy.	Neurokinin-1 Receptor Antagonists
Rolitetracycline	527.5662	A broad-spectrum tetracycline antibiotic used in cases needing high concentrations or when oral administration is impractical.	Tetracyclines
Romidepsin	540.69	A histone deacetylase (HDAC) inhibitor used to treat cutaneous T-cell lymphoma.	Histone deacetylase (HDAC) inhibitors
Ropinirole	260.3746	A non-ergoline dopamine agonist used to treat the symptoms of Parkinson's disease and Restless Legs Syndrome.	Anti-Parkinson Drugs
Ropivacaine	274.4011	An amide-type local anesthetic used for local or regional anesthesia during surgery and for short-term management of acute pain.	Amides
Rose bengal	973.673	Indicated as a diagnostic agent in routine ocular examinations or when superficial conjunctiva or corneal tissue change is suspected, and as an aid in the diagnosis of keratoconjunctivitis sicca, keratitis,...	Colouring Agents
Rose bengal I-131	989.67	Not Annotated	Radiopharmaceuticals
Rosiglitazone	357.427	A thiazolidinedione indicated as an adjunct to diet and exercise to maintain glycemic control in type 2 diabetes.	Peroxisome Proliferator Receptor gamma Agonist
Rosoxacin	294.3047	For the treatment of bacterial infection of respiratory tract, urinary tract, GI, CNS and immuno compromised patients.	Anti-Infective Agents
Rosuvastatin	481.538	An HMG-CoA reductase inhibitor used to lower lipid levels and reduce the risk of cardiovascular disease including myocardial infarction and stroke.	Sulfonamides
Rotigotine	315.48	A non-selective dopamine agonist used for the treatment of Parkinson's Disease and Restless Leg Syndrome.	Agents that produce hypertension
Roxadustat	352.346	A hypoxia-inducible factor (HIF) prolyl hydroxylase inhibitor used to treat symptomatic anemia associated with chronic kidney disease.	Hypoxia-Inducible Factor-Proline Dioxygenases, antagonists & inhibitors
Roxithromycin	837.0465	An antibiotic used to treat a variety of susceptible bacterial infections.	Anti-Bacterial Agents
Rubidium	85.4678	Not Annotated	Metals, Alkali
Rubidium Rb-82	81.9177	A radiopharmaceutical diagnostic agent used for Positron Emission Tomography (PET) imaging of the myocardium to evaluate regional myocardial perfusion in adult patients with suspected or existing coronary artery disease.	Radioactive Diagnostic Agent
Rucaparib	323.371	A poly (ADP-ribose) polymerase (PARP) inhibitor used to treat recurrent ovarian and prostate cancers in previously treated adults.	Poly (ADP-ribose) polymerase (PARP) inhibitors
Rufinamide	238.1935	An antiepileptic drug used as adjunctive therapy to treat seizures associated with Lennox-Gastaut Syndrome (LGS).	Carboxamide Derivatives
Rupatadine	415.97	A selective histamine H1 receptor antagonist and platelet activating factor (PAF) antagonist used to treat allergic rhinitis.	Platelet Activating Factor, antagonists & inhibitors
Rutin	610.5175	A flavonoid found in over-the-counter vitamin supplements.	Flavonoids
Tafenoquine	463.501	An antiparasitic agent used for the treatment and prevention of relapse of Vivax malaria.	Aminoquinolines
Ruxolitinib	306.365	A kinase inhibitor used to treat various types of myelofibrosis, polycythemia vera in patients who have not responded to or cannot tolerate hydroxyurea, and to treat graft-versus-host disease in cases that are refractory to steroid treatment.	Agents for Dermatitis, Excluding Corticosteroids
Saccharide isomerate	0	Not Annotated	Biopolymers
Sacubitril	411.498	A neprilysin inhibitor used in combination with valsartan as an adjunct to reduce the risk of cardiovascular death and hospitalization for heart failure in patients with chronic heart failure (NYHA Class II-IV) and reduced ejection fraction.	Neprilysin Inhibitor
Safinamide	302.349	A MAO-B inhibitor used as an add-on treatment to levodopa/carbidopa for Parkinson's disease during off episodes.	Agents that produce hypertension
Salbutamol	239.3107	A beta-2 adrenergic receptor agonist used to treat asthma, bronchitis, COPD, as well as prevent exercise induced bronchospasms.	Agents producing tachycardia
Salicylamide	137.136	Salicylamide is the common name for the substance o-hydroxybenzamide, or amide of salicyl. Salicylamide is a non-prescription drug with analgesic and antipyretic properties. It has similar medicinal uses to aspirin....	Salicylic Acid and Derivatives
Salicylic acid	138.1207	An acid used to treat acne, psoriasis, calluses, corns, keratosis pilaris, and warts.	Anti-Inflammatory Agents, Non-Steroidal
Salmeterol	415.5656	A long-acting beta-2 adrenergic receptor agonist used to treat asthma and COPD.	Agents producing tachycardia
Salsalate	258.2262	A nonsteroidal anti-inflammatory agent used in the symptomatic relief of rheumatoid arthritis, osteoarthritis and related rheumatic disorders.	Salicylic Acid and Derivatives
Samarium (153Sm) lexidronam	586.021	A chelated complex of samarium isotope and EDTMP that concentrates in areas with high bone turnover such as sites of metastases to relieve pain associated with osteoblastic metastatic bone lesions.	Various Pain Palliation Radiopharmaceuticals
Samidorphan	370.449	A novel opioid-system modulator, similar to naltrexone, that functions primarily as a μ-opioid receptor antagonist in vivo and is used primarily in combination with antipsychotics to reduce their metabolic dysfunction-associated adverse effects.	Diazepines, Oxazepines, Thiazepines and Oxepines
Sapropterin	241.2471	A cofactor used as an adjunct to phenylalanine restriction in the treatment of phenylketonuria (PKU).	Various Alimentary Tract and Metabolism Products
Saquinavir	670.8408	An HIV protease inhibitor used in combination with other antiretroviral agents for the treatment of HIV-1 with advanced immunodeficiency.	Cytochrome P-450 CYP3A Inhibitors
Sarecycline	487.509	A tetracycline antibiotic used to treat inflammatory lesions of non-nodular moderate to severe acne vulgaris.	Anti-Bacterial Agents
Saxagliptin	315.41	An DPP-4 inhibitor used for the management of type 2 diabetes mellitus.	DPP-IV Inhibitors
Scopolamine	303.3529	A belladonna alkaloid with anticholinergic effects indicated for the treatment of nausea and vomiting associated with motion sickness and postoperative nausea and vomiting (PONV).	Agents producing tachycardia
Sea salt	0	Sea salt is the salt obtained from the evaporation of seawater or water from saltwater lakes. Sea salt production is subject to little processing which leaves certain trace minerals and...	\N
Secnidazole	185.183	A nitroimidazole antibiotic used to treat bacterial vaginosis.	Nitroimidazole Derivatives
Secobarbital	238.2829	A barbiturate used for the short-term treatment of insomnia.	Barbiturates, Plain
Segesterone acetate	370.489	Segesterone acetate in combination with ethinyl estradiol is indicated for use by females of reproductive potential to prevent pregnancy as a combination hormonal contraceptive (CHC). It induces contraception for thirteen...	Contraceptive Agents, Female
Selegiline	187.286	A monoamine oxidase inhibitor used to treat major depressive disorder and Parkinson's.	Agents that produce hypertension
Selenic acid	144.97	An ingredient found in a variety of supplements and vitamins.	Selenium Compounds
Selenious acid	128.97	An ingredient found in supplements, vitamins, parenteral nutrition, and dandruff shampoo.	Selenium Compounds
Selenium	78.96	An ingredient found in a variety of supplements and vitamins.	Antioxidants
Selenium Sulfide	143.09	An antifungal used to treat dandruff, seborrheic dermatitis of the scalp, and tinea capitis.	Antifungals for Dermatological Use
Selenomethionine	196.11	Selenomethionine is a naturally occuring amino acid in some plant materials such as cereal grains, soybeans and enriched yeast but it cannot be synthesized from animals or humans. It can...	Organoselenium Compounds
Selenomethionine Se-75	192.071	Not Annotated	Organoselenium Compounds
Selexipag	496.63	A non prostanoid IP prostacyclin receptor agonist used to treat pulmonary arterial hypertension.	Platelet Aggregation Inhibitors Excl. Heparin
Selinexor	443.313	Selinexor is indicated in combination with bortezomib and dexamethasone for the treatment of multiple myeloma in adult patients who have received at least one prior therapy. Selinexor is also indicated...	Antineoplastic Agents
Selpercatinib	525.613	A RET receptor tyrosine kinase inhibitor for the treatment of RET-driven non-small cell lung cancer, medullary thyroid cancer, and thyroid cancer in appropriate patient populations.	Kinase Inhibitor
Selumetinib	457.68	A MEK 1/2 inhibitor used in pediatric patients to treat neurofibromatosis type 1 (NF1) accompanied by symptomatic, inoperable plexiform neurofibromas (PN).	Mitogen-activated protein kinase (MEK) inhibitors
Serdexmethylphenidate	499.52	A prodrug of the CNS stimulant dexmethylphenidate used as a first-line treatment for Attention Deficit Hyperactivity Disorder (ADHD).	Centrally Acting Sympathomimetics
Sertaconazole	437.77	A topical antifungal agent used in the treatment of interdigital tinea pedis in immunocompetent patients.	Imidazole and Triazole Derivatives
Sertindole	440.941	An atypical antipsychotic indicated in the treatment of schizophrenia.	Indole Derivatives
Sertraline	306.23	A selective serotonin reuptake inhibitor (SSRI) indicated to treat major depressive disorder, social anxiety disorder and many other psychiatric conditions.	Antidepressive Agents Indicated for Depression
Setmelanotide	1117.32	Setmelanotide is indicated to treat obesity caused by genetic POMC, PCSK1, or LEPR deficiencies or Bardet-Biedl syndrome.	Centrally Acting Antiobesity Products
Sevelamer	149.619	A phosphate binder used to treat hyperphosphatemia.	Drugs for Treatment of Hyperkalemia and Hyperphosphatemia
Sevoflurane	200.0548	A inhalation anaesthetic agent used for induction and maintenance of general anesthesia during surgical procedures.	Hydrocarbons, Halogenated
Tiludronic acid	318.608	A bisphosphonate used for the treatment of Paget's disease of bone.	Bone Density Conservation Agents
Silodosin	495.5345	An alpha-1 adrenergic receptor antagonist used to treat symptoms associated with benign prostatic hyperplasia (BPH).	Adrenergic alpha-1 Receptor Antagonists
Silodrate	380.832	Not Annotated	\N
Silver	107.8682	Indicated for the treatment of acne for topical use or the management of dental caries for dental use.	Silver Compounds
Silver nitrate	169.8731	Silver nitrate is an inorganic compound with the chemical formula AgNO3. In its solid form, silver nitrate is coordinated in a trigonal planar arrangement. It is often used as a...	Silver Compounds
Silver sulfadiazine	357.137	A topical sulfonamide antibiotic that acts on the bacterial cell wall and cell membrane; approved for the treatment of burns.	Sulfonamides
Simeprevir	749.939	A direct-acting antiviral agent that inhibits HCV NS3/4A protease to treat chronic hepatitis C virus (HCV) infection in adults with HCV genotype 1 or 4.	Antivirals for treatment of HCV infections
Simethicone	238.461	An anti-flatulence agent used to relieve pressure, bloating, and symptoms referred to as gas.	Antifoaming Agents
Simvastatin	418.5662	An HMG-CoA reductase inhibitor used to lower lipid levels and reduce the risk of cardiovascular events including myocardial infarction and stroke.	Anticholesteremic Agents
Sinapultide	2469.45	A synthetic lung surfactant used to treat infant respiratory distress syndrome.	Pulmonary Surfactants
Sincalide	1143.27	A diagnostic agent used to stimulate gallbladder contraction or pancreatic secretion during diagnostic tests, and accelerate fluoroscopy and x-ray examination of the intestinal tract.	Tests for Bile Duct Patency
Sinecatechins	0	A topical agent used to treat external genital and perianal warts in immunocompetent adult patients.	Antiviral Agents
Siponimod	516.605	A medication used to treat relapsing multiple sclerosis.	Selective Immunosuppressants
Sirolimus	914.187	An mTOR inhibitor immunosuppressant used to prevent organ transplant rejections, treat lymphangioleiomyomatosis, and treat adults with perivascular epithelioid cell tumors.	Mammalian target of rapamycin (mTOR) kinase inhibitors
Sitagliptin	407.3136	An oral dipeptidyl peptidase-4 (DPP-4) inhibitor used for the management of type 2 diabetes mellitus.	DPP-IV Inhibitors
Sitaxentan	454.905	Investigated for use/treatment in pulmonary hypertension, connective tissue diseases, hypertension, and congestive heart failure.	Antihypertensives for Pulmonary Arterial Hypertension
Sodium 1,2-Dipalmitoyl-sn-glycero-3-phospho-(1'-rac-glycerol)	744.964	Not Annotated	\N
Sodium acetate	82.0338	A compound used for electrolyte replenishment and total parenteral nutrition (TPN) therapy.	Electrolyte Solutions
Sodium ascorbate	198.106	Not Available	Antioxidants
Sodium aurothiomalate	390.07	A disease-modifying antirheumatic drug (DMARD) indicated for the symptomatic treatment of arthritis.	Gold Preparations
Sodium aurotiosulfate	526.2	Not Annotated	Gold Preparations
Sodium bicarbonate	84.0066	A compound used for the symptomatic treatment of heartburn, acid indigestion, and upset stomach as well as the treatment of metabolic acidosis associated with conditions such as severe renal disease and circulatory insufficiency due to shock.	Electrolyte Solutions
Sodium bisulfite	104.061	An ingredient in parenteral nutrition products for patients with severe liver disorders.	Anti-Infective Agents, Local
Sodium borate	201.219	No FDA- or EMA-approved therapeutic indications on its own.	Anions
Sodium camphorsulfonate	254.28	Not Annotated	\N
Sodium carbonate	105.9884	Used topically for dermatitides, mouthwash, vaginal douche; veterinary use as emergency emetic.Occasionally, for dermatitides topically as a lotion. Medication (Vet): In solution to cleanse skin, in eczema, to soften scabs...	Alkalies
Sodium cellulose phosphate	0	Sodium cellulose phosphate is used to treat hypercalcemia and hypercalciuria. It has been used to prevent kidney stones. This compound is an ion-exchange resin that can not be absorbed by...	Drugs for Treatment of Hypercalcemia
Sodium chloride	58.443	An ingredient found in a variety of nutritional products as a source of electrolytes and water.	Electrolyte Solutions
Sodium chromate Cr-51	160.92	Not Annotated	Radioactive Diagnostic Agent
Sodium citrate	258.068	An ingredient used for the anticoagulation of whole blood as part of automated apheresis procedures.	Salt Solutions
Sodium feredetate	367.047	Not Annotated	Iron Trivalent, Oral Preparations
Sodium ferric gluconate complex	2089.309	An iron complex used for the treatment of iron deficiency anemia in adult patients and in pediatric patients age 6 years and older with chronic kidney disease receiving hemodialysis who are receiving supplemental epoetin therapy.	Parenteral Iron Replacement
Sodium fluoride	41.9882	An ingredient of various dental preparations used to support tooth mineralization and the prevention of dental caries.	Caries Prophylactic Agents
Sodium fluorophosphate	143.949	A fluoride anticaries agent used to prevent and treat dental cavities.	Caries Prophylactic Agents
Sodium glycerophosphate	216.036	A medication used to treat hypophosphatemia.	Electrolyte Solutions
Sodium hydroxide	39.9971	Used to destroy or kill the nail matrix (matrixectomies) .	Caustics
Sodium iodide	149.8942	A supplement used in total parenteral nutrition.	Iodides
Sodium lauryl sulfoacetate	330.41	A laxative indicated in the treatment of constipation and bowel preparation for rectal endoscopy.	Enemas
Sodium metavanadate	121.9295	Not Annotated	Anions
Sodium molybdate	205.93	Not Annotated	Elements
Sodium oxybate	126.087	A central nervous system depressant used to treat cataplexy and excessive daytime sleepiness (EDS) associated with narcolepsy.	Adjuvants, Anesthesia
Sodium phosphate P 32	142.957	Not Annotated	Various Therapeutic Radiopharmaceuticals
Sodium phosphate, dibasic	141.9588	An osmotic laxative used to cleanse the colon before a colonoscopy.	Osmotic Laxatives
Sodium phosphate, dibasic, unspecified form	0	An osmotic laxative used to cleanse the colon before a colonoscopy.	Osmotic Laxatives
Sodium phosphate, monobasic	119.977	A source of phosphorus used prevent or correct hypophosphatemia in patients with restricted or no oral intake.	Drugs for Treatment of Hypercalcemia
Sodium phosphate, monobasic, unspecified form	0	An osmotic laxative used to cleanse the colon before a colonoscopy.	Osmotic Laxatives
Sodium stibogluconate	907.88	For the treatment of various types of a protozoal infection called leishmaniasis, which may result from sandfly bites in tropical and temperate parts of the world. Also investigated for use/treatment...	Antimony Compounds
Sodium sulfate	142.042	An agent used for bowel cleansing prior to colonoscopy or barium enema X-ray examination.	Laxatives
Sodium sulfide	78.04	Sodium sulfide is a chemical compound with a chemical formula Na2S. Sodium sulfide is used in the pulp and paper industry, water treatment, textile industry, and various chemical manufacturing processes...	Anions
Sodium tartrate	194.05	It acts as an emulsifier and pH control agent in food products , .\\nIn the laboratory, it is used while performing the Karl Fischer equation, which is used to...	Osmotic Laxatives
Sodium tetradecyl sulfate	316.43	An anionic surfactant used to treat varicose veins of the lower extremities.	Sclerosing Agents for Local Injection
Sodium zirconium cyclosilicate	365.452	A potassium binder used to treat hyperkalemia.	Drugs for Treatment of Hyperkalemia and Hyperphosphatemia
Sofosbuvir	529.458	A direct-acting antiviral agent used to treat specific hepatitis C virus (HCV) infections in combination with other antiviral agents.	Antivirals for treatment of HCV infections
Solifenacin	362.473	A muscarinic antagonist with antispasmodic properties used to treat urge urinary incontinence, urgency, and urinary frequency associated with an overactive bladder.	Drugs for Urinary Frequency and Incontinence
Solriamfetol	194.234	Solriamfetol is indicated for treatment of daytime sleepiness associated with obstructive sleep apnea and narcolepsy, but is not a treatment for the underlying airway obstruction in apnea patients[FDA Label][A176534,A176744].	Centrally Acting Sympathomimetics
Somatostatin	1637.9	A natural peptide hormone used to treat acute bleeding from esophageal varices, gastrointestinal ulcers, and gastritis; prevent pancreatic complications after surgery; and restrict secretions of the upper intestine, pancreas, and biliary tract.	Somatostatin and Analogues
Sonidegib	485.507	An antineoplastic agent used for the treatment of locally advanced recurrent basal cell carcinoma (BCC) following surgery and radiation therapy, or in cases where surgery or radiation therapy are not appropriate.	Hedgehog pathway inhibitors
Sorafenib	464.825	A kinase inhibitor used to treat unresectable liver carcinoma, advanced renal carcinoma, and differentiated thyroid carcinoma.	Protein Kinase Inhibitors
Sorbitol	182.1718	A product that can be used as a laxative to relieve constipation, and also as a urologic irrigating fluid. May also be used as a pharmaceutical sweetener.	Enemas
Sotagliflozin	424.94	An orally administered dual SGLT1/2 inhibitor used alongside insulin to improve glycemic control in patients with type 1 diabetes mellitus.	Sodium-glucose Cotransporter 2 (SGLT2) Inhibitors
Sotalol	272.364	A methane sulfonanilide beta adrenergic antagonist used to treat life-threatening ventricular arrhythmias and to maintain sinus rhythm in atrial fibrillation or flutter.	Beta Blocking Agents, Non-Selective
Sotorasib	560.606	An experimental KRAS inhibitor being investigated for the treatment of KRAS G12C mutant non small cell lung cancer, colorectal cancer, and appendix cancer.	Immune Checkpoint Inhibitors
Soy isoflavones	0	Not Annotated	\N
Sparfloxacin	392.3998	A fluoroquinolone antibiotic used to treat bacterial respiratory infections and sinusitis.	Anti-Bacterial Agents
Sparsentan	592.76	An endothelin and angiotensin II receptor antagonist indicated to reduce proteinuria in adults with primary immunoglobulin A nephropathy at risk of rapid disease progression.	Agents Acting on the Renin-Angiotensin System
Spectinomycin	332.3496	An aminocyclitol antibiotic used to treat susceptible strains of Neisseria gonorrhoeae.	Anti-Bacterial Agents
Spinosad	1477.963	A pediculicide used topically to treat head lice.	Insecticides
Spiramycin	843.065	A macrolide antimicrobial agent used in the treatment of various bacterial infections.	Anti-Bacterial Agents
Spirapril	466.614	Spirapril is an ACE inhibitor class drug used to treat hypertension.	Agents Acting on the Renin-Angiotensin System
Spironolactone	416.573	An aldosterone receptor antagonist used for the treatment of hypertension, hyperaldosteronism, edema due to various conditions, hirsutism (off-label) and hypokalemia.	Antihypertensive Agents Indicated for Hypertension
Squalene	410.73	Squalene is originally obtained from shark liver oil. It is a natural 30-carbon isoprenoid compound and intermediate metabolite in the synthesis of cholesterol. It is not susceptible to lipid peroxidation...	Polyenes
Stannous chloride	189.62	Stannous chloride is a component of technetium-99m agents indicated for imaging of the skeleton for areas of altered osteogenesis or in the detection of infarcted heart tissue [FDA Label].	\N
Stannous fluoride	156.71	A medication used to treat dental hypersensitivity, produce enamel, prevent gingivitis and cavities, and prevent periodontal infections.	Caries Prophylactic Agents
Stanozolol	328.4916	An anabolic steroid used to manage hereditary angioedema.	Androstan Derivatives
Starch, corn	0	Corn starch refers to the starch extracted from the corn grain that is commonly used as a food ingredient and chemical additive. Starch is any of a group of polysaccharides...	Dietary Carbohydrates
Stavudine	224.2133	A dideoxynucleoside used in the treatment of HIV infection.	Anti-HIV Agents
Stearic acid	284.4772	An ingredient found in topical products as a skin protectant.	Stearic Acids
Steviolbioside	642.739	Steviolbioside has been used in trials studying the treatment of HIV-1 Infection.	Stevia
Stiripentol	234.295	An antiepileptic agent used in combination with other anticonvulsants to treat seizures associated with Dravet syndrome.	Central Nervous System Depressants
Streptomycin	581.5741	An aminoglycoside antibiotic indicated to treat multi-drug resistant mycobacterium tuberculosis and various non-tuberculosis infections.	Streptomycins
Streptozocin	265.2206	A nitrosourea antineoplastic agent used in the treatment of metastatic pancreatic islet cell carcinoma.	Nitrosoureas
Strontium chloride	158.52	A medication used to treat bone pain in skeletal metastases.	Strontium Radioisotopes
Strontium chloride Sr-89	159.81	A radiopharmaceutical agent used for the relief of bone pain in patients with painful skeletal metastases.	Various Pain Palliation Radiopharmaceuticals
Strontium ranelate	513.49	A medication used for the management of severe osteoporosis in high-risk postmenopausal women and adult men.	Bone Density Conservation Agents
Succimer	182.21	A mercaptodicarboxylic acid heavy metal chelator used in the treatment of heavy metal poisoning.	Antidotes
Succinic acid	118.088	For nutritional supplementation, also for treating dietary shortage or imbalance	Succinates
Succinylcholine	290.399	A depolarizing skeletal muscle relaxant used adjunctly to anesthesia and for skeletal muscle relaxation during intubation, mechanical ventilation, and surgical procedures.	Choline Derivatives
Sucralfate	1558.67	A gastro-duodenal protective agent used in the treatment of gastric and duodenal ulcers and to prevent duodenal ulcer recurrence.	Aluminum Complex
Sucrose	342.2965	A nonreducing disaccharide composed of glucose and fructose linked via their anomeric carbons. It is obtained commercially from sugarcane, sugar beet (beta vulgaris), and other plants and used extensively as...	Dietary Sugars
Sufentanil	386.551	An opioid used to induce and maintain anesthesia, to act as an analgesic in labor and delivery, and to treat severe, acute pain.	Opioid Anesthetics
Sugammadex	2002.12	A modified gamma cyclodextrin used to reverse neuromuscular blockade induced by vecuronium bromide and rocuronium bromide which are agents used for anesthesia.	Antidotes
Sulbactam	233.242	An beta-lactamase inhibitor antibiotic combined with other antibiotics to treat a variety of susceptible bacterial infections.	beta-Lactamase Inhibitors
Sulconazole	397.74	A topical antifungal agent used for the treatment of tinea cruris, tinea corporis, and tinea versicolor caused by susceptible fungal strains.	Imidazole and Triazole Derivatives
Sulfabenzamide	276.311	A sulfonamide antibacterial used as an ingredient in various topical and vaginal preparations to treat certain infections, but has been discontinued by the FDA.	Amides
Sulfacetamide	214.242	A sulfonamide used to treat inflammatory ocular conditions and acne vulgaris.	Antiinfectives for Treatment of Acne
Sulfacytine	294.33	Used orally in the treatment of acute urinary tract infections.	Sulfonamides
Sulfadiazine	250.277	A sulfonamide antibiotic used in a variety of infections, such as urinary tract infections, trachoma, and chancroid.	Intermediate-Acting Antibacterial Sulfonamides
Sulfadimethoxine	310.329	For use in the treatment of infections.	Long-Acting Antibacterial Sulfonamides
Sulfadoxine	310.329	A long acting sulfonamide used for the treatment or prevention of malaria.	Anti-Infective Agents
Sulfamerazine	264.304	An antibacterial agent used in the treatment of various bacterial infections, such as bronchitis, prostatitis, and urinary tract infections.	Long-Acting Antibacterial Sulfonamides
Sulfameter	280.3	Long acting sulfonamide used in leprosy, urinary, and respiratory tract infections.	Long-Acting Antibacterial Sulfonamides
Sulfamethazine	278.33	An antibacterial agent used in the treatment of various bacterial infections, such as bronchitis, prostatitis, and urinary tract infections.	Short-Acting Antibacterial Sulfonamides
Sulfamethizole	270.331	A sulfonamide antibiotic used to treat a wide variety of susceptible bacterial infections.	Short-Acting Antibacterial Sulfonamides
Sulfamethoxazole	253.278	An oral sulfonamide antibiotic, given in combination with trimethoprim, used to treat a variety of infections of the urinary tract, respiratory system, and gastrointestinal tract.	Intermediate-Acting Antibacterial Sulfonamides
Sulfametopyrazine	280.303	An antibiotic used in the treatment or prevention of bacterial infections and malaria.	Long-Acting Antibacterial Sulfonamides
Sulfanilamide	172.205	A sulfonamide anti-infective used to treat vulvovaginal candidiasis caused by Candida albicans.	Short-Acting Antibacterial Sulfonamides
Sulfaphenazole	314.362	For the treatment bacterial infections.	Long-Acting Antibacterial Sulfonamides
Sulfapyridine	249.289	A sulfonamide antibiotic used to treat dermatitis herpetiformis, benign mucous membrane pemphigoid and pyoderma gangrenosum.	Short-Acting Antibacterial Sulfonamides
Sulfasalazine	398.393	A salicylate used to treat Crohn's disease, ulcerative colitis, and rheumatoid arthritis.	Salicylates
Sulfathiazole	255.317	Sulfathiazole is effective against a wide range of gram positive and gram negative pathogenic microorganisms. Although no longer used in humans, it is used in cattle.	Short-Acting Antibacterial Sulfonamides
Sulfinpyrazone	404.482	A platelet inhibitory and uricosuric agent used to inhibit thrombotic and embolic processes and to manage the chronic phases of gout .	Preparations Increasing Uric Acid Excretion
Sulfisoxazole	267.304	A sulfonamide antibiotic used with other antibiotics to prevent and treat a variety of bacterial infections.	Short-Acting Antibacterial Sulfonamides
Sulfoxone	404.482	For the treatment of leprosy and dermatitis herpetiformis	Drugs for Treatment of Lepra
Sulfur hexafluoride	146.05	A medication used in ultrasound to enhance viewing of blood vessels and the urinary tract.	Fluorides
Sulindac	356.411	An NSAID used to treat osteoarthritis, rheumatoid arthritis, ankylosing spondylitis, acute subacromial bursitis or supraspinatus tendinitis, and acute gouty arthritis.	Acetic Acid Derivatives and Related Substances
Sulpiride	341.426	A selective D2 dopamine receptor antagonist indicated to treat chronic and acute schizophrenia.	Benzamides and benzamide derivatives
Sultamicillin	594.65	A mutual prodrug of ampicillin and sulbactam useful in the treatment of infections caused by beta-lactamase-producing bacteria.	Anti-Bacterial Agents
Sulthiame	290.359	A carbonic anhydrase inhibitor used primarily in benign focal epilepsies of childhood that may be useful as an adjunct therapy in a variety of other refractory epilepsies.	Anticonvulsants
Sultopride	354.47	Sultopride is used in Japan, Hong Kong, and Europe to treat schizophrenia. It is of the drug class atypical antipsychotics .	Benzamides and benzamide derivatives
Sumatriptan	295.4	A serotonin receptor agonist used to treat migraines and cluster headaches.	Selective Serotonin 5-HT1 Receptor Agonists
Sunitinib	398.4738	A receptor tyrosine kinase inhibitor and chemotherapeutic agent used for the treatment of renal cell carcinoma (RCC) and imatinib-resistant gastrointestinal stromal tumor (GIST).	Protein Kinase Inhibitors
Suprofen	260.308	An NSAID used to prevent pupil constriction in ocular surgery.	Propionates
Suvorexant	450.93	A orexin receptor antagonist used to treat insomnia that is characterized by difficulties with sleep onset and/or sleep maintenance.	Orexin Receptor Antagonists
Synthetic camphor	152.2334	Not Annotated	\N
Synthetic Conjugated Estrogens, A	0	A mixture of estrogens used to treat a variety of postmenopausal symptoms, including vaginal atrophy and dyspareunia.	Estrogens
Synthetic Conjugated Estrogens, B	0	A mixture of estrogens used to treat a variety of postmenopausal symptoms, including vaginal dryness.	Estrogens
Tacrine	198.2637	An anticholinesterase drug used for the management of Alzheimer's disease symptoms.	Aminoacridines
Tacrolimus	804.0182	A calcineurin inhibitor used to prevent organ transplant rejection and to treat moderate to severe atopic dermatitis.	Agents for Dermatitis, Excluding Corticosteroids
Tadalafil	389.404	A phosphodiesterase 5 inhibitor used to treat erectile dysfunction, benign prostatic hyperplasia, and pulmonary arterial hypertension.	5-alpha Reductase Inhibitors
Tafamidis	308.116	A medication used to treat transthyretin-mediated amyloidosis.	Anti-Inflammatory Agents
Tafluprost	452.5313	An ophthalmic prostaglandin analog used to lower intraocular pressure in patients with ocular hypertension or open-angle glaucoma.	Prostaglandins, Synthetic
Talazoparib	380.359	A poly-ADP ribose polymerase inhibitor used to treat HER2-, BRCA mutated locally advanced or metastatic breast cancer and HRR gene-mutated metastatic castration-resistant prostate cancer.	Poly (ADP-ribose) polymerase (PARP) inhibitors
Talbutal	224.2563	For use as a sedative and hypnotic.	Barbiturates, Plain
Talc	379.259	A mineral used to prevent recurrence of malignant pleural effusions in symptomatic patients during thoracoscopy or open thoracotomy.	Antiperspirants
Tamoxifen	371.5146	A selective estrogen receptor modulator used to treat estrogen receptor positive breast cancer, reduce the risk of invasive breast cancer following surgery, or reduce the risk of breast cancer in high risk women.	Anti-Estrogens
Tamsulosin	408.512	An alpha-1A and alpha-1B adrenergic receptor antagonist used to treat benign prostatic hyperplasia, ureteral stones, prostatitis, and female voiding dysfunction.	Sulfonamides
Tannic acid	1701.206	Tannic acid is indicated for cold sores, fever blisters, diaper rash, minor burn or sunburn and prickly heat.\\nVaginally, tannic acid is used as a douche for leukorrhea. It has...	Biopolymers
Tapentadol	221.3385	An opioid used to manage severe pain that has not responded to non-opioid medications, and for which opioid analgesic therapy is appropriate.	Adrenergic Uptake Inhibitors
Tapinarof	254.329	A therapeutic aryl hydrocarbon receptor-modulating agent (TAMA) indicated for the treatment of adult psoriasis.	Aryl Hydrocarbon Receptor Agonist
Tasimelteon	245.322	A melatonin receptor agonist used to treat Non- 24-Hour Sleep-Wake Disorder.	Melatonin Receptor Agonists
Taurine	125.147	An ingredient found in mixture products indicated for nutritional support.	Alkanesulfonic Acids
Taurocholic acid	515.703	The product of conjugation of cholic acid with taurine. Its sodium salt is the chief ingredient of the bile of carnivorous animals. It acts as a detergent to solubilize fats...	Bile Acids and Salts
Taurolidine	284.35	An antimicrobial derivative of taurine used for prophylaxis of catheter-related infections.	Anti-Infective Agents
Tauroursodeoxycholic acid	499.71	The taurine conjugate of ursodeoxycholic acid with antiapoptotic and ER stress response dampening effects used in some countries to treat gallstones. It is also being investigated for a wide variety of other conditions.	Cholagogues and Choleretics
Tavaborole	151.93	An antifungal agent used to treat onychomycosis, a fungal infection of the nail.	Antifungal Agents
Tazarotene	351.462	An acetylenic retinoid used to treat fine wrinkles, mottled pigmentation of the skin, acne vulgaris, and plaque psoriasis.	Keratolytic Agents
Tazemetostat	572.75	A methyltransferase inhibitor indicated to treat patients 16 years and older with metastatic or locally advanced epithelioid sarcoma not eligible for complete resection.	Methyltransferase Inhibitor
Tazobactam	300.291	A beta lactamase inhibitor administered with antibiotics such as piperacillin and ceftolozane to prevent their degradation, resulting in increased efficacy.	beta-Lactamase Inhibitors
Technetium Tc-99m disofenin	449.321	A radiopharmaceutical diagnostic agent used for hepatobiliary scans.	Technetium (99Mtc) Compounds
Technetium Tc-99m etidronate	304.933	Not Annotated	Radiopharmaceuticals
Technetium Tc-99m exametazime	0	A radiopharmaceutical diagnostic agent used as an adjunct for scintigraphy in the detection of altered regional cerebral perfusion in stroke.	Technetium (99Mtc) Compounds
Technetium Tc-99m mebrofenin	484.23	A diagnostic radiopharmaceutical agent used during hepatobiliary imaging tests.	Technetium (99Mtc) Compounds
Technetium Tc-99m medronate	305.906	A diagnostic radiopharmaceutical agent used as a bone imaging agent to delineate areas of altered osteogenesis.	Technetium (99Mtc) Compounds
Technetium Tc-99m nofetumomab merpentan	0	Tc-99m nm is one of the technetium-labeled antibodies and it is indicated for the detection of small-cell lung cancer. The small cell lung cancer is a syndrome characterized by the...	Amino Acids, Peptides, and Proteins
Technetium Tc-99m oxidronate	290.906	Technetium Tc-99m oxidronate is indicated in adult and pediatric patients to be used in skeletal imaging for diagnosis of areas that can present altered osteogenesis. When administered intravenously, it is...	Technetium (99Mtc) Compounds
Technetium Tc-99m pertechnetate	169.968	A radiocontrast agent used for the identification of various organs, including but not limited to the brain, thyroid, placenta, and bladder.	Thyroid Diagnostic Radiopharmaceuticals
Technetium Tc-99m polyphosphate	0	Not Annotated	Acids
Technetium Tc-99m pyrophosphate	272.847	A radiopharmaceutical diagnostic agent used for diagnostic imaging scans for the bones, heart, and gastrointestinal tract.	Technetium (99Mtc) Compounds
Technetium Tc-99m sestamibi	775.96	A radiopharmaceutical diagnostic agent used in nuclear medicine imaging tests to detect coronary artery disease and evaluate myocardial function.	Technetium (99Mtc) Compounds
Technetium Tc-99m succimer	281.11	A radioactive diagnostic agent used as an aid in the scintigraphic evaluation of renal parenchymal disorders.	Technetium (99Mtc) Compounds
Technetium Tc-99m sulfur colloid	355.39	A radiopharmaceutical diagnostic agent used for the localization of lymph nodes, evaluation of peritoneovenous (LeVeen) shunt patency, imaging areas of functioning reticuloendothelial cells, and gastrointestinal imaging.	Technetium (99Mtc), Particles and Colloids
Technetium Tc-99m tetrofosmin	898.86	Technetium-99m tetrofosmin is indicated for the diagnosis of heart abnormalities by exercise myocardial scintigraphy. The exercise myocardial scintigraphy is an established method for the diagnosis of the severity of coronary...	Technetium (99Mtc) Compounds
Technetium Tc-99m tilmanocept	0	A radiopharmaceutical diagnostic imaging agent indicated with or without scintigraphic imaging for lymphatic mapping and guiding sentinel lymph node biopsy.	Technetium (99Mtc) Compounds
Tecovirimat	376.335	An antiviral medication used to treat smallpox, monkeypox, and cowpox.	Anti-Infective Agents
Tedizolid	370.344	An oxazolidinone class antibiotic that inhibits bacterial protein synthesis and is proven to be effective in the treatment of certain Gram-positive bacterial infections.	Anti-Bacterial Agents
Tedizolid phosphate	450.323	An oxazolidinone class antibiotic that inhibits bacterial protein synthesis and is proven to be effective in the treatment of certain Gram-positive bacterial infections.	Anti-Bacterial Agents
Tegafur	200.169	An antineoplastic agent used in combination with other anticancer medications to treat advanced gastric and colorectal cancers.	Pyrimidine Analogues
Tegafur-uracil	312.257	Tegafur-uracil is indicated for the first line treatment of metastatic colorectal cancer with concomitant administration of calcium folinate. Colorectal cancer is the third most diagnosed cancer and 30% of the...	Cytochrome P-450 CYP2A6 Substrates
Tegaserod	301.394	A serotonin-4 (5-HT4) receptor agonist indicated for the treatment of constipation predominant irritable bowel syndrome (IBS-C) specifically in women under the age of 65. There is currently no safety or efficacy data for use of tegaserol in men.	Gastrointestinal Agents
Teicoplanin	1879.67	A glycopeptide antibiotic with a similar mechanism of action and spectrum of activity to vancomycin used to treat various infections caused by gram-positive bacteria.	Glycopeptide Antibacterials
Telaprevir	679.8493	An NS3/4A viral protease inhibitor used in combination with other antivirals for the curative treatment of chronic Hepatitis C Virus infections.	Antivirals for treatment of HCV infections
Telavancin	1755.65	An antibacterial agent used in the treatment of complicated skin and skin structure infections and types of hospital-acquired bacterial pneumonia.	Glycopeptide Antibacterials
Telbivudine	242.2286	A thymidine nucleoside analog used for the treatment of chronic hepatitis B with clinical evidence of viral replication or persistent elevations in serum aminotransferases (ALT or AST).	Nucleoside and Nucleotide Reverse Transcriptase Inhibitors
Telithromycin	812.018	An ketolide used to treat community acquired pneumonia of mild to moderate severity.	Anti-Bacterial Agents
Telmisartan	514.6169	An ARB used to treat hypertension, diabetic nephropathy, and congestive heart failure.	Angiotensin II receptor blockers (ARBs) and calcium channel blockers
Telotristat ethyl	574.99	A tryptophan hydroxylase inhibitor that is used to treat carcinoid syndrome diarrhea.	Tryptophan Hydroxylase Inhibitor
Temazepam	300.74	A short-acting benzodiazepine commonly used to treat panic disorders, severe anxiety, and insomnia.	Anti-Anxiety Agents
Temocillin	414.45	Temocillin has been investigated in Infection, Liver Dysfunction, and Urinary Tract Infection.	Penicillins With Extended Spectrum
Temoporfin	680.764	A photosensitizer used to treat squamous cell carcinomas of the head and neck.	Photosensitizing Agents
Temozolomide	194.1508	An alkylating agent used to treat glioblastoma multiforme and refractory anaplastic astrocytoma.	Alkylating Drugs
Temsirolimus	1030.2871	A antineoplastic agent used in the treatment of renal cell carcinoma (RCC) that works by inhibiting mTOR.	Mammalian target of rapamycin (mTOR) kinase inhibitors
Tenapanor	1145.04	An NHE3 inhibitor indicated for the treatment of constipation-predominant irritable bowel syndrome (IBS-C).	Alimentary Tract and Metabolism
Teniposide	656.654	A cytotoxic drug used as an adjunct for chemotherapy induction in the treatment of refractory childhood acute lymphoblastic leukemia.	Podophyllotoxin Derivatives
Tenofovir alafenamide	476.474	A nucleoside analog reverse transcriptase inhibitor used for the treatment of chronic hepatitis B virus infection in adults with compensated liver disease.	Antiviral Agents
Tenofovir disoproxil	519.448	A nucleotide analog reverse transcriptase inhibitor used in the treatment of Hepatitis B infection and used in the management of HIV-1 infection.	Anti-HIV Agents
Tenoxicam	337.37	An anti inflammatory analgesic used to treat mild to moderate pain as well as the signs and symptoms of rheumatoid arthritis and osteoarthritis.	Oxicams
Tepotinib	492.583	An oral tyrosine kinase inhibitor targeted against MET for the treatment of metastatic non-small cell lung cancer in patients exhibiting MET exon 14 skipping mutations.	Antineoplastic Agents
Terazosin	387.4329	An alpha-1 adrenergic antagonist used in the treatment of symptomatic benign prostatic hyperplasia and management of hypertension.	Adrenergic alpha-1 Receptor Antagonists
Terbinafine	291.4299	An allylamine antifungal used to treat dermatophyte infections of toenails and fingernails as well as other fungal skin infections.	Antifungals for Systemic Use
Terbutaline	225.2842	A beta-2 adrenergic agonist used as a bronchodilator and to prevent premature labor.	Agents producing tachycardia
Terconazole	532.47	An antifungal drug used in the treatment of vulvovaginal candidiasis.	Triazole Derivatives
Terfenadine	471.6734	An antihistamine for the treatment of allergy symptoms.	Benzhydryl Compounds
Teriflunomide	270.2073	A pyrimidine synthesis inhibitor with anti-inflammatory and immunomodulatory properties used to treat patients with the relapsing-remitting form of multiple sclerosis.	Selective Immunosuppressants
Terizidone	302.29	Terizidone has been used in trials studying the treatment of Tuberculosis, HIV Infections, Multidrug Resistant Tuberculosis, and Extensively-drug Resistant Tuberculosis.	Antiinfectives for Systemic Use
Terpin hydrate	190.283	An expectorant used to treat bronchitis, pneumonia, bronchiectasis, COPD, and infectious or inflammatory diseases of the upper respiratory tract.	Expectorants
Testolactone	300.3921	A medication used to treat advanced breast cancer.	Androstadienes
Testosterone	288.4244	A hormone used to treat hypogonadism, breast carcinoma in women, or the vasomotor symptoms of menopause.	3-Oxoandrosten (4) Derivatives
Testosterone cypionate	412.614	An androgen used to treat low or absent testosterone.	Anabolic Agents
Testosterone enantate benzilic acid hydrazone	624.866	Not Annotated	Androstanes
Testosterone enanthate	400.594	An androgen used to treat low or absent testosterone.	Androgens
Testosterone propionate	344.4877	A slow-release anabolic steroid no longer used commonly for the treatment of androgen deficiency or promotion of anabolic effects on muscles.	Androgens
Testosterone undecanoate	456.711	An androgen indicated for testosterone replacement therapy in adult males with primary hypogonadism and hypogonadotropic hypogonadism.	Androgens
Tetrabenazine	317.4226	A vesicular monoamine transporter 2 (VMAT) inhibitor used for the management of chorea associated with Huntington's Disease.	Quinolizines
Tetracaine	264.369	A local anaesthetic agent used to induce local analgesia in the eyes and skin during medical procedures.	Anesthetics for Topical Use
Tetrachlorodecaoxide	319.821	Investigated for use/treatment in acquired immune deficiency syndrome (AIDS) and aids-related infections, cancer/tumors (unspecified), HIV infection, and inflammatory disorders (unspecified).	Radiation-Protective Agents
Tetracosactide	2933.49	A diagnostic agent used in the screening of patients presumed to have adrenocortical insufficiency.	Adrenocorticotropic Hormone
Tetracycline	444.4346	An antibiotic used to treat a wide variety of susceptible infections.	Antiinfectives and Antiseptics for Local Oral Treatment
Tetracycline phosphate complex	4821.729	Not Annotated	Anti-Bacterial Agents
Tetradecyl hydrogen sulfate (ester)	294.45	An anionic surfactant used to treat small uncomplicated varicose veins.	Drugs that are Mainly Renally Excreted
Tetraferric tricitrate decahydrate	967.803	A phosphate binder used to control serum phosphorus levels or as an iron supplement.	Drugs for Treatment of Hyperkalemia and Hyperphosphatemia
Tetrakis(2-methoxyisobutylisocyanide)copper(I) tetrafluoroborate	602.99	Tetrakis (2-methoxyisobutylisocyanide) copper (I) tetrafluoroborate is a component of Cardiolite, a technetium Tc99m-based imaging agent used for assessing myocardial perfusion.	\N
Tetramethylthiuram monosulfide	208.36	Not Annotated	Standardized Chemical Allergen
Tetrofosmin	382.462	A diphosphine complexed with technetium 99 used for imaging to determine myocardial ischemia, infarcted myocardium, and assessment of left ventricular function.	Radioactive Diagnostic Agent
Tetryzoline	200.285	An alpha-adrenergic agonist used in the temporary symptomatic relief of discomfort and redness of the eyes due to minor irritations, as well as alleviate nasal congestion.	Sympathomimetics Used as Decongestants
Tezacaftor	520.505	A medication used to treat homozygous or heterozygous F508del mutation cystic fibrosis.	BCRP/ABCG2 Inhibitors
Thalidomide	258.2295	A medication used to treat cancers, particularly newly diagnosed multiple myeloma, and erythema nodosum leprosum.	Angiogenesis Inhibitors
Thallous chloride	239.836	A diagnostic radiopharmaceutical for myocardial perfusion testing and tests of parathyroid function.	Radioactive Diagnostic Agent
Thallous chloride Tl-201	236.42	A radioisotope indicated for cardiac perfusion scintigraphy	Diagnostic Radiopharmaceuticals
Thenalidine	286.435	Withdrawn from the Canadian, US, and UK markets in 1963 due to concerns involving neutropenia.	Antihistamines for Topical Use
Thenyldiamine	261.39	An ingredient in products indicated to treat rhinitis caused by the common cold.	\N
Theophylline	180.164	A xanthine used to manage the symptoms of asthma, COPD, and other lung conditions caused by reversible airflow obstruction.	Xanthines and Adrenergics
Thiabendazole	201.248	A benzimidazole used in the treatment of strongyloides, cutaneous larva migrans, visceral larva migrans, and trichinosis infections.	Benzimidazole Derivatives
Thiamine	265.355	A vitamin used to correct vitamin B1 deficiency.	Vitamins
Thiamylal	254.349	Used for the production of complete anaesthesia of short duration, for the induction of general anaesthesia, and for inducing a hypnotic state.	Hypnotics and Sedatives
Thiethylperazine	399.616	A drug used for the treatment of nausea and vomiting.	Phenothiazine Derivatives
Thimerosal	404.81	Used as preservative in some cosmetics, topical pharmaceuticals, and biological drug products, which includes vaccines [L1671, L1672, L1673].	Mercurial Products
Thiohexam	264.41	Thiohexam is approved for use within allergenic epicutaneous patch tests which are indicated for use as an aid in the diagnosis of allergic contact dermatitis (ACD) in persons 6 years...	Standardized Chemical Allergen
Thiopental	242.338	A barbiturate used to induce general anesthesia, treat convulsions, and reduce intracranial pressure.	Barbiturates, Plain
Thioredoxin	0	Thioredoxin is a small dithiol protein and specific reductant for major allergenic proteins present in foods from animal and plant products. It is a 12-kD oxidoreductase enzyme encoded by TXN...	Proteins
Thioridazine	370.575	A phenothiazine antipsychotic used to treat schizophrenia and generalized anxiety disorder.	Phenothiazines With Piperidine Structure
Thiosulfuric acid	114.144	A sulfur donor used sequentially with sodium nitrite for the reversal of life-threatening acute cyanide poisoning. Also used to reduce the risk of ototoxicity associated with cisplatin.	Antidotes
Thiotepa	189.218	An alkylating agent used to prevent graft rejection in stem cell transplantation and to treat a variety of malignancies including certain types of adenocarcinoma and superficial bladder carcinomas.	Ethylene Imines
Thiothixene	443.625	An antipsychotic indicated for the management of schizophrenia.	Thioxanthene Derivatives
Thiram	240.433	Thiram may be used in dermatology as a scabicide . Thiram is mainly used as a fungicide for plants and treatment for seeds, however, this use is being investigated for...	Sulfur Containing Products
Thonzonium	511.818	A cationic surfactant used to disperse exudate and cellular debris, as well as enhance the penetration of antimicrobials.	Amines
Thonzylamine	286.379	Thozylamine is indicated for use in the symptomatic control of allergic rhinitis or other upper respiratory allergic symptoms [FDA Label]. It is typically a part of combination over the counter...	Antiallergic Agents, Excl. Corticosteroids
Threonine	119.1192	An amino acid commonly found as a component of total parenteral nutrition.	Amino Acids, Essential
Thymol	150.2176	An essential oil found in various over-the-counter antibacterial and antifungal products.	Anti-Infective Agents
Tiagabine	375.548	An antiepileptic used to treat partial seizures.	Fatty Acid Derivatives
Tiaprofenic acid	260.308	A nonsteroidal anti-inflammatory (NSAID) used to manage inflammation and analgesia associated with rheumatoid arthritis and osteoarthritis.	Propionates
Tibolone	312.453	For the relief of post-menopausal symptoms and for the prevention of osteoporosis .	Anabolic Agents
Ticagrelor	522.568	A P2Y12 platelet inhibitor used in patients with a history of myocardial infarction or with acute coronary syndrome (ACS) to prevent future myocardial infarction, stroke and cardiovascular death.	Platelet Aggregation Inhibitors Excl. Heparin
Ticarcillin	384.427	A beta lactam antibiotic used to treat a variety of infections in the body.	Penicillins With Extended Spectrum
Ticlopidine	263.786	A platelet aggregation inhibitor used in the prevention of conditions associated with thrombi, such as stroke and transient ischemic attacks (TIA).	Platelet Aggregation Inhibitors Excl. Heparin
Tigecycline	585.6487	A glycylcycline antibiotic used to treat a number of susceptible bacterial infections.	Anti-Bacterial Agents
Tilarginine	188.2275	Tilarginine has been investigated for the basic science, treatment, and diagnostic of Obesity, Type 2 Diabetes, Ocular Physiology, and Regional Blood Flow.	Arginine
Tilbroquinol	238.084	Tilbroquinol was approved in France, Morocco, and Saudi Arabia but it has been withdrawn in France and Saudi Arabia markets mainly due to its hepatotoxicity risk outweighing the drug benefit...	Hydroxyquinoline Derivatives
Tilmanocept	0	Tilmanocept is under investigation in clinical trial NCT03241446 (Pharmacokinetics and Dosimetry of Tc 99m Tilmanocept Following a Single Intravenous Dose Administration in Male and Female Subjects Diagnosed With Rheumatoid Arthritis...	\N
Timolol	316.42	A non-selective beta adrenergic blocker used in the treatment of elevated intraocular pressure in ocular hypertension or open angle glaucoma.	Beta Blocking Agents, Non-Selective
Tinidazole	247.272	A nitroimidazole used to treat trichomoniasis, giardiasis, amebiasis, and bacterial vaginosis.	Imidazole Derivatives
Tinzaparin	0	A low molecular weight heparin used for the treatment of acute symptomatic deep vein thrombosis with or without pulmonary embolism when administered in conjunction with warfarin.	Anticoagulants
Tioconazole	387.711	An imidazole antifungal used to treat vulvovaginal candidiasis.	Imidazole and Triazole Derivatives
Tioguanine	167.192	A purine analogue antineoplastic agent used for the induction of remission, and for remission consolidation in patients with acute nonlymphocytic anemias.	Purine Analogues
Tiopronin	163.19	A thiol agent indicated for the prevention of kidney stone formation in patients with severe homozygous cystinuria.	Amino Acids, Sulfur
Tiotropium	392.512	A long-acting bronchodilator used in the management of chronic obstructive pulmonary disease (COPD).	Agents producing tachycardia
Tipiracil	242.662	A thymidine phosphorylase inhibitor used as an adjunct treatment of adult patients with certain types of gastric or colorectal malignancies.	Thymidine Phosphorylase Inhibitor
Tipranavir	602.664	A protease inhibitor used to treat HIV-1 resistant to more than 1 protease inhibitor.	Anti-HIV Agents
Tirbanibulin	431.536	A tyrosine kinase and tubulin inhibitor used to treat actinic keratosis on the face or scalp.	Enzyme Inhibitors
Tirofiban	440.597	A platelet aggregation inhibitor used to prevent thrombotic events in non-ST elevated acute coronary syndrome.	Platelet Aggregation Inhibitors Excl. Heparin
Titanium dioxide	79.865	A sunscreen agent found in sunscreens that absorbs UV rays.	Biocompatible Materials
Tivozanib	454.863	A kinase inhibitor to treat adult patients with renal cell carcinoma (RCC) who have failed prior systemic therapies or experienced relapsed disease.	Protein Kinase Inhibitors
Tixocortol	378.53	A corticosteroid used for the symptomatic treatment of rhinitis, pharyngitis, and ulcerative colitis.	Corticosteroids
Tizanidine	253.711	An alpha-2 adrenergic agonist used for the short-term treatment of muscle spasticity.	Agents producing tachycardia
Tobramycin	467.5145	An aminoglycoside antibiotic used to treat cystic fibrosis-associated bacterial, lower respiratory tract, urinary tract, eye, skin, bone, and skin structure infections.	Aminoglycoside Antibacterials
Tocainide	192.2575	An orally active class 1b antiarrhythmic agent that interferes with cardiac sodium channels and typically used to treat ventricular arrhythmias.	Antiarrhythmic agents
Tocofersolan	0	A derivative of alpha tocopherol used to treat vitamin E deficiencies.	Drug Carriers
Tocopherol	0	Tocopherol can be used as a dietary supplement for patients with a deficit of vitamin E; this is mainly prescribed in the alpha form. Vitamin E deficiency is rare, and...	Vitamins
Tofacitinib	312.3696	A Janus kinase (JAK) inhibitor used to treat rheumatic conditions, such as rheumatoid arthritis and ankylosing spondylitis, and ulcerative colitis.	Selective Immunosuppressants
Tolazamide	311.4	A sulfonylurea used in the treatment of non insulin dependent diabetes mellitus.	Sulfonylureas
Tolazoline	160.2157	A vasodilator used to treat pulmonary artery anomalies.	Imidazoline Derivatives
Tolbutamide	270.348	A sulfonylurea used to treat hyperglycemia in patients with type 2 diabetes mellitus.	Tests for Diabetes
Tolcapone	273.2408	A catechol-O-methyltransferase (COMT) inhibitor used as adjunct therapy in the symptomatic management of idiopathic Parkinson's disease.	Anti-Parkinson Drugs
Tolevamer	0	A potassium-binding resin used in the treatment of hyperkalemia.	Drugs for Treatment of Hyperkalemia and Hyperphosphatemia
Tolfenamic acid	261.704	In the information for tolfenamic acid, it is stated that this drug, being an NSAID, is effective in treating the pain associated with the acute attack of migraines in adults.	Fenamates
Tolmetin	257.2845	An NSAID used to treat acute flares of various painful conditions and used for the long term management of osteoarthritis, rheumatoid arthritis, and juvenile arthritis.	Acetic Acid Derivatives and Related Substances
Tolnaftate	307.409	An antifungal agent used to treat various skin infections caused by fungi.	Antifungal Agents
Tolterodine	325.4876	A muscarinic receptor antagonist used to treat overactive bladder with urinary incontinence, urgency, and frequency.	Drugs for Urinary Frequency and Incontinence
Tolvaptan	448.941	A selective vasopressin V2-receptor antagonist to slow kidney function decline in patients at risk for rapidly progressing autosomal dominant polycystic kidney disease (ADPKD). Also used to treat hypervolemic and euvolemic hyponatremia.	Antidiuretic Hormone Receptor Antagonists
Topiramate	339.362	An anticonvulsant drug used in the control of epilepsy and in the prophylaxis and treatment of migraines.	Centrally Acting Antiobesity Products
Topotecan	421.4458	An antineoplastic agent used to treat ovarian cancer, small cell lung cancer, or cervical cancer.	Topoisomerase 1 (TOP1) inhibitors
Torasemide	348.42	A diuretic used to treat hypertension and edema associated with heart failure, renal failure, or liver disease.	Sulfonamides
Toremifene	405.96	A first generation nonsteroidal selective estrogen receptor modulator used to treat certain breast cancers.	Anti-Estrogens
Trabectedin	761.837	An alkylating agent approved for the treatment of unresectable or metastatic soft tissue sarcoma (liposarcoma or leiomyosarcoma).	Alkylating Drugs
Tramadol	263.381	A centrally-acting opioid agonist and SNRI (serotonin/norepinephrine reuptake inhibitor) used for the management of moderate to severe pain in adults.	Agents producing tachycardia
Trametinib	615.3948	A kinase inhibitor used alone or in combination with dabrafenib to treat patients with cancers with specific BRAF mutations, such as melanoma and non-small cell lung cancer.	Mitogen-activated protein kinase (MEK) inhibitors
Trandolapril	430.5372	A prodrug of an ACE inhibitor used to treat hypertension, congestive heart failure, and to improve survival following a myocardial infarction.	ACE Inhibitors and Calcium Channel Blockers
Tranexamic acid	157.2102	An antifibrinolytic used to reduce or prevent hemorrhagic episodes, especially in the context of hyperfibrinolytic disorders.	Amino Acids
Tranylcypromine	133.194	A monoamine oxidase inhibitor used to treat major depressive disorder.	Monoamine Oxidase Inhibitors, Non-Selective
Travoprost	500.5477	A prostaglandin analog used in the treatment of elevated intraocular pressure due to open angle glaucoma or ocular hypertension.	Antihypertensive Agents
Trazodone	371.864	A serotonin uptake inhibitor used to treat major depressive disorder.	Agents that produce hypertension
Treosulfan	278.29	Treosulfan is under investigation in Allogeneic Haematopoietic Stem Cell Transplantation. Treosulfan has been investigated for the treatment of Lymphoblastic Leukemia, Acute, Childhood.	Alkanesulfonates
Treprostinil	390.5131	A prostacyclin vasodilator for the treatment of pulmonary arterial hypertension to relieve exercise associated symptoms and to prevent clinical deterioration after stopping epoprostenol.	Platelet Aggregation Inhibitors Excl. Heparin
Tretinoin	300.442	A vitamin A derivative used to treat acne vulgaris and certain types of promyelocytic leukemia, as well as various skin conditions in over-the-counter medications.	Retinoids for cancer treatment
Triamcinolone	394.4339	A glucocorticoid used to treat a wide variety of inflammatory conditions of organ systems and tissues.	Corticosteroids for Local Oral Treatment
Triamterene	253.2626	A potassium-sparing diuretic used in the treatment of edema and in the management of hypertension.	Drugs causing inadvertant photosensitivity
Triazolam	343.21	A benzodiazepine used for short term treatment of insomnia.	Adjuvants, Anesthesia
Trichlormethiazide	380.656	Used in the treatment of oedema (including that associated with heart failure) and hypertension.	Low-Ceiling Diuretics and Potassium-Sparing Agents
Trichloroacetate	0	Trichloroacetate, or trichloroacetic acid, is a strong acid prepared by the reaction of chlorine with acetic acid in the presence of a suitable catalyst. In clinical chemistry and biochemistry, it...	Caustics
Trichloroethylene	131.388	Trichloroethylene is a halocarbon commonly used as an industrial solvent, not to be confused with the similar 1,1,1-trichloroethane, also known as chlorothene. It has been sold under a variety of...	Hydrocarbons, Halogenated
Trichophyton verrucosum	0	Trichophyton verrucosum is a fungus which can provoke allergic reactions. Trichophyton verrucosum extract is used in allergenic testing.	\N
Triclabendazole	359.65	An anthelmintic drug used to treat fascioliasis.	Antihelminthic
Triclocarban	315.58	An antibacterial agent used in liquid soaps and body washes.	Anti-Infective Agents, Local
Triclofos	229.37	Not Annotated	Central Nervous System Depressants
Triclosan	289.542	An antimicrobial agent in clinical setting for disinfection, and prevention of spread and growth of bacteria, fungus, and mildew.	Medicated Dressings With Antiinfectives
Triethylenetetramine	146.2339	A copper chelating agent used for the management of Wilson's disease in cases where penicillamine therapy is clinically inappropriate.	Various Alimentary Tract and Metabolism Products
Trifarotene	459.586	A topical retinoid indicated for the treatment of acne vulgaris.	Retinoids for Topical Use in Acne
Trifluoperazine	407.496	A phenothiazine used to treat depression, anxiety, and agitation.	Phenothiazines With Piperazine Structure
Triflupromazine	352.417	Used mainly in the management of psychoses. Also used to control nausea and vomiting.	Phenothiazines With Aliphatic Side-Chain
Trifluridine	296.1999	A nucleoside metabolic inhibitor used to treat keratoconjunctivitis and epithelial keratitis caused by simplex virus, and as a part of chemotherapy for certain types of metastatic gastrointestinal cancers.	Pyrimidine Analogues
Triflusal	248.157	A medication related to acetylsalicylic acid with antithrombotic effects used in the treatment of thromboembolic diseases.	Platelet Aggregation Inhibitors Excl. Heparin
Triheptanoin	428.61	Triheptanoin is a medium chain triglyceride indicated to provide calories and fatty acids to treat long chain fatty acid oxidation disorders.	Various Alimentary Tract and Metabolism Products
Trihexyphenidyl	301.4662	An antispasmodic drug used as an adjunct drug in the management of parkinsonism and as a treatment for extrapyramidal symptoms caused by drugs affecting the central nervous system (CNS).	Tertiary Amines
Trilaciclib	446.559	A CDK4 and CDK6 inhibitor to reduce the risk of chemotherapy induced myelosuppression.	Detoxifying Agents for Antineoplastic Treatment
Trilostane	329.4333	Used in the treatment of Cushing's syndrome. It is normally used in short-term treatment until permanent therapy is possible.	Anticorticosteroids
Trimebutine	387.476	A spasmolytic agent used for the symptomatic treatment of irritable bowel syndrome (IBS) and treatment of postoperative paralytic ileus following abdominal surgery.	Synthetic Anticholinergics, Esters With Tertiary Amino Group
Trimetazidine	266.341	A piperazine derivative indicated as an adjunct therapy in symptomatic treatment of stable angina pectoris.	Piperazines
Trimethadione	143.1406	An anticonvulsant agent indicated for the control of treatment-refractory petit mal seizures.	Oxazolidine Derivatives
Trimethaphan	365.512	For the controlled reduction of blood pressure during surgery and in the treatment of hypertensive emergencies.	Sulfonium Derivatives
Trimethobenzamide	388.4574	An antiemetic used to treat postoperative nausea and vomiting and nausea associated with gastroenteritis.	Aminoalkyl Ethers
Trimethoprim	290.3177	An antifolate antibiotic often used in combination with sulfamethoxazole to treat a number of infections, including those of the urinary tract, respiratory tract, and gastrointestinal tract.	Trimethoprim and Derivatives
Trimetrexate	369.4176	A folate antagonist used for the treatment of moderate-to-severe Pneumocystis carinii pneumonia (PCP) in immunocompromised patients as an alternative therapy in combination with leucovorin.	Folic Acid Antagonists
Trimipramine	294.4338	A tricyclic antidepressant used to treat depression.	Non-Selective Monoamine Reuptake Inhibitors
Trioxsalen	228.2433	A psoralen derivative that has been used in combination with UV light to treat vitiligo, but has been discontinued by its manufacturer.	Psoralens for Systemic Use
Tripelennamine	255.358	A histamine H1 antagonist used to treat hypersensitivity reactions, coughs, and the common cold.	Antihistamines for Topical Use
Triprolidine	278.3914	A sedating antihistamine combined with pseudoephedrine and guaifenesin in various types of cold and allergy medications to relieve allergy symptoms, hay fever and common cold symptoms, and to aid in sleep.	Anti-Allergic Agents
Triptorelin	1311.473	A GnRH agonist indicated for the palliative treatment of advanced prostate cancer.	Gonadotropin-releasing hormone agonist
Tritoqualine	500.548	Not Annotated	Cholagogues and Choleretics
Trofinetide	315.326	A drug used to treat Rett syndrome in children and adults.	Amino Acids
Troglitazone	441.54	For the treatment of Type II diabetes mellitus. It is used alone or in combination with a sulfonylurea, metformin, or insulin as an adjunct to diet and exercise.	Thiazolidinediones
Trolamine	149.1882	Trolamine is used as an alkalizing agent, surfactant, and counter-ion in cosmetic and pharmaceutical formulations . It is not considered to be an active pharmacological ingredient and so has no...	Alcohols
Trolamine polypeptide oleate condensate	0	Various ear diseases and infections are treated with eardrops containing triethanolamine polypeptide oleate-condensate, such as Cerumenex in the United States and Canada.	\N
Trolamine salicylate	287.312	A medication used to relieve minor aches and pains of the muscles and joints.	Sunscreen Agents
Troleandomycin	813.9684	For the treatment of bacterial infection.	Anti-Bacterial Agents
Tromantadine	280.412	Tromantadine is marketed as Viru-Merz in the Czech Republic . It is an antiviral used in the treatment of herpes zoster and simplex.	Antiviral Agents
Tromethamine	121.135	A proton acceptor used for the prevention and correction of metabolic acidosis associated with various clinical conditions, such as cardiac bypass surgery.	Solutions Affecting the Electrolyte Balance
Tropicamide	284.3529	A muscarinic receptor antagonist used to induce mydriasis and cycloplegia for diagnostic procedures.	Anticholinergic Agents
Tropisetron	284.3529	A 5HT-3 receptor antagonist used as an antiemetic in the treatment of chemotherapy-induced nausea and vomiting.	Serotonin 5-HT3 Receptor Antagonists
Trospium	392.518	An antimuscarinic agent used to treat the symptoms of overactive bladder (OAB).	Drugs for Urinary Frequency and Incontinence
Trovafloxacin	416.36	An antibiotic used to treat gonorrhea and chlamydia.	Fluoroquinolones
Trypan blue free acid	872.87	A dye used as a visualizing aid to stain the epiretinal membranes during ophthalmic surgical vitrectomy procedures, thereby facilitating removal of the tissue.	Azo Compounds
Trypsin	0	A naturally occurring proteolytic enzyme found in the digestive tract of mammals. Used clinically in combination with bromelain and rutosides in the treatment of some inflammatory conditions.	Enzymes
Tryptophan	204.2252	An amino acid commonly found as a component of total parenteral nutrition.	Amino Acids, Aromatic
Tubocurarine	609.7312	Tubocurarine is a non-depolarizing neuromuscular blocking agent and the first identified curare alkaloid. Curare is one of the names used to describe plant-derived poisons used by indigenous South Americans to...	Curare Alkaloids
Tucatinib	480.532	A kinase inhibitor used to treat certain types of unresectable/metastatic HER-2 positive breast cancer.	Human epidermal growth factor receptor 2 (HER2) tyrosine kinase inhibitors
Turpentine	0	A medication used to treat minor aches and pains of muscles and joints.	Irritants
Tyloxapol	0	Tyloxapol is an inhaled surfactant that assists in removing and liquefying and removing bronchopulmonary secretions with mucus and pus. Tyloxapol is administered either through nebulized solution or a stream of...	Expectorants
Tyropanoic acid	641.026	For use in cholecystography (X-ray diagnosis/imaging of gallstones).	Watersoluble, Hepatotropic X-Ray Contrast Media
Tyrosine	181.1885	An amino acid commonly found as a component in total parenteral nutrition.	Amino Acids, Aromatic
Tyrothricin	0	A topical antibiotic with broad spectrum activity against Gram positive bacteria and some fungal infections.	Anti-Bacterial Agents
Ubidecarenone	863.3435	A cofactor found in various dietary supplements.	Electron Transport Chain Complex Proteins
Ubiquinol	865.3594	Ubiquinol (CoQH2) is a reduced form of coenzyme Q10 (CoQ10) that acts as an active antioxidant that prevents the initiation and propagation of lipid peroxidation in biological membranes and human...	Benzoquinones
Ubrogepant	549.554	An oral CGRP antagonist used in the acute treatment of migraine with or without aura.	Calcitonin Gene-Related Peptide (CGRP) Antagonists
Udenafil	516.656	A PDE5 inhibitor used to treat erectile dysfunction.	Drugs Used in Erectile Dysfunction
Ulipristal	433.592	A selective progesterone receptor modulator used for emergency contraception after unprotected intercourse or in a situation where a planned method of contraception has failed.	Contraceptives, Postcoital
Ulobetasol	428.9	A lipocortin corticosteroid used to treat inflammatory and pruritic corticosteroid-responsive dermatoses.	Corticosteroids, Potent (Group III)
Umbralisib	571.56	A kinase inhibitor used to treat rare forms of refractory lymphoma.	Kinase Inhibitor
Umeclidinium	428.595	A long-acting muscarinic antagonist used as a long-term maintenance treatment of airflow obstruction in patients with chronic obstructive pulmonary disease (COPD).	Agents producing tachycardia
Undecoylium chloride iodine complex	272.73	Not Annotated	\N
Undecylenic acid	184.2753	An antifungal used to treat tinea species infections.	Antifungals for Dermatological Use
Unoprostone	382.541	A prostaglandin analogue used to lower intraocular pressure in patients with open-angle glaucoma or ocular hypertension who are clinically unresponsive to other ocular antihypertensive agents.	Antihypertensive Agents
Upadacitinib	380.375	An oral Janus kinase (JAK)1-selective inhibitor used in the treatment of moderate to severe rheumatoid arthritis, active psoriatic arthritis, ankylosing spondylitis, and severe atopic dermatitis, including in patients who did not respond well to other therapies.	Selective Immunosuppressants
Uracil mustard	252.098	Used for its antineoplastic properties.	Nitrosoureas
Urea	60.0553	A keratolytic emollient used to treat hyperkeratotic lesions and moisturize the skin.	Carbamide products
Urea C-13	61.048	A diagnostic agent used for the detection of urease associated with Helicobacter pylori in the human stomach and initial diagnosis or post-treatment monitoring of Helicobacter pylori infection in adults.	Helicobacter pylori Diagnostic
Urea C-14	62.048	A diagnostic agent used for the detection of urease associated with Helicobacter pylori in the human stomach and initial diagnosis or post-treatment monitoring of Helicobacter pylori infection in adults.	Radioactive Diagnostic Agent
Urethane	89.0932	Urethane, formerly marketed as an inactive ingredient in Profenil injection, was determined to be carcinogenic and was removed from the Canadian, US, and UK markets in 1963.	Anesthetics, Intravenous
Uridine triacetate	370.314	A pyrimidine analog used for the reversal of overdose, regardless of the presence of symptoms, and early-onset, severe or life-threatening CNS toxicity or cardiotoxicity of fluorouracil or capecitabine.	Various Alimentary Tract and Metabolism Products
Ursodeoxycholic acid	392.572	A bile acid used for the treatment of primary biliary cirrhosis (PBC).	Bile Acid Preparations
Vaborbactam	297.13	A beta lactamase inhibitor used to treat complicated urinary tract infections.	beta-Lactamase Inhibitors
Vadadustat	306.7	An oral hypoxia-inducible factor prolyl-hydroxylase inhibitor used to treat symptomatic anemia associated with chronic kidney disease in adults on chronic maintenance dialysis.	Amino Acids
Valaciclovir	324.3357	An guanine nucleoside antiviral used to treat herpes exacerbations.	Nucleosides and Nucleotides Excl. Reverse Transcriptase Inhibitors
Valbenazine	418.578	A vesicular monoamine transporter 2 inhibitor used to treat tardive dyskinesia.	Vesicular Monoamine Transporter 2 Inhibitor
Valdecoxib	314.359	A COX-2 inhibitor used to treat osteoarthritis and dysmenorrhoea.	COX-2 Inhibitors
Valganciclovir	354.3617	An antiviral medication used to treat cytomegalovirus (CMV) retinitis in patients diagnosed with acquired immunodeficiency syndrome (AIDS).	Nucleosides and Nucleotides Excl. Reverse Transcriptase Inhibitors
Valine	117.1463	An amino acid commonly found as a component of total parenteral nutrition.	Amino Acids, Branched-Chain
Valproate bismuth	638.598	A medication used to treat laryngitis.	Neurotoxic agents
Valproic acid	144.2114	An anticonvulsant used to control complex partial seizures and both simple and complex absence seizures.	Fatty Acid Derivatives
Valrubicin	723.651	An anthracycline used intravesically in the treatment of BCG-resistant bladder carcinoma.	Anthracyclines and Related Substances
Valsartan	435.5188	An angiotensin-receptor blocker used to manage hypertension alone or in combination with other antihypertensive agents and to manage heart failure in patients who are intolerant to ACE inhibitors.	Angiotensin II Antagonists and Calcium Channel Blockers
Vanadium	50.9415	A micronutrient used in some multivitamins and parenteral nutrition.	Metals, Heavy
Vancomycin	1449.254	A glycopeptide antibiotic used to treat severe but susceptible bacterial infections such as MRSA (methicillin-resistant Staphylococcus aureus) infections.	Anti-Bacterial Agents
Vandetanib	475.354	An antineoplastic kinase inhibitor used to treat symptomatic or progressive medullary thyroid cancer in patients with unresectable locally advanced or metastatic disease.	Protein Kinase Inhibitors
Vanillyl butyl ether	210.2695	Vanillyl butyl ether is an ether of monohydroxybenzoic acid. It is added to food products as a flavoring agent. It is also present in cosmetics and personal care products as...	\N
Vardenafil	488.603	A phosphodiesterase 5 inhibitor used to treat erectile dysfunction.	Drugs Used in Erectile Dysfunction
Varenicline	211.268	A partial agonist at nicotinic acetylcholine receptors used as an aid in smoking cessation.	Drugs Used in Nicotine Dependence
Vasopressin	2140.46	A peptide hormone used to increase blood pressure in patients with vasodilatory shock who are resistant to fluid and catecholamine therapy.	Vasopressin and Analogues
Vecuronium	557.8274	A nondepolarizing neuromuscular blocking agent used to relax muscles or as an adjunct in general anesthesia during surgical procedures.	Androstanols
Velpatasvir	883.019	A NS5A inhibitor used to treat chronic hepatitis C infections in patients without cirrhosis or with compensated cirrhosis.	Antivirals for treatment of HCV infections
Vemurafenib	489.922	A kinase inhibitor used to treat patients with Erdheim-Chester Disease who have the BRAF V600 mutation, and melanoma in patients who have the BRAF V600E mutation.	B-Raf serine-threonine kinase (BRAF) inhibitors
Venetoclax	868.45	A BCL-2 inhibitor used to treat chronic lymphocytic leukemia, small lymphocytic lymphoma, or acute myeloid leukemia.	BCL-2 Inhibitor
Venlafaxine	277.4018	A selective serotonin and norepinephrine reuptake inhibitor (SNRI) used for the treatment of major depression, generalized or social anxiety disorder, and panic disorder.	Agents producing tachycardia
Verapamil	454.6016	A non-dihydropyridine calcium channel blocker used in the treatment of angina, arrhythmia, and hypertension.	ACE Inhibitors and Calcium Channel Blockers
Vericiguat	426.388	A soluble guanylate cyclase stimulator used to reduce heart failure-related hospitalization and cardiovascular death in patients with chronic systolic heart failure.	Soluble Guanylate Cyclase Stimulator
Vernakalant	349.471	An antiarrhythmic medication used to treat patients with atrial fibrillation.	Antiarrhythmic agents
Verteporfin	718.7942	A benzoporphyrin derivative used to treat pathological myopia, ocular histoplasmosis, and choroidal neovascularization in macular degeneration.	Antineovascularisation Agents
Vibegron	444.535	A beta-3 adrenergic agonist the treatment of overactive bladder (OAB) with symptoms of urge urinary incontinence, urgency, and urinary frequency in adults.	Adrenergic Agonists
Vidarabine	267.2413	An antiviral agent used to treat various viral infections.	Antiviral Agents
Vigabatrin	129.157	An irreversible GABA transaminase inhibitor used as an adjunct therapy to treat refractory complex partial seizures in patients ≥2 years unresponsive to alternatives. May also be used as monotherapy to treat infantile spasms in infants 1 month to 2 years.	Fatty Acid Derivatives
Vilanterol	486.43	A long-acting beta2-adrenergic agonist used in combination with other bronchodilators for the management of chronic obstructive pulmonary disease (COPD), including chronic bronchitis and/or emphysema.	Agents producing tachycardia
Vilazodone	441.5249	An antidepressant agent used for the treatment of major depressive disorder that targets the 5-HT transporter and 5-HT1A receptors.	Agents that produce hypertension
Vildagliptin	303.3993	A once-daily dipeptidyl peptidase 4 (DPP-4) inhibitor used in the management of type 2 diabetes mellitus.	DPP-IV Inhibitors
Viloxazine	237.299	A selective norepinephrine reuptake inhibitor indicated for the treatment of Attention Deficit Hyperactivity Disorder (ADHD) in adults in children.	Adrenergic Uptake Inhibitors
Vinblastine	810.9741	A vinca alkaloid used to treat breast cancer, testicular cancer, neuroblastoma, Hodgkin's and non-Hodgkins lymphoma, mycosis fungoides, histiocytosis, and Kaposi's sarcoma.	Antineoplastic Agents, Phytogenic
Vincristine	824.972	A vinca alkaloid used to treat acute leukemia, malignant lymphoma, Hodgkin's disease, acute erythraemia, and acute panmyelosis.	Neurotoxic agents
Vindesine	753.941	A vinca alkaloid derived from vinblastine used for various types of malignancies, but mainly acute lymphocytic leukemia (ALL).	Vinca Alkaloids
Vinflunine	816.944	A vinca alkaloid used to treat advanced or metastatic transitional cell carcinoma of the urothelial tract after a platinum containing treatment has failed.	Vinca Alkaloids
Vinorelbine	778.947	A vinca alkaloid used in the treatment of metastatic non-small cell lung carcinoma (NSLC) and in conjunction with other drugs in locally advanced NSCLC.	Neurotoxic agents
Viomycin	685.69	Viomycin is an essential component in the drug cocktail currently used to fight infections of Mycobacterium tuberculosis.	Anti-Bacterial Agents
Vismodegib	421.297	A hedgehog pathway inhibitor used to treat patients with locally advanced or metastatic basal cell carcinoma.	Hedgehog pathway inhibitors
Vitamin A	286.4516	A vitamin important for retinal function that is used clinically to correct vitamin A deficiency.	Retinoids for Topical Use in Acne
Vitamin D	0	An ingredient found in a variety of supplements and vitamins.	Bone Density Conservation Agents
Vitamin E	430.7061	An antioxidant vitamin used in many skin creams and multivitamin preparations.	Antioxidants
Voclosporin	1214.646	A calcineurin inhibitor for the treatment of lupus nephritis (LN) in patients diagnosed with systemic lupus erythematosus (SLE).	Calcineurin Inhibitors
Vonoprazan	345.39	A potassium-competitive acid blocker used in the treatment of acid-related disorders and as an adjunct to Helicobacter pylori eradication.	Alimentary Tract and Metabolism
Vorapaxar	492.5817	A platelet aggregation inhibitor used to reduce thrombotic cardiovascular events in patients with a history of myocardial infarction (MI) or peripheral arterial disease (PAD).	Platelet Aggregation Inhibitors Excl. Heparin
Voriconazole	349.3105	A triazole compound used to treat fungal infections.	Triazole and tetrazole derivatives
Vorinostat	264.3202	A histone deacetylase (HDAC) inhibitor used for the treatment of cutaneous manifestations in patients with progressive, persistent, or recurrent cutaneous T- cell lymphoma (CTCL) following prior systemic therapies.	Histone deacetylase (HDAC) inhibitors
Vortioxetine	298.45	A serotonin modulating antidepressant indicated for the treatment of major depressive disorder (MDD).	Agents that produce hypertension
Voxelotor	337.379	A drug used to inhibit the polymerization of hemoglobin S, preventing the painful and sometimes lethal vaso-occlusive crises associated with sickle cell disease.	Hematologic Agents
Voxilaprevir	868.94	A nonstructural protein 3 and 4a protease inhibitor used to treat Hepatitis C infections.	Antivirals for treatment of HCV infections
Warfarin	308.3279	A vitamin K antagonist used to treat venous thromboembolism, pulmonary embolism, thromboembolism with atrial fibrillation, thromboembolism with cardiac valve replacement, and thromboembolic events post myocardial infarction.	4-Hydroxycoumarins
Water	18.0153	A naturally-occurring element used as an ingredient and vehicle in various pharmaceutical preparations of water.	Diluents
Xamoterol	339.392	Xamoterol is a β1-adrenoceptor partial agonist that has shown to improve systolic and diastolic function in studies with heart failure patients. It modulates the sympathetic control of the heart but...	Agents producing tachycardia
Xanthan gum	0	Xanthan gum is a polysaccharide gum derived from* Xanthomonas campestris* by a pure-culture fermentation process and purified by recovery with isopropyl alcohol. The major constituents include D-glucose, D-mannose, and D-glucuronic...	Drug Carriers
Xanthinol	311.342	A vasodilatory niacin found in diet supplements.	Purine Derivatives
Xenon Xe-127	126.9052	Not Annotated	Inhalation Diagnostic Agent
Xenon Xe-129	128.9048	As a hyperpolarized contrast agent, it is indicated for use with magnetic resonance imaging (MRI) for evaluation of lung ventilation.	Contrast Media
Xenon-133	132.9059	An inhaled radionuclide used to measure lung function and organ blood flow.	Inhalation Diagnostic Agent
Ximelagatran	473.5652	For the treatment of acute deep vein thrombosis.	Antithrombins
Xylometazoline	244.3752	A direct-acting alpha-adrenergic agonist used for the symptomatic treatment of nasal congestion and minor inflammation due to allergies or colds.	Sympathomimetics Used as Decongestants
Xylose	150.1299	The predominant everyday nutritional usage of xylose is as a parent sugar alcohol from which another sugar alcohol - xylitol- can be derived from and used as an extremely common...	Pentoses
Yohimbine	354.4427	An alpha-2-adrenergic blocker and sympatholytic found in supplements used to.	Drugs Used in Erectile Dysfunction
Yttrium Y-90	89.9072	Yttrium 90 has been investigated for the treatment of Colon Cancer and Colorectal Cancer.	Yttrium (90Y) Compounds
Zafirlukast	575.675	A leukotriene receptor antagonist used for prophylaxis and chronic treatment of asthma.	Anti-Asthmatic Agents
Zalcitabine	211.2178	A dideoxynucleoside used to treat HIV.	Nucleoside and Nucleotide Reverse Transcriptase Inhibitors
Zaleplon	305.3339	A sedative used for short term treatment of insomnia in adults.	Anticonvulsants
Zanamivir	332.3098	A neuraminidase inhibitor used to treat influenza A and B.	Antiviral Agents
Zanubrutinib	471.561	A kinase inhibitor used to treat mantle cell lymphoma, a type of B-cell non-Hodgkin lymphoma, in adults who previously received therapy.	Bruton's tyrosine kinase (BTK) inhibitors
Zeaxanthin	568.886	Zeaxanthin is a most common carotenoid alcohols found in nature that is involved in the xanthophyll cycle. As a coexistent isomer of lutein, zeaxanthin is synthesized in plants and some...	Xanthophylls
Ziconotide	2639.14	An N-type calcium channel antagonist used to manage patients with severe chronic pain who cannot tolerate, or who have not responded adequately to other treatments such as intrathecal morphine and systemic analgesics.	Analgesics
Zidovudine	267.2413	A dideoxynucleoside used in the treatment of HIV infection.	Anti-HIV Agents
Zileuton	236.29	A leukotriene synthesis inhibitor used in the prophylaxis and treatment of chronic asthma.	Leukotriene Antagonists
Zimelidine	317.23	For the treatment of depression.	Selective Serotonin Reuptake Inhibitors
Zinc	65.409	An essential element commonly used for the treatment of patients with documented zinc deficiency.	Metals, Heavy
Zinc acetate	183.497	A medication used to treat zinc deficiency.	Various Alimentary Tract and Metabolism Products
Zinc ascorbate	415.61	A medication used to prevent the absorption of copper in Wilson's disease and also as part of natural health products.	Vitamin C and analogues
Zinc chloride	136.315	A medication used to treat zinc deficiencies and associated symptoms and also in total parenteral nutrition.	Electrolyte Solutions
Zinc dibutyldithiocarbamate	474.12	Zinc dibutyldithiocarbamate is approved for use within allergenic epicutaneous patch tests which are indicated for use as an aid in the diagnosis of allergic contact dermatitis (ACD) in persons 6...	Standardized Chemical Allergen
Zinc gluconate	455.67	An ingredient found in a variety of supplements and vitamins.	Zinc Compounds
Zinc oxide	81.408	A mineral ingredient of various pharmacological preparations to treat diaper dermatitis and other skin conditions, to protect the epidermis, and to prevent sunburn.	Dermatologicals
Zinc phenolsulfonate	411.7	An ingredient in ophthalmic solutions indicated in the treatment of minor irritation and conjunctivitis.	\N
Zinc sulfate	161.472	A drug used to replenish low levels of zinc or prevent zinc deficiency, or to test for zinc deficiency.	Electrolyte Solutions
Zinc sulfate, unspecified form	0	A zinc supplement indicated in parenteral nutrition.	Agents for Treatment of Hemorrhoids and Anal Fissures for Topical Use
Ziprasidone	412.936	An atypical antipsychotic used to manage schizophrenia, bipolar mania, and agitation in patients with schizophrenia.	Indole Derivatives
Zirconium chloride hydroxide	143.68	Not Annotated	\N
Zofenopril	429.55	An ACE inhibitor indicated in the treatment of hypertension.	ACE Inhibitors and Diuretics
Zoledronate D,L-Lysine Monohydrate	436.295	Not Annotated	\N
Zoledronic acid	272.0896	A bisphosphonate used to treat malignancy associated hypercalcemia, multiple myeloma, and bone metastasis from solid tumors.	Bisphosphonates
Zolmitriptan	287.3568	A member of the triptan class of 5-HT(1B/1D/1F) receptor agonist drugs used for the acute treatment of migraine with or without aura in adults.	Selective Serotonin 5-HT1 Receptor Agonists
Zolpidem	307.3895	A sedative hypnotic used for the short-term treatment of insomnia to improve sleep latency.	GABA-A Receptor Agonists
Zonisamide	212.226	A sulfonamide anticonvulsant used to treat partial seizures.	Sulfonamides
Zopiclone	388.808	A nonbenzodiazepine hypnotic used for the short-term management of insomnia.	Drugs causing inadvertant photosensitivity
Zotepine	331.86	Zotepine, like other atypical antipsychotics, is considered as the first-line treatment in newly diagnosed schizophrenia. It is usually thought to be an option of choice for managing acute schizophrenic episodes...	Neurotoxic agents
Zucapsaicin	305.4119	A topical analgesic used as an adjunct to relieve severe pain of osteoarthritis of the knee in selected adult patients.	Capsaicin and Similar Agents
Zuclopenthixol	400.965	An antipsychotic indicated for the management of schizophrenia. The acuphase formulation is indicated for initial treatment of acute psychosis or exacerbation of psychosis, while the depot formulation is best for maintenance.	Thioxanthene Derivatives
Zytron	314.16	Zytron (DMPA) is under investigation for the treatment and health services research of HIV, Lactation, Contraception, Postpartum Depression, and Immune Cells (Mucosal and Systemic). DMPA has been investigated for the...	Amines
\.


--
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee (employee_id, first_name, last_name, phone_number, address, dateofbirth) FROM stdin;
\.


--
-- Data for Name: transaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transaction (drug_name, employee_id, customer_id, "time") FROM stdin;
\.


--
-- Name: customer_drugstore customer_drugstore_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_drugstore
    ADD CONSTRAINT customer_drugstore_pkey PRIMARY KEY (customer_id);


--
-- Name: customer_hospital customer_hospital_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_hospital
    ADD CONSTRAINT customer_hospital_pkey PRIMARY KEY (customer_id);


--
-- Name: customer_personal customer_personal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_personal
    ADD CONSTRAINT customer_personal_pkey PRIMARY KEY (customer_id);


--
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (customer_id);


--
-- Name: drug drug_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drug
    ADD CONSTRAINT drug_pkey PRIMARY KEY (name);


--
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (employee_id);


--
-- Name: transaction transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_pkey PRIMARY KEY (drug_name, employee_id, customer_id);


--
-- Name: customer_drugstore customer_drugstorefk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_drugstore
    ADD CONSTRAINT customer_drugstorefk FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: customer_hospital customer_hospitalfk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_hospital
    ADD CONSTRAINT customer_hospitalfk FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: customer_personal customer_personal fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_personal
    ADD CONSTRAINT "customer_personal fk" FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: transaction transactioncust; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transactioncust FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: transaction transactionemployee; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transactionemployee FOREIGN KEY (employee_id) REFERENCES public.employee(employee_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: transaction transactionname; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transactionname FOREIGN KEY (drug_name) REFERENCES public.drug(name) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

