<?php


function connectMySQL()
{
    $dsn = "mysql:host=127.0.0.1;dbname=user12";
    $link = null;
    try{
        $link = new PDO($dsn, "user12", "user12");
    } catch(PDOException $e) {
        echo 'Подключение не удалось: ' . $e->getMessage();
    }
    return $link;
}

function maxId($link)
{
    $sql="SELECT MAX(id) from task1";
    $res=$link->query($sql)->fetch();
    return $res[0];
}
function insertion($link)
{
    $n=1000000;
    //$n=10;
    $nameLen = 100;
    //$nameLen=4;

    $letters = array_merge(range(65,90), range(97,122));
    $letters = array_flip($letters);
    //$b = array_map("chr", $letters);
    //print_r($letters);
    //print_r($b);

        $sql = "INSERT INTO task1(id, name, descr) VALUES(?,?,?)";
        $stmt = $link->prepare($sql);
        
    $lastId = maxId($link);
    //echo "LastId=$lastId";
    for($i=$lastId; $i<$n; $i++){
        $name="";
        for($j=0; $j<$nameLen; $j++){
            $name .= chr(array_rand($letters));
        }
        $descr = str_repeat($name, 5);

    $id=$i;
        $stmt->bindParam(1, $id);
        $stmt->bindParam(2, $name);
        $stmt->bindParam(3, $descr);
        $stmt->execute();

    }
    return null;
}


$link = connectMySQL();
insertion($link);
//maxId($link);

?>
