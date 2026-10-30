Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793341290;
	b=p1RravyDUjAXUrNzYck8bfHAQ/2kKA/thChqIcyMBQWocWj1Wo+ccuK9q5Vo5wiFeIKd
	 uAsljQGHyggBbUoT6Hqgow180CIlsQ/POpLwQETXQJA9ddq9N5uSS3Ru6MU212I5WSR58
	 3VjjgW3lPgrFaHmJfkfokZRbWjIxx+quKVDrWiwJ2Am9E1bZtiJIyrx1zsHd/aC/UKGnj
	 La+VhoEAz6BGoKrG5G+Hsl6VAKH0lFGp2/WEOvmoS99HCnjIcVatbA/6cQD486n10Q+5I
	 +j6M4AlnFh7INL7ARuAkrFRqgzV6jM5dZMaPhA6xutiQBmb2A3lKVoBRFAVXnnKtD/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793341290;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=RgmjaHKT+8xjtXoW72r5gl9u8NYf/R6DKfCNFrT8aco=;
	b=BOevFSJRHesnGuAe1A1nVgjBFPxU7mb3x/IJPK4iTWEQojQI4Fa6hXlrcWzDNS51Eqzc
	 WDMKaSXzht0Ck6yXv3PcfLdnhf5FmBYtok2l2u9V+XnI80vmLyiFzHZwbhTot90eGpoV7
	 ej33ellsx7XFEsdGKVEjfars+wqetxwFL2QIjjBB+ibpofAA33QWHu/kV/pekVF1/CLsm
	 dIPHSWj5+YVCc/Zzl0bWfZ3KyHDOH6jxZ2W1W9ZRvJJZm/MSQcwQIp2ZdOjp67Suc9RpS
	 N1MLCjdC/6W1/ny2YxUAVZUheS5PYzzb60phC9T6bkx/K7GouULN4QVDrtvbwqBWIGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q0lMVd8i;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A7m2ABW8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB1E606A31E
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 06:21:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AB1E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q0lMVd8i;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A7m2ABW8
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5F4Lh2287019
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 06:21:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RgmjaHKT+8xjtXoW72r5gl9u8NYf/R6DKfCNFrT8aco=; b=Q0lMVd8i9PEtZ62V
	iawUO3S838i5fqp3bVT0qLx17O0ZZB3Mcv/x9gqAX6Pz9knoq4Wg7sDitSk2sEaG
	omXBwq6F3utCEwQZ0dl/n4L9cUUJKXnXPVcBbqXAB10sDrJeEYyu0IcBWjgMBHVS
	DoNAnEFH3c9W2KG0TcPz4h8UwMhCCFMXlqH96JNEhnUsxrwLhJfxikMW79jF6Jyh
	dG2jjnECE3LQCMw7qh+NxJ7bWqZvdALHOxylXI+5h6XANHzr2X8yxhdqhf/ApDPK
	QCwRpR9zjzaq5lc5rsZSOK90t4yKN6pu74grSGDjCbwDG0yppJyGP3noBrn4snKF
	xlQqrA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qhh63-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 06:21:29 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-89e96c03cd0so347054b3a.1
        for <mfd@lists.linux.dev>; Thu, 29 Oct 2026 23:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793341289; x=1793946089; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RgmjaHKT+8xjtXoW72r5gl9u8NYf/R6DKfCNFrT8aco=;
        b=A7m2ABW8hKgu5sVF/lc/5hvsrdhl09ha6i57uH1egqE3zKyrLjwRWY2ihGJrdmqYKx
         ggAH6bOR7UvDXDv2C2qZgkNY09GuBT6WOTbq5xYau99f/xtynvzCsEf7XKB1ITx6LpxW
         I2w+rRy1Se7C43p/hTpGiOZteOKYRHLX8aUNWB1vdn/iPCENUJygJCbalFhLNkLolJKN
         vxmevR16UPXdICAzc0PRcggKBwS3+rhMG5Vf+m7NdppooUHHXs8bxvclZCpy8tdZqk8m
         l/t2FVFk6vv4HsFP9mFz2GKddwpEnL1Px9Fo35UdFSFg3bJtFfHdEgUet363qP3nEA8H
         rq9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793341289; x=1793946089;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RgmjaHKT+8xjtXoW72r5gl9u8NYf/R6DKfCNFrT8aco=;
        b=HxQB6hJxpsLDAJ+g6EGYVBxv2ul6pftPpjrnCjxM2r1KXKYkmL4m+7mwHzLrN1eWDJ
         lznqFqcHIFk6MgpAd0CVmKTmt4CLYcKFtbJwa1YKxGIQkebM4Hgv/576GxiuMxrbrLXd
         Rw49WO8Ig6dwbA7eubZJ9u/lqsEq9VoWxJ4A3BbJURVhVtp8KgicwZSfZ3Q50Pikz2sd
         xEivCNVMbRV2gYeqOwtsOQKDSq8oQEzZrNAnB2G+3+eWbb8tZri0g0+w0bN8edzG+ZZw
         YvU5uAbK2IchQwO0sdgU0kKU4zQ/fnzwAjz3oTFh4KdzHnnxh6N2EMoYSFcN79s/3SWX
         r3dA==
