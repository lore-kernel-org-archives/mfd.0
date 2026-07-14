Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D46C45BD6F;
	Tue, 14 Jul 2026 12:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784033794; cv=fail; b=YebxO/hJzGoRTU/aCBgdf+jg6+Qz1IIlVgZZJSw5kMpZDlZJ797VwLg46hQ3qjtWyWBXt/0ZRI2EtQb+EpQWCDXsfd+92w6YAOvJMtEAe2ixyFV5/nKHb6ThADhpej1i34Txu0/XzyLOMu/GpsViSnBJuc9anYSBbm2h1WSEk7k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784033794; c=relaxed/simple;
	bh=Iyr3hP4hzFLJxY7I4YxN6m/uBJr9a15xMqHltbEnrDM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nj3h0aBJEGXiqhxv+eVHnyoyxAdK9hq0uypW/xxoGD0ee3m2LYW4xRen9hcmJmcjcDbgEJrCk8WYzdGwQ68egp3DQ+zAF/oOgb+HPzGyzuxatHCT2N2MAS2J9nn319g4fV+oihUZjor++SetxTmhu6SrAkJeMqR2gffU1a9ozX8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=n3Ix9U96; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=qr+4Mma2; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="n3Ix9U96";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="qr+4Mma2"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EBQAI22106443;
	Tue, 14 Jul 2026 07:56:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=GYc6M55vcMvd+
	2q3j2XV2+gWQeYx+ehYAPO5ghPXcUM=; b=n3Ix9U96BHWyZ0SOTvYb8Mf6CnUTv
	hD/6LiXAAA1XsCpNBFehuwQqBqjGys1jY0iBoKwiB0ngeL0VN7MQXYDfZ5npBtlS
	1YqQuq7Vtr4/h0ONwjFt79cSX11iu1Q4T1+3Cidumko8r2kSiHDF46B02qOWAvcX
	VIBrPJdo2qFYo6jPRAkHCCZdNtFSyyY1p+Nmqk1EvJSltv7I51z+auDD9tbWJ9Tk
	YBG7fyem1epkSMQdc3K9exUveOQCEQiLkJahpErl2wNBGMtnObYT06q1iL88y670
	U68H5AQMN8nmm32y9onPYG74NX1ZCqb5OnaFf8x+IUlEzToDrcccZjaEA==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011056.outbound.protection.outlook.com [52.101.52.56])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fdm2tge16-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 14 Jul 2026 07:56:24 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FwyF/FDcJ7G+uzimcyqRnN8tsc3cqYQ0ewcyDzaxWsPtXIFOoW4nck2ckyQ8s5Qx3Xz98YYDnNgYykiFNOQaz0+BaEuhyMIg027seEupxvH5CPNrkL6TCynsbhLQ4maKfPPDDWn3MOHEOGpBknAmI+J6X1PCFW7t5Tc3cxxtawL2Qdwqvstk6olnvzhGBZq48T0LOn4laJvrVo+HEBws/lGbzBR/TyyOUsUJuf6JvmK2zMo7r45hoFWO9Cxv18MsS4tDtFvvFBywGNBnFIy6dPWv7KIePu+DWRLO1F02nJpiTRjGi5dI71IZai3NyB1iZm7/ykFd8YJnOKOjZpQbwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GYc6M55vcMvd+2q3j2XV2+gWQeYx+ehYAPO5ghPXcUM=;
 b=D+bO55dqBZn+pATHbtpMnas4nSu7FB3J9lkFjY1Xz/9pxMz+CcrhawUaX/UJtvz1XDpA8IEKqao3QMbvbjTP7+zpYJmOWyaWhdqYdRWA2wCIBAdlSn9v65qXUaLRNLRutx9/bBLJL8uXiJxH+l2982gCQQhWJSH708wfoYOGsyK5E6Lor4w5WkImxfegDYxP6Nf8h6RN542EO+EBC6u0O0kO6h1yl0qBsC+8NH5LI4B+DcDDYGCaWjfBxITxqknaizpZqwCFoMFafKSH0CJm6MBAsL6DbSCDO5AxIlUsHglYJC7uJ09tzh+LFdnEm1xbR+MnCte2xbMCWRX7kDDEgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GYc6M55vcMvd+2q3j2XV2+gWQeYx+ehYAPO5ghPXcUM=;
 b=qr+4Mma277eDTNWE83zcQCXJkcCkjedF81A0bIq/no/yaexo1Bj1xp+J+xOd2xi8OZ3t9XlH936AJYIeKzKQEaUGqGH1E524E+Pgalk5BchuVTEguel+KcGvaZniukoD4WlTDHJCgErvVYaPom678nwQqjO8c4C7Znr88JvCy10=
