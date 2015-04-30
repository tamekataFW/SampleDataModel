-- Project Name : IVTRY
-- Date/Time    : 2015/04/30 15:14:24
-- Author       : tamekataFW
-- RDBMS Type   : PostgreSQL
-- Application  : A5:SQL Mk-2

-- 商品
create table t_gds (
  gds_cd integer not null
  , gds_nm character varying(50) not null
  , pms_i_ymd timestamp without time zone default now() not null
  , pms_i_usr character varying(32) default "current_user"() not null
  , pms_i_class character varying(128)
  , pms_u_ymd timestamp without time zone
  , pms_u_usr character varying(32)
  , pms_u_class character varying(128)
  , constraint t_gds_PKC primary key (gds_cd)
) ;

-- 論理倉庫
create table t_lgcl_wh (
  wh_cd integer not null
  , seq integer not null
  , lgcl_wh_div_cd character varying(1) not null
  , pms_i_ymd timestamp without time zone default now() not null
  , pms_i_usr character varying(32) default "current_user"() not null
  , pms_i_class character varying(128)
  , pms_u_ymd timestamp without time zone
  , pms_u_usr character varying(32)
  , pms_u_class character varying(128)
  , constraint t_lgcl_wh_PKC primary key (wh_cd,seq)
) ;

-- 引当在庫
create table t_rsv_ivtry (
  gds_cd integer not null
  , rsv_wh_cd integer not null
  , cur_ivtry_qty integer default 0 not null
  , ivtry_rsv_qty integer default 0 not null
  , due_in_rsv_qty integer default 0 not null
  , pms_i_ymd timestamp without time zone default now() not null
  , pms_i_usr character varying(32) default "current_user"() not null
  , pms_i_class character varying(128)
  , pms_u_ymd timestamp without time zone
  , pms_u_usr character varying(32)
  , pms_u_class character varying(128)
  , constraint t_rsv_ivtry_PKC primary key (gds_cd,rsv_wh_cd)
) ;

-- 引当倉庫
create table t_rsv_wh (
  rsv_wh_cd integer not null
  , rsv_wh_nm character varying(50) not null
  , rsv_shp_area_div_cd character varying(1) not null
  , pms_i_ymd timestamp without time zone default now() not null
  , pms_i_usr character varying(32) default "current_user"() not null
  , pms_i_class character varying(128)
  , pms_u_ymd timestamp without time zone
  , pms_u_usr character varying(32)
  , pms_u_class character varying(128)
  , constraint t_rsv_wh_PKC primary key (rsv_wh_cd)
) ;

-- 出荷倉庫在庫
create table t_shp_wh_ivtry (
  wh_cd integer not null
  , seq integer not null
  , gds_cd integer not null
  , shp_work_qty integer default 0 not null
  , pms_i_ymd timestamp without time zone default now() not null
  , pms_i_usr character varying(32) default "current_user"() not null
  , pms_i_class character varying(128)
  , pms_u_ymd timestamp without time zone
  , pms_u_usr character varying(32)
  , pms_u_class character varying(128)
  , constraint t_shp_wh_ivtry_PKC primary key (wh_cd,seq,gds_cd)
) ;

-- 保管倉庫在庫
create table t_strg_wh_ivtry (
  wh_cd integer not null
  , seq integer not null
  , shlf_cd integer not null
  , gds_cd integer not null
  , cur_strg_ivtry_qty integer default 0 not null
  , shp_inst_qty integer default 0 not null
  , pms_i_ymd timestamp without time zone default now() not null
  , pms_i_usr character varying(32) default "current_user"() not null
  , pms_i_class character varying(128)
  , pms_u_ymd timestamp without time zone
  , pms_u_usr character varying(32)
  , pms_u_class character varying(128)
  , constraint t_strg_wh_ivtry_PKC primary key (wh_cd,seq,shlf_cd,gds_cd)
) ;

create index i_t_strg_wh_ivtry_alt1
  on t_strg_wh_ivtry(gds_cd,wh_cd,seq);

