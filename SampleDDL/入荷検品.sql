---------------------------------------------------------------------------
-- System: FWP(fwp)
-- Table : ���B��
-- Author: tamekataFW
-- Date  : 2015-04-08
---------------------------------------------------------------------------

CREATE TABLE t_splr (
    splr_cd INTEGER NOT NULL,
    splr_nm VARCHAR(100),
    pms_i_ymd TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    pms_i_usr VARCHAR(32) DEFAULT USER NOT NULL,
    pms_i_class VARCHAR(128),
    pms_u_ymd TIMESTAMP,
    pms_u_usr VARCHAR(32),
    pms_u_class VARCHAR(128),
    CONSTRAINT con_t_splr_pri PRIMARY KEY (splr_cd)
);

COMMENT ON TABLE t_splr IS '���B��';
COMMENT ON COLUMN t_splr.splr_cd IS '���B��R�[�h';
COMMENT ON COLUMN t_splr.splr_nm IS '���B�於��';
---------------------------------------------------------------------------
-- System: FWP(fwp)
-- Table : ���i
-- Author: tamekataFW
-- Date  : 2015-04-08
---------------------------------------------------------------------------

CREATE TABLE t_gds (
    gds_cd INTEGER NOT NULL,
    gds_nm VARCHAR(100),
    pms_i_ymd TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    pms_i_usr VARCHAR(32) DEFAULT USER NOT NULL,
    pms_i_class VARCHAR(128),
    pms_u_ymd TIMESTAMP,
    pms_u_usr VARCHAR(32),
    pms_u_class VARCHAR(128),
    CONSTRAINT con_t_gds_pri PRIMARY KEY (gds_cd)
);

COMMENT ON TABLE t_gds IS '���i';
COMMENT ON COLUMN t_gds.gds_cd IS '���i�R�[�h';
COMMENT ON COLUMN t_gds.gds_nm IS '���i����';
---------------------------------------------------------------------------
-- System: FWP(fwp)
-- Table : �i�������
-- Author: tamekataFW
-- Date  : 2015-04-08
---------------------------------------------------------------------------

CREATE TABLE t_qlty_insp_std (
    qlty_insp_std_cd INTEGER NOT NULL,
    qlty_insp_std_nm VARCHAR(100),
    qlty_insp_smry VARCHAR(2000),
    pms_i_ymd TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    pms_i_usr VARCHAR(32) DEFAULT USER NOT NULL,
    pms_i_class VARCHAR(128),
    pms_u_ymd TIMESTAMP,
    pms_u_usr VARCHAR(32),
    pms_u_class VARCHAR(128),
    CONSTRAINT con_t_qlty_insp_std_pri PRIMARY KEY (qlty_insp_std_cd)
);

COMMENT ON TABLE t_qlty_insp_std IS '�i�������';
COMMENT ON COLUMN t_qlty_insp_std.qlty_insp_std_cd IS '�i��������R�[�h';
COMMENT ON COLUMN t_qlty_insp_std.qlty_insp_std_nm IS '�i���������';
---------------------------------------------------------------------------
-- System: FWP(fwp)
-- Table : ���i.�i�������.�Ώƕ\
-- Author: tamekataFW
-- Date  : 2015-04-08
---------------------------------------------------------------------------

CREATE TABLE t_gds_qlty_insp_std (
    gds_cd INTEGER NOT NULL,
    qlty_insp_std_cd INTEGER NOT NULL,
    gds_insp_trgt_div_cd VARCHAR(1) NOT NULL,
    pass_std_infr_rate DECIMAL(4,1) NOT NULL,
    insp_rate DECIMAL(3,1),
    pms_i_ymd TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    pms_i_usr VARCHAR(32) DEFAULT USER NOT NULL,
    pms_i_class VARCHAR(128),
    pms_u_ymd TIMESTAMP,
    pms_u_usr VARCHAR(32),
    pms_u_class VARCHAR(128),
    CONSTRAINT con_t_gds_qlty_insp_std_pri PRIMARY KEY (gds_cd,qlty_insp_std_cd),
    CONSTRAINT con_t_gds_qlty_insp_std_ref1 FOREIGN KEY (gds_cd) REFERENCES t_gds,
    CONSTRAINT con_t_gds_qlty_insp_std_ref2 FOREIGN KEY (qlty_insp_std_cd) REFERENCES t_qlty_insp_std
);

