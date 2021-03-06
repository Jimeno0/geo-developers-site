<?php
require_once '../config.php';
require_once 'init.php';

$GeodevDB = new GeodevDB(array("meetup_id" => $_GET["query"]));

$userprofile = $GeodevDB->getUser(array("type" => "userprofile"));

if($userprofile){

    $smarty->assign('PROFILE',      $userprofile);
    $smarty->assign('SKILLSGIS',    $GeodevDB->getUserSkills(array("type" => "gis")));
    $smarty->assign('SKILLS',       $GeodevDB->getUserSkills(array("type" => "other")));
    $smarty->assign('REFERRERS',    $referrers = $GeodevDB->getReferrers());
    $smarty->assign('ACTION', "view");

    $smarty->assign('ISRECOMMENDED', false);
    if(isset($_SESSION["user"])){

      $date = getdate();

      $date = $date["year"] ."-". $date["mon"]."-".$date["mday"];
      $db -> where ("visitor", $_SESSION["user"]['id'])
          -> where ("visited", $userprofile['id'])
          -> where ("date", $date,"=");
      $visit = $db->get('profile_views');
      if(!$visit){
        $db -> insert("profile_views",array(
          "visitor" => $_SESSION["user"]['id'],
          "visited" => $userprofile['id'],
          "date" => $date
        ));
      }

      if($GeodevDB->getIsReferred(array("referrer" => $_SESSION["user"]["meetup_id"]))){
          $smarty->assign('ISRECOMMENDED', true);
      }
    }

    $smarty->display('profile.tpl');
}else{
    echo "Error el usuario no existe en la base de datos";
}
?>