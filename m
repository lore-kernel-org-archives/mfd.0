Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793344345;
	b=sUfVZaWurPVJcxoAb+yGMAym28f3/Fb16EX+RyqYjaJIguYiL67VUlXsADQZzchgxU0v
	 4M+JfBXfZcQHG63Iu38cCPkllGA0FlQI7I9AZoVvxI2mNEoJqrVL6917hHgAcVoFLRuMp
	 /1ZsnVhgBNzoiiPCV09//kBGDbKBlAOt1RvWCdcjME9et99s665lckx+1nnOzMOWOz+BA
	 cpC5j2bTdQeIFCU1JIB4SQcbDQGPWZvsVwO9MfXFpXAOCb81JNkJetuQeIfJ60qC4Q+lF
	 sCX8z9H1XAD/JUgYTiN8B7C/Te5WzyHI6QOBmsnJzu2CVuDKMj+yBQyf+kDwC/fg+1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793344345;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=GBXGIsf8Ff9iTgcTPMOoZ8nhfqdAMpikNU4DnUYt6g8=;
	b=kry5/hOUQlnmi+n7NjnteswVpWfTCMYOyEkFfxydIyfkYRqnXW+wlX3Ei5v+Cwimm1mz
	 AoSM0Es7A89+KMgUGDm5bR/4sa5zcQWzlKrEN0fNpIlpJIvZuRVJQLm5pX87HFE12vLKl
	 hlZh2QlOvP7AqdbdIxFpLJJQcdPuqJRppUqAFIdqUI9E5KcmPIwu3YSt9SEx059LEp8vr
	 UGFJzJhbd4s6dsgk6Ufer5ZnV3zG6VLnG75lHfB9j9QaoRjixs66Ekg+4l6LlLH+Ktekr
	 cVwtdSp3v5Ol3vIMg/pANdnAamvpybid6wGA6pEl/OXfiUFfXnjBZOqZ76w72XuMzLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hGTIgvR7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LxChCQG2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBF3606A31A
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 07:12:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABBF3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hGTIgvR7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LxChCQG2
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5FVq22872285
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 07:12:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=GBXGIsf8Ff9iTgcTPMOoZ8nhfqdAMpikNU4
	DnUYt6g8=; b=hGTIgvR7bBCAQXvoNaBkX+H2e7HsCjJjl0yVS59OaA+/jrLX9uW
	SmsFLzFodP6yqAfrbyHw6tsgyyIThvHGeTBJ5alaaSg4+nC/XqLI1QJACGSS+ocM
	c6GfoXWFXLVbVse//7EY3+cQSzEhKyZCGzuZXnA8Tk1AKNDpf/EUYnJQF4KefnLf
	CgvSZJ1lV8YtFuYsUo4p+SH4HAJyEPnLs6PqCAiLWqpF57ZXdx5YIk0GEAk4uX/V
	Je9X2P3J01X4RCyoqiPHn7rt6Hb747qnt1MmL8BvPu8+mvVH348f8e8giuzpf/4g
	i5BQXOGG82mOCIZxz1D8X2pRGqBdRxhCHnA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qhqpy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 07:12:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cbf2fd504so60887785a.2
        for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 00:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793344343; x=1793949143; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GBXGIsf8Ff9iTgcTPMOoZ8nhfqdAMpikNU4DnUYt6g8=;
        b=LxChCQG2yclemlE2FF404WVUFTq0CuObfg82dm52cHDEq4y63BGV/fJyJpSKuZdi25
         A2ddycOddVcg/Kzf32kHnaYToNa/udtHTnM1OZaNb+s5VDzaVhXfQ395iO7KTLYzITOg
         gUQjPaoNSsa/B06SjTGV0iOnUU4dAB6HKVuCyKmOSppPyHTyA1m9pAgeOP51JwCifqwK
         Vxh4ZwHea5TW5srp7cK4VwDH31MOHbXP+sS1hfJp8GbsPGC5oSSyvGmUJG8ReoHibWxq
         //ntKq2ZR43JeJTpVAyhNs4TYwJUA87PDaGN8/P1PGCJXJfnnbKbBUBQmeitImWZQBOT
         7bvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793344343; x=1793949143;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GBXGIsf8Ff9iTgcTPMOoZ8nhfqdAMpikNU4DnUYt6g8=;
        b=mjS4Vfy9WFoFWb6fsr9K7b9D8cKYWBC0tuTJQ+wppMWm0FwzgGuu9NZqDWOeib+bYb
         utaniUcTyVvH3BN2d8Oz6DJxv0EJK7yAFnRtk6GkvpkRYHkcZFxfEM6Fv+Ef71A7Zl0U
         SNpKfyFz4MSOgSYmWeZ73KqmZFk3FXT4qUbeqyp5ycxJLv/EdDdTzBh0HJo8vHfMWsJy
         WYZh7LRhyDPJhPZLYmnbVqLjbNiFKKk8HiK8ENzEYLG9Xpi37C6+vYZ7PDqDQoBegM53
         tIsZOFxGOEN2+Qm4Gs9Zp+nRx48/a7CcW82oBMGXSZC1l006qR09+VZYCSz0qVFJcJBW
         ec8A==