COMMENT ON TABLE t_gds_qlty_insp_std IS '���i.�i�������.�Ώƕ\';
COMMENT ON COLUMN t_gds_qlty_insp_std.gds_cd IS '���i�R�[�h';
COMMENT ON COLUMN t_gds_qlty_insp_std.qlty_insp_std_cd IS '�i��������R�[�h';
---------------------------------------------------------------------------
-- System: FWP(fwp)
-- Table : ����
-- Author: tamekataFW
-- Date  : 2015-04-08
---------------------------------------------------------------------------

CREATE TABLE t_pord (
    pord_no INTEGER NOT NULL,
    pord_no_ns INTEGER,
    pord_no_nc INTEGER,
    splr_cd INTEGER NOT NULL,
    gds_cd INTEGER NOT NULL,
    pord_dt DATE,
    pord_qty DECIMAL(6,0),
    pms_i_ymd TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    pms_i_usr VARCHAR(32) DEFAULT USER NOT NULL,
    pms_i_class VARCHAR(128),
    pms_u_ymd TIMESTAMP,
    pms_u_usr VARCHAR(32),
    pms_u_class VARCHAR(128),
    CONSTRAINT con_t_pord_pri PRIMARY KEY (pord_no),
    CONSTRAINT con_t_pord_ref1 FOREIGN KEY (splr_cd) REFERENCES t_splr,
    CONSTRAINT con_t_pord_ref2 FOREIGN KEY (gds_cd) REFERENCES t_gds
);
CREATE INDEX i_t_pord_alt1 ON t_pord (pord_no_ns);
CREATE INDEX i_t_pord_alt2 ON t_pord (pord_no_nc);

COMMENT ON TABLE t_pord IS '����';
COMMENT ON COLUMN t_pord.pord_no IS '�����ԍ�';
COMMENT ON COLUMN t_pord.pord_no_ns IS '������t���O';
COMMENT ON COLUMN t_pord.pord_no_nc IS '�������t���O';
COMMENT ON COLUMN t_pord.splr_cd IS '���B��R�[�h';
COMMENT ON COLUMN t_pord.gds_cd IS '���i�R�[�h';
COMMENT ON COLUMN t_pord.pord_dt IS '������';
COMMENT ON COLUMN t_pord.pord_qty IS '������';
---------------------------------------------------------------------------
-- System: FWP(fwp)
-- Table : �������HDR
-- Author: tamekataFW
-- Date  : 2015-04-08
---------------------------------------------------------------------------

CREATE TABLE t_ldg_acpt_hdr (
    ldg_acpt_no INTEGER NOT NULL,
    ldg_acpt_dt DATE,
    pms_i_ymd TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    pms_i_usr VARCHAR(32) DEFAULT USER NOT NULL,
    pms_i_class VARCHAR(128),
    pms_u_ymd TIMESTAMP,
    pms_u_usr VARCHAR(32),
    pms_u_class VARCHAR(128),
    CONSTRAINT con_t_ldg_acpt_hdr_pri PRIMARY KEY (ldg_acpt_no)
);

COMMENT ON TABLE t_ldg_acpt_hdr IS '�������HDR';
COMMENT ON COLUMN t_ldg_acpt_hdr.ldg_acpt_no IS '��������ԍ�';
COMMENT ON COLUMN t_ldg_acpt_hdr.ldg_acpt_dt IS '���������';
---------------------------------------------------------------------------
-- System: FWP(fwp)
-- Table : �����������
-- Author: tamekataFW
-- Date  : 2015-04-08
---------------------------------------------------------------------------

CREATE TABLE t_ldg_acpt_dtl (
    ldg_acpt_no INTEGER NOT NULL,
    acpt_dtl_no INTEGER NOT NULL,
    acpt_qty INTEGER,
    pord_no INTEGER NOT NULL,
    pms_i_ymd TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    pms_i_usr VARCHAR(32) DEFAULT USER NOT NULL,
    pms_i_class VARCHAR(128),
    pms_u_ymd TIMESTAMP,
    pms_u_usr VARCHAR(32),
    pms_u_class VARCHAR(128),
    CONSTRAINT con_t_ldg_acpt_dtl_pri PRIMARY KEY (ldg_acpt_no,acpt_dtl_no)
);

