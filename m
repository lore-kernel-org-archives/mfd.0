Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C654EF145
	for <mfd@lists.linux.dev>; Wed, 14 Oct 2026 10:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791974010; cv=none; b=tJ/tMq0ho37TikyZ2F5CL/yAPYdiiE9tp3sgaltv2irIEggVHDm5L7h4hNhS/WD/I+Nqjhh2i58xdCdaxdy2DGnY2VCMevI8ukCVZd19c2mmLLyO7RDpY9AhcnkPIA4A/s+E+Sz3XlhtUgXaheO6RQM1XCZbH/Jp9u7qUw9bbYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791974010; c=relaxed/simple;
	bh=nKpyjZqeImxNCSJaq+3VeFOj7UQIeMfj5eT5LpaG0WU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SlDIbVVEl8/RPgCKZD0Rv1aoZjjWKiqHOC+AbuncKAqpSJdvOi8EN6LwyDwOFb8W1wUxfk0mRU0pNbK/d1gEor1aHejihyNU8wqVH7YD8cZzxe+G7nEmuUlZJTRAMNeEjj2c/1SGZ2wqgRwv/o9nr48OtjqPvegIRM22sk0dTEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l44pQ44g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JYLiH+1U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l44pQ44g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JYLiH+1U"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E7mHh63017676
	for <mfd@lists.linux.dev>; Wed, 14 Oct 2026 10:33:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9To/C/5ILqecaf++QZfKIUCwyaf5sTpD6boha6uClss=; b=l44pQ44g688kRei0
	1aHJ9R8fGJU9h03yeStkxOeFtBPE+aO02Z6kaLoDlEB4yOz1VBC2RjJGjGqj9gIf
	dBRbYMVPZdxOUZcJW1Jddf0mhSqxXtLCGMcVmS1/vJwEbZKJ04JwHlbfNtiJNUZe
	xgcMGBdbecsAJfCOkOJBJjAAAsHKsm3zhKZBYcwiEhSSzKpnkTk+/d2WMvPZ5vzW
	0k9Ald1wIWW+/Hf7F3vW0Esra04hJr6B2SWXEnGwjU9eJYKyTfxy5qLSUmfAEwla
	x9zYfOJIwIXBT6LejovMAgQAPbW5nYnn0IEZ8EhH2ckpPHP4IlPU6NogVIIyR7Ya
	vzX10g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9s2b3uem-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Wed, 14 Oct 2026 10:33:26 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a4aa263a4aso229355a91.1
        for <mfd@lists.linux.dev>; Wed, 14 Oct 2026 03:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791974006; x=1792578806; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9To/C/5ILqecaf++QZfKIUCwyaf5sTpD6boha6uClss=;
        b=JYLiH+1UeitVVKkXageuIMNYLTgDVc1EKc95x3inN3P6++nWjlkPGgLL6nFlNftsT9
         W3VjDUwNfknAhbdzpodnKrDStvgJccWic/WtF0sj57pIErvQntSkxExGm6lbBm87kD8N
         /CF8nlF7faCqljZ7MAeMQCUJ3GUbRgVCOeUuZgvIvsyvIImANpdMYyaG3qVTAxzNWw9b
         jTzM0SdZ3e5K7K8FHIxsBCkRpskHO0mbGsJhoXs+UqayomXanlOeXm5epd7gkjWzY4fi
         qverW00h8bj6hzzo9rQekSmhSCifdeM/cEcysAW7DwqUh1tk+OuY9opNFBl8dOnJXLEq
         dgdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791974006; x=1792578806;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9To/C/5ILqecaf++QZfKIUCwyaf5sTpD6boha6uClss=;
        b=1bfEsxpfl/+5JHUGQrKHVH7UfAGyyC/UkfIiHDTHJDOXJjuwB39bjpOFBoDgL5xqQE
         W02SDzcPGRz18PwFng77TqOjQFz9UWsmxpVQpv9A4dAkYDl4othldB5kf6xA1tjtoe8u
         rZO6F9abxfGsdAZnVNRTK8vwEsY0GtAdc6QeONV5GIdgXeaYqMRXbFKSQVEyVZP5syDY
         ZwKwAQZ3Fn6tyPP9Tf1fnXCgUDi16J4yEuZoUrWl6m1tXNDXY5DvbdOPGGSAcB2eBMlW
         D6nTOOrMhhuga4Eipit7Z44sdUrGp4gmrYqPfz68bx0+ipMfGPqs4A9yEwjQ5fv7pZCK
         VvTQ==
