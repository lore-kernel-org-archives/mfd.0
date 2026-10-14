Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC37449B17
	for <mfd@lists.linux.dev>; Wed, 14 Oct 2026 10:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791974022; cv=none; b=PvgDoDROMy+z0EZBMfSBm2CebX3hcHVYuMhukn6vZ2zrLQ1gxfUUl/+zgGn18bT0oYVNa1LOTuNEL/XeaE7Emaa6AAcgruGtkBWO4EnxydOaE4mkazU8/12AuvhQeypRdMBasI6TcBNYntZXZpD2w+A+GA0yyulP9T6scG5Ts9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791974022; c=relaxed/simple;
	bh=hxIjusSCBorTVqOq5RuZvSDPBIP7IUeJuk1QW4jovkQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GecH+UbUXHTkrFuhNfZ+EbJcIEfCjGCNXw46vD1lzB4TbL7j7rwYaVvyQ9JLvtNu1yEodf/mZy6wxJgR/SPfvg7iuMqsQKoUCH/PABxHpJXq8A+PIC3TWdUoaGts1cADg/Q8mVOXlM6by3fwTNJ3nadNQ8nrU97McKU1BUL9JUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kAH/+4HA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dohGCuXs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kAH/+4HA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dohGCuXs"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E8mVUJ3000890
	for <mfd@lists.linux.dev>; Wed, 14 Oct 2026 10:33:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uYOdaRlpvFiyZRi9h6nqtF0wDEGaCkKokf+siSEe6Go=; b=kAH/+4HAiNunpkmQ
	QTW4kTAfdcM5OQpSxHhwyyLB69YptJeAANXSBbpsX8ZRLCfYXYJqKZGuiDhiURp+
	LDuzZ9OdshcuIVQd9/C7hKG7MN0CaHQt3OZpp63gLHYZOPh7t33Le0XC887NoE1U
	4MpsuRoJtA7Yvb3Jx2DjG6DIp+OJq3dlsMjtMoxiyZP/3/ZWS0Dvc+IFa5A5UrTD
	QwamdLLhf1YWdV16oJw3QMQ65R+J9IH7k+Cw71pVQZcOocViE3pfBBHBe2wtUMZY
	IsgNcvRClptPAr2CXFr4/p1kFqch/IJcFefZh5l/xZTESFksP6dSaNA4tIYanoeR
	8+99cw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9sbeugq2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Wed, 14 Oct 2026 10:33:39 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ac7a4ba546so254533a91.0
        for <mfd@lists.linux.dev>; Wed, 14 Oct 2026 03:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791974019; x=1792578819; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uYOdaRlpvFiyZRi9h6nqtF0wDEGaCkKokf+siSEe6Go=;
        b=dohGCuXsjeIPYRAN9l3XFmEdb+k3E5kysI5S0uLgDIgi/Uzw8JEalvBqOJTQITTA4c
         MidptY2VtiRVyNzj3eGrbTXht4DWVZiOgI4kdaMoYvHF7kQM9xBLT32kIDRrAPieHVRg
         dcvBB+9sl1cjpbdoBlLWrQTLE1VulRXrxp+0QP3kKiasQL0oQ6rwecJIuWN0UivctxYI
         Cb6Rhgyzzi+RQgCaMpoFdH4IIVZnxBNJx1wC6MV9c6p6+QltEkd4MvoXmGl7g+kRPm/g
         Bt55GQaTl8ZQLHOj4wyDzmYeAu9z93CWer69TPlm/YVGjz2X473m1aoJ48qr9lfp3SWB
         qw9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791974019; x=1792578819;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uYOdaRlpvFiyZRi9h6nqtF0wDEGaCkKokf+siSEe6Go=;
        b=aVtjIdbXcsn5jr+X7u7P55VlMwZtKVcYG2gRGzA2X64XtjAPU8n+fRgK0vuU1YuhZB
         6Z+/VzgysYuywwmVipi9u+BJGXIgZLKJ9QB3QJ2AMW1S38nVeC5rPfBmTHGCL3nfqJA/
         UKRWJLgFfGp4VDPAkOUNyweCUKANADL2lprbauJEuXWXjPTYYFU7ZsHaOtRgpOCzS5gW
         ce9KciARBi3gy1xIkPRkMqIiBQ6PB0z87WZ5KpeIOmUiNJhIoAGBbPMGtpFLzcPep+zR
         rRC0VESlm+DsdqJgvA053RqEcMvzZhNTzcKV+OBdoXznDItldCINxaBeCGYN0RaeLPZ+
         o8Gw==
