<?php
define("USER","user12");
define("PASSWORD","user12");
define("DBNAME","user12");

//define("USER","root");
//define("PASSWORD","123");

function connectMySQL()
{
    $dsn = "mysql:host=127.0.0.1;dbname=".DBNAME;
    $link = null;
    try{
        $link = new PDO($dsn, USER, PASSWORD);
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
    $nameLength = 100;
    //$nameLength=4;
	
	$characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $charactersLength = strlen($characters);

    $sql = "INSERT INTO task1(id, name, descr) VALUES(?,?,?)";
    $stmt = $link->prepare($sql);
        
	$newId = maxId($link)+1;
    for($i=$newId; $i<$n; $i++){
        $name = '';
		for ($j = 0; $j < $nameLength; $j++) {
			$name .= $characters[rand(0, $charactersLength - 1)];
		}
        $descr = str_repeat($name, 5);
		$id=$i;
        $stmt->bindParam(1, $id);
        $stmt->bindParam(2, $name);
        $stmt->bindParam(3, $descr);
        $stmt->execute();
		echo "$id\n";
    }
    return null;
}


$link = connectMySQL();
insertion($link);


?>
