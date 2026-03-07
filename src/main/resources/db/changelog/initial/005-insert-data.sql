INSERT INTO roles(name)
VALUES ('USER');

--пароль qwe123
INSERT INTO users (username, email, password, phone, account_number, balance, enabled, role_id, language)
VALUES ('john_doe', 'john@example.com', '$2a$12$j/XjLRV4klQOMv6qEaOT4ubL9B2dQiHvz0LkZlAxgwNDG3CQeLzOq', '0550123456',
        'ABC123', 1000.0, true, 1, 'ru'),
       ('jane_smith', 'jane@example.com', '$2a$12$j/XjLRV4klQOMv6qEaOT4ubL9B2dQiHvz0LkZlAxgwNDG3CQeLzOq', '0999123456',
        'XYZ789', 1000.0, true, 1, 'en');

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
