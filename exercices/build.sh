#!/bin/bash

dir=$(dirname $(readlink -f $0))
out=$dir/README.rst

cd $dir

cat << EOF > $out 
Tous les exercices sont réalisés avec QCAD, logiciel libre disponible
gratuitement (édition Pro payant disponible également). Il existe également
LibreCAD, fork libre de QCAD.

Mis à jour: $(date)

Visible en ligne grâce à ShareCAD.

Toutes les coupes sont superposées sur les dessins, mais classées sous forme
de couches. Vous pouvez en désactiver certaines en cliquant en haut à gauche sur
l'option "Calques".

Pour un affichage correct, il vous faut également activer le fond "Noir", en
cliquant sur le bouton à côté de celui des calques.
EOF

for ex in */
do
    ex=$(echo $ex | sed -e 's#/##g')
    echo
    echo $ex
    echo $(echo $ex | sed -e 's/./=/g')
    echo "\`Voir en ligne <http://sharecad.org/cadframe/load?url=https://raw.githubusercontent.com/second-reality/charpente/master/exercices/$ex/dessin.dxf>\`_"
    echo
    cat $ex/README.rst
done >> $out 