X-Forwarded-Encrypted: i=1; AKwUvBwwtYkUAvEjKNEePjzRIG2CsszQZYccC+ZhJXO2uZL7HSfDObLaqNpRWSFphUH9IJ9m+/I=@lists.linux.dev
X-Gm-Message-State: AFq9FYISfPbaBfzD7ZjntBmOXRAVM8rSroDCR2DmuQ9xJxMZ0jMKYfwQ
	BML3mj+tPn0oKQfuAYavE3TWdBEiAHXypiurLLF5MrSZQWdcsbuA0MWY0eM9ic7CqsKS3/79Ee4
	csNzMU+fVhTgiX8PhzuEMrZXWrkafeTE5c+8QS38zuFB7sw16x9oaKY0=
X-Gm-Gg: AYBFou03vOWlSFJoeXCL8JcTfv7oQAHBkhxRBIJ9C2lSCf4wfKdPLMAwr/iv0pL8Ksp
	dQhZc0UNfjSfUV/fUu8MqGb5QXqNsn3LOMdBzBoWqoheyNxy1E1H84uMaypYM1sd7sOARfMxcBJ
	305ktNBiylxg+Wqc8S8Xg9s67s2ZcfhaN+BV0/yZGWFNZUApOOrEN3wm5moeoXB4Ms38UClCPBo
	uqDFHMZNVR4L77kDQ301xMRvOiIw3dAgRIgSdk8030mcYKQ8ScXwAXl8sZs2+RYd2zYgZU4ESzn
	YMtIK6Me3/y2Rc8Lz5Dj0M8gcpO9uv0rl0ZnVEY6UntUYlChMYCOZbxIbcSYiYrCOjEOR4ID0Aj
	jVNDpop3e4D2Pq1IOQ2kNpbnn3Hy50GeidUaBAjFwdfbYzZLJjFHmp7drzgfapw==
X-Received: by 2002:a05:620a:8014:b0:939:733d:cbe0 with SMTP id af79cd13be357-9442158555emr246110885a.3.1793344342444;
        Fri, 30 Oct 2026 00:12:22 -0700 (PDT)
X-Received: by 2002:a05:620a:8014:b0:939:733d:cbe0 with SMTP id af79cd13be357-9442158555emr246107285a.3.1793344341953;
        Fri, 30 Oct 2026 00:12:21 -0700 (PDT)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe7706516sm28581165e9.0.2026.10.30.00.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 00:12:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Thomas Richard <thomas.richard@bootlin.com>,
        Andy Shevchenko <andy@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Andreas Werner <andreas.werner@men.de>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>, mfd@lists.linux.dev,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        patches@opensource.cirrus.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] mfd: Constify mfd_cell arrays
