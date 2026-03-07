INSERT INTO roles(name)
VALUES ('USER');

--пароль qwe123
INSERT INTO PUBLIC.USERS (USERNAME, EMAIL, PASSWORD, ACCOUNT_NUMBER, PHONE, BALANCE, ENABLED, LANGUAGE, ROLE_ID)
VALUES ('john_doe', 'john@example.com', '$2a$12$j/XjLRV4klQOMv6qEaOT4ubL9B2dQiHvz0LkZlAxgwNDG3CQeLzOq', 'ABC123',
        '0550123456', 395, true, 'ru', 1);
INSERT INTO PUBLIC.USERS (USERNAME, EMAIL, PASSWORD, ACCOUNT_NUMBER, PHONE, BALANCE, ENABLED, LANGUAGE, ROLE_ID)
VALUES ('jane_smith', 'jane@example.com', '$2a$12$j/XjLRV4klQOMv6qEaOT4ubL9B2dQiHvz0LkZlAxgwNDG3CQeLzOq', 'XYZ789',
        '0999123456', 800, true, 'ru', 1);
INSERT INTO PUBLIC.USERS (USERNAME, EMAIL, PASSWORD, ACCOUNT_NUMBER, PHONE, BALANCE, ENABLED, LANGUAGE, ROLE_ID)
VALUES ('ivan30@gmail.com', 'ivan30@gmail.com', '$2a$10$X9nH1GOXi.l34AOnQd6c.uMMa8DPahZqUVZkJIIN3gCPmt09SzAxe',
        '5CA878', '0555323232', 1000, true, null, 1);
INSERT INTO PUBLIC.USERS (USERNAME, EMAIL, PASSWORD, ACCOUNT_NUMBER, PHONE, BALANCE, ENABLED, LANGUAGE, ROLE_ID)
VALUES ('alex.kim@mail.com', 'alex.kim@mail.com', '$2a$10$Eh6r.VS8qb6YS3nPpKW1huqiijxw.sLnlJEkS2p7mpE7LWAWljz3q',
        '4B4DDA', '0888888888', 1000, true, 'en', 1);
INSERT INTO PUBLIC.USERS (USERNAME, EMAIL, PASSWORD, ACCOUNT_NUMBER, PHONE, BALANCE, ENABLED, LANGUAGE, ROLE_ID)
VALUES ('Denis', 'devskjj@gmail.com', '$2a$10$jeM..H/MtouuF12LD9aT5.Oso9n.T9dGmqgEocqqURbmas8RepP36', 'FC5E2D',
        '0555320152', 520, true, null, 1);
INSERT INTO PUBLIC.USERS (USERNAME, EMAIL, PASSWORD, ACCOUNT_NUMBER, PHONE, BALANCE, ENABLED, LANGUAGE, ROLE_ID)
VALUES ('Denka', 'dev@gmail.com', '$2a$10$.7EDqspnGfHkGjpYzPyBJO6NjKrQ9aHzHvFStcdg3gsJfk7.y1Xqm', '6CC723',
        '0229999999', 1000, true, null, 1);

INSERT
INTO service_providers (name)
VALUES ('Beeline');

INSERT INTO service_providers (name)
VALUES ('Водоканал');

INSERT INTO provider_accounts (provider_id, user_id, phone_number, account_number, balance)
VALUES ((SELECT id FROM service_providers WHERE name = 'Beeline'),
        (SELECT id FROM users WHERE email = 'john@example.com'),
        (SELECT phone FROM users WHERE email = 'john@example.com'), 'BL770012', 1500.0);

INSERT INTO provider_accounts (provider_id, user_id, phone_number, account_number, balance)
VALUES ((SELECT id FROM service_providers WHERE name = 'Beeline'),
        (SELECT id FROM users WHERE email = 'jane@example.com'),
        (SELECT phone FROM users WHERE email = 'jane@example.com'), 'BL773456', 2300.0);

INSERT INTO provider_accounts (provider_id, user_id, phone_number, account_number, balance)
VALUES ((SELECT id FROM service_providers WHERE name = 'Водоканал'),
        (SELECT id FROM users WHERE email = 'john@example.com'),
        (SELECT phone FROM users WHERE email = 'john@example.com'), 'VD87654321', 2800.0);