X-Forwarded-Encrypted: i=1; AKwUvBwk3Xwe9aqN4OIwfN7w9sLvieiQNH91TcUltP1Ty0IPBRt08tCQ30dYd/dK52RofyUQLIc=@lists.linux.dev
X-Gm-Message-State: AFq9FYIaYXxC7/SxunLIxB+GeXsbuTJPla+6nWb85+Gq86bxrPxlVuS/
	leN1J7P+a2Cko55ZpsRRz/522LyiqMKSEpTVVE26jjHbHWYNt0PxtHCw8yb9SGGN7hIuzhA2sw/
	yEwxrNXrWl6LeDFqTP0kN9T+eV/Z2YMHQb5eHAqn+9Dd1oV46U8NQFzQ=
X-Gm-Gg: AYBFou0WCjYba7wr06eOdkgk0w41/XPsUS2BjlCXSang3AE3yG1EQOz7sf33NnmtDPL
	TLe5dgyxPB8kzwC1TywWxY6Feq9HUxJgwnYEFLG4fnjxrli6a3UGg0VTjdXW8G5Fa0KanNLW9LX
	z86mPYY5TsTooPEB0cPURacUGjRK5MgxDRq92kmQX+qsziMoFcw9/To4ntAXFwcHBa/r21llU52
	P7pQnIu5IJ0LsLY0xdimRkKAaFnT9ZxK3Bqo/8vFk0OmYOFSHfsFoGTuXVkZINHDZn4HNPF/7BI
	rapKPQRRdUNx7uPCy5JL9225Ew+h1VCK7jHC80xFondv6frhDo+d2cJJkcSYo7eZzq2/PvDApb4
	JQQlO6u69fFmCYzcMlKw=
X-Received: by 2002:a17:90b:1d4f:b0:3a4:fe48:d410 with SMTP id 98e67ed59e1d1-3ab3a954001mr12770321a91.30.1791974006041;
        Wed, 14 Oct 2026 03:33:26 -0700 (PDT)
X-Received: by 2002:a17:90b:1d4f:b0:3a4:fe48:d410 with SMTP id 98e67ed59e1d1-3ab3a954001mr12770300a91.30.1791974005463;
        Wed, 14 Oct 2026 03:33:25 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e08905sm6822382a12.9.2026.10.14.03.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 03:33:25 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 16:01:59 +0530
Subject: [PATCH v2 2/7] regulator: pm8008: Add PM8010 support
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-pm8010_i2c_support-v2-2-b395d2b3f668@oss.qualcomm.com>
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
In-Reply-To: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791973985; l=7897;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=x3r84kKfjqPTxAqPbXtj7jZvilPtCOTLr7dgEbH92tU=;
 b=zkhRadOSrLFQXUzJRZs4fStdjeXiwNFEohHFvNa5LYD3P8eYaw/PlpbJ1IUEHqeQ2GzINCuzx
 r8SPXGFy/AKCsQ9JY+1XzuB7+PSTwTSrl9SZVGsjM/MsqMdWBVP4WKT
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Authority-Analysis: v=2.4 cv=RPQmjIi+ c=1 sm=1 tr=0 ts=6acf5a77 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=CF1g25cjMhU89PGl3DsA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: cMxOPLRhVkSCwu1Rxqo98YLOwfUAeznt
X-Proofpoint-ORIG-GUID: cMxOPLRhVkSCwu1Rxqo98YLOwfUAeznt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA0MSBTYWx0ZWRfX2dDEnu//7kKW
 hf59t3xCipwNc+LLGBPXs6p2oMWSdUBZA9P2GrxQk5LEaM1b6VHSV7LegRt5o+SV7kryM8ynNHM
 2hLa1dTQHHAldTtdJmiUT6Le3gWmI+zSNbB/OmJExX67AdxvtOjUCvoUHzXbQ3vXC08Lkql4FGV
 yx3do3tYxax2LLwF6JygEfLKp79aDEXICu58bLBAOikm6XqhQVq1YelnJ7WR6rQuXFeEzFTM+8a
 xcSK4mI0X8Y05jUrzGnQ+ZG5ZQgiYjAlB39S5bs0NacSsAgQzrEuq8Om7AxsRMIo0Z6LnV52L86
 Mw8HO7vHjALbg+EM1v2vulWtZ1H9mdqQGZYtlQbynSIIrPjnlpKaYNBhIp/cZkp4cjbCUosrcF7
 NCWDKnLeXtTzii93omsIvPXZHG6LYJd1x51ibby0+1c95oiruAIqT5EZL5Gzx5b4keWCmI5Y4n7
 GRQtby9Chu9RYwu7MDw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA0MSBTYWx0ZWRfXw0NPnmrByg2O
 erKqlIMsCjHUTs5CNRkmDtkXBOUmPpnzGP29rEZctQ9KginJjxqDQ3D9FsmGdEf7Rx6Zjfu3Bks
 MWEln+0xTr6xdn0D/Pav4/MBr1tNfUo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140041

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

PM8010 is effectively the next generation of PM8008.

Like PM8008, PM8010 also has 7 LDOs under it which are used to power
camera sensors. The PM8010 LDO are of different types from the PM8008
ones and have different voltage dropout values. PM8010 LDOs do not have
a voltage step rate configuration register.

Add the necessary changes to support PM8010 LDOs.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Tested-by: Oleg Keri <okerixx@gmail.com> # Lenovo Yoga Slim 7x Gen 11 (Glymur)
Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 drivers/regulator/qcom-pm8008-regulator.c | 109 +++++++++++++++++++++++-------
 1 file changed, 85 insertions(+), 24 deletions(-)

diff --git a/drivers/regulator/qcom-pm8008-regulator.c b/drivers/regulator/qcom-pm8008-regulator.c
index 9c9b8be2e15a..b484c0f73eea 100644
--- a/drivers/regulator/qcom-pm8008-regulator.c
+++ b/drivers/regulator/qcom-pm8008-regulator.c
@@ -39,24 +39,59 @@ struct pm8008_regulator_data {
 	unsigned int			base;
 	int				min_dropout_uV;
 	const struct linear_range	*voltage_range;
+	int				n_linear_ranges;
 };
 