-- 物理倉庫
create table t_wh (
  wh_cd integer not null
  , wh_nm character varying(50) not null
  , wh_addr character varying(60)
  , wh_tel character varying(15)
  , pms_i_ymd timestamp without time zone default now() not null
  , pms_i_usr character varying(32) default "current_user"() not null
  , pms_i_class character varying(128)
  , pms_u_ymd timestamp without time zone
  , pms_u_usr character varying(32)
  , pms_u_class character varying(128)
  , constraint t_wh_PKC primary key (wh_cd)
) ;

-- 倉庫ロット在庫
create table t_wh_lot_ivtry (
  wh_cd integer not null
  , seq integer not null
  , shlf_cd integer not null
  , gds_cd integer not null
  , lot_no integer not null
  , rcv_d date not null
  , rcv_qty integer default 0 not null
  , lot_cur_ivtry_qty integer default 0 not null
  , lot_shp_inst_qty integer default 0 not null
  , pms_i_ymd timestamp without time zone default now() not null
  , pms_i_usr character varying(32) default "current_user"() not null
  , pms_i_class character varying(128)
  , pms_u_ymd timestamp without time zone
  , pms_u_usr character varying(32)
  , pms_u_class character varying(128)
  , constraint t_wh_lot_ivtry_PKC primary key (wh_cd,seq,shlf_cd,gds_cd,lot_no)
) ;

-- 物理倉庫.引当倉庫.対照表
create table t_wh_rsv_wh (
  rsv_wh_cd integer not null
  , wh_cd integer not null
  , pms_i_ymd timestamp without time zone default now() not null
  , pms_i_usr character varying(32) default "current_user"() not null
  , pms_i_class character varying(128)
  , pms_u_ymd timestamp without time zone
  , pms_u_usr character varying(32)
  , pms_u_class character varying(128)
  , constraint t_wh_rsv_wh_PKC primary key (rsv_wh_cd,wh_cd)
) ;

create index i_t_wh_rsv_wh_alt1
  on t_wh_rsv_wh(wh_cd,rsv_wh_cd);

alter table t_lgcl_wh
  add constraint t_lgcl_wh_FK1 foreign key (wh_cd) references t_wh(wh_cd)
  on delete cascade;

alter table t_strg_wh_ivtry
  add constraint t_strg_wh_ivtry_FK1 foreign key (wh_cd,seq) references t_lgcl_wh(wh_cd,seq)
  on delete cascade;

alter table t_shp_wh_ivtry
  add constraint t_shp_wh_ivtry_FK1 foreign key (wh_cd,seq) references t_lgcl_wh(wh_cd,seq)
  on delete cascade;

alter table t_wh_lot_ivtry
  add constraint t_wh_lot_ivtry_FK1 foreign key (gds_cd) references t_gds(gds_cd)
  on delete cascade;

alter table t_strg_wh_ivtry
  add constraint t_strg_wh_ivtry_FK2 foreign key (gds_cd) references t_gds(gds_cd)
  on delete cascade;

alter table t_shp_wh_ivtry
  add constraint t_shp_wh_ivtry_FK2 foreign key (gds_cd) references t_gds(gds_cd)
  on delete cascade;

alter table t_rsv_ivtry
  add constraint t_rsv_ivtry_FK1 foreign key (gds_cd) references t_gds(gds_cd)
  on delete cascade;

alter table t_wh_rsv_wh
  add constraint t_wh_rsv_wh_FK1 foreign key (rsv_wh_cd) references t_rsv_wh(rsv_wh_cd)
  on delete cascade;

alter table t_rsv_ivtry
  add constraint t_rsv_ivtry_FK2 foreign key (rsv_wh_cd) references t_rsv_wh(rsv_wh_cd)
  on delete cascade;

alter table t_wh_rsv_wh
  add constraint t_wh_rsv_wh_FK2 foreign key (wh_cd) references t_wh(wh_cd)
  on delete cascade;

alter table t_wh_lot_ivtry
  add constraint t_wh_lot_ivtry_FK2 foreign key (wh_cd) references t_wh(wh_cd)
  on delete cascade;

comment on table t_gds is '商品';
comment on column t_gds.gds_cd is '商品コード';
comment on column t_gds.gds_nm is '商品名称';
comment on column t_gds.pms_i_ymd is 'pms_i_ymd';
comment on column t_gds.pms_i_usr is 'pms_i_usr';
comment on column t_gds.pms_i_class is 'pms_i_class';
comment on column t_gds.pms_u_ymd is 'pms_u_ymd';
comment on column t_gds.pms_u_usr is 'pms_u_usr';
comment on column t_gds.pms_u_class is 'pms_u_class';

comment on table t_lgcl_wh is '論理倉庫';
comment on column t_lgcl_wh.wh_cd is '倉庫コード';
comment on column t_lgcl_wh.seq is '連番';
comment on column t_lgcl_wh.lgcl_wh_div_cd is '論理倉庫区分コード';
comment on column t_lgcl_wh.pms_i_ymd is 'pms_i_ymd';
comment on column t_lgcl_wh.pms_i_usr is 'pms_i_usr';
comment on column t_lgcl_wh.pms_i_class is 'pms_i_class';
comment on column t_lgcl_wh.pms_u_ymd is 'pms_u_ymd';
comment on column t_lgcl_wh.pms_u_usr is 'pms_u_usr';
comment on column t_lgcl_wh.pms_u_class is 'pms_u_class';

comment on table t_rsv_ivtry is '引当在庫';
comment on column t_rsv_ivtry.gds_cd is '商品コード';
comment on column t_rsv_ivtry.rsv_wh_cd is '引当倉庫コード';
comment on column t_rsv_ivtry.cur_ivtry_qty is '現在庫数';
comment on column t_rsv_ivtry.ivtry_rsv_qty is '在庫引当数';
comment on column t_rsv_ivtry.due_in_rsv_qty is '入庫予定引当数';
comment on column t_rsv_ivtry.pms_i_ymd is 'pms_i_ymd';
comment on column t_rsv_ivtry.pms_i_usr is 'pms_i_usr';
comment on column t_rsv_ivtry.pms_i_class is 'pms_i_class';
comment on column t_rsv_ivtry.pms_u_ymd is 'pms_u_ymd';
comment on column t_rsv_ivtry.pms_u_usr is 'pms_u_usr';
comment on column t_rsv_ivtry.pms_u_class is 'pms_u_class';

comment on table t_rsv_wh is '引当倉庫';
comment on column t_rsv_wh.rsv_wh_cd is '引当倉庫コード';
comment on column t_rsv_wh.rsv_wh_nm is '引当倉庫名称';
comment on column t_rsv_wh.rsv_shp_area_div_cd is '引当出荷地域区分コード';
comment on column t_rsv_wh.pms_i_ymd is 'pms_i_ymd';
comment on column t_rsv_wh.pms_i_usr is 'pms_i_usr';
comment on column t_rsv_wh.pms_i_class is 'pms_i_class';
comment on column t_rsv_wh.pms_u_ymd is 'pms_u_ymd';
comment on column t_rsv_wh.pms_u_usr is 'pms_u_usr';
comment on column t_rsv_wh.pms_u_class is 'pms_u_class';

comment on table t_shp_wh_ivtry is '出荷倉庫在庫';
comment on column t_shp_wh_ivtry.wh_cd is '倉庫コード';
comment on column t_shp_wh_ivtry.seq is '連番';
comment on column t_shp_wh_ivtry.gds_cd is '商品コード';
comment on column t_shp_wh_ivtry.shp_work_qty is '出荷作業数';
comment on column t_shp_wh_ivtry.pms_i_ymd is 'pms_i_ymd';
comment on column t_shp_wh_ivtry.pms_i_usr is 'pms_i_usr';
comment on column t_shp_wh_ivtry.pms_i_class is 'pms_i_class';
comment on column t_shp_wh_ivtry.pms_u_ymd is 'pms_u_ymd';
comment on column t_shp_wh_ivtry.pms_u_usr is 'pms_u_usr';
comment on column t_shp_wh_ivtry.pms_u_class is 'pms_u_class';

comment on table t_strg_wh_ivtry is '保管倉庫在庫';
comment on column t_strg_wh_ivtry.wh_cd is '倉庫コード';
comment on column t_strg_wh_ivtry.seq is '連番';
comment on column t_strg_wh_ivtry.shlf_cd is '棚コード';
comment on column t_strg_wh_ivtry.gds_cd is '商品コード';
comment on column t_strg_wh_ivtry.cur_strg_ivtry_qty is '現保管在庫数';
comment on column t_strg_wh_ivtry.shp_inst_qty is '出荷指示済数';
comment on column t_strg_wh_ivtry.pms_i_ymd is 'pms_i_ymd';
comment on column t_strg_wh_ivtry.pms_i_usr is 'pms_i_usr';
comment on column t_strg_wh_ivtry.pms_i_class is 'pms_i_class';
comment on column t_strg_wh_ivtry.pms_u_ymd is 'pms_u_ymd';
comment on column t_strg_wh_ivtry.pms_u_usr is 'pms_u_usr';
comment on column t_strg_wh_ivtry.pms_u_class is 'pms_u_class';

comment on table t_wh is '物理倉庫';
comment on column t_wh.wh_cd is '倉庫コード';
comment on column t_wh.wh_nm is '倉庫名称';
comment on column t_wh.wh_addr is '倉庫住所';
comment on column t_wh.wh_tel is '倉庫電話番号';
comment on column t_wh.pms_i_ymd is 'pms_i_ymd';
comment on column t_wh.pms_i_usr is 'pms_i_usr';
comment on column t_wh.pms_i_class is 'pms_i_class';
comment on column t_wh.pms_u_ymd is 'pms_u_ymd';
comment on column t_wh.pms_u_usr is 'pms_u_usr';
comment on column t_wh.pms_u_class is 'pms_u_class';

comment on table t_wh_lot_ivtry is '倉庫ロット在庫';
comment on column t_wh_lot_ivtry.wh_cd is '倉庫コード';
comment on column t_wh_lot_ivtry.seq is '連番';
comment on column t_wh_lot_ivtry.shlf_cd is '棚コード';
comment on column t_wh_lot_ivtry.gds_cd is '商品コード';
comment on column t_wh_lot_ivtry.lot_no is 'ロットNO';
comment on column t_wh_lot_ivtry.rcv_d is '入荷日';
comment on column t_wh_lot_ivtry.rcv_qty is '入荷数';
comment on column t_wh_lot_ivtry.lot_cur_ivtry_qty is 'ロット現在庫数';
comment on column t_wh_lot_ivtry.lot_shp_inst_qty is 'ロット出荷指示済数';
comment on column t_wh_lot_ivtry.pms_i_ymd is 'pms_i_ymd';
comment on column t_wh_lot_ivtry.pms_i_usr is 'pms_i_usr';
comment on column t_wh_lot_ivtry.pms_i_class is 'pms_i_class';
comment on column t_wh_lot_ivtry.pms_u_ymd is 'pms_u_ymd';
comment on column t_wh_lot_ivtry.pms_u_usr is 'pms_u_usr';
comment on column t_wh_lot_ivtry.pms_u_class is 'pms_u_class';

comment on table t_wh_rsv_wh is '物理倉庫.引当倉庫.対照表';
comment on column t_wh_rsv_wh.rsv_wh_cd is '引当倉庫コード';
comment on column t_wh_rsv_wh.wh_cd is '倉庫コード';
comment on column t_wh_rsv_wh.pms_i_ymd is 'pms_i_ymd';
comment on column t_wh_rsv_wh.pms_i_usr is 'pms_i_usr';
comment on column t_wh_rsv_wh.pms_i_class is 'pms_i_class';
comment on column t_wh_rsv_wh.pms_u_ymd is 'pms_u_ymd';
comment on column t_wh_rsv_wh.pms_u_usr is 'pms_u_usr';
comment on column t_wh_rsv_wh.pms_u_class is 'pms_u_class';

