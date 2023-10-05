Wyświetl zwroty dla użytkownika Tomek

SELECT zwroty.*
FROM klienci
JOIN zwroty ON klienci.klient_id = zwroty.klient_id
WHERE klienci.imie = 'Tomek';

Wyświetl nazwe produktu które zwrócił Krzysztof tomczyk

SELECT telefony.marka_ID, telefony.model_ID
FROM klienci
JOIN zwroty ON klienci.klient_ID = zwroty.klient_ID
JOIN telefony ON zwroty.telefon_ID = telefony.telefon_ID
WHERE klienci.nazwisko = 'Tomczyk' AND klienci.imie = 'Krzysztof';

Wyświetl modele produktów które były na gwarancji w tym miesiącu

SELECT telefony.marka_ID, telefony.model_ID
FROM telefony
INNER JOIN gwarancje ON telefony.telefon_ID = gwarancje.zamówienie_ID
WHERE MONTH(gwarancje.data_oddania) = MONTH(CURDATE()) 
AND YEAR(gwarancje.data_oddania) = YEAR(CURDATE());


Wyświetl dane klientów którzy złożyli zamówienie w tym miesiącu

SELECT *
FROM klienci
WHERE klient_ID IN (
  SELECT klient_ID
  FROM zamówienia
  WHERE YEAR(data_zam) = YEAR(CURRENT_DATE)
    AND MONTH(data_zam) = MONTH(CURRENT_DATE)
);


Wyświetl wszystkie  produkty które były kupione w tym roku minimum 3 razy

SELECT telefony.marka_ID AS nazwa_telefonu, telefony.model_ID AS model_telefonu, COUNT(*) AS liczba_zamowien
FROM telefony 
INNER JOIN zamówienia  ON telefony.telefon_ID = zamówienia.telefon_ID
WHERE YEAR(zamówienia.data_zam) = YEAR(CURRENT_DATE)
GROUP BY telefony.marka_ID, telefony.model_ID
HAVING COUNT(*) = 3;


Wyświetl top 3 kielntów którzy najczęściej robia zakupy

SELECT klient_ID, COUNT(*) AS liczba_zakupow
FROM zamówienia
GROUP BY klient_ID
ORDER BY klient_ID DESC
LIMIT 3;


