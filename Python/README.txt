							Projet : Système de Gestion de Bibliothèque
			Description générale :

Ce projet implémente un système de gestion de bibliothèque en Python. Il permet de gérer des livres, des étudiants qui empruntent ces livres, et d'effectuer diverses actions telles que l'emprunt, le retour, la recherche de livres, et la gestion des livres dans la bibliothèque. L'objectif est de fournir une interface simple et claire pour interagir avec la bibliothèque via la ligne de commande.

							Fonctionnalités principales :
							
			Gestion des livres :
Ajout de nouveaux livres à la bibliothèque.
Recherche de livres par titre ou auteur.
Visualisation de tous les livres dans la bibliothèque, avec leur statut de disponibilité.

			Gestion des étudiants :
Les étudiants peuvent emprunter des livres (avec une limite d'emprunt, par défaut 3 livres).
Les étudiants peuvent rendre des livres.
Le système empêche les étudiants d'emprunter plus de livres que leur limite autorisée.

			Persistances des données :
Enregistrement de l'état des livres et de leur disponibilité dans un fichier texte.
Chargement de l'état des livres depuis un fichier texte au démarrage de l'application.


							Interface en ligne de commande :
	
			Un menu interactif permettant de :
- Voir tous les livres de la bibliothèque.
- Rechercher un livre par titre ou auteur.
- Ajouter un nouveau livre.
- Emprunter un livre.
- Rendre un livre.
- Quitter l'application.


			Limitation des emprunts :
Un étudiant peut emprunter jusqu'à un nombre maximum de livres (par défaut, 3).
Si l'étudiant tente d'emprunter plus de livres que ce nombre, un message d'erreur est affiché.

							Installation et configuration :
Prérequis :
- Python 3.x installé sur votre machine.
- Aucune bibliothèque externe n'est nécessaire pour le fonctionnement de base, tout est implémenté avec les bibliothèques standard de Python.

							Téléchargez le projet :
							
		1. Télécharger le programme
Clonez ou téléchargez le fichier contenant le projet (le code Python et le fichier library_data.txt).

		2.Démarrer le programme :
Ouvrez un terminal ou une ligne de commande dans le dossier où vous avez téléchargé le projet.
Exécutez le fichier Python en utilisant la commande suivante :
			python library_system.py
			

							Utilisation du programme :
Lorsque vous lancez le programme, vous verrez un menu interactif dans la console qui vous permettra de choisir une action. Les options disponibles sont les suivantes :

		Voir tous les livres :
Affiche une liste de tous les livres présents dans la bibliothèque, avec leur titre, auteur et statut de
disponibilité (disponible ou emprunté).

		Rechercher un livre :
Permet de rechercher un livre par titre ou auteur. Le programme affiche les livres correspondants à la
recherche.

		Ajouter un nouveau livre :
Permet d'ajouter un livre à la bibliothèque en entrant le titre et l'auteur.

		Emprunter un livre :
Permet à un étudiant d'emprunter un livre (en respectant la limite d'emprunts). Si le livre est déjà
emprunté ou inexistant, un message d'erreur est affiché.

		Retourner un livre :
Permet à un étudiant de retourner un livre emprunté. Le livre devient à nouveau disponible dans la
bibliothèque.

		Quitter le programme :
Quitte le programme et termine l'exécution.

		Conclusion :
Ce projet fournit un système de gestion de bibliothèque fonctionnel et extensible. Il offre une manière
simple et pratique de gérer les livres et les emprunts avec des fonctionnalités de recherche, d'emprunt
et de retour. Vous pouvez facilement l'étendre ou l'intégrer dans des applications plus complexes.