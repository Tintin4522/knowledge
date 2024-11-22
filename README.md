# REALISATION D'UN SITE DE E-LEARNING AVEC SYMFONY


Bienvenue sur le site de Knoledge, site de E-Learning qui permet :

        1   -   Création de compte utilisateur.

        2   -   Une partie 'admin' qui permet d'avoir accès au menu de gestion pour l'ajout et la suppression de cours, ainsi que le suivi des élèves.

        3   -   Effectuer des achats tests dans un panier jusqu'au paiement (fictif pour le développement avec les informations contenue dans la
                documentation du projet au format PDF dans le repository)

        4   -   Suivre les différents cours et les différentes leçons

        5   -   Valider le cours ou la leçon

        6   -   Suivre son évolution

-------------------------------------------------------------

## PREREQUIS 

1 - PHP 8.2 ou plus récent

2 - Composer pour la gestion des dépendances PHP

3 - MySQL pour la base de donnée

4 - Symfony CLI (facultatif, mais recommandé pour la gestion du projet)

-------------------------------------------------------------

### PROCEDURE DE LANCEMENT

1 - Installation du projet :

        git clone https://github.com/Tintin4522/knowledge.git

2 - Accéder au répertoire de développement :

        cd knowledge

3 - Installer toutes les dépendances :

        composer install

4 - Configurer les variables d'environnement comme mentionnées dans la documentation du projet

5 - Créer la base de donnée ou l'importer (Voir documentation PDF du projet)

-------------------------------------------------------------

#### DEMARRAGE DE L'APPLICATION EN LOCAL

Après avoir installé le projet, vous pouvez lancer l'application en excutant la commande suivante :

        symfony server:start

Une fois la commande lancer, rendez-vous dans votre navigateur à l'adresse suivante pour vous connecter avec les identifiants ci-dessous :

        http://localhost:8000/

-------------------------------------------------------------

##### CONNECTION AU SITE

Identifiants de connection :

        En tant qu'administrateur du site :

                E-mail utilisateur : admin@example.com
                Mot de passe : mdpdeadmin

        En tant qu'utilisateur du site : 
        
                E-mail utilisateur : test@test.fr
                Mot de passe : mdpdetest

-------------------------------------------------------------

###### CAPTURE D'ECRAN DU SITE

![Getting Started](./assets/images/home.png)

![Getting Started](./assets/images/suivi.png)