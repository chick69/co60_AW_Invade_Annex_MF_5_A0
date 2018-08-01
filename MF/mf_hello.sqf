// ---------------------------------------------------------------------------------------------------------------------
// Simple welcome message hint script by Jamie (A.K.A WalkingHazard)
// ---------------------------------------------------------------------------------------------------------------------

_displayCount = -1;

// Settings
_n = 5; //Number of seconds (^10) hint will be display for

// Display hint for _n seconds
while {(_displayCount) < (_n)} do {

_separator = parseText "<br />------------------------<br />";
_imageFile = parseText "<img size='5' image='MF\icon\MF.paa'>";
_title = parseText "<t color='#FFBF00' size='1.1' shadow='2' shadowColor='#000000' align='center'>Mercenaires Francais Info</t>";
_ts = parseText "Adresse TeamSpeak";
_infox = parseText "mercenaires-francais.fr";
_info = parseText "<br />Vous désirez trouver le serveur rapidement taper dans filtre : Serval";
_info1 = parseText "<br />------------------------<br />";
_info2 = parseText "Le serveur fonctionne avec des addons non-obligatoire,";
_info3 = parseText "Packs d'armes et d'uniformes Français. ";
_info4 = parseText "Vous pouvez trouver les liens sur le TS ou les récupérer via le site.";
_info5 = parseText "<br />------------------------<br />";
_info6 = parseText "<t color='#CC0000' size='1.1' shadow='2' shadowColor='#000000' align='center'>Règles :</t>";
_info7 = parseText " Troll , Tk volontaires, Insultes et autres comportements inappropriés ne sont pas tolérés sur le serveur !";
//_don = parseText "<br />------------------------<br />";
//_don1 = parseText "<t color='#FFBF00' size='1.1' shadow='2' shadowColor='#000000' align='center'>Mercenaires Francais Donation : </t>";
//_don2 = parseText "Vous pouvez aider à maintenir le serveur en effectuant des donations via notre site web.";
//_don3 = parseText "Les donations servent à maintenir le serveur, le Teamspeack et le Site.";

//_txt = composeText [_title,_separator,_imageFile,_separator,_ts,_separator,_infox,_info,_info1,_info2,_info3,_info4,_info5,_info6,_info7,_don,_don1,_don2,_don3];
_txt = composeText [_title,_separator,_imageFile,_separator,_ts,_separator,_infox,_info,_info1,_info2,_info3,_info4,_info5,_info6,_info7];
hintSilent _txt;

_displayCount = _displayCount + 1;

// Delay hint redisplay for 10 seconds to reduce server strain, hence (_n) is ^10
sleep 30;
};