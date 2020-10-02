
-- MENU --

INSERT INTO seg.menues (modulo, opcion, texto, url, javascript, orden, url_icono, texto_onmouseover, eliminado, fec_alta, usuario, usuario_app, opcion_padre) VALUES('ALM', 'stock', 'Stock', 'traz-comp-almacenes/Lote', NULL, 102, '/img/alm.gif', 'Stock', 0, '2020-10-02 10:09:13.036498-03', 'postgres', 'postgres', 'almacenes');
INSERT INTO seg.menues (modulo, opcion, texto, url, javascript, orden, url_icono, texto_onmouseover, eliminado, fec_alta, usuario, usuario_app, opcion_padre) VALUES('ALM', 'almacenes', 'Almacenes', '', NULL, 100, '/img/icono.gif', 'Almacenes', 0, '2020-10-02 10:09:13.036498-03', 'postgres', 'postgres', NULL);
INSERT INTO seg.menues (modulo, opcion, texto, url, javascript, orden, url_icono, texto_onmouseover, eliminado, fec_alta, usuario, usuario_app, opcion_padre) VALUES('ALM', 'articulos_abm', 'Articulos', 'traz-comp-almacenes/Articulo', NULL, 101, '/img/icono.gif', 'Articulos', 0, '2020-10-02 10:09:13.036498-03', 'postgres', 'postgres', 'almacenes');
INSERT INTO seg.menues (modulo, opcion, texto, url, javascript, orden, url_icono, texto_onmouseover, eliminado, fec_alta, usuario, usuario_app, opcion_padre) VALUES('ALM', 'entrega_abm', 'Entrega Materiales', 'traz-comp-almacenes/new/Entrega_Material', NULL, 103, '/img/icono.gif', 'Entrega Materiales', 0, '2020-10-02 10:09:13.036498-03', 'postgres', 'postgres', 'almacenes');
INSERT INTO seg.menues (modulo, opcion, texto, url, javascript, orden, url_icono, texto_onmouseover, eliminado, fec_alta, usuario, usuario_app, opcion_padre) VALUES('ALM', 'recepcion_abm', 'Recepción Materiales', 'traz-comp-almacenes/Remito', NULL, 104, '/img/icono.gif', 'Recepcion Materiales', 0, '2020-10-02 10:09:13.036498-03', 'postgres', 'postgres', 'almacenes');
INSERT INTO seg.menues (modulo, opcion, texto, url, javascript, orden, url_icono, texto_onmouseover, eliminado, fec_alta, usuario, usuario_app, opcion_padre) VALUES('ALM', 'punto_pedido_abm', 'Punto de Pedido', 'traz-comp-almacenes/Lote/puntoPedList', NULL, 105, '/img/icono.gif', 'Punto de Pedido', 0, '2020-10-02 10:09:13.036498-03', 'postgres', 'postgres', 'almacenes');
INSERT INTO seg.menues (modulo, opcion, texto, url, javascript, orden, url_icono, texto_onmouseover, eliminado, fec_alta, usuario, usuario_app, opcion_padre) VALUES('ALM', 'ajuste_abm', 'Ajuste Stock', 'traz-comp-almacenes/Ajustestock', NULL, 14, '/img/icono.gif', 'Ajuste Stock', 0, '2020-10-02 10:09:13.036498-03', 'postgres', 'postgres', 'almacenes');
INSERT INTO seg.menues (modulo, opcion, texto, url, javascript, orden, url_icono, texto_onmouseover, eliminado, fec_alta, usuario, usuario_app, opcion_padre) VALUES('ALM', 'pedido_materiales_abm', 'Pedido Materiales', 'traz-comp-almacenes/Notapedido', NULL, 14, '/img/icono.gif', 'Pedido Matariales', 0, '2020-10-02 10:09:13.036498-03', 'postgres', 'postgres', 'almacenes');


--  MEMBERSHIPS MENU  --
INSERT INTO memberships_menues (modulo, opcion, "group", "role", fec_alta, usuario, usuario_app) VALUES('ALM', 'almacenes', 'grupotest', 'roletest', '2020-10-02', 'postgres', 'postgres');


--  MEMBERSHIPS USER  --
INSERT INTO memberships_users ("group", "role", fec_alta, usuario, usuario_app, email) VALUES('grupotest', 'roletest', '2020-10-02 14:44:09.238826+00', 'postgres', 'postgres', 'admin@gmail.com');