Date: Fri, 30 Oct 2026 08:11:38 +0100
Message-ID: <20261030071137.100954-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=11230; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=pGGqpQt25E6SebnEhU7k3lGSfg4jOWFkLbiIISHitrI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq5EMp2J/lexIAvdqPPdnCYCBPvkONl6H932ARQ
 piR1liUV+mJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCauRDKQAKCRDBN2bmhouD
 13GgD/44CCQCIaLtaGgVNGHvkaPCgKjlAX8086oly4Ob1LJzeLHrMYiR8MvbyCrie+mDKoRb0Cm
 VlqhnhC7qeWLvwplSatd04JGBNqB8ofcOit4G3Rdx9TDIpHCEtRMPVnvS8wY2zVzLhL2Jy4vmdo
 Cv0ltumsHfBZy54Gyhe8sZUk0g35gnDBjQI+in04MEHcceJTo8jImPgZ8HuTWyDxxgIH5nwN+Os
 OW0XMB2CLAw/ja0+jnwC0rX10571EdFGqftMmRx52ApKbUTIE+KSmRgGkOEakjq/anitJSz7++I
 EMz3bAsvtGgn4z1CbDV1xRwyuWkYt7PgiYTpOuzrpPPrtenof95y5TYU8eL4TN8pfgA1Na9dvQ8
 rHZvesVvyigAh+JPLhUUdPpYlynGJ9eO6PPiGAEVr3iPZ3+tHp60YQMg5U92aqwS6qV/+ecROV0
 lMReQsG6hHKV7JjdgSFlfHyOP/eBQk8DudJtmH0wi8bmj+mfBYhqa4ghbJ/QAQz9qai9L3azD/+
 Ospqwv1uovblvBQBJU7+PgcLPPIWcF/Bxk3Mpi0P7rvt+VeWajQrT0i5CLz3Zax0mdBMlb8ZIsI
 EPsROwjIePL8F+rbZhkfN2iYk8EeHI0KJH0Ma8Gohvyc6V65pTqPQN2ZEyXIcd4Z2Sghr1xUGDI fdLsGqf738eDJJQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyOCBTYWx0ZWRfX4kDfh7/5nfny
 3zDKJVVv/ytEXao2pCyWAFrwBaqxfDOukJwyASgmnL/GtADn8CqCZfigCD/Lj4K7qrVhOlS5ZeO
 fIZQEbtBT9Q+kGK1KHuHn09sjGPxv/OmpFVIlW2bHoiMIp7/LpWIoZmqapNR6JP91r22ENTp57G
 60XzwgkuZeTig0qSgOZFwL7wFUhGoPuLztise8g0YiUFaqQCSE+WImvw3TZl8mUXWmdHgV7JIXj
 HK2bKXNMNQFjKp8BJj5iAyk+WpMA+aH7ix2btOKcLxqaxbdWM1yUmyIMMZlfzBKqt7yqMFMA4nz
 +pBsVB1e0l8LpJSMV8kolA2D9+hAOD5z9Zx/q8He6x4OhVQyk7IxSopkYbJ8NsXLOgNNZnzJTsX
 cdMtEmvmH0aDUvhCbwiGTKqe4NkcLmKr56aywGAlauBZ53gnm5yGoqCcWP95XxFMlZHyrl6El7J
 kmEuHGp3RqIyoa+vKqw==
X-Proofpoint-ORIG-GUID: tulVCLGnCMIncj48IewDlQsAVU0jGkE9
X-Authority-Analysis: v=2.4 cv=IeoSymqa c=1 sm=1 tr=0 ts=6ae44357 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=_gzb5aec3OYO3pdMjf0A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyOCBTYWx0ZWRfX2+5tUFrruy5+
 7vGf4PrZ2kM8ucMpKpbR513sjvyGLn+YCqCo1EXYZ7wio8QJ8QA4wkKF7Wue74CAGMf/44/yFVv
 5dTxliqPFFdBsv2YP9eUgNZEwit6j8E=
X-Proofpoint-GUID: tulVCLGnCMIncj48IewDlQsAVU0jGkE9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300028

