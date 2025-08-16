USE tv_shows;

DROP PROCEDURE IF EXISTS PrintWatchTimeReports;

DELIMITER &&

CREATE PROCEDURE PrintWatchTimeReports()
BEGIN
    	DECLARE done INT DEFAULT FALSE;
    	DECLARE sub_id INT;
    	DECLARE cur CURSOR FOR SELECT SubscriberID FROM Subscribers;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    	OPEN cur;
   
    	subs_loop: LOOP
		FETCH cur INTO sub_id;
                IF done THEN
            		LEAVE subs_loop;
        	END IF;
        CALL GetWatchHistoryBySubscriber(sub_id);
        
    	END LOOP subs_loop;
    
    	CLOSE cur;
END &&
DELIMITER ;

CALL PrintWatchTimeReports();