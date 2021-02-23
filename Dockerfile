FROM ubuntu
#EXPOSE 8080 -> -P dans le docker run pour exposer le port
COPY /TPDockerSampleApp /TPDockerSampleApp
RUN apt-get update
RUN apt-get install -y openjdk-8-jdk
RUN apt-get install -y maven
WORKDIR TPDockerSampleApp
RUN mvn install:install-file -Dfile=lib/opencv-3410.jar -DgroupId=org.opencv -DartifactId=opencv -Dversion=3.4.10 -Dpackaging=jar
RUN mvn package
ENTRYPOINT java -Djava.library.path=lib/ubuntuupperthan18/ -jar target/fatjar-0.0.1-SNAPSHOT.jar

#COPY le projet depuis le répertoire courant, installe tout ce qu'il faut 
#puis l'exécute au lancement du container à l'aide du CMD

#Si l'on veut télécharger le projet depuis le container
#Insérer les lignes après en ligne 4 et supprimer le COPY:
#RUN apt-get install -f libpng16-16
#RUN apt-get install -f libdc1394-22
#RUN apt-get install -y git
#RUN git clone https://github.com/barais/TPDockerSampleApp

#Commande à exécuter pour gérer le container:

#docker build -t sampleapp . pour créer l'image avec le nom sampleapp
#docker images pour repérer si l'image a bien été créée et vérifier le tag
#docker run -p 8080:8080 -d --name sampleapp sampleapp Lance le container avec l'image créée précedemment en arrière plan 
#docker ps pour repérer le container son nom
#docker exec sampleapp -ti bash (ou remplacer -d par -ti à la précédente commande docker run) pour lancer un bash sur le container

#Vérifier que l'appli est bien lancée dans le container, dans le bash du container :
#apt-get install curl && curl 0.0.0.0:8080