Received: from PH8PR05CA0020.namprd05.prod.outlook.com (2603:10b6:510:2cc::27)
 by CH0PR10MB5130.namprd10.prod.outlook.com (2603:10b6:610:cb::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Tue, 14 Jul
 2026 12:56:18 +0000
Received: from CY4PEPF0000EE39.namprd03.prod.outlook.com
 (2603:10b6:510:2cc:cafe::87) by PH8PR05CA0020.outlook.office365.com
 (2603:10b6:510:2cc::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.10 via Frontend Transport; Tue,
 14 Jul 2026 12:56:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY4PEPF0000EE39.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Tue, 14 Jul 2026 12:56:16 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 14 Jul
 2026 07:56:06 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 14 Jul
 2026 07:55:56 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 14 Jul 2026 07:55:56 -0500
Received: from venkey.dhcp.ti.com (venkey.dhcp.ti.com [10.24.53.161])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66ECtrC3545867;
	Tue, 14 Jul 2026 07:55:54 -0500
From: MANNURU VENKATESWARLU <v-mannuru@ti.com>
To: <lee@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <mfd@lists.linux.dev>,
        <linux-kernel@vger.kernel.org>, <n-francis@ti.com>, <s-k6@ti.com>,
        <bb@ti.com>, <v-mannuru@ti.com>
Subject: [RFC PATCH 05/22] mfd: ti-ddrss: Add TI K3 DDR subsystem MFD core driver
Date: Tue, 14 Jul 2026 18:25:53 +0530
Message-ID: <20260714125553.3304282-1-v-mannuru@ti.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE39:EE_|CH0PR10MB5130:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a7c6ba6-0454-4c17-ce5f-08dee1a74aa9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|30052699003|23010399003|376014|36860700016|82310400026|1800799024|13003099007|6133799003|56012099006|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	Q8J+iSzlqpM6Zajk93wUemP8b+3JwXEtKgBkqQgHO827kISbVWc+Aajzbm9gcNHicjwnkSrx+fQl0RI5bOehh1Tt7JD2TUMAm1SKEnzX9HvsgH5xTikP4UkwWilrgy6S0azyNYCNSF8WokjWQns16zG/1UGZEflgwWvHs/vj0ZH6n+s04n9eZ1riYLGEjFsIazvLoNXc400cfDJvxKEVTLC+U1Nef8/3gQxWme/qcC227t8+tQclhI+Q+cmDm6T7Kyrq67V6/pygYzHappo+iKleqDSkTMvaEwITTsqVMyf3IP4+HkZfwWCSg8B9J3RQbrihxqmP1kQO28bgEGHgxZrCiDGDqz4R/QBOBFA8viDto/XIuNfU6ebThiUFEmrNQJnHYK/I5jL9GxsYrHsg8dJENWDnN6v1Kcv7TaKfC+rhEvhYw77pgClhWz3QAIpeEYZnJDsqXGNgdAEWR2ID7QokZoZCXG2nD7eYk/ict29HW4vdcLptO0tdKPB5H2akbC8/MuYb5UJnTNUba0K/CaLji4PfnMvBTHN3riFUf2z2IlmnFngY9Z322Q97IuArnW+kQrLrREnAqmNRZ6e2QBno0whaK9z5Xe2AfKvrdNt7nSqGeH2q642qZZ14Ngl/lYQgrO/J7brzPvIHjY0x8w==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(30052699003)(23010399003)(376014)(36860700016)(82310400026)(1800799024)(13003099007)(6133799003)(56012099006)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zT3KiNO2KF+Hb/1k4oP9y3cLDuER3hSJv0GVP9eqX6Cf/rwkCNHCK/YDDHMqLYvoOzjK+DFto/9T9ga/RneNfkj/A3vAJsi1CfFLYMGK3RHBvOoVRGmSCIR9dlhMwTwNLJ1P0c6IMcaqenvgxgBah+hrhv6n5dOcGgfIy0og4FiDG8WLtUf0EzvQXrCe/dERCGZmqA5fEmnSp9whnI3mBmzVioD8yLC+ZIGddZxQgUxipETniXlDIkiq8Jr6b5AfmvWndod8uOeijikK5upia9KGVOYUiNMvHxjXCuGZzswYY/vd4KUF9OnSS6gDgkU52EknrFEkSIed54nTtGlfdoydZdWHw2dUN5zXkIYuY7GeLN3WmQGduPIPg+c5raTl0ysqndMcwGJQyJOLM4qYrQDkoPAF35+D3JNgR5j9uK4iqTSBL9gwQIdyaMDcVgmK
X-Exchange-RoutingPolicyChecked:
	h3YN7xipiv86jlVLbp9qrPySDlSc/eQZam1YUbU/kGOArn96IDvMgV9HXU6lZhpZDLee/ORzHDLWhi2o+qRAB7VET88AeTO96AFQgVl03mslsNtw7SV629rGIMMQEMtYfHP24AZSipvqp/uJdIa9r0fy0JIwAvXI96oOgbjbhV3lkZh3Lu9bNMJZ0gtz9sQlByOGgutk+7VKjB4CDbcCoDhihxTX6LCYdPV2p7VMTcVcXRhtFORwFlNc7zv6K/F7WanXA3rZesQQZW5/8wdFRGqM0vIHlQImWLDOmklVFGzWXfShLIrLQ5h5af+L3WOd2cudX52C1Mhl+dJN11L7tg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 12:56:16.0827
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a7c6ba6-0454-4c17-ce5f-08dee1a74aa9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE39.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5130
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEzNSBTYWx0ZWRfXx7YHstYVtETn
 hO7OlbXeCGJe8XGcm3uOiHDKzRkqhq1R5kRw9llR2uN/mGofjOujbBEs7PZ+OWwIKMFGMmjOnwg
 awefPcE5L1F0XPZ6Y9gywwQvOQrPD2o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEzNSBTYWx0ZWRfX+in3F5Ori/fh
 PH5uHTQOBw+WzOYdAbCcKJWxURHwNWIcuhq9ua8LIvfQcMvA6c+3Eiyg9hSWw96ouHYjE6QXP5L
 ORoJaBuJUme9zujl7UHC37ITWcwyeht4gOiRvdieUtGmIcmxqoGgtRnKzc82GLTTJSUUnCXJJB8
 Sxw1uhmg3jfZgKNlLnt3MTek8i5khfzXJE8h0KN77c98Z7B3lslcnwrj5MCsRxr9AQ04ji1Xqnk
 /GBfoUl4WabaS+tlyDxIxdkIl7AK/6fTYO0LcmKBTMGT2lpMm8YXVVH84IHFFKsr+pJSyW9YiML
 vMvqrTdn+2OJeehd9TSJxUgHDfggak3Dtr/54XpafIcsWen9ewQzQE73PXuqHcMSbCkOK4cDJfa
 DH1zIBDYFIphogOKnq1yKxCHHsITX1w8n/DdHT/X9zQszYp7M+tJIyM75GrKoBCaKnFvVRCBV6f
 ApvFUK6W+O8T8HF7mlw==
X-Authority-Analysis: v=2.4 cv=FbcHAp+6 c=1 sm=1 tr=0 ts=6a5631f8 cx=c_pps
 a=oQiTq6cBShE1BE+bdGc2Dw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=V7mBuAJLFX5T_3ukjxIA:9
X-Proofpoint-ORIG-GUID: tD_kYVVncQUefZUx7XcEVsxiXWKxm1m-
X-Proofpoint-GUID: tD_kYVVncQUefZUx7XcEVsxiXWKxm1m-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1011
 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140135

Add a multi-function device core driver for the TI K3 DDR
subsystem wrapper. The driver maps DDR controller registers, reads
SoC-specific configuration via device match data, and instantiates
the MR4 refresh-rate and PMU child devices.

Signed-off-by: MANNURU VENKATESWARLU <v-mannuru@ti.com>
---
 drivers/mfd/Kconfig          |  13 ++
 drivers/mfd/Makefile         |   1 +
 drivers/mfd/ti-ddrss-core.c  | 280 +++++++++++++++++++++++++++++++++++
 include/linux/mfd/ti-ddrss.h |  53 +++++++
 4 files changed, 347 insertions(+)
 create mode 100644 drivers/mfd/ti-ddrss-core.c
 create mode 100644 include/linux/mfd/ti-ddrss.h

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 35f6e9b76d056..a13ecc212f58e 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1834,6 +1834,19 @@ config MFD_TI_LP87565
 	  This driver can also be built as a module. If so, the module
 	  will be called lp87565.
 
+config MFD_TI_DDRSS
+	tristate "TI K3 DDR Subsystem"
+	depends on ARCH_K3 || COMPILE_TEST
+	select MFD_CORE
+	select REGMAP_MMIO
+	help
+	  Core MFD driver for TI K3 DDR subsystem. Provides register access
+	  management and coordinates hwmon temperature monitoring and perf
+	  counter child drivers for DDR performance and thermal monitoring.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called ti-ddrss-core.
+
 config MFD_TPS65218
 	tristate "TI TPS65218 Power Management chips"
 	depends on I2C && OF
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index dd4bb7e77c336..1258d09f3a40b 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -27,6 +27,7 @@ obj-$(CONFIG_MFD_MACSMC)	+= macsmc.o
 obj-$(CONFIG_MFD_TI_LP873X)	+= lp873x.o
 obj-$(CONFIG_MFD_TI_LP87565)	+= lp87565.o
 obj-$(CONFIG_MFD_TI_AM335X_TSCADC)	+= ti_am335x_tscadc.o
+obj-$(CONFIG_MFD_TI_DDRSS) += ti-ddrss-core.o
 
 obj-$(CONFIG_MFD_STMPE)		+= stmpe.o
 obj-$(CONFIG_STMPE_I2C)		+= stmpe-i2c.o
diff --git a/drivers/mfd/ti-ddrss-core.c b/drivers/mfd/ti-ddrss-core.c
new file mode 100644
index 0000000000000..a12a54e3461e1
--- /dev/null
+++ b/drivers/mfd/ti-ddrss-core.c
@@ -0,0 +1,280 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * ti-ddrss-core.c -- TI DDR Subsystem MFD core driver
+ *
+ * Copyright (C) 2026 Texas Instruments Incorporated - https://www.ti.com/
+ */
+
+#include <linux/mfd/core.h>
+#include <linux/mfd/ti-ddrss.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+
+/* J7 Register offsets */
+#define J7_INT_STAT				0x494
+#define J7_INT_ACK				0x49C
+#define J7_INT_MASK				0x4A4
+#define J7_TEMP_REG0				0x288
+#define J7_TEMP_REG1				0x28C
+
+/* AM62 Register offsets */
+#define AM62_INT_STAT_MASTER			0x538
+#define AM62_INT_MASK_MASTER			0x53C
+#define AM62_INT_MASK_MISC			0x594
+#define AM62_INT_STAT_MISC			0x554
+#define AM62_INT_ACK_MISC			0x574
+#define AM62_TEMP_REG0				0x2F8
+#define AM62_TEMP_REG1				0x2FC
+
+/* AM62A Register offsets */
+#define AM62A_INT_STAT_MASTER			0x558
+#define AM62A_INT_MASK_MASTER			0x55C
+#define AM62A_INT_MASK_MISC			0x5B4
+#define AM62A_INT_STAT_MISC			0x574
+#define AM62A_INT_ACK_MISC			0x594
+#define AM62A_TEMP_REG0				0x304
+#define AM62A_TEMP_REG1				0x308
+
+/*
+ * tRAS_MAX / tREF register offsets  (byte offset = CTL_N * 4)
+ *
+ * J7:      TRAS_MAX F0/F1/F2 = CTL_44/46/48, 17-bit [16:0]
+ *          TREF     F0/F1/F2 = CTL_61/63/65, 20-bit [19:0]
+ * AM62/64: TRAS_MAX F0/F1/F2 = CTL_55/58/61, 20-bit [19:0]
+ *          TREF     F0/F1/F2 = CTL_73/75/77, 20-bit [19:0]
+ * AM62A/P: TRAS_MAX F0/F1/F2 = CTL_57/60/63, 20-bit [19:0]
+ *          TREF     F0/F1/F2 = CTL_75/77/79, 20-bit [19:0]
+ */
+#define J7_TRAS_MAX_F0				0x0B0
+#define J7_TRAS_MAX_F1				0x0B8
+#define J7_TRAS_MAX_F2				0x0C0
+#define J7_TREF_F0				0x0F4
+#define J7_TREF_F1				0x0FC
+#define J7_TREF_F2				0x104
+
+#define AM62_TRAS_MAX_F0			0x0DC
+#define AM62_TRAS_MAX_F1			0x0E8
+#define AM62_TRAS_MAX_F2			0x0F4
+#define AM62_TREF_F0				0x124
+#define AM62_TREF_F1				0x12C
+#define AM62_TREF_F2				0x134
+
+#define AM62A_TRAS_MAX_F0			0x0E4
+#define AM62A_TRAS_MAX_F1			0x0F0
+#define AM62A_TRAS_MAX_F2			0x0FC
+#define AM62A_TREF_F0				0x12C
+#define AM62A_TREF_F1				0x134
+#define AM62A_TREF_F2				0x13C
+
+static const struct reg_field j7_reg[] = {
+	/* J7: single bit (28) covers both group and TUF - no separate masking levels */
+	[K3_DDR_INT_STAT_MASTER]        = REG_FIELD(J7_INT_STAT, 28, 28),
+	[K3_DDR_INT_MASK_MASTER_MISC]   = REG_FIELD(J7_INT_MASK, 28, 28),
+	[K3_DDR_INT_MASK_MASTER_GLOBAL] = { 0 }, /* not applicable for J7 */
+	[K3_DDR_INT_MASK_TUF]           = { 0 }, /* not applicable for J7 */
+	[K3_DDR_INT_STAT_TUF]           = REG_FIELD(J7_INT_STAT, 28, 28),
+	[K3_DDR_INT_ACK_TUF]            = REG_FIELD(J7_INT_ACK, 28, 28),
+	[K3_DDR_TEMP_REG0_FIELD0] = REG_FIELD(J7_TEMP_REG0, 8, 10),
+	[K3_DDR_TEMP_REG0_FIELD1] = REG_FIELD(J7_TEMP_REG0, 16, 18),
+	[K3_DDR_TEMP_REG1_FIELD0] = REG_FIELD(J7_TEMP_REG1, 0, 2),
+	[K3_DDR_TEMP_REG1_FIELD1] = REG_FIELD(J7_TEMP_REG1, 8, 10),
+	[K3_DDR_TRAS_MAX_F0]      = REG_FIELD(J7_TRAS_MAX_F0, 0, 16),
+	[K3_DDR_TRAS_MAX_F1]      = REG_FIELD(J7_TRAS_MAX_F1, 0, 16),
+	[K3_DDR_TRAS_MAX_F2]      = REG_FIELD(J7_TRAS_MAX_F2, 0, 16),
+	[K3_DDR_TREF_F0]          = REG_FIELD(J7_TREF_F0, 0, 19),
+	[K3_DDR_TREF_F1]          = REG_FIELD(J7_TREF_F1, 0, 19),
+	[K3_DDR_TREF_F2]          = REG_FIELD(J7_TREF_F2, 0, 19),
+};
+
+static const struct reg_field am62_reg[] = {
+	[K3_DDR_INT_STAT_MASTER]        = REG_FIELD(AM62_INT_STAT_MASTER, 7, 7),
+	[K3_DDR_INT_MASK_MASTER_MISC]   = REG_FIELD(AM62_INT_MASK_MASTER, 7, 7),
+	[K3_DDR_INT_MASK_MASTER_GLOBAL] = REG_FIELD(AM62_INT_MASK_MASTER, 31, 31),
+	[K3_DDR_INT_MASK_TUF]           = REG_FIELD(AM62_INT_MASK_MISC, 5, 5),
+	[K3_DDR_INT_STAT_TUF]           = REG_FIELD(AM62_INT_STAT_MISC, 5, 5),
+	[K3_DDR_INT_ACK_TUF]            = REG_FIELD(AM62_INT_ACK_MISC, 5, 5),
+	[K3_DDR_TEMP_REG0_FIELD0] = REG_FIELD(AM62_TEMP_REG0, 24, 26),
+	[K3_DDR_TEMP_REG0_FIELD1] = REG_FIELD(AM62_TEMP_REG0, 28, 30),
+	[K3_DDR_TEMP_REG1_FIELD0] = REG_FIELD(AM62_TEMP_REG1, 0, 2),
+	[K3_DDR_TEMP_REG1_FIELD1] = REG_FIELD(AM62_TEMP_REG1, 4, 6),
+	[K3_DDR_TRAS_MAX_F0]      = REG_FIELD(AM62_TRAS_MAX_F0, 0, 19),
+	[K3_DDR_TRAS_MAX_F1]      = REG_FIELD(AM62_TRAS_MAX_F1, 0, 19),
+	[K3_DDR_TRAS_MAX_F2]      = REG_FIELD(AM62_TRAS_MAX_F2, 0, 19),
+	[K3_DDR_TREF_F0]          = REG_FIELD(AM62_TREF_F0, 0, 19),
+	[K3_DDR_TREF_F1]          = REG_FIELD(AM62_TREF_F1, 0, 19),
+	[K3_DDR_TREF_F2]          = REG_FIELD(AM62_TREF_F2, 0, 19),
+};
+
+static const struct reg_field am62a_reg[] = {
+	[K3_DDR_INT_STAT_MASTER]        = REG_FIELD(AM62A_INT_STAT_MASTER, 7, 7),
+	[K3_DDR_INT_MASK_MASTER_MISC]   = REG_FIELD(AM62A_INT_MASK_MASTER, 7, 7),
+	[K3_DDR_INT_MASK_MASTER_GLOBAL] = REG_FIELD(AM62A_INT_MASK_MASTER, 31, 31),
+	[K3_DDR_INT_MASK_TUF]           = REG_FIELD(AM62A_INT_MASK_MISC, 5, 5),
+	[K3_DDR_INT_STAT_TUF]           = REG_FIELD(AM62A_INT_STAT_MISC, 5, 5),
+	[K3_DDR_INT_ACK_TUF]            = REG_FIELD(AM62A_INT_ACK_MISC, 5, 5),
+	[K3_DDR_TEMP_REG0_FIELD0] = REG_FIELD(AM62A_TEMP_REG0, 8, 10),
+	[K3_DDR_TEMP_REG0_FIELD1] = REG_FIELD(AM62A_TEMP_REG0, 12, 14),
+	[K3_DDR_TEMP_REG1_FIELD0] = REG_FIELD(AM62A_TEMP_REG1, 0, 2),
+	[K3_DDR_TEMP_REG1_FIELD1] = REG_FIELD(AM62A_TEMP_REG1, 4, 6),
+	[K3_DDR_TRAS_MAX_F0]      = REG_FIELD(AM62A_TRAS_MAX_F0, 0, 19),
+	[K3_DDR_TRAS_MAX_F1]      = REG_FIELD(AM62A_TRAS_MAX_F1, 0, 19),
+	[K3_DDR_TRAS_MAX_F2]      = REG_FIELD(AM62A_TRAS_MAX_F2, 0, 19),
+	[K3_DDR_TREF_F0]          = REG_FIELD(AM62A_TREF_F0, 0, 19),
+	[K3_DDR_TREF_F1]          = REG_FIELD(AM62A_TREF_F1, 0, 19),
+	[K3_DDR_TREF_F2]          = REG_FIELD(AM62A_TREF_F2, 0, 19),
+};
+
+static const struct k3_ddr_cfg j7_cfg = {
+	.cfg_fields = j7_reg,
+	.has_intr_group = false,
+	.identifier = "J7",
+};
+
+static const struct k3_ddr_cfg am62_cfg = {
+	.cfg_fields = am62_reg,
+	.has_intr_group = true,
+	.has_mask_misc = true,
+	.identifier = "AM62",
+};
+
+static const struct k3_ddr_cfg am62a_cfg = {
+	.cfg_fields = am62a_reg,
+	.has_intr_group = true,
+	.has_mask_misc = true,
+	.identifier = "AM62A",
+};
+
+static const struct k3_ddr_cfg am64_cfg = {
+	.cfg_fields = am62_reg,
+	.has_intr_group = true,
+	.has_mask_misc = true,
+	.identifier = "AM64",
+};
+
+static const struct k3_ddr_cfg am62p_cfg = {
+	.cfg_fields = am62a_reg,
+	.has_intr_group = true,
+	.has_mask_misc = true,
+	.identifier = "AM62P",
+};
+
+static const struct regmap_config ti_ddrss_regmap_config = {
+	.reg_bits	= 32,
+	.val_bits	= 32,
+	.reg_stride	= 4,
+	.fast_io	= true,
+};
+
+static const struct mfd_cell ti_ddrss_cells[] = {
+	MFD_CELL_NAME("ti-ddrss-mr4"),
+	MFD_CELL_OF("ti-k3-ddr-pmu", NULL, NULL, 0, 0, "ti,k3-ddr-pmu"),
+};
+
+static int ti_ddrss_probe(struct platform_device *pdev)
+{
+	struct device_node *child_np, *pmu_np;
+	struct ti_ddrss_dev *ddrss;
+	struct device *dev = &pdev->dev;
+	struct resource res;
+	void __iomem *base;
+	int irq, ncells, ret;
+
+	ddrss = devm_kzalloc(dev, sizeof(*ddrss), GFP_KERNEL);
+	if (!ddrss)
+		return -ENOMEM;
+
+	ddrss->dev = dev;
+	ddrss->cfg = device_get_match_data(dev);
+	if (!ddrss->cfg)
+		return dev_err_probe(dev, -ENODEV, "No match data found\n");
+
+	child_np = of_get_child_by_name(dev->of_node, "ddr");
+	if (!child_np)
+		return dev_err_probe(dev, -ENODEV, "ddr child node not found\n");
+
+	ret = of_address_to_resource(child_np, 0, &res);
+	if (ret) {
+		of_node_put(child_np);
+		return dev_err_probe(dev, ret, "Failed to get register address\n");
+	}
+
+	base = devm_ioremap_resource(dev, &res);
+	of_node_put(child_np);
+
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	ddrss->base = base;
+
+	ddrss->sscfg = devm_platform_ioremap_resource_byname(pdev, "ss_cfg");
+	if (IS_ERR(ddrss->sscfg))
+		return dev_err_probe(dev, PTR_ERR(ddrss->sscfg),
+				     "Failed to map SSCFG registers\n");
+
+	ddrss->regmap = devm_regmap_init_mmio(dev, base, &ti_ddrss_regmap_config);
+	if (IS_ERR(ddrss->regmap))
+		return dev_err_probe(dev, PTR_ERR(ddrss->regmap), "Failed to init regmap\n");
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	ddrss->irq = irq;
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
+	pm_runtime_get_noresume(dev);
+
+	platform_set_drvdata(pdev, ddrss);
+
+	pmu_np = of_get_child_by_name(dev->of_node, "pmu");
+	ncells = pmu_np ? ARRAY_SIZE(ti_ddrss_cells) : 1;
+	of_node_put(pmu_np);
+
+	ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO,
+				   ti_ddrss_cells, ncells, NULL, 0, NULL);
+	if (ret) {
+		pm_runtime_put_noidle(dev);
+		return dev_err_probe(dev, ret, "Failed to register child devices\n");
+	}
+
+	return 0;
+}
+
+static void ti_ddrss_remove(struct platform_device *pdev)
+{
+	pm_runtime_put_noidle(&pdev->dev);
+}
+
+static const struct of_device_id ti_ddrss_of_match[] = {
+	{ .compatible = "ti,j721s2-ddrss", .data = &j7_cfg  },
+	{ .compatible = "ti,j721e-ddrss",  .data = &j7_cfg  },
+	{ .compatible = "ti,j7-ddrss",     .data = &j7_cfg  },
+	{ .compatible = "ti,am62-ddrss", .data = &am62_cfg },
+	{ .compatible = "ti,am62a-ddrss", .data = &am62a_cfg },
+	{ .compatible = "ti,am64-ddrss", .data = &am64_cfg },
+	{ .compatible = "ti,am62p-ddrss", .data = &am62p_cfg },
+	{}
+};
+MODULE_DEVICE_TABLE(of, ti_ddrss_of_match);
+
+static struct platform_driver ti_ddrss_driver = {
+	.driver = {
+		.name = "ti-ddrss",
+		.of_match_table = ti_ddrss_of_match,
+	},
+	.probe = ti_ddrss_probe,
+	.remove = ti_ddrss_remove,
+};
+
+module_platform_driver(ti_ddrss_driver);
+
+MODULE_DESCRIPTION("TI K3 DDR Subsystem core driver");
+MODULE_AUTHOR("Texas Instruments Inc");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/mfd/ti-ddrss.h b/include/linux/mfd/ti-ddrss.h
new file mode 100644
index 0000000000000..32ea3527978e0
--- /dev/null
+++ b/include/linux/mfd/ti-ddrss.h
@@ -0,0 +1,53 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * ti-ddrss.h -- TI DDR Subsystem MFD device header
+ *
+ * Copyright (C) 2026 Texas Instruments Incorporated - https://www.ti.com/
+ */
+
+#ifndef __LINUX_MFD_TI_DDRSS_H
+#define __LINUX_MFD_TI_DDRSS_H
+
+#include <linux/regmap.h>
+
+enum k3_ddr_fields {
+	K3_DDR_INT_STAT_MASTER,
+	K3_DDR_INT_MASK_MASTER_MISC,   /* J7: combined bit; AM62/AM62A: MISC group */
+	K3_DDR_INT_MASK_MASTER_GLOBAL, /* top-level enable - AM62/AM62A only */
+	K3_DDR_INT_MASK_TUF,           /* TUF bit in MISC mask - AM62/AM62A only */
+	K3_DDR_INT_STAT_TUF,
+	K3_DDR_INT_ACK_TUF,
+	K3_DDR_TEMP_REG0_FIELD0,
+	K3_DDR_TEMP_REG0_FIELD1,
+	K3_DDR_TEMP_REG1_FIELD0,
+	K3_DDR_TEMP_REG1_FIELD1,
+	/* tRAS_MAX and tREF for the three DDR Frequency Set Points.
+	 * Must stay contiguous in this order: ti-ddrss-mr4.c uses
+	 * K3_DDR_TRAS_MAX_F0+i and K3_DDR_TREF_F0+i to iterate FSPs.
+	 */
+	K3_DDR_TRAS_MAX_F0,
+	K3_DDR_TRAS_MAX_F1,
+	K3_DDR_TRAS_MAX_F2,
+	K3_DDR_TREF_F0,
+	K3_DDR_TREF_F1,
+	K3_DDR_TREF_F2,
+	K3_DDR_MAX_FIELDS
+};
+
+struct k3_ddr_cfg {
+	const struct reg_field *cfg_fields;
+	bool has_intr_group;  /* AM62/AM62A: separate group status register */
+	bool has_mask_misc;   /* AM62/AM62A: three-level interrupt unmasking */
+	const char *identifier;
+};
+
+struct ti_ddrss_dev {
+	struct device *dev;
+	struct regmap *regmap;
+	int irq;
+	const struct k3_ddr_cfg *cfg;
+	void __iomem *base;   /* DDR controller base (regmap) */
+	void __iomem *sscfg;  /* SSCFG base (PMU counters live here) */
+};
+
+#endif
-- 
2.34.1

