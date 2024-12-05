								Présentation du Projet

Ce projet est un système de gestion universitaire, qui consiste à gérer les étudiants, les cours et les inscriptions. Il permet de suivre les étudiants inscrits dans divers cours, de gérer les capacités des cours, d’effectuer des analyses sur les statistiques des inscriptions et de gérer des contraintes spécifiques pour limiter les inscriptions excessives. Ce projet est conçu pour être utilisé dans un environnement de base de données relationnelle, et il a été développé avec des instructions SQL pour gérer la base de données.

								Fonctionnalités principales :
Gestion des Étudiants :
	Enregistrement des détails des étudiants (nom, âge, sexe).
	Suivi des étudiants inscrits dans les cours.
Gestion des Cours :
	Création de cours avec un nombre de crédits et une capacité maximale.
	Ajout, modification et suppression des cours disponibles.
Inscriptions des Étudiants :
	Lien entre étudiants et cours via la table d’inscriptions.
	Vérification des capacités des cours et prévention des inscriptions si la capacité est atteinte.
Statistiques des Cours :
	Nombre d’étudiants inscrits dans chaque cours.
	Identification des cours ayant des inscriptions supérieures à la moitié de leur capacité.
Analyse des Inscriptions :
	Identification des étudiants inscrits dans le plus grand nombre de cours.
	Calcul des crédits totaux pris par chaque étudiant.
	Identification des cours sans inscriptions.
Maintenance et Réinitialisation des Données :
	Suppression des inscriptions d'un cours sans supprimer le cours.
	Suppression des étudiants n'ayant pas d’inscriptions.
	
								Setup et Utilisation :

Prérequis :
Base de données relationnelle : Le projet est conçu pour être exécuté sur une base de données MySQL, PostgreSQL ou SQLite. Vous devez avoir l'un de ces SGBD installés ou utiliser Docker pour exécuter les conteneurs correspondants.
Docker : Si vous utilisez Docker pour exécuter la base de données, vous pouvez suivre les étapes pour lancer les conteneurs décrites ci-dessous.
Étapes pour le Setup du Projet

								1. Installation de la Base de Données

Avec Docker :
Si vous utilisez Docker pour exécuter votre base de données, voici un exemple de commande pour exécuter MySQL dans un conteneur :

docker run --name mysql-container -e MYSQL_ROOT_PASSWORD=root -d mysql:latest
Puis, vous pouvez copier et exécuter les fichiers SQL comme expliqué dans la section précédente.

								2. Exécution des Requêtes SQL

Placez vos fichiers dans le répertoire du projet.
Connectez-vous à votre SGBD (MySQL, PostgreSQL, SQLite) et exécutez les commandes SQL pour créer les tables et insérer des données.

								3. Test des Fonctionnalités

Une fois les données insérées, vous pouvez tester les différentes fonctionnalités en exécutant les requêtes SQL dans votre terminal pour vérifier les statistiques des cours, les inscriptions, etc.
Utilisez les requêtes fournies dans le projet pour extraire des informations, comme la liste des étudiants inscrits dans les cours ou le nombre d’étudiants dans chaque cours.
Utilisation de l'Application

		Connexion à la Base de Données :
Ouvrez votre terminal et connectez-vous à votre base de données à l'aide de l'outil de ligne de commande approprié (MySQL, psql, SQLite).

Utilisez les commandes SQL pour interagir avec la base de données, afficher les informations sur les étudiants, les cours et les inscriptions.

		Manipulation des Données :
Ajout de nouveaux étudiants : Vous pouvez ajouter de nouveaux étudiants à l'aide des requêtes INSERT INTO.
Ajout de nouveaux cours : Vous pouvez ajouter des cours et définir leurs capacités et crédits.
Inscriptions : Utilisez la table Enrollments pour inscrire des étudiants dans des cours.

		Exécuter des Analyses :
Analyser les inscriptions : Exécutez des requêtes pour obtenir des statistiques sur le nombre d’étudiants inscrits dans chaque cours, ou les cours sans inscriptions.
Analyser les crédits des étudiants : Calculez le total des crédits de chaque étudiant en fonction de ses inscriptions.

								4. Réinitialiser et Maintenir les Données  
Supprimer les inscriptions d’un cours : Si vous souhaitez supprimer toutes les inscriptions pour un cours particulier sans le supprimer, utilisez la requête pour supprimer les lignes correspondantes de la table Enrollments tout en conservant le cours intact.
Supprimer les étudiants non inscrits : Si vous souhaitez supprimer tous les étudiants qui ne sont inscrits dans aucun cours, vous pouvez utiliser la requête de suppression basée sur l'absence d’inscriptions.

								Conclusion :
Ce projet vous permet de gérer les inscriptions aux cours, de suivre les étudiants et leurs crédits, tout en appliquant des contraintes et des vérifications spécifiques. Grâce aux fonctionnalités de gestion des données et d'analyse, il peut être étendu ou intégré à un système universitaire plus large.
