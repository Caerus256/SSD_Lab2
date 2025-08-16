USE tv_shows;

DROP PROCEDURE IF EXISTS AddSubscriberIfNotExists;

DELIMITER &&

CREATE PROCEDURE AddSubscriberIfNotExists(IN subName VARCHAR(100))
BEGIN
	DECLARE id_exist INT;
    	DECLARE new_id INT;

    	SELECT SubscriberID INTO id_exist FROM Subscribers
    		WHERE SubscriberName = subName
    	LIMIT 1;

    	IF id_exist IS NULL THEN
		SELECT IFNULL(MAX(SubscriberID), 0) + 1 INTO new_id FROM Subscribers;
		INSERT INTO Subscribers (SubscriberID, SubscriberName, SubscriptionDate) VALUES 
			(new_id, subName, CURDATE());
		SELECT CONCAT('Subscriber "', subName, '" added successfully with ID ', new_id) AS Message;
    	ELSE
        	SELECT CONCAT('Subscriber "', subName, '" already exists with ID ', id_exist) AS Message;
    	END IF;
END &&

DELIMITER ;

CALL AddSubscriberIfNotExists("Chris Lewis");
CALL AddSubscriberIfNotExists("Chris Lewis");
