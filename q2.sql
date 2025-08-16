USE tv_shows;

DROP PROCEDURE IF EXISTS GetWatchHistoryBySubscriber;

DELIMITER &&

CREATE PROCEDURE GetWatchHistoryBySubscriber(IN sub_id INT)
BEGIN
    SELECT subs.SubscriberName AS Subscriber_Name, 
           sho.Title AS Show_Title, 
           wh.WatchTime AS Watch_Time
    FROM WatchHistory wh
    JOIN Subscribers subs ON wh.SubscriberID = subs.SubscriberID
    JOIN Shows sho ON wh.ShowID = sho.ShowID
    WHERE subs.SubscriberID = sub_id;
END &&

DELIMITER ;

CALL GetWatchHistoryBySubscriber(2);