mfd_add_devices() takes pointer to const, so 'struct mfd_cell' arrays
can be constified whenever driver does not modify it in the probe.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/mfd/ac100.c                   | 2 +-
 drivers/mfd/axp20x.c                  | 4 ++--
 drivers/mfd/cgbc-core.c               | 2 +-
 drivers/mfd/cs5535-mfd.c              | 2 +-
 drivers/mfd/intel_soc_pmic_bxtwc.c    | 2 +-
 drivers/mfd/intel_soc_pmic_chtdc_ti.c | 2 +-
 drivers/mfd/intel_soc_pmic_chtwc.c    | 2 +-
 drivers/mfd/intel_soc_pmic_crc.c      | 6 +++---
 drivers/mfd/max77705.c                | 2 +-
 drivers/mfd/menf21bmc.c               | 2 +-
 drivers/mfd/mxs-lradc.c               | 6 +++---
 drivers/mfd/rohm-bd718x7.c            | 6 +++---
 drivers/mfd/rsmu_core.c               | 8 ++++----
 drivers/mfd/stmfx.c                   | 2 +-
 drivers/mfd/vexpress-sysreg.c         | 2 +-
 drivers/mfd/wm97xx-core.c             | 2 +-
 16 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/mfd/ac100.c b/drivers/mfd/ac100.c
index 8f47c392cbd1..51b4d468c51d 100644
--- a/drivers/mfd/ac100.c
+++ b/drivers/mfd/ac100.c
@@ -75,7 +75,7 @@ static const struct regmap_config ac100_regmap_config = {
 	.cache_type	= REGCACHE_MAPLE,
 };
 