X-Forwarded-Encrypted: i=1; AKwUvBzFpi+f3z2DdCc1e4Z/lcJSMMCCKKxnud34Qgvz6tiTxIVueBVIyq3hNjlBvAR+cR/MkcE=@lists.linux.dev
X-Gm-Message-State: AFq9FYKIS/OiwFwqFbEsl9Fo90qZfWRl2T8tUUZzCMs3RSiXCBRc+ivC
	7Bh8IWIYIfhruwG5n/ik3rLPs1s2YYAMgjokOmZvtZxu5UBLXIqGehlG3m6xx1tkhFqDZiIdX4j
	mlRFGW/Yex2pLoAVrW6HK+MfzwEG8cHcF65tIs6ROax1eyOcghtXJiAU=
X-Gm-Gg: AYBFou2tL94PS8e/p+OxTpZv0wAJL5w++e3B+uBdTE1XwO+SN2R+/QZygCs7SDe6Ra9
	nrFk/jDVnHkS4KAG+n1FKRAM38iPLWJaZggFHoPlSccYtztpcxsFXxjgEJuIPg+8rKJWAN3y8Hh
	LLZnfV6MUNysz5YeKQY2vgiy4AjkUHjGpws53nTv+rXKCfHcPikUgAYkzMERNtZIfZJVPj5sCf/
	FhKA+yME885uMkU/GNuECchIhX6A5EPEGoxpkHcX5f18b2/ufnXrzQs2TS5sS3eg8jvl7edth4P
	bdD7szhBGgbYF1UTlgmv+KY4n+b907/RtUgLbZwebcQENEAgllsIG53NcY5wSzLz6EzcxX3Q6Of
	h10O2doY35xBjPBC+aPU=
X-Received: by 2002:a17:90a:c885:b0:3ac:7c98:dda5 with SMTP id 98e67ed59e1d1-3ac7c98e242mr456435a91.51.1791974018526;
        Wed, 14 Oct 2026 03:33:38 -0700 (PDT)
X-Received: by 2002:a17:90a:c885:b0:3ac:7c98:dda5 with SMTP id 98e67ed59e1d1-3ac7c98e242mr456410a91.51.1791974018007;
        Wed, 14 Oct 2026 03:33:38 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e08905sm6822382a12.9.2026.10.14.03.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 03:33:37 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 16:02:01 +0530
Subject: [PATCH v2 4/7] mfd: qcom-pm8008: Drop GPIO support
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-pm8010_i2c_support-v2-4-b395d2b3f668@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791973985; l=2664;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=hxIjusSCBorTVqOq5RuZvSDPBIP7IUeJuk1QW4jovkQ=;
 b=AElc/WvIvPXIUJVp0/t2t/wfMdZneAGVDMqv6c1eqg/ofRpLZRnZCcWvDZpBFXFjwNWwthwB/
 qvtaWtqShfSDU/dqcmBCTSGlT4kRgk90gPSK8IDpPe0RlysHN7nvVKc
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-ORIG-GUID: IPcpF6OTMVRPGEvdEr425Fr5F9Rg1RB0
X-Proofpoint-GUID: IPcpF6OTMVRPGEvdEr425Fr5F9Rg1RB0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA0MSBTYWx0ZWRfX8yYU5KiD9PHz
 W5rbfPAGf2Sj+4jjqqC38C+rr9aSXRNc/5Ymy9Ha2jc/6wakq+5Zo4j2xgMgHFc40XRaY7TLkdc
 55t1SN+bMnQ7nkfXhDsnrBvOi4k+71nTqyKBkmOn/Buu0w/kfBvwTbXPf/G9O7xsbgNpsPIBLPn
 rmhrcSdhDaEgpDWJ8I8lreSALotpwkzJQL9r5Ei6111rXch+VejsnvETn3ODMRez8U8RYpPz07R
 RsL0PeCE256uJlQHMFVR88pHceDTc6E97lWWrdL9wpdpPqZMs79qV+FHLUWvJ5/q2IboWjK9vkA
 SEmziLEEtouKui8B9g8+WgB9+zq8R4Iu8FvzovnAXaXZzhqaNHJgzLAhR74vs1mhJZ2bRNl1KQt
 qrUgaE7q9bOG3gbuHLYuTjUUit29k9DOgIgal9DeHfg11p0k+tfKhVV0lF6R6ZhWBJxi4S+XFh7
 DTrv+Gd2phcEoLXnIig==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA0MSBTYWx0ZWRfX882qtiaO3fIw
 8K280YqT/41uV8x6F5M59ck9O3TAO7WSsZxx2HC9cLwYqAIhLCvP1pjkkroaWzEnTkaNztj/UN9
 uQZDerJ/dsUfY/HuxoeflRMVYIIgmcw=