COMMENT ON TABLE t_ldg_acpt_dtl IS '�����������';
COMMENT ON COLUMN t_ldg_acpt_dtl.ldg_acpt_no IS '��������ԍ�';
COMMENT ON COLUMN t_ldg_acpt_dtl.acpt_dtl_no IS '������הԍ�';
COMMENT ON COLUMN t_ldg_acpt_dtl.acpt_qty IS '�����';
COMMENT ON COLUMN t_ldg_acpt_dtl.pord_no IS '�����ԍ�';
---------------------------------------------------------------------------
-- System: FWP(fwp)
-- Table : ���׌��i���b�g
-- Author: tamekataFW
-- Date  : 2015-04-08
---------------------------------------------------------------------------

CREATE TABLE t_rcv_ins_lot (
    rcv_insp_no INTEGER NOT NULL,
    ldg_acpt_no INTEGER NOT NULL,
    acpt_dtl_no INTEGER NOT NULL,
    insp_dt DATE,
    acpt_qty INTEGER,
    acpt_rslt_div_cd VARCHAR(1),
    pms_i_ymd TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    pms_i_usr VARCHAR(32) DEFAULT USER NOT NULL,
    pms_i_class VARCHAR(128),
    pms_u_ymd TIMESTAMP,
    pms_u_usr VARCHAR(32),
    pms_u_class VARCHAR(128),
    CONSTRAINT con_t_rcv_ins_lot_pri PRIMARY KEY (rcv_insp_no),
    CONSTRAINT con_t_rcv_ins_lot_ref1 FOREIGN KEY (ldg_acpt_no) REFERENCES t_ldg_acpt_hdr
);

COMMENT ON TABLE t_rcv_ins_lot IS '���׌��i���b�g';
COMMENT ON COLUMN t_rcv_ins_lot.rcv_insp_no IS '���׌��i�ԍ�';
COMMENT ON COLUMN t_rcv_ins_lot.ldg_acpt_no IS '��������ԍ�';
COMMENT ON COLUMN t_rcv_ins_lot.acpt_dtl_no IS '������הԍ�';
COMMENT ON COLUMN t_rcv_ins_lot.insp_dt IS '���i��';
COMMENT ON COLUMN t_rcv_ins_lot.acpt_qty IS '�����';
COMMENT ON COLUMN t_rcv_ins_lot.acpt_rslt_div_cd IS '������ۋ敪�R�[�h';
---------------------------------------------------------------------------
-- System: FWP(fwp)
-- Table : ���׌��i����
-- Author: tamekataFW
-- Date  : 2015-04-08
---------------------------------------------------------------------------

CREATE TABLE t_rcv_insp_insp (
    rcv_insp_no INTEGER NOT NULL,
    rcv_insp_dtl_no INTEGER NOT NULL,
    qlty_insp_infr_qty INTEGER,
    qlty_insp_trgt_qty INTEGER,
    infr_rate DECIMAL(3,1),
    insp_rslt_div_cd VARCHAR(1),
    gds_cd INTEGER NOT NULL,
    qlty_insp_std_cd INTEGER NOT NULL,
    pms_i_ymd TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    pms_i_usr VARCHAR(32) DEFAULT USER NOT NULL,
    pms_i_class VARCHAR(128),
    pms_u_ymd TIMESTAMP,
    pms_u_usr VARCHAR(32),
    pms_u_class VARCHAR(128),
    CONSTRAINT con_t_rcv_insp_insp_pri PRIMARY KEY (rcv_insp_no,rcv_insp_dtl_no),
    CONSTRAINT con_t_rcv_insp_insp_ref1 FOREIGN KEY (rcv_insp_no) REFERENCES t_rcv_ins_lot,
    CONSTRAINT con_t_rcv_insp_insp_ref2 FOREIGN KEY (gds_cd) REFERENCES t_gds,
    CONSTRAINT con_t_rcv_insp_insp_ref3 FOREIGN KEY (qlty_insp_std_cd) REFERENCES t_qlty_insp_std
);

COMMENT ON TABLE t_rcv_insp_insp IS '���׌��i����';
COMMENT ON COLUMN t_rcv_insp_insp.rcv_insp_no IS '���׌��i�ԍ�';
COMMENT ON COLUMN t_rcv_insp_insp.qlty_insp_infr_qty IS '�i�������s�ǐ�';
COMMENT ON COLUMN t_rcv_insp_insp.gds_cd IS '���i�R�[�h';
COMMENT ON COLUMN t_rcv_insp_insp.qlty_insp_std_cd IS '�i��������R�[�h';