-static struct mfd_cell ac100_cells[] = {
+static const struct mfd_cell ac100_cells[] = {
 	{
 		.name		= "ac100-codec",
 		.of_compatible	= "x-powers,ac100-codec",
diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
index 50df66de24e0..4d770e718716 100644
--- a/drivers/mfd/axp20x.c
+++ b/drivers/mfd/axp20x.c
@@ -1055,13 +1055,13 @@ static const struct mfd_cell axp152_cells[] = {
 	},
 };
 
-static struct mfd_cell axp313a_cells[] = {
+static const struct mfd_cell axp313a_cells[] = {
 	/* AXP323 is sometimes paired with AXP717 as sub-PMIC */
 	MFD_CELL_BASIC("axp20x-regulator", NULL, NULL, 0, 1),
 	MFD_CELL_RES("axp313a-pek", axp313a_pek_resources),
 };
 
-static struct mfd_cell axp717_cells[] = {
+static const struct mfd_cell axp717_cells[] = {
 	MFD_CELL_NAME("axp20x-regulator"),
 	MFD_CELL_RES("axp20x-pek", axp717_pek_resources),
 	MFD_CELL_OF("axp717-adc",
diff --git a/drivers/mfd/cgbc-core.c b/drivers/mfd/cgbc-core.c
index 2becaf797646..3460c50047ea 100644
--- a/drivers/mfd/cgbc-core.c
+++ b/drivers/mfd/cgbc-core.c
@@ -231,7 +231,7 @@ int cgbc_command(struct cgbc_device_data *cgbc, void *cmd, unsigned int cmd_size
 }
 EXPORT_SYMBOL_GPL(cgbc_command);
 
-static struct mfd_cell cgbc_devs[] = {
+static const struct mfd_cell cgbc_devs[] = {
 	{ .name = "cgbc-wdt"	},
 	{ .name = "cgbc-gpio"	},
 	{ .name = "cgbc-i2c", .id = 1 },
diff --git a/drivers/mfd/cs5535-mfd.c b/drivers/mfd/cs5535-mfd.c
index f3becbef19f5..d91d60dc5416 100644
--- a/drivers/mfd/cs5535-mfd.c
+++ b/drivers/mfd/cs5535-mfd.c
@@ -37,7 +37,7 @@ const struct software_node cs5535_gpio_swnode = {
 };
 EXPORT_SYMBOL_NS(cs5535_gpio_swnode, "CS5535");
 
-static struct mfd_cell cs5535_mfd_cells[] = {
+static const struct mfd_cell cs5535_mfd_cells[] = {
 	{
 		.name = "cs5535-smb",
 		.num_resources = 1,
diff --git a/drivers/mfd/intel_soc_pmic_bxtwc.c b/drivers/mfd/intel_soc_pmic_bxtwc.c
index 117517c171b5..5aa9e52401f0 100644
--- a/drivers/mfd/intel_soc_pmic_bxtwc.c
+++ b/drivers/mfd/intel_soc_pmic_bxtwc.c
@@ -245,7 +245,7 @@ static const struct resource tmu_resources[] = {
 	DEFINE_RES_IRQ_NAMED(BXTWC_TMU_IRQ, "TMU"),
 };
 
-static struct mfd_cell bxt_wc_dev[] = {
+static const struct mfd_cell bxt_wc_dev[] = {
 	{
 		.name = "bxt_wcove_thermal",
 		.num_resources = ARRAY_SIZE(thermal_resources),
diff --git a/drivers/mfd/intel_soc_pmic_chtdc_ti.c b/drivers/mfd/intel_soc_pmic_chtdc_ti.c
index 6daf33e07ea0..8412a25d37ff 100644
--- a/drivers/mfd/intel_soc_pmic_chtdc_ti.c
+++ b/drivers/mfd/intel_soc_pmic_chtdc_ti.c
@@ -53,7 +53,7 @@ static const struct resource battery_resources[] = {
 	DEFINE_RES_IRQ(CHTDC_TI_CCEOCAL),
 };
 
-static struct mfd_cell chtdc_ti_dev[] = {
+static const struct mfd_cell chtdc_ti_dev[] = {
 	{
 		.name = "chtdc_ti_pwrbtn",
 		.num_resources = ARRAY_SIZE(power_button_resources),
diff --git a/drivers/mfd/intel_soc_pmic_chtwc.c b/drivers/mfd/intel_soc_pmic_chtwc.c
index aa71a7d83fcd..f27985a58c87 100644
--- a/drivers/mfd/intel_soc_pmic_chtwc.c
+++ b/drivers/mfd/intel_soc_pmic_chtwc.c
@@ -50,7 +50,7 @@ static const struct resource cht_wc_ext_charger_resources[] = {
 	DEFINE_RES_IRQ(CHT_WC_EXT_CHGR_IRQ),
 };
 
-static struct mfd_cell cht_wc_dev[] = {
+static const struct mfd_cell cht_wc_dev[] = {
 	{
 		.name = "cht_wcove_pwrsrc",
 		.num_resources = ARRAY_SIZE(cht_wc_pwrsrc_resources),
diff --git a/drivers/mfd/intel_soc_pmic_crc.c b/drivers/mfd/intel_soc_pmic_crc.c
index 627a89334908..ce4c9ef59198 100644
--- a/drivers/mfd/intel_soc_pmic_crc.c
+++ b/drivers/mfd/intel_soc_pmic_crc.c
@@ -54,7 +54,7 @@ static const struct resource gpio_resources[] = {
 	DEFINE_RES_IRQ_NAMED(CRYSTAL_COVE_IRQ_GPIO, "GPIO"),
 };
 
-static struct mfd_cell crystal_cove_byt_dev[] = {
+static const struct mfd_cell crystal_cove_byt_dev[] = {
 	{
 		.name = "crystal_cove_pwrsrc",
 		.num_resources = ARRAY_SIZE(pwrsrc_resources),
@@ -93,7 +93,7 @@ static struct mfd_cell crystal_cove_byt_dev[] = {
 	},
 };
 
-static struct mfd_cell crystal_cove_cht_dev[] = {
+static const struct mfd_cell crystal_cove_cht_dev[] = {
 	{
 		.name = "crystal_cove_gpio",
 		.num_resources = ARRAY_SIZE(gpio_resources),
@@ -142,7 +142,7 @@ static struct pwm_lookup crc_pwm_lookup[] = {
 
 struct crystal_cove_config {
 	unsigned long irq_flags;
-	struct mfd_cell *cell_dev;
+	const struct mfd_cell *cell_dev;
 	int n_cell_devs;
 	const struct regmap_config *regmap_config;
 	const struct regmap_irq_chip *irq_chip;
diff --git a/drivers/mfd/max77705.c b/drivers/mfd/max77705.c
index 2e9b81f26414..771015c229c8 100644
--- a/drivers/mfd/max77705.c
+++ b/drivers/mfd/max77705.c
@@ -15,7 +15,7 @@
 #include <linux/regmap.h>
 #include <linux/of.h>
 
-static struct mfd_cell max77705_devs[] = {
+static const struct mfd_cell max77705_devs[] = {
 	MFD_CELL_OF("max77705-rgb", NULL, NULL, 0, 0, "maxim,max77705-rgb"),
 	MFD_CELL_OF("max77705-charger", NULL, NULL, 0, 0, "maxim,max77705-charger"),
 	MFD_CELL_OF("max77705-haptic", NULL, NULL, 0, 0, "maxim,max77705-haptic"),
diff --git a/drivers/mfd/menf21bmc.c b/drivers/mfd/menf21bmc.c
index 0f24de516d72..252d5c81db6b 100644
--- a/drivers/mfd/menf21bmc.c
+++ b/drivers/mfd/menf21bmc.c
@@ -17,7 +17,7 @@
 #define BMC_CMD_REV_MINOR	0x81
 #define BMC_CMD_REV_MAIN	0x82
 
-static struct mfd_cell menf21bmc_cell[] = {
+static const struct mfd_cell menf21bmc_cell[] = {
 	{ .name = "menf21bmc_wdt", },
 	{ .name = "menf21bmc_led", },
 	{ .name = "menf21bmc_hwmon", }
diff --git a/drivers/mfd/mxs-lradc.c b/drivers/mfd/mxs-lradc.c
index 64afc7631790..71ad5184f7e0 100644
--- a/drivers/mfd/mxs-lradc.c
+++ b/drivers/mfd/mxs-lradc.c
@@ -90,7 +90,7 @@ static struct resource mx28_touchscreen_resources[] = {
 	DEFINE_RES_IRQ_NAMED(MX28_LRADC_CH7_IRQ, "mxs-lradc-channel7"),
 };
 
-static struct mfd_cell mx23_cells[] = {
+static const struct mfd_cell mx23_cells[] = {
 	{
 		.name = "mxs-lradc-adc",
 		.resources = mx23_adc_resources,
@@ -103,7 +103,7 @@ static struct mfd_cell mx23_cells[] = {
 	},
 };
 
-static struct mfd_cell mx28_cells[] = {
+static const struct mfd_cell mx28_cells[] = {
 	{
 		.name = "mxs-lradc-adc",
 		.resources = mx28_adc_resources,
@@ -128,7 +128,7 @@ static int mxs_lradc_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *node = dev->of_node;
 	struct mxs_lradc *lradc;
-	struct mfd_cell *cells = NULL;
+	const struct mfd_cell *cells = NULL;
 	struct resource *res;
 	int ret = 0;
 	u32 ts_wires = 0;
diff --git a/drivers/mfd/rohm-bd718x7.c b/drivers/mfd/rohm-bd718x7.c
index 0b0f8e27e329..bd087004dde8 100644
--- a/drivers/mfd/rohm-bd718x7.c
+++ b/drivers/mfd/rohm-bd718x7.c
@@ -19,12 +19,12 @@
 
 #include "rohm-pwrbutton.h"
 
-static struct mfd_cell bd71837_mfd_cells[] = {
+static const struct mfd_cell bd71837_mfd_cells[] = {
 	{ .name = "bd71837-clk", },
 	{ .name = "bd71837-pmic", },
 };
 
-static struct mfd_cell bd71847_mfd_cells[] = {
+static const struct mfd_cell bd71847_mfd_cells[] = {
 	{ .name = "bd71847-clk", },
 	{ .name = "bd71847-pmic", },
 };
@@ -113,7 +113,7 @@ static int bd718xx_i2c_probe(struct i2c_client *i2c)
 	struct irq_domain *irq_domain;
 	int ret;
 	unsigned int chip_type;
-	struct mfd_cell *mfd;
+	const struct mfd_cell *mfd;
 	int cells;
 
 	if (!i2c->irq) {
diff --git a/drivers/mfd/rsmu_core.c b/drivers/mfd/rsmu_core.c
index fd04a6e5dfa3..02bfb84653ae 100644
--- a/drivers/mfd/rsmu_core.c
+++ b/drivers/mfd/rsmu_core.c
@@ -22,7 +22,7 @@ enum {
 	RSMU_N_DEVS = 2,
 };
 
-static struct mfd_cell rsmu_cm_devs[] = {
+static const struct mfd_cell rsmu_cm_devs[] = {
 	[RSMU_PHC] = {
 		.name = "8a3400x-phc",
 	},
@@ -31,7 +31,7 @@ static struct mfd_cell rsmu_cm_devs[] = {
 	},
 };
 
-static struct mfd_cell rsmu_sabre_devs[] = {
+static const struct mfd_cell rsmu_sabre_devs[] = {
 	[RSMU_PHC] = {
 		.name = "82p33x1x-phc",
 	},
@@ -40,7 +40,7 @@ static struct mfd_cell rsmu_sabre_devs[] = {
 	},
 };
 
-static struct mfd_cell rsmu_sl_devs[] = {
+static const struct mfd_cell rsmu_sl_devs[] = {
 	[RSMU_PHC] = {
 		.name = "8v19n85x-phc",
 	},
@@ -51,7 +51,7 @@ static struct mfd_cell rsmu_sl_devs[] = {
 
 int rsmu_core_init(struct rsmu_ddata *rsmu)
 {
-	struct mfd_cell *cells;
+	const struct mfd_cell *cells;
 	int ret;
 
 	switch (rsmu->type) {
diff --git a/drivers/mfd/stmfx.c b/drivers/mfd/stmfx.c
index f683fdb6ece6..b0db33c0a7f2 100644
--- a/drivers/mfd/stmfx.c
+++ b/drivers/mfd/stmfx.c
@@ -73,7 +73,7 @@ static const struct resource stmfx_ts_resources[] = {
 	DEFINE_RES_IRQ(STMFX_REG_IRQ_SRC_EN_TS_OVF),
 };
 
-static struct mfd_cell stmfx_cells[] = {
+static const struct mfd_cell stmfx_cells[] = {
 	{
 		.of_compatible = "st,stmfx-0300-pinctrl",
 		.name = "stmfx-pinctrl",
diff --git a/drivers/mfd/vexpress-sysreg.c b/drivers/mfd/vexpress-sysreg.c
index f49cee91f71c..c5f375cd22ae 100644
--- a/drivers/mfd/vexpress-sysreg.c
+++ b/drivers/mfd/vexpress-sysreg.c
@@ -69,7 +69,7 @@ static const struct software_node vexpress_sysreg_sys_flash_swnode = {
 	.properties = vexpress_sysreg_sys_flash_props,
 };
 
-static struct mfd_cell vexpress_sysreg_cells[] = {
+static const struct mfd_cell vexpress_sysreg_cells[] = {
 	{
 		.name = "basic-mmio-gpio",
 		.of_compatible = "arm,vexpress-sysreg,sys_led",
diff --git a/drivers/mfd/wm97xx-core.c b/drivers/mfd/wm97xx-core.c
index 1566a9b04b6a..c0ddcd5219b5 100644
--- a/drivers/mfd/wm97xx-core.c
+++ b/drivers/mfd/wm97xx-core.c
@@ -104,7 +104,7 @@ static const struct regmap_config wm9705_regmap_config = {
 	.writeable_reg = wm97xx_writeable_reg,
 };
 
-static struct mfd_cell wm9705_cells[] = {
+static const struct mfd_cell wm9705_cells[] = {
 	{ .name = "wm9705-codec", },
 	{ .name = "wm97xx-ts", },
 };
-- 
2.53.0