X-Authority-Analysis: v=2.4 cv=U7AHnuru c=1 sm=1 tr=0 ts=6acf5a83 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=-NFQ3DzUh64S9De9z5UA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140041

GPIOs used on PM8008 and also the upcoming PM8010 have fixed
functions (reset and interrupt input functionality) so it is
not useful to expose them for general-purpose usage. Drop the
GPIO MFD cell and associated peripheral definitions.

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 drivers/mfd/qcom-pm8008.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
index 60204cc9a2dc..2d6c01cf54f3 100644
--- a/drivers/mfd/qcom-pm8008.c
+++ b/drivers/mfd/qcom-pm8008.c
@@ -31,19 +31,13 @@
 enum {
 	PM8008_MISC,
 	PM8008_TEMP_ALARM,
-	PM8008_GPIO1,
-	PM8008_GPIO2,
 	PM8008_NUM_PERIPHS,
 };
 
 #define PM8008_PERIPH_0_BASE	0x900
 #define PM8008_PERIPH_1_BASE	0x2400
-#define PM8008_PERIPH_2_BASE	0xc000
-#define PM8008_PERIPH_3_BASE	0xc100
 
 #define PM8008_TEMP_ALARM_ADDR	PM8008_PERIPH_1_BASE
-#define PM8008_GPIO1_ADDR	PM8008_PERIPH_2_BASE
-#define PM8008_GPIO2_ADDR	PM8008_PERIPH_3_BASE
 
 /* PM8008 IRQ numbers */
 #define PM8008_IRQ_MISC_UVLO	0
@@ -52,8 +46,6 @@ enum {
 #define PM8008_IRQ_MISC_OTST3	3
 #define PM8008_IRQ_MISC_LDO_OCP	4
 #define PM8008_IRQ_TEMP_ALARM	5
-#define PM8008_IRQ_GPIO1	6
-#define PM8008_IRQ_GPIO2	7
 
 enum {
 	SET_TYPE_INDEX,
@@ -84,15 +76,11 @@ static const struct regmap_irq pm8008_irqs[] = {
 	_IRQ(PM8008_IRQ_MISC_OTST3,   PM8008_MISC,	BIT(3), IRQ_TYPE_EDGE_RISING),
 	_IRQ(PM8008_IRQ_MISC_LDO_OCP, PM8008_MISC,	BIT(4), IRQ_TYPE_EDGE_RISING),
 	_IRQ(PM8008_IRQ_TEMP_ALARM,   PM8008_TEMP_ALARM,BIT(0), IRQ_TYPE_SENSE_MASK),
-	_IRQ(PM8008_IRQ_GPIO1,	      PM8008_GPIO1,	BIT(0), IRQ_TYPE_SENSE_MASK),
-	_IRQ(PM8008_IRQ_GPIO2,	      PM8008_GPIO2,	BIT(0), IRQ_TYPE_SENSE_MASK),
 };
 
 static const unsigned int pm8008_periph_base[] = {
 	PM8008_PERIPH_0_BASE,
 	PM8008_PERIPH_1_BASE,
-	PM8008_PERIPH_2_BASE,
-	PM8008_PERIPH_3_BASE,
 };
 
 static unsigned int pm8008_get_irq_reg(struct regmap_irq_chip_data *data,
@@ -180,7 +168,6 @@ static const struct resource pm8008_temp_res[] = {
 static const struct mfd_cell pm8008_cells[] = {
 	MFD_CELL_NAME("pm8008-regulator"),
 	MFD_CELL_RES("qpnp-temp-alarm", pm8008_temp_res),
-	MFD_CELL_NAME("pm8008-gpio"),
 };
 
 static void devm_irq_domain_fwnode_release(void *data)
@@ -252,9 +239,6 @@ static int pm8008_probe(struct i2c_client *client)
 		return ret;
 	}
 
-	/* Needed by GPIO driver. */
-	dev_set_drvdata(dev, regmap_irq_get_domain(irq_data));
-
 	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, pm8008_cells,
 				ARRAY_SIZE(pm8008_cells), NULL, 0,
 				regmap_irq_get_domain(irq_data));

-- 
2.43.0