X-Forwarded-Encrypted: i=1; AKwUvBxJdGLekVwGrIci9jPkkst8mTilzn9JHIWgk8KkD6pKWCsVDSYfnDpgkdtY0lexnKm7ISo=@lists.linux.dev
X-Gm-Message-State: AFq9FYL0duJvNLtAMkWnLKuEowSevI1IIvvX4JI8svLHp19otmqLkgPD
	Ua6NaevhWv1AnuNz+eUds0CHgt8ZwdfOP+YGf4uq24Eyw5ctnGUogshqPyX7/Mj9sCsQyI5RkAI
	KGjZf2EMv+T4W5MNNVboku7g44EY3J8gPsrz9Hu13V2UDt974mp3OZBg=
X-Gm-Gg: AYBFou0SC1wpLI17Idudq2hS3s8bixR0LSeLXDyq0rZIsG0j0nYUQMEjNGyE47oGXZR
	fVZ7GmIok1QATDgATtWPz+LT3br39WI6EjF8MQSsWtWfE0HCNiDbxfqXDlvqPKQCHrZ41jZtFkV
	AjuWC4nbzcC3+xLA6tdwMc/FojhFFXGSdup3UJOZ6sUDhiuCqeL/uRpeyWkRvpumS2hRs6R8otw
	4mQeYq8LfT9BLJvrxCmXjjNcqplAJ+2bVRDPbfdWYB9gH/CcQWwYTWvVrzos1uABpy1tDzTLO4r
	wZsJ7p74ziy5osRTLIEOUmLGHib9cg3KiKi7s0OfDa587g6GF2jNgmhLKf26SkS2Lf4BuJl9Sz9
	MhZYAz1Aoih8tClKKlLMMAQ3RR9k8Vbv+8JlA8D06P8wuA5QxMz1a9ZSRUg6Z2e4lK4A=
X-Received: by 2002:a05:6a00:a87:b0:87c:e44e:5694 with SMTP id d2e1a72fcca58-8a9be48bae6mr1062374b3a.21.1793341288884;
        Thu, 29 Oct 2026 23:21:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:a87:b0:87c:e44e:5694 with SMTP id d2e1a72fcca58-8a9be48bae6mr1062351b3a.21.1793341288405;
        Thu, 29 Oct 2026 23:21:28 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a9ef08b936sm351163b3a.13.2026.10.29.23.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 23:21:28 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 11:50:52 +0530
Subject: [PATCH v3 4/7] mfd: qcom-pm8008: Drop GPIO support
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
Message-Id: <20261030-pm8010_i2c_support-v3-4-995ed1ec7a72@oss.qualcomm.com>
References: <20261030-pm8010_i2c_support-v3-0-995ed1ec7a72@oss.qualcomm.com>
In-Reply-To: <20261030-pm8010_i2c_support-v3-0-995ed1ec7a72@oss.qualcomm.com>
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
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793341260; l=2803;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=7mLpR3X9sn5PkU9srryIPwK4wU4oxVAA/ffDfHVmy3Y=;
 b=3VC6SDP1ZyUjeKHAJKTRxNVFsCVnabMXGvo7hun8OFtJKAlg2iTU1gbcQu20nFLXuq86EFP03
 kqIJgVur52oAMVguZjEJm8HH9garGe0hLQBjD7Xjy5DEgQy/HY1Bd3v
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-GUID: gBrYw4BUkqc6vwVbeujWcpYM4BSwvhwn
X-Authority-Analysis: v=2.4 cv=KLzPn1Fo c=1 sm=1 tr=0 ts=6ae43769 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=-NFQ3DzUh64S9De9z5UA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyNSBTYWx0ZWRfX1cg22/oLMGLk
 XcPCC+Zo5v2CtOYA9GSj5waa9+Ng0jb1z9k2IDHxZkLQLX2aQNIzCgg4q5bYftoOZQZwuNsCmN1
 EyIhmeWoARHhLDJS/pWdbRLiyOzzn7qlI6HVtWJw9UVo0rvQZLHLOQz0OWtham8ugyiN7zSbiFx
 4GpPdIolnUn/VCq9sh1LZJHnPv9c4lKb6oju5nkE19P+1TDzAEqJYfGKj/tVGBsZLVLCcNbj3H4
 hEroL6nr1i5YX0UQsht+SdTCgbCm6iVtfSKIvR+9Mx8ECCqgz8XeD9EqreogVeg2mgMmtJtKfLu
 VdZ+cxNWVp2JSTMxebUvkNs3jhISUTgtJvMtNd+YkckL7WN/K6PdGjtAHBfBscXdkd7netVOsdi
 65A3TP+BAAIkHaPXhuzy8p2wA52NZBfALIO3tggb6AhJroG9NDjhX6GL6R+G3vFQTgtzD4kql45
 fhoY6Nm/YtSyLKBdpSg==
X-Proofpoint-ORIG-GUID: gBrYw4BUkqc6vwVbeujWcpYM4BSwvhwn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyNSBTYWx0ZWRfX1nQfgHwxdOBW
 Q1Uh1QQ3noUXBK+0aK+A/22bvfbSYvrd60/OLAWjG74wBr5IblsLlnoJlR7Crshpp8nh9UIuiDT
 mtPGeI4JK0UG9OinOZjugcZFwy1fjMg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300025

GPIOs used on PM8008 and also the upcoming PM8010 have fixed
functions (reset and interrupt input functionality) so it is
not useful to expose them for general-purpose usage. Drop the
GPIO MFD cell and associated peripheral definitions.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Burke Cates <burke.cates@gmail.com> # ASUS Zenbook A16 (UX3607OA)
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

