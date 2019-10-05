# iOS-Project

> Contexte:

Notre project C2 consiste a créer un systeme pour une “animalerie” (maison et hopital pour animaux de compagnie). Ces hopitaux sont très connus en Europe et en Amérique. Ils embauchent differents médecins avec plusieurs cliniques pour prendre soin de tous leurs clients et leurs animaux domestiques. Ces endroits sont connu aussi comme magasin spécialisé dans la vente de petits animaux de compagnie ainsi que de produits (nourriture, produits de traitement, litière, etc.) et accessoires (aquariums, cages, sellerie, etc.) qui leur sont destines. De plus, Ils possèdent des animaux pour adoptions.

> Objectif:

Les objectifs principals de ce syteme sont:

- Accès aux clients enregistrés dans le systeme avec possibilité d’ajouter de nouveaux members et leur donner un code d’activation pour accéder à leur compte dans les differents interfaces web et mobiles.
- Accès aux animaux domestiques enregistrés dans le systeme avec possibilité d’ajouter de nouveaux animaux et leur connecter à un certain client.
- Accès aux medecins enregistrés dans le systeme avec possibilité d’ajouter de nouveaux medecins avec leurs horaires de disponibilité.
- Manipuler les animaux pour adoption.
- Capabilité de prendre des rendez-vous en ligne et manipuler ces rendez-vous dans le systeme.
- Ajouter et manipuler des produits à vendre.
- Ajouter des Nouvelles à propos de l’animalerie ou à propos des animaux en génerale.

> Périmètre:

Ce project est addressé aux differentes animaleries dans les pays developpés. Toute la population peut utiliser l’application  mobile pour profiter de ses fonctionalités mais seules les clients enregistreés dans le systeme peuvent s’identifier pour accéder à leur profile, prendre des rendez-vous, voir leurs précédentes visites medicales et de manipuler leurs animaux domestiques.

> Fonctionnement:

Ce systeme sera capable de traduire les besoins suivants:

- Inscrivez-vous en tant qu'utilisateur ou médecin
- Connectez-vous en tant qu'utilisateur ou médecin
- Accéder aux produits, aux medecins et aux Nouvelles pour un client ordinaire ou engistré
- Accéder aux rendez-vous pour un client enregitré seulement.
- Identification pour medecin pour acceder à leur rendez-vous.
- Voir, mettre à jour le profil pour un médecin ou utilisateur
- Réserver un rendez-vous pour le propriétaire des animaux pour un médecin ou un utilisateur

> Les technologies:
- Combine: 
La structure Combine fournit une API Swift déclarative pour le traitement des valeurs dans le temps. Ces valeurs peuvent représenter plusieurs types d'événements asynchrones. Combine déclare aux éditeurs d'exposer les valeurs qui peuvent changer au fil du temps et aux abonnés de recevoir ces valeurs de la part des éditeurs.
Le protocole Publisher déclare un type pouvant fournir une séquence de valeurs dans le temps. Les éditeurs ont des opérateurs qui agissent sur les valeurs reçues des éditeurs en amont et les republient.
À la fin d'une chaîne d'éditeurs, un abonné agit sur les éléments au fur et à mesure qu'il les reçoit. Les éditeurs n'émettent des valeurs que lorsque les abonnés le leur demandent explicitement. Ainsi, votre code d’abonné contrôle la rapidité avec laquelle il reçoit les événements des éditeurs auxquels il est connecté.
- SwiftUI Better apps. Less code:
SwiftUI est un moyen innovant et simple de créer des interfaces utilisateur sur toutes les plateformes Apple avec la puissance de Swift. Créez des interfaces utilisateur pour tous les appareils Apple à l'aide d'un seul ensemble d'outils et d'API. Avec une syntaxe Swift déclarative facile à lire et naturelle à écrire, SwiftUI fonctionne de manière transparente avec les nouveaux outils de conception Xcode pour que votre code et votre conception soient parfaitement synchronisés.
Combine et SwiftUI sont introduits dans la Conférence mondiale des développeurs Apple (WWDC) 2019 qui s'est déroulée du 3 au 7 juin à San Jose, en Californie. Mon objectif de ce projet est d'apprendre et d'adapter ces 2 nouvelles technologies qui aident les développeurs iOS à développer des logiciels sur tous les appareils Apple.
- Swift 5: 
Swift est un langage de programmation compilé multi-paradigme et polyvalent développé par Apple Inc. pour iOS, iPadOS, macOS, watchOS, tvOS, Linux et z/OS. Swift est conçu pour fonctionner avec les frameworks Apple Cocoa et Cocoa Touch et avec le vaste corpus de code Objective-C existant écrit pour les produits Apple. Il est construit avec le framework de compilateur LLVM open source et est inclus dans Xcode depuis la version 6, publiée en 2014. Sur les plateformes Apple, il utilise la bibliothèque d'exécution Objective-C qui permet l'utilisation de C, Objective-C, C ++ et Swift. code à exécuter dans un programme.
Apple souhaitait que Swift prenne en charge de nombreux concepts de base associés à Objective-C, notamment la répartition dynamique, la liaison tardive généralisée, la programmation extensible et des fonctionnalités similaires, mais de manière "plus sûre", facilitant ainsi la détection des bogues logiciels; Swift propose des fonctionnalités permettant de corriger certaines erreurs de programmation courantes telles que le déréférencement de pointeur null et fournit un sucre syntaxique permettant d'éviter la pyramide du destin. Swift prend en charge le concept d'extensibilité de protocole, un système d'extensibilité qui peut être appliqué à des types, des structures et des classes, préconisé par Apple comme étant un véritable changement dans les paradigmes de programmation qu'ils appellent "programmation orientée protocole" (similaire aux traits).

> Architecture logicielle: MVVM

![](MVVM.png)

MVVM facilite la séparation du développement de l'interface utilisateur graphique - que ce soit via un langage de balisage ou un code d'interface graphique - du développement de la logique métier ou de la logique de back-end (modèle de données). Le modèle de vue de MVVM est un convertisseur de valeur, ce qui signifie que le modèle de vue est chargé d'exposer (convertir) les objets de données à partir du modèle de manière à ce que les objets soient facilement gérés et présentés. À cet égard, le modèle de vue est plus modèle que vue et gère la plupart sinon la totalité de la logique d'affichage de la vue. Le modèle de vue peut implémenter un motif de médiateur, organisant l'accès à la logique dorsale autour de l'ensemble des cas d'utilisation pris en charge par la vue.

MVVM est une variante du modèle de conception Presentation Model de Martin Fowler. MVVM résume de la même manière l'état et le comportement d'une vue, mais un modèle de présentation résume une vue (crée un modèle de vue) de manière indépendante d'une plate-forme d'interface utilisateur spécifique.

MVVM a été inventé par Ken Cooper et Ted Peters, architectes de Microsoft, dans le but de simplifier la programmation d'interfaces utilisateur pilotée par les événements. Le modèle a été intégré à Windows Presentation Foundation (WPF) (système graphique .NET de Microsoft) et à Silverlight (application dérivée d'applications Internet de WPF). John Gossman, l'un des architectes WPF et Silverlight de Microsoft, a annoncé MVVM sur son blog en 2005.
