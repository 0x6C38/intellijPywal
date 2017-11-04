#!/usr/bin/env bash
# value=\"(\K[a-f0-9]{6})
# (?sm)(^[^\r\n]+$)(?!.*^\1$)

# now=$(date +"%T")
# actLog=/media/MD/Development/Projects/Bash/intellijPywal/activity.log
# echo "script was run at $now" >> $actLog

# Attempts to retrieve wals colors
cache_dir="${HOME}/.cache/wal"
# Import colors
c=($(< "${cache_dir}/colors"))
c=("${c[@]//\#}")

txtColor=$1
bgColor=$2
sbgColor=$3
sfgColor=$4
caretRowColor=$5
lnColor=$6
fgColor=$7
bg2Color=$8
contrastColor=$9
sbColor=$10
treeColor=$11


if [[ $1 -eq 0 ]] ; then
    txtColor=${c[15]}
fi
if [[ $2 -eq 0 ]] ; then
    bgColor=${c[0]}
fi
if [[ $3 -eq 0 ]] ; then
    sbgColor=${c[0]}
fi
if [[ $4 -eq 0 ]] ; then
    sfgColor=${c[15]}
fi
if [[ $5 -eq 0 ]] ; then
    caretRowColor=$sbgColor
fi
if [[ $6 -eq 0 ]] ; then
    lnColor=${c[1]}
fi
if [[ $7 -eq 0 ]] ; then
    fgColor=${c[15]}
fi
if [[ $8 -eq 0 ]] ; then
    bg2Color=${c[1]}
fi
if [[ $9 -eq 0 ]] ; then
    contrastColor=${c[1]}
fi
if [[ $10 -eq 0 ]] ; then
    sbColor=${c[1]}
fi
if [[ $11 -eq 0 ]] ; then
    treeColor=${c[15]}
fi

templatePath=/media/MD/Development/Projects/Bash/intellijPywal/material_scheme_template.xml
materialTPath=/media/MD/Development/Projects/Bash/intellijPywal/material_template.xml

ijCfPath=~/.IntelliJIdea2017.2/config/colors/material_pywal.icls # Point to your path
ijMPath=~/.IntelliJIdea2017.2/config/options/material_custom_theme.xml

# echo $bgColor\ $txtColor\ $caretRowColor >> $actLog

cp -f $templatePath $ijCfPath
cp -f $materialTPath $ijMPath

exp=s/leTXT/$txtColor/g
sed -i $exp $ijCfPath
sed -i $exp $ijMPath

exp=s/leBG/$bgColor/g
sed -i $exp $ijCfPath
sed -i $exp $ijMPath

# Selection/Highlight colors
exp=s/leSFG/$sfgColor/g
sed -i $exp $ijCfPath
sed -i $exp $ijMPath

exp=s/leSBG/$sbgColor/g
sed -i $exp $ijCfPath
sed -i $exp $ijMPath

exp=s/leCROW/$caretRowColor/g
sed -i $exp $ijCfPath
sed -i $exp $ijMPath

exp=s/leLN/$lnColor/g
sed -i $exp $ijCfPath
sed -i $exp $ijMPath

exp=s/leFG/$fgColor/g
sed -i $exp $ijCfPath
sed -i $exp $ijMPath

exp=s/leBG2/$bg2Color/g
sed -i $exp $ijCfPath
sed -i $exp $ijMPath

exp=s/leContrast/$contrastColor/g
sed -i $exp $ijCfPath
sed -i $exp $ijMPath

exp=s/leSBC/$sbColor/g
sed -i $exp $ijCfPath
sed -i $exp $ijMPath

exp=s/leTree/$treeColor/g
sed -i $exp $ijCfPath
sed -i $exp $ijMPath