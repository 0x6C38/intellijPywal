#!/usr/bin/env bash
# value=\"(\K[a-f0-9]{6})
# (?sm)(^[^\r\n]+$)(?!.*^\1$)


# Attempts to retrieve wals colors
cache_dir="${HOME}/.cache/wal"
# Import colors
c=($(< "${cache_dir}/colors"))
c=("${c[@]//\#}")

ijConfigPath=$1

#now=$(date +"%T")
#actLog=/media/MD/Development/Projects/Bash/intellijPywal/activity.log
#echo "script was run at $now and path is $ijConfigPath" >> $actLog
#

#txtColor=$2
#bgColor=$3
#sbgColor=$4
#sfgColor=$5
#caretRowColor=$6
#lnColor=$7
#fgColor=$8
#bg2Color=$9
#contrastColor=${10}
#sbColor=${11}
#treeColor=${12}

txtColor=${c[15]}
bgColor=${c[0]}
sbgColor=${c[0]}
sfgColor=${c[15]}
caretRowColor=${sbgColor}
lnColor=${c[1]}
fgColor=${c[15]}
bg2Color=${c[1]}
contrastColor=${c[1]}
sbColor=${c[1]}
treeColor=${c[15]}

#if [[ $1 -eq 0 ]] ; then
#    ijConfigPath=$HOME/.IntelliJIdea2017.2/config
#fi

#
#if [[ $2 -eq 0 ]] ; then
#    txtColor=${c[15]}
#fi
#if [[ $3 -eq 0 ]] ; then
#    bgColor=${c[0]}
#fi
#if [[ $4 -eq 0 ]] ; then
#    sbgColor=${c[0]}
#fi
#if [[ $5 -eq 0 ]] ; then
#    sfgColor=${c[15]}
#fi
#if [[ $6 -eq 0 ]] ; then
#    caretRowColor=${sbgColor}
#fi
#if [[ $7 -eq 0 ]] ; then
#    lnColor=${c[1]}
#fi
#if [[ $8 -eq 0 ]] ; then
#    fgColor=${c[15]}
#fi
#if [[ $9 -eq 0 ]] ; then
#    bg2Color=${c[1]}
#fi
#if [[ $10 -eq 0 ]] ; then
#    contrastColor=${c[1]}
#fi
#if [[ $11 -eq 0 ]] ; then
#    sbColor=${c[1]}
#fi
#if [[ $12 -eq 0 ]] ; then
#    treeColor=${c[15]}
#fi

# Get current Directory
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

templatePath=$DIR\/material_scheme_template.xml
materialTPath=$DIR\/material_template.xml


# ijConfigPath=~/.IntelliJIdea2017.2/config
#ijCfPath=~/.IntelliJIdea2017.2/config/colors/material-pywal.icls # Point to your path
#ijMPath=~/.IntelliJIdea2017.2/config/options/material_custom_theme.xml # Point to your path

ijCfPath=$ijConfigPath/colors/material-pywal.icls # Point to your path
ijMPath=$ijConfigPath/options/material_custom_theme.xml # Point to your path
#echo $ijCfPath
#echo $ijMPath

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