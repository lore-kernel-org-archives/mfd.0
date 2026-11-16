Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794809644;
	b=HBWK/+hjB0VaiYCDeizJb85uWRt0bmDiGUX4WJWj21Xm25EVbl0Zkl+MVDCvCJkEAgPE
	 GgIfizt3k/Iy0sGuiWF0iai4iMGDPZePRTwKbfDEjoIJAYYFRuJvmR3wWjvoC2HnrtFRk
	 oozj8gX5mf27nDaCpLldVLv+cfhK5c0EYJ8EjEwmliqyw5O568k47ve8bm/c6YG+eAsbq
	 DDpRhC36xw2d9e6NwdRaBBBA0Jfcar92h+cYpphJyPeDPt/mHzmheULZQlthKlQ/Fz8MR
	 yTARfMTDxBEMko0eQ0GR/nhhZA9Qb1tP5kA6Wdor9U5Yc2NnpudFMnVXHDRryZAqVgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794809644;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6w2wZrYLW8QCNl+5T9joDueswIFQX8PDG+kYC3D+80Y=;
	b=oNAASnQCUKKcDW87qHsuhaHnKaslDgsDVSQCvH4cNSEU5yS5zT+ex1US4K0A38s9bxZM
	 ZJ/ot5fjAa1jSCNOQT22Pg2oRRviXE8I3GGZz93RORIitIFmipEFINxGRwscr1j4nLj9n
	 kokiSU+TAjQ3wxUnkR2BnnjNjTgZVD/OgtO29gS6CBtPsu6fHdK+DcYbAZXwvpNyk2/oB
	 s6cqnTsDUPm/RNksUZBmbzu8cEPrIhKudT1+ccZt8POF/bxQYeEwOOjM5dvLN9GWSMgkX
	 bSTsNK+NlLTVhfrq+pzaV36EIVzS9IMcB6Zy5zL+k1uYk29DXJlFl6r4xg6CWkN/zVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SRngTkA+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zcp374tu;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28CED606A32C
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 06:14:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28CED606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SRngTkA+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zcp374tu
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG5Lhe9112160
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 06:14:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6w2wZrYLW8QCNl+5T9joDueswIFQX8PDG+kYC3D+80Y=; b=SRngTkA+eY328LKS
	Lip6yzCPznf1exoTsgT1AF/+3c6SEQeM/1el6fArQ1fvUCCAEoSAynpiRkJrXZyF
	CusnmHfTfPnCps2RZGGw3ZLxo7j4z3Y4ENPlZU9AawQ+jHiH5bpa+pmpUKXLeIUR
	pbBHFg4bLlkbmv2PRIcIWlz0hYZbFdmwOOPDBwCG9D5zQeT668WxajHr8qphtKgV
	JJQYdnHxLJhLF/aM92RXPNO7p8t+4G3KJXCJ2ustkxRkTeS1+Y0ytwojVbCvPRV3
	mTQnCBK+Dj+QZUUkjCrnIYADd7p0/zNX4k/A9rAejqXpX5LmseApZ/2Jf6vqcyvw
	ucZmIw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhkwd0tq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 06:14:02 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b10afdf947so3924997a91.0
        for <mfd@lists.linux.dev>; Sun, 15 Nov 2026 22:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794809641; x=1795414441; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6w2wZrYLW8QCNl+5T9joDueswIFQX8PDG+kYC3D+80Y=;
        b=Zcp374tuwGGz6Yfq+9CAhamEEPrGcYi0ysrDZIKYyRXZlw7/M9jLO7iIP8Pxd//b5r
         M0x/NT+ov2NvXomQQLE47MOpuaW19C+ST1p9JK55wZBZX6VD9LduoWyNSWHuhiJwfNzt
         rftN66la/7pGjpc2K8WKo8zS1ZLP0/NQVnp8EW4yvjP1+aLIo3t31ofPHx5DXg0ucMAj
         QNpYtW7tZn2xEhecSybpI1w567OzMd54+abNzMIS2/BQPXh4Jjuewi4JTcAee3Ws2sjf
         wabrR6hTDFYdYik0+r/t1tjHIAVJT2mtCqj7mhks80Nps/42zcG3rmiEI89twZKguA7l
         oanQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794809641; x=1795414441;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6w2wZrYLW8QCNl+5T9joDueswIFQX8PDG+kYC3D+80Y=;
        b=ajJYrfULf6QVJQEq9+kdITBgZ/cSG5RuEZwX1x2F1Z3S2ns5ZFhV9bFZ6TmUOnL6zS
         dd6/8O3B17L0DU2qbitmGGy2ZTQMT6lTQN++fsSS1lN2qxVAGiL8vafPP7HHboG98sRU
         ECm/VABfX8AUAEfSbmt5atfd194TgYoDjNiRmw5Doqv+IAmjWvxlILfE8pwhIMZpfdau
         uqP6/X+Wh7RttLG4LYggVnj+o94hV4t7wGt46RsEsm1xmn+GF3uCywW1jz7mFUuxPoTe
         KoWU+PDYRJOqKxkkGulDuZl6V9EYgtAj3TpP3Dh4eRpytzwolFHD2HCt2Zmqaigo2TOB
         +LYA==
X-Forwarded-Encrypted: i=1; AL+hErHRdvVN4C4hxOmmPqtPMEI1U0IQ3mH7f2+jDkq5tdz/XsTs/dUJOZaN0204aXfthTvDsWE=@lists.linux.dev
X-Gm-Message-State: APuU4Z+UiYW3C3qMk/vBkQAFEzBXqQrd8Bynias1sY31RvHXNGY17BwL
	ZCkwKh5S9FqDjuOoiA/uHOto8o3Mf5//hKOQiL2s2TxDX6huKYdcOC93T3l0noz3G/YTvPwElYk
	2Ke4EFg4JXfXr7q99l1TOQNhhPdMBC7N+IKg74MhWnmIftEDFvgM2a1M=
X-Gm-Gg: AZFdTZfwp8syS/U2h4psWoSnZrAC86FWQy8l6usEIOQCYJCgSMDl+ypmdcTPI4DO4NG
	THCYAJEgb1VWw8n0WeVOYftuK1XT14UO+QtscZVtR87x0hCSSsRQku3Jypdm7B84vHFaxXlkEoo
	hqtqXIDsj75nINOVZ6HTMcBfDSgETkSwZcdFdPgUSG82zdj68D/TvlmAphw4EuWzNba7WhyqNiL
	JiVczTrnvfc5v/t3YzUEFZ3m7RY4EO8Cp9mYfC0lgSHALp57grevAnep1t1vQWZcL5ughg/dTvz
	BD3UxYmBtyXrK1ctNCOL7E+6sodIMB/zVn4hH2bnUzCYwOu1r1Gmj4oZUBx8JShwp00dRBNlLt/
	Ul2LkIjVWbFudwAKb4jQB15SMFoRyqvWmtGCZNA09lVQT63wHf0pDLU3wVLBhMVlbyOac
X-Received: by 2002:a17:90b:4c8f:b0:3ad:7f4d:2839 with SMTP id 98e67ed59e1d1-3b1b0b5c3cfmr6107426a91.14.1794809641041;
        Sun, 15 Nov 2026 22:14:01 -0800 (PST)
X-Received: by 2002:a17:90b:4c8f:b0:3ad:7f4d:2839 with SMTP id 98e67ed59e1d1-3b1b0b5c3cfmr6107411a91.14.1794809640535;
        Sun, 15 Nov 2026 22:14:00 -0800 (PST)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0f497sm20229444a91.8.2026.11.15.22.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:14:00 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 11:43:21 +0530
Subject: [PATCH v5 3/7] regulator: pm8008: Add mode voting support for
 PM8010
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-pm8010_i2c_support-v5-3-5626ba17c0fb@oss.qualcomm.com>
References: <20261116-pm8010_i2c_support-v5-0-5626ba17c0fb@oss.qualcomm.com>
In-Reply-To: <20261116-pm8010_i2c_support-v5-0-5626ba17c0fb@oss.qualcomm.com>
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
        Oleg Keri <okerixx@gmail.com>, Burke Cates <burke.cates@gmail.com>,
        Christian Cortner <ccortner@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794809616; l=6336;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=sLgFxdoZSlOfW2ww3mFNg4KJkHeH9NXGs/EKYxEsFL0=;
 b=vspQyX/ef8iwiXI5HGjCF4QeOaVoNMexIW22U0jr8V+G2ktLEjTIvjNxgdRm5uAWKrh7iq+0+
 I8FQNLJv6n6BB/limXFfBsLGkwPa+LlX8ChSMmrvaIvS7pbm8kk4kFK
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyNCBTYWx0ZWRfX5koNGaOVj6M0
 xnFvHIYKR1aOce/xZDuzG+2r7avLMR/uLHwWXzq85JEH3xHzCo8lhS1l/lyvKXYbb7A7ddTR1XQ
 HVQAMsrPVxtI0saoxyGENzf2dqDytVGfdSPVGRRjqV8QhUrntm4OdFcFs/Y8/Vsu8A0ztKzkBoB
 BFuXeJEn1Qp6hT0leGv8k49zIBFJ6/cg+3tLhe6G9LDCJpHmdGM5yHFXH+sN64H/zzUmcxOMRkK
 dgL8z5UtoGunF64dvRrZUyCbdfcPKMUPxnS0baLWxjaFbnlNZkd9a7keAR3zT/oDEdOBajWSrAu
 zrtpjmBWCfxNwzrOap1X4+E81tobcfdHEBatuS+soDbp3lEZd+zIze4bdwx/DYl4n/X7kRPvAXp
 jKTYLxxhYnQ6A4rDHT3ePX2VY6QidsX19Di/Z/xrc7ogmEpVSXoyFE/sKnAs9aL9eLZcDsFWWn+
 MlT/Dw9AW9Er7Wylk0Q==
X-Authority-Analysis: v=2.4 cv=YPYKWhGx c=1 sm=1 tr=0 ts=6afa9f2a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=9b6pvoUWzmwS3gtn3D8A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: iZi2jdXmk4VafBQfT9Aa2ZkOtv8fSMj5
X-Proofpoint-ORIG-GUID: iZi2jdXmk4VafBQfT9Aa2ZkOtv8fSMj5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyNCBTYWx0ZWRfXwEvOnOSsHhM9
 mqvF9TxD6WVYvo26CE65xwcDZOXqEy+gRviCp7rVhU546qKSUEsBD5GWsyhMUTAPf3oihIuosnE
 UYw5UM2oHK0BFDA8N1sPYc0wm5cENyk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160024

From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>

Implement set_mode/get_mode/get_optimum_mode support for PM8010 LDOs
using the mode control and status registers to allow clients to vote
for LDO modes. Mode voting is supported for L1 and L2 alone of PM8010
LDOs and not supported for any of the PM8008 LDOs.

Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 drivers/regulator/qcom-pm8008-regulator.c | 102 ++++++++++++++++++++++++++++--
 1 file changed, 98 insertions(+), 4 deletions(-)

diff --git a/drivers/regulator/qcom-pm8008-regulator.c b/drivers/regulator/qcom-pm8008-regulator.c
index 0ea4ac016dc2..b7769b3dfc45 100644
--- a/drivers/regulator/qcom-pm8008-regulator.c
+++ b/drivers/regulator/qcom-pm8008-regulator.c
@@ -24,6 +24,13 @@
 
 #define LDO_VSET_LB_REG			0x40
 
+#define LDO_MODE_CTL1_REG		0x45
+#define MODE_PRIMARY_MASK		GENMASK(2, 0)
+#define LDO_MODE_NPM			7
+#define LDO_MODE_LPM			4
+
+#define MODE_CHANGE_UNSUPPORTED		0
+
 #define LDO_ENABLE_REG			0x46
 #define ENABLE_BIT			BIT(7)
 
@@ -31,6 +38,7 @@ struct pm8008_regulator {
 	struct regmap		*regmap;
 	struct regulator_desc	desc;
 	unsigned int		base;
+	int			hpm_min_load_uA;
 };
 
 struct pm8008_regulator_data {
@@ -40,6 +48,7 @@ struct pm8008_regulator_data {
 	int				min_dropout_uV;
 	const struct linear_range	*voltage_range;
 	int				n_linear_ranges;
+	int				hpm_min_load_uA;
 };
 
 struct pm8008_match_data {
@@ -71,8 +80,12 @@ static const struct linear_range pm8010_pldo_lv_ranges[] = {
 	REGULATOR_LINEAR_RANGE(3312000, 31, 31, 0),
 };
 
-#define PM8008_REGULATOR(_name, _supply, _base, _dropout, _range)	\
-	{ _name, _supply, _base, _dropout, _range, ARRAY_SIZE(_range) }
+#define PM8008_REGULATOR(_name, _supply, _base, _dropout, _range)    \
+	{ _name, _supply, _base, _dropout, _range, ARRAY_SIZE(_range), \
+	  MODE_CHANGE_UNSUPPORTED }
+
+#define PM8010_REGULATOR(_name, _supply, _base, _dropout, _range, _min_load)    \
+	{ _name, _supply, _base, _dropout, _range, ARRAY_SIZE(_range), _min_load }
 
 static const struct pm8008_regulator_data pm8008_reg_data[] = {
 	PM8008_REGULATOR("ldo1", "vdd-l1-l2", 0x4000, 225000, pm8008_nldo_ranges),
@@ -84,9 +97,10 @@ static const struct pm8008_regulator_data pm8008_reg_data[] = {
 	PM8008_REGULATOR("ldo7", "vdd-l7",    0x4600, 200000, pm8008_pldo_ranges),
 };
 
+/* LPM setting is supported for only N-type LDOs of PM8010 (L1 and L2) */
 static const struct pm8008_regulator_data pm8010_reg_data[] = {
-	PM8008_REGULATOR("ldo1", "vdd-l1-l2", 0x4000, 172000, pm8010_nldo_ranges),
-	PM8008_REGULATOR("ldo2", "vdd-l1-l2", 0x4100, 172000, pm8010_nldo_ranges),
+	PM8010_REGULATOR("ldo1", "vdd-l1-l2", 0x4000, 172000, pm8010_nldo_ranges, 30000),
+	PM8010_REGULATOR("ldo2", "vdd-l1-l2", 0x4100, 172000, pm8010_nldo_ranges, 30000),
 	PM8008_REGULATOR("ldo3", "vdd-l3-l4", 0x4200, 80000, pm8010_pldo_lv_ranges),
 	PM8008_REGULATOR("ldo4", "vdd-l3-l4", 0x4300, 80000, pm8010_pldo_lv_ranges),
 	PM8008_REGULATOR("ldo5", "vdd-l5",    0x4400, 296000, pm8010_pldo_ranges),
@@ -134,6 +148,69 @@ static int pm8008_regulator_get_voltage_sel(struct regulator_dev *rdev)
 	return regulator_map_voltage_linear_range(rdev, uV, INT_MAX);
 }
 
+static int pm8010_regulator_set_mode(struct regulator_dev *rdev, unsigned int mode)
+{
+	struct pm8008_regulator *preg = rdev_get_drvdata(rdev);
+	unsigned int val;
+
+	switch (mode) {
+	case REGULATOR_MODE_NORMAL:
+		val = LDO_MODE_NPM;
+		break;
+	case REGULATOR_MODE_IDLE:
+		val = LDO_MODE_LPM;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return regmap_update_bits(preg->regmap, preg->base + LDO_MODE_CTL1_REG,
+				   MODE_PRIMARY_MASK, val);
+}
+
+static unsigned int pm8010_regulator_get_mode(struct regulator_dev *rdev)
+{
+	struct pm8008_regulator *preg = rdev_get_drvdata(rdev);
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(preg->regmap, preg->base + LDO_MODE_CTL1_REG, &val);
+	if (ret < 0)
+		return REGULATOR_MODE_INVALID;
+
+	switch (val & MODE_PRIMARY_MASK) {
+	case LDO_MODE_NPM:
+		return REGULATOR_MODE_NORMAL;
+	case LDO_MODE_LPM:
+		return REGULATOR_MODE_IDLE;
+	default:
+		return REGULATOR_MODE_INVALID;
+	}
+}
+
+static unsigned int pm8010_regulator_get_optimum_mode(struct regulator_dev *rdev,
+						      int input_uV, int output_uV,
+						      int load_uA)
+{
+	struct pm8008_regulator *preg = rdev_get_drvdata(rdev);
+
+	if (load_uA >= preg->hpm_min_load_uA)
+		return REGULATOR_MODE_NORMAL;
+	else
+		return REGULATOR_MODE_IDLE;
+}
+
+static unsigned int pm8010_regulator_of_map_mode(unsigned int mode)
+{
+	switch (mode) {
+	case REGULATOR_MODE_NORMAL:
+	case REGULATOR_MODE_IDLE:
+		return mode;
+	default:
+		return REGULATOR_MODE_INVALID;
+	}
+}
+
 static const struct regulator_ops pm8008_regulator_ops = {
 	.list_voltage		= regulator_list_voltage_linear_range,
 	.set_voltage_sel	= pm8008_regulator_set_voltage_sel,
@@ -143,6 +220,18 @@ static const struct regulator_ops pm8008_regulator_ops = {
 	.is_enabled		= regulator_is_enabled_regmap,
 };
 
+static const struct regulator_ops pm8010_regulator_mode_set_ops = {
+	.list_voltage		= regulator_list_voltage_linear_range,
+	.set_voltage_sel	= pm8008_regulator_set_voltage_sel,
+	.get_voltage_sel	= pm8008_regulator_get_voltage_sel,
+	.enable			= regulator_enable_regmap,
+	.disable		= regulator_disable_regmap,
+	.is_enabled		= regulator_is_enabled_regmap,
+	.set_mode		= pm8010_regulator_set_mode,
+	.get_mode		= pm8010_regulator_get_mode,
+	.get_optimum_mode	= pm8010_regulator_get_optimum_mode,
+};
+
 static int pm8008_regulator_probe(struct platform_device *pdev)
 {
 	const struct pm8008_match_data *match_data;
@@ -186,6 +275,11 @@ static int pm8008_regulator_probe(struct platform_device *pdev)
 		desc->of_match = data->name;
 		desc->regulators_node = of_match_ptr("regulators");
 		desc->ops = &pm8008_regulator_ops;
+		if (data->hpm_min_load_uA) {
+			desc->of_map_mode = pm8010_regulator_of_map_mode;
+			preg->hpm_min_load_uA = data->hpm_min_load_uA;
+			desc->ops = &pm8010_regulator_mode_set_ops;
+		}
 		desc->type = REGULATOR_VOLTAGE;
 		desc->owner = THIS_MODULE;
 

-- 
2.43.0

