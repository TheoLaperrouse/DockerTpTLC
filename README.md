# Projet Docker

Le but de ce TP était de prendre en main docker dans un premier temps pour pouvoir ensuite se lancer sur le projet avec des bases suffisantes.

J'ai fait un Dockerfile et un docker-compose permettant de build l'application.

Des informations sont disponibles dans ces fichiers pour retranscrire les étapes du projet et aussi les lignes de commandes nécessaires au lancement du container docker, je les remets ici pour remplir un peu le README :

#docker build -t sampleapp . pour créer l'image avec le nom sampleapp

#docker images pour repérer si l'image a bien été créée et vérifier le tag

#docker run -p 8080:8080 -d --name sampleapp sampleapp Lance le container avec l'image créée précedemment en arrière plan 

#docker ps pour repérer le container son nom

#docker exec sampleapp -ti bash (ou remplacer -d par -ti à la précédente commande docker run) pour lancer un bash sur le container

#Vérifier que l'appli est bien lancée dans le container, dans le bash du container :

#apt-get install curl && curl 0.0.0.0:8080
