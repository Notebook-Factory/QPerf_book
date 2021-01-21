***
**Purpose**    
Quantitative myocardial perfusion mapping has advantages over qualitative assessment, including the ability to detect global flow reduction. However, it is not clinically available and remains a research tool. Building upon the previously described imaging sequence, this study presents algorithm and implementation of an automated solution for inline perfusion flow mapping with step by step performance characterization.

**Methods**   
Proposed workflow consists of motion correction (MOCO), arterial input function blood detection, intensity to gadolinium concentration conversion, and pixel‐wise mapping. A distributed kinetics model, blood‐tissue exchange model, is implemented, computing pixel‐wise maps of myocardial blood flow (mL/min/g), permeability‐surface‐area product (mL/min/g), blood volume (mL/g), and interstitial volume (mL/g).

**Results**   
Thirty healthy subjects (11 men; 26.4 ± 10.4 years) were recruited and underwent adenosine stress perfusion cardiovascular MR. Mean MOCO quality score was 3.6 ± 0.4 for stress and 3.7 ± 0.4 for rest. Myocardial Dice similarity coefficients after MOCO were significantly improved (P < 1e‐6), 0.87 ± 0.05 for stress and 0.86 ± 0.06 for rest. Arterial input function peak gadolinium concentration was 4.4 ± 1.3 mmol/L at stress and 5.2 ± 1.5 mmol/L at rest. Mean myocardial blood flow at stress and rest were 2.82 ± 0.47 mL/min/g and 0.68 ± 0.16 mL/min/g, respectively. The permeability‐surface‐area product was 1.32 ± 0.26 mL/min/g at stress and 1.09 ± 0.21 mL/min/g at rest (P < 1e‐3). Blood volume was 12.0 ± 0.8 mL/100 g at stress and 9.7 ± 1.0 mL/100 g at rest (P < 1e‐9), indicating good adenosine vasodilation response. Interstitial volume was 20.8 ± 2.5 mL/100 g at stress and 20.3 ± 2.9 mL/100 g at rest (P = 0.50).

**Conclusions**   
An inline perfusion flow mapping workflow is proposed and demonstrated on normal volunteers. Initial evaluation demonstrates this fully automated solution for the respiratory MOCO, arterial input function left ventricle mask detection, and pixel‐wise mapping, from free‐breathing myocardial perfusion imaging.

```{tabbed} Tab 1 title
My first tab
```

```{tabbed} Tab 2 title
My second tab with `some code`!
```