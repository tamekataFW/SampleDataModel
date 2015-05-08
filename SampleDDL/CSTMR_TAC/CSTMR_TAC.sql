-- Project Name : noname
-- Date/Time    : 2015/05/08 14:55:49
-- Author       : tonakata
-- RDBMS Type   : Oracle Database
-- Application  : A5:SQL Mk-2

-- �����
create table t_cstmr (
  cstmr_no character varying(10) not null
  , cstmr_nm character varying(50) not null
  , ho_addr character varying(100)
  , cstmr_org_div_cd character varying(20)
  , pms_i_ymd timestamp without time zone default now() not null
  , pms_i_usr character varying(32) default "current_user"() not null
  , pms_i_class character varying(128)
  , pms_u_ymd timestamp without time zone
  , pms_u_usr character varying(32)
  , pms_u_class character varying(128)
  , constraint t_cstmr_PKC primary key (cstmr_no)
) ;

-- �����_�������
create table t_cstmr_tac (
  cstmr_tac_no integer not null
  , cstmr_no character varying(10) not null
  , trd_div_cd character varying(1) not null
  , cls_d integer
  , pytrm integer
  , pms_i_ymd timestamp without time zone default now() not null
  , pms_i_usr character varying(32) default "current_user"() not null
  , pms_i_class character varying(128)
  , pms_u_ymd timestamp without time zone
  , pms_u_usr character varying(32)
  , pms_u_class character varying(128)
  , constraint t_cstmr_tac_PKC primary key (cstmr_tac_no)
) ;

create index i_t_cstmr_tac_alt1
  on t_cstmr_tac(cstmr_no);

-- �����_�����������
create table t_cstmr_tac_dtl (
  tac_dtl_id integer not null
  , cstmr_tac_no integer not null
  , rcpt_div_cd character varying(1) not null
  , bill_sght integer
  , trdaccnt_id integer
  , pms_i_ymd timestamp without time zone default now() not null
  , pms_i_usr character varying(32) default "current_user"() not null
  , pms_i_class character varying(128)
  , pms_u_ymd timestamp without time zone
  , pms_u_usr character varying(32)
  , pms_u_class character varying(128)
  , constraint t_cstmr_tac_dtl_PKC primary key (tac_dtl_id)
) ;

create index i_t_cstmr_tac_dtl_alt1
  on t_cstmr_tac_dtl(cstmr_tac_no);

-- �����.�������.�Ώƕ\
create table t_cstmr_trdaccnt (
  cstmr_trdaccnt_id integer not null
  , cstmr_no character varying(10) not null
  , trdaccnt_id integer not null
  , pms_i_ymd timestamp without time zone default now() not null
  , pms_i_usr character varying(32) default "current_user"() not null
  , pms_i_class character varying(128)
  , pms_u_ymd timestamp without time zone
  , pms_u_usr character varying(32)
  , pms_u_class character varying(128)
  , constraint t_cstmr_trdaccnt_PKC primary key (cstmr_trdaccnt_id)
) ;

create index i_t_cstmr_trdaccnt_alt1
  on t_cstmr_trdaccnt(cstmr_no,trdaccnt_id);

-- �������
create table t_trdaccnt (
  trdaccnt_id integer not null
  , bank_nm character varying(50) not null
  , bank_cd character varying(50)
  , bank_br_nm character varying(50)
  , bank_br_cd character varying(10)
  , accnt_typ character varying(10)
  , accnt_no character varying(10)
  , accnt_hldr character varying(50)
  , pms_i_ymd timestamp without time zone default now() not null
  , pms_i_usr character varying(32) default "current_user"() not null
  , pms_i_class character varying(128)
  , pms_u_ymd timestamp without time zone
  , pms_u_usr character varying(32)
  , pms_u_class character varying(128)
  , constraint t_trdaccnt_PKC primary key (trdaccnt_id)
) ;

comment on table t_cstmr is '�����';
comment on column t_cstmr.cstmr_no is '�����ԍ�';
comment on column t_cstmr.cstmr_nm is '�����_����';
comment on column t_cstmr.ho_addr is '�{�X���ݒn';
comment on column t_cstmr.cstmr_org_div_cd is '�����_�g�D�敪�R�[�h';
comment on column t_cstmr.pms_i_ymd is 'pms_i_ymd';
comment on column t_cstmr.pms_i_usr is 'pms_i_usr';
comment on column t_cstmr.pms_i_class is 'pms_i_class';
comment on column t_cstmr.pms_u_ymd is 'pms_u_ymd';
comment on column t_cstmr.pms_u_usr is 'pms_u_usr';
comment on column t_cstmr.pms_u_class is 'pms_u_class';