INSERT INTO provider_accounts (provider_id, user_id, phone_number, account_number, balance)
VALUES ((SELECT id FROM service_providers WHERE name = 'Водоканал'),
        (SELECT id FROM users WHERE email = 'jane@example.com'),
        (SELECT phone FROM users WHERE email = 'jane@example.com'), 'VD87654000', 800.0);

INSERT INTO PUBLIC.TRANSACTIONS (USER_ID, AMOUNT, DATE, TYPE, COUNTERPARTY, DESCRIPTION)
VALUES (5, 220, '2026-03-07 20:00:38.494087', 'PAYMENT', 'Водоканал', 'Payment to Водоканал (account: VD87654000)');
INSERT INTO PUBLIC.TRANSACTIONS (USER_ID, AMOUNT, DATE, TYPE, COUNTERPARTY, DESCRIPTION)
VALUES (5, 100, '2026-03-07 20:01:02.753062', 'TRANSFER_SENT', 'XYZ789', 'Transfer to jane_smith');
INSERT INTO PUBLIC.TRANSACTIONS (USER_ID, AMOUNT, DATE, TYPE, COUNTERPARTY, DESCRIPTION)
VALUES (2, 100, '2026-03-07 20:01:02.753082', 'TRANSFER_RECEIVED', 'FC5E2D', 'Transfer from Denis');
INSERT INTO PUBLIC.TRANSACTIONS (USER_ID, AMOUNT, DATE, TYPE, COUNTERPARTY, DESCRIPTION)
VALUES (2, 400, '2026-03-07 20:01:48.936053', 'PAYMENT', 'Beeline', 'Payment to Beeline (account: BL770012)');
INSERT INTO PUBLIC.TRANSACTIONS (USER_ID, AMOUNT, DATE, TYPE, COUNTERPARTY, DESCRIPTION)
VALUES (1, 100, '2026-03-07 20:14:58.192851', 'TRANSFER_SENT', 'XYZ789', 'Перевод пользователю jane_smith');
INSERT INTO PUBLIC.TRANSACTIONS (USER_ID, AMOUNT, DATE, TYPE, COUNTERPARTY, DESCRIPTION)
VALUES (2, 100, '2026-03-07 20:14:58.192878', 'TRANSFER_RECEIVED', 'ABC123', 'Перевод от пользователя john_doe');
INSERT INTO PUBLIC.TRANSACTIONS (USER_ID, AMOUNT, DATE, TYPE, COUNTERPARTY, DESCRIPTION)
VALUES (1, 200, '2026-03-07 20:15:29.639502', 'PAYMENT', 'Beeline', 'Оплата услуг Beeline (лицевой счет: BL773456)');
INSERT INTO PUBLIC.TRANSACTIONS (USER_ID, AMOUNT, DATE, TYPE, COUNTERPARTY, DESCRIPTION)
VALUES (1, 150, '2026-03-07 20:16:05.160479', 'PAYMENT', 'Beeline', 'Оплата услуг Beeline (лицевой счет: BL770012)');
INSERT INTO PUBLIC.TRANSACTIONS (USER_ID, AMOUNT, DATE, TYPE, COUNTERPARTY, DESCRIPTION)
VALUES (1, 300, '2026-03-07 20:16:20.673597', 'PAYMENT', 'Водоканал',
        'Оплата услуг Водоканал (лицевой счет: VD87654000)');
INSERT INTO PUBLIC.TRANSACTIONS (USER_ID, AMOUNT, DATE, TYPE, COUNTERPARTY, DESCRIPTION)
VALUES (5, 160, '2026-03-07 20:16:52.601540', 'TRANSFER_SENT', 'ABC123', 'Transfer to john_doe');
INSERT INTO PUBLIC.TRANSACTIONS (USER_ID, AMOUNT, DATE, TYPE, COUNTERPARTY, DESCRIPTION)
VALUES (1, 160, '2026-03-07 20:16:52.601545', 'TRANSFER_RECEIVED', 'FC5E2D', 'Transfer from Denis');
INSERT INTO PUBLIC.TRANSACTIONS (USER_ID, AMOUNT, DATE, TYPE, COUNTERPARTY, DESCRIPTION)
VALUES (1, 15, '2026-03-07 20:22:34.028462', 'PAYMENT', 'Водоканал',
        'Оплата услуг Водоканал (лицевой счет: VD87654321)');
