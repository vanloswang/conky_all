#!/bin/bash

ROOT_DIR=$(pwd)
echo "Root dir is $ROOT_DIR"
FONTS_DIR=$ROOT_DIR/fonts
echo "Fonts dir is $FONTS_DIR"
RES_DIR=$ROOT_DIR/res
echo "Resource dir is $RES_DIR"
CONKYCOLORSDIR=$RES_DIR/conkycolors
echo "Conky colors is $CONKYCOLORSDIR"
BIN_DIR=$CONKYCOLORSDIR/bin
echo "Bin dir is $BIN_DIR"
SCRIPT_DIR=$CONKYCOLORSDIR/bin
echo "Script dir is $SCRIPT_DIR"
SRC_DIR=$ROOT_DIR/conky_colors
echo "Conky-colors source code dir is $SRC_DIR"

echo "Check the dirs is correct before you input password!!!"
###################################################################
#				Install conky-all and so on						  #	
###################################################################
sudo apt-get install aptitude python-keyring python-statgrab \
	ttf-ubuntu-font-family hddtemp curl lm-sensors conky conky-all
sudo chmod u+s /usr/sbin/hddtemp
sudo sensors-detect 
echo "************** Install conky-all and so on OK **************"
###################################################################
###################################################################
#				Build and Install conky_colors					  #	
###################################################################
cd $SRC_DIR
make
sudo make install
cd $ROOT_DIR
conky-colors --theme=custom --default-color=black --color0=cyan  \
	--color1=green --color2=orange --color3=red --ubuntu --cpu=2 \
	--updates --proc=3 --clock=lucky --calendar --nvidia		 \
	--hd=default --hdtemp1=sda --photo --photord --network		 \
	--unit=C --side=right --bbcweather=1586 --weather=CHXX0100	 \
	--rhythmbox=cd
echo "************ Build and Install conky_colors OK *************"
###################################################################

###################################################################
#					Install Weather Fonts						  #
###################################################################
sudo cp $FONTS_DIR/*.ttf /usr/share/fonts/conkycolors/ 
sudo fc-cache -v -f
echo "**************** Install Weather Fonts OK ****************"
###################################################################

###################################################################
#					Installl Resources							  #	
###################################################################
cp $CONKYCOLORSDIR/conkyrc* ~/.conkycolors/
cp $BIN_DIR/* ~/.conkycolors/bin
sudo cp $SCRIPT_DIR/* /usr/share/conkycolors/scripts/
echo "****************** Installl Resources OK ******************"
###################################################################

###################################################################
#							Run it								  #	
###################################################################
conky -c ~/.conkycolors/conkyrc
###################################################################