comment on table t_cstmr_tac is '�����_�������';
comment on column t_cstmr_tac.cstmr_tac_no is '�����_��������ݒ�ԍ�';
comment on column t_cstmr_tac.cstmr_no is '�����ԍ�';
comment on column t_cstmr_tac.trd_div_cd is '����敪�R�[�h';
comment on column t_cstmr_tac.cls_d is '����';
comment on column t_cstmr_tac.pytrm is '�����T�C�g';
comment on column t_cstmr_tac.pms_i_ymd is 'pms_i_ymd';
comment on column t_cstmr_tac.pms_i_usr is 'pms_i_usr';
comment on column t_cstmr_tac.pms_i_class is 'pms_i_class';
comment on column t_cstmr_tac.pms_u_ymd is 'pms_u_ymd';
comment on column t_cstmr_tac.pms_u_usr is 'pms_u_usr';
comment on column t_cstmr_tac.pms_u_class is 'pms_u_class';

comment on table t_cstmr_tac_dtl is '�����_�����������';
comment on column t_cstmr_tac_dtl.tac_dtl_id is '�����������ID';
comment on column t_cstmr_tac_dtl.cstmr_tac_no is '�����_��������ݒ�ԍ�';
comment on column t_cstmr_tac_dtl.rcpt_div_cd is '�������@�敪�R�[�h';
comment on column t_cstmr_tac_dtl.bill_sght is '��`�T�C�g';
comment on column t_cstmr_tac_dtl.trdaccnt_id is '��������Ǘ��ԍ�';
comment on column t_cstmr_tac_dtl.pms_i_ymd is 'pms_i_ymd';
comment on column t_cstmr_tac_dtl.pms_i_usr is 'pms_i_usr';
comment on column t_cstmr_tac_dtl.pms_i_class is 'pms_i_class';
comment on column t_cstmr_tac_dtl.pms_u_ymd is 'pms_u_ymd';
comment on column t_cstmr_tac_dtl.pms_u_usr is 'pms_u_usr';
comment on column t_cstmr_tac_dtl.pms_u_class is 'pms_u_class';

comment on table t_cstmr_trdaccnt is '�����.�������.�Ώƕ\';
comment on column t_cstmr_trdaccnt.cstmr_trdaccnt_id is '�����_�������ID';
comment on column t_cstmr_trdaccnt.cstmr_no is '�����ԍ�';
comment on column t_cstmr_trdaccnt.trdaccnt_id is '��������Ǘ��ԍ�';
comment on column t_cstmr_trdaccnt.pms_i_ymd is 'pms_i_ymd';
comment on column t_cstmr_trdaccnt.pms_i_usr is 'pms_i_usr';
comment on column t_cstmr_trdaccnt.pms_i_class is 'pms_i_class';
comment on column t_cstmr_trdaccnt.pms_u_ymd is 'pms_u_ymd';
comment on column t_cstmr_trdaccnt.pms_u_usr is 'pms_u_usr';
comment on column t_cstmr_trdaccnt.pms_u_class is 'pms_u_class';

comment on table t_trdaccnt is '�������';
comment on column t_trdaccnt.trdaccnt_id is '��������Ǘ��ԍ�';
comment on column t_trdaccnt.bank_nm is '���Z�@�֖�';
comment on column t_trdaccnt.bank_cd is '���Z�@�փR�[�h�i��s�R�[�h�j';
comment on column t_trdaccnt.bank_br_nm is '���Z�@�֎x�X��';
comment on column t_trdaccnt.bank_br_cd is '���Z�@�֎x�X�R�[�h';
comment on column t_trdaccnt.accnt_typ is '�������';
comment on column t_trdaccnt.accnt_no is '�����ԍ�';
comment on column t_trdaccnt.accnt_hldr is '�������`�l';
comment on column t_trdaccnt.pms_i_ymd is 'pms_i_ymd';
comment on column t_trdaccnt.pms_i_usr is 'pms_i_usr';
comment on column t_trdaccnt.pms_i_class is 'pms_i_class';
comment on column t_trdaccnt.pms_u_ymd is 'pms_u_ymd';
comment on column t_trdaccnt.pms_u_usr is 'pms_u_usr';
comment on column t_trdaccnt.pms_u_class is 'pms_u_class';

