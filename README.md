# 🎓 Jskk_Reco — Application de gestion des présences par reconnaissance faciale

**Jskk_Reco** est une application web conçue pour automatiser la gestion des présences étudiantes à l’aide de la reconnaissance faciale. Elle vise à offrir une solution moderne, sécurisée et efficace pour le suivi des étudiants dans un cadre académique.

## 📌 Objectifs

- Identifier automatiquement les étudiants à partir de leur visage
- Enregistrer les présences en temps réel avec horodatage
- Faciliter le suivi administratif des absences
- Proposer une interface simple pour les enseignants et les administrateurs

## 🧰 Technologies utilisées

| Composant        | Outils / Langages             |
|------------------|-------------------------------|
| Langage principal| Python                        |
| Reconnaissance   | OpenCV, face_recognition      |
| Backend          | Flask                         |
| Base de données  | SQLite ou MySQL               |
| Frontend         | HTML, CSS, JavaScript         |
| Outils annexes   | Git, GitHub, VS Code          |

## 🧠 Fonctionnalités principales

- Enregistrement des visages des étudiants
- Détection et reconnaissance faciale en direct via webcam
- Horodatage automatique des présences
- Interface web pour visualiser les présences
- Export des données (CSV ou autre format à venir)

## 📦 Structure du projet
projet Reconnaissance faciale/  
 ├── templates/ # Pages HTML 
 ├── static/ # Fichiers CSS, JS 
 ├── reco.py # Script de reconnaissance faciale 
 ├── app.py # Routes Flask 
 ├── data_base # Base de données SQLite 
 └── requirements.txt # Dépendances Python 

 
## 🚀 Lancer le projet en local

1. **Cloner le dépôt**
   ```bash
   git clone https://github.com/Jean-Bogou-Dev/Jskk_Reco.git
   cd Jskk_Reco
2. **Installer les dépendances**
pip install -r requirements.txt

3. **Lancer l’application**
python run.py

4.**Accéder à l’interface**
http://localhost:5000

📚 Ce que j’ai appris
Intégrer la reconnaissance faciale dans une application web

Gérer les flux vidéo en temps réel

Concevoir une base de données adaptée au suivi des présences

Structurer un projet complet avec frontend et backend

Utiliser GitHub pour documenter et partager mes projets

📬 Contact
Pour toute question ou suggestion, vous pouvez me contacter via GitHub.

Ce projet est en cours d’évolution. Toute contribution ou retour est le bienvenu !