-static const struct linear_range nldo_ranges[] = {
+struct pm8008_match_data {
+	const bool has_stepper_ctl_reg;
+	const struct pm8008_regulator_data *regulator_data;
+	const int num_regulators;
+};
+
+static const struct linear_range pm8008_nldo_ranges[] = {
 	REGULATOR_LINEAR_RANGE(528000, 0, 122, 8000),
 };
 
-static const struct linear_range pldo_ranges[] = {
+static const struct linear_range pm8008_pldo_ranges[] = {
 	REGULATOR_LINEAR_RANGE(1504000, 0, 237, 8000),
 };
 
+static const struct linear_range pm8010_nldo_ranges[] = {
+	REGULATOR_LINEAR_RANGE(528000, 0, 127, 8000),
+};
+
+static const struct linear_range pm8010_pldo_ranges[] = {
+	REGULATOR_LINEAR_RANGE(1504000, 0, 255, 8000),
+};
+
+static const struct linear_range pm8010_pldo_lv_ranges[] = {
+	REGULATOR_LINEAR_RANGE(1800000, 0,  2,  200000),
+	REGULATOR_LINEAR_RANGE(2608000, 3,  28, 16000),
+	REGULATOR_LINEAR_RANGE(3104000, 29, 30, 96000),
+	REGULATOR_LINEAR_RANGE(3312000, 31, 31, 0),
+};
+
+#define PM8008_REGULATOR(_name, _supply, _base, _dropout, _range)	\
+	{ _name, _supply, _base, _dropout, _range, ARRAY_SIZE(_range) }
+
 static const struct pm8008_regulator_data pm8008_reg_data[] = {
-	{ "ldo1", "vdd-l1-l2", 0x4000, 225000, nldo_ranges, },
-	{ "ldo2", "vdd-l1-l2", 0x4100, 225000, nldo_ranges, },
-	{ "ldo3", "vdd-l3-l4", 0x4200, 300000, pldo_ranges, },
-	{ "ldo4", "vdd-l3-l4", 0x4300, 300000, pldo_ranges, },
-	{ "ldo5", "vdd-l5",    0x4400, 200000, pldo_ranges, },
-	{ "ldo6", "vdd-l6",    0x4500, 200000, pldo_ranges, },
-	{ "ldo7", "vdd-l7",    0x4600, 200000, pldo_ranges, },
+	PM8008_REGULATOR("ldo1", "vdd-l1-l2", 0x4000, 225000, pm8008_nldo_ranges),
+	PM8008_REGULATOR("ldo2", "vdd-l1-l2", 0x4100, 225000, pm8008_nldo_ranges),
+	PM8008_REGULATOR("ldo3", "vdd-l3-l4", 0x4200, 300000, pm8008_pldo_ranges),
+	PM8008_REGULATOR("ldo4", "vdd-l3-l4", 0x4300, 300000, pm8008_pldo_ranges),
+	PM8008_REGULATOR("ldo5", "vdd-l5",    0x4400, 200000, pm8008_pldo_ranges),
+	PM8008_REGULATOR("ldo6", "vdd-l6",    0x4500, 200000, pm8008_pldo_ranges),
+	PM8008_REGULATOR("ldo7", "vdd-l7",    0x4600, 200000, pm8008_pldo_ranges),
+};
+
+static const struct pm8008_regulator_data pm8010_reg_data[] = {
+	PM8008_REGULATOR("ldo1", "vdd-l1-l2", 0x4000, 172000, pm8010_nldo_ranges),
+	PM8008_REGULATOR("ldo2", "vdd-l1-l2", 0x4100, 172000, pm8010_nldo_ranges),
+	PM8008_REGULATOR("ldo3", "vdd-l3-l4", 0x4200, 80000, pm8010_pldo_lv_ranges),
+	PM8008_REGULATOR("ldo4", "vdd-l3-l4", 0x4300, 80000, pm8010_pldo_lv_ranges),
+	PM8008_REGULATOR("ldo5", "vdd-l5",    0x4400, 296000, pm8010_pldo_ranges),
+	PM8008_REGULATOR("ldo6", "vdd-l6",    0x4500, 80000, pm8010_pldo_lv_ranges),
+	PM8008_REGULATOR("ldo7", "vdd-l7",    0x4600, 296000, pm8010_pldo_ranges),
 };
 
 static int pm8008_regulator_set_voltage_sel(struct regulator_dev *rdev, unsigned int sel)
@@ -100,7 +135,7 @@ static int pm8008_regulator_get_voltage_sel(struct regulator_dev *rdev)
 }
 
 static const struct regulator_ops pm8008_regulator_ops = {
-	.list_voltage		= regulator_list_voltage_linear,
+	.list_voltage		= regulator_list_voltage_linear_range,
 	.set_voltage_sel	= pm8008_regulator_set_voltage_sel,
 	.get_voltage_sel	= pm8008_regulator_get_voltage_sel,
 	.enable			= regulator_enable_regmap,
@@ -110,8 +145,10 @@ static const struct regulator_ops pm8008_regulator_ops = {
 
 static int pm8008_regulator_probe(struct platform_device *pdev)
 {
+	const struct pm8008_match_data *match_data;
 	const struct pm8008_regulator_data *data;
 	struct regulator_config config = {};
+	const struct platform_device_id *id;
 	struct device *dev = &pdev->dev;
 	struct pm8008_regulator *preg;
 	struct regulator_desc *desc;
@@ -120,12 +157,20 @@ static int pm8008_regulator_probe(struct platform_device *pdev)
 	unsigned int val;
 	int ret, i;
 
+	id = platform_get_device_id(pdev);
+	if (!id)
+		return dev_err_probe(dev, -ENODEV, "Missing platform device id\n");
+
+	match_data = (const struct pm8008_match_data *)id->driver_data;
+	if (!match_data)
+		return dev_err_probe(dev, -ENODATA, "Missing driver match data\n");
+
 	regmap = dev_get_regmap(dev->parent, "secondary");
 	if (!regmap)
 		return -EINVAL;
 
-	for (i = 0; i < ARRAY_SIZE(pm8008_reg_data); i++) {
-		data = &pm8008_reg_data[i];
+	for (i = 0; i < match_data->num_regulators; i++) {
+		data = &match_data->regulator_data[i];
 
 		preg = devm_kzalloc(dev, sizeof(*preg), GFP_KERNEL);
 		if (!preg)
@@ -145,18 +190,21 @@ static int pm8008_regulator_probe(struct platform_device *pdev)
 		desc->owner = THIS_MODULE;
 
 		desc->linear_ranges = data->voltage_range;
-		desc->n_linear_ranges = 1;
-		desc->uV_step = desc->linear_ranges[0].step;
-		desc->min_uV = desc->linear_ranges[0].min;
-		desc->n_voltages = linear_range_values_in_range(&desc->linear_ranges[0]);
-
-		ret = regmap_read(regmap, preg->base + LDO_STEPPER_CTL_REG, &val);
-		if (ret < 0) {
-			dev_err(dev, "failed to read step rate: %d\n", ret);
-			return ret;
+		desc->n_linear_ranges = data->n_linear_ranges;
+		desc->n_voltages = linear_range_values_in_range_array(desc->linear_ranges,
+								      desc->n_linear_ranges);
+
+		if (match_data->has_stepper_ctl_reg) {
+			ret = regmap_read(regmap, preg->base + LDO_STEPPER_CTL_REG, &val);
+			if (ret < 0) {
+				dev_err(dev, "failed to read step rate: %d\n", ret);
+				return ret;
+			}
+			val &= STEP_RATE_MASK;
+			desc->ramp_delay = DEFAULT_VOLTAGE_STEPPER_RATE >> val;
+		} else {
+			desc->ramp_delay = DEFAULT_VOLTAGE_STEPPER_RATE;
 		}
-		val &= STEP_RATE_MASK;
-		desc->ramp_delay = DEFAULT_VOLTAGE_STEPPER_RATE >> val;
 
 		desc->min_dropout_uV = data->min_dropout_uV;
 
@@ -179,8 +227,21 @@ static int pm8008_regulator_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct pm8008_match_data pm8008_data = {
+	.has_stepper_ctl_reg = true,
+	.regulator_data = pm8008_reg_data,
+	.num_regulators = ARRAY_SIZE(pm8008_reg_data),
+};
+
+static const struct pm8008_match_data pm8010_data = {
+	.has_stepper_ctl_reg = false,
+	.regulator_data = pm8010_reg_data,
+	.num_regulators = ARRAY_SIZE(pm8010_reg_data),
+};
+
 static const struct platform_device_id pm8008_regulator_id_table[] = {
-	{ .name = "pm8008-regulator" },
+	{ .name = "pm8008-regulator", .driver_data = (kernel_ulong_t)&pm8008_data },
+	{ .name = "pm8010-regulator", .driver_data = (kernel_ulong_t)&pm8010_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, pm8008_regulator_id_table);

-- 
2.43.0

