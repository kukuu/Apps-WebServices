<?php
include 'config.php';
//in bar assase venue event ro check mikone 
if(isset($_GET['action'])&isset($_GET['date'])){
    $acction=$_GET['action'];
    $date=$_GET['date'];
    $data=array();
    $data['data']=array();
    // get events acording to  date  
     $query=$pdo->prepare("SELECT * FROM  `venue` ");
    $query->execute();
    $venues=$query->fetchAll(PDO::FETCH_ASSOC);   
   // $date="$date 00:00:00";
     $event_indicator=0;
    foreach($venues as $venue){
        
            
    
    
    //$date="$date 00:00:00";
       $query=$pdo->prepare("SELECT * FROM  `events` where `venue_id`=? and `date` = ?");
          $query->bindValue(1,$venue['id']);
		  $query->bindValue(2,"$date");
        $query->execute();
        $events=$query->fetchAll(PDO::FETCH_ASSOC);
        
       
        if($events){
        //venu location
            $locations['address']=$venue['address'];
            $locations['postcode']=$venue['postcode'];
            $locations['city']=$venue['city'];
            $locations['latitude']=$venue['latitude'];
            $locations['longitude']=$venue['longitude'];
            // venue details and event detasil and artists 
        
            $ven['id']=$venue['id'];
            $ven['bio']=$venue['bio'];
            $ven['name']=$venue['name'];
            $ven['telephone']=$venue['phone'];
            if($venue['facebook']!=''){ $ven['urls']['facebook']=$venue['facebook'];}
            if($venue['twitter']!=''){ $ven['urls']['twitter']=$venue['twitter'];}
            if($venue['website']!=''){ $ven['urls']['website']=$venue['website'];}
            $ven['location']=$locations;
            $ven['logoImage']=$website_url."/gallery/venue_logo/$venue[logo]";
            $ven['mainImage']=$website_url."/gallery/venue_image/$venue[image]";   
            if($venue['promotion']!=''){
            $ven['promotion']=$venue['promotion'];
            }
        
        
    foreach($events as $event){
        
            
        //define genre
         $sql="SELECT * FROM `genre` WHERE id = $event[genre1]";
            $query=$pdo->query($sql);
            $genre1=$query->fetch(PDO::FETCH_ASSOC);
            $genre1name=$genre1['name'];
        
            $sql="SELECT * FROM `genre` WHERE id = $venue[genre]";
            $query=$pdo->query($sql);
            $venuegenre=$query->fetch(PDO::FETCH_ASSOC);
            $venuegenrename=$venuegenre['name'];
            
            
           
          
              
            //make event fieled
            $eventdetail['id']=$event['id'];
            $eventdetail['name']=$event['name'];
            $eventdetail['date']=$event['date'].'T'.$event['time'].'.000Z';
            $eventdetail['genres'][0]=$venuegenrename;
            
           
           
            $eventdetail['ageRestriction']=$event['age'];

        $event_artist_details['id']=$event['id'];
        $event_artist_details['name']=$event['name'];
        $event_artist_details['bio']=$event['bio'];
          $event_artist_details['genres'][0]=$venuegenrename;  
        $event_artist_details['genres'][1]= $genre1name;

        
        if($event['youtube']!=''){$event_artist_details['urls']['youtube']=$event['youtube'];}
         if($event['url']!=''){$event_artist_details['urls']['facebook']=$event['url'];}
         $query=$pdo->prepare("SELECT * FROM  `event_gallery` where `event_id`=? ");
          $query->bindValue(1,$event['id']);
		  
        $query->execute();
        $event_artist_images=$query->fetchAll(PDO::FETCH_ASSOC);
        $imagesarray=array();
        foreach($event_artist_images as $event_artist_image){
            $imagefile=$website_url."/gallery/events/".$event_artist_image['file'];
            array_push($imagesarray, $imagefile);
            
        }
        $event_artist_details['images']=$imagesarray;
        $event_artist_details['mainImage']=$imagesarray[0];
        
        
        $eventdetail['performance'][0]=$event_artist_details;
        

      

           
            $ven['events'][$event_indicator]=$eventdetail;

            unset($eventdetail);
            $event_indicator++;
           
    }
           
        
  
   
     $event_indicator=0;
    array_push($data['data'],$ven );
          //  $event_indicator++;
           unset($ven);
    
    
    //end if 
    }else{
       // break;
    }
     
    }   
    $data['name']="get.event.successful";
    $data['status']=200;
    header("Content-Type: application/json");
    echo  $out=json_encode($data,JSON_PRETTY_PRINT);

 
     
    
    

    
    
    
}


