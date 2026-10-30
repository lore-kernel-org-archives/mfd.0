Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793368977;
	b=JVEj/2ZM6BNqMkeWIZKkrsKQw3usYbrdBFlx11ZYF2DUJr2/XBw1urWogyeJqTsZDWIi
	 PHbZ447VJXqEsuexCy9tHBVN4KkhQqN3v4EPiO+FdNKbA56WiJT8ufW8V3X7aYuEEEvSq
	 O+0QekD+cIIII1fykx21pOhhs35G27zpvbJQX9qTzFyyqfWamtGZ9V5lRuvYGoITlj3De
	 uFCat+o1SqVKjjQyYCb1RD7SwEidmeJaWNl652WpN95cpG0cuo6hc9oNsoKmiavu3H+oQ
	 2bmOWtdNGeG0ryuHhYoZRKhpvBQ23Ef2ZM2TBhHLy5RsyYJvOt1KbLNADKC7MztfE1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793368977;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=IFjgsi/GRlis4bzhLMHvpJ/jURFZy6HO4rYGSHjoXuo=;
	b=mV34JiFOt1WrlwkvhgIKEl0lg/gDSXbWEiZABmV4lC8d54U27CQildoxOvMY41aZPhI6
	 6HeRpQPqsec6TXUKMyrCjEB3hD71LVdiCQrNt3eQr1Xn5Jcpc7Q0La4jA1Oo8wKOdwF72
	 sBfqghM07MFh6rHYtXNDmCTG1vvkgey5UUOWKBajQoMpFFU9izeqbN+jN2oOVeWIJmXc3
	 Efydp5RnrECJmxNOvtcZHHi1XzH96+PCfHwO/xzPevMbPpoNPy1SR7MLpefMKlMBsBstH
	 0Gjnm2hhen8i9TR/DFCl2zJnP8yPLBiDdr2yHhDN2Vt4rh5oOGPIB/IrBjU/IkotcQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WI4N3ImJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vu3yj8PB;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADA2606A323
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 14:02:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4ADA2606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WI4N3ImJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vu3yj8PB
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UDnPQV2883758
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 14:02:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=IFjgsi/GRlis4bzhLMHvpJ/jURFZy6HO4rY
	GSHjoXuo=; b=WI4N3ImJpfIaQ2wEpfmHv9zPO6aOB8ROutVdbRWf6l1oNMX0KMr
	ayHgnh/HbpgRTktmGVXPoVheO2IJfoqyN+BfGxsAAFu0lknSPym2atWBQ8v2ZoAu
	01Jk2LpEblNKn6Kvqyo9sm1g3eDJ1kg+AFxUGeb0nsLXobVMUwaFkiWJHlsKU7XK
	6+sAB7wGfvNBPAya6HAS8VV6ub3UifixLyX9uKaVGgnynMD+k/auco7izI5l9SQV
	KqTfvLA8tKcYTbg/l/cBYS11ntCFULvDCBss0QpcV81Hdl5/CfbFV91yXTUT3MfO
	gvKTXdGK2E5nwx0LES0WYwH9Bm4lRFp9gWw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qkch1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 14:02:55 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7cc450e6dc2so521373137.2
        for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 07:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793368974; x=1793973774; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IFjgsi/GRlis4bzhLMHvpJ/jURFZy6HO4rYGSHjoXuo=;
        b=Vu3yj8PB0IiryUIWMTfcXXhWan4/Moz1NvlyLZR9pF6dFeKK9JcuTG4nQ6qwBsrvZ6
         0LclQZa8ZH8ZJc9wLF8HqLD857dRQrDeVvRddKPoeFxqSOB657+1ZfurZq3kLDV3QXZ9
         kAOMTSwsPJzkfcRvM2mtANLZijvKAY0nobLepdPVjtKBalIwU3gFjGK6N/zoYBtI8IFP
         Guypr5wqivvGFVMlLoD5ucl4/FPaEqNSUKPpaWhIdcSfj8XZFk3pXSCMOlWlP0J0iNt4
         lHeD2GK0Ay+z7BJ9ewWNJ0jaZVagkRkjhSv2Mv9fKEgXVLSNuvTWNaJIC13MdNKZ2xiZ
         l1qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793368974; x=1793973774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IFjgsi/GRlis4bzhLMHvpJ/jURFZy6HO4rYGSHjoXuo=;
        b=DK7grocN7WpS7/eqIsw1KpD42uVB7nylF0BJq61ZL1bnCQDLzbZklOtS9Y4k7oKaUE
         2dPcepCODxNNRYsOGE9psHj0/ZJq0xjFI65samE9vDgTFUV11Vkzr47jtPYjUWItZss4
         /U6oETSkl0CxBgHl0t8VEGx/FY6Z2W9BFrmgOOG7NyvGSG28nFyQgca2M51hjufOOROo
         M92nkfGelH1IGG4bnXU/YUTlJgEQpiOxs+iXO3cXjPdGsEvR2WRKMs4uNOo9a35ZlWxg
         P7GfIjQk49eNQiiZ9a/+WgNpQLy9jp11hyKl6WypMnzUnOCTZcaMxWFa+mF1TRFVMdiB
         zTJQ==
X-Forwarded-Encrypted: i=1; AKwUvByEkW2fn65MSitS+OGtysa9iVQiUNTXJ+37SnncTjOJ75Q8tDhn0nbX5NAEEyjLQN9rEQ0=@lists.linux.dev
X-Gm-Message-State: AFq9FYL0z4DPhdSmH2tdV2W9TtY2CPGA021/l+3g3n9zE3/eDAsG/0Wb
	AZb5jHkoIypVZuHTu3TTUoMH+s+HBXs4NQPuzJly84xl5+ndIvFW1WxVdNUOGiAP8hOWu4WPVfW
	IY9+9n8dAAmhe9+GW5xnFzhJltpGXgrJ3/RMbQbP/dvO6vOothbehNt4=
X-Gm-Gg: AYBFou0aqHJk7WlPExs/hik8EXIXkGRm23ZddKICubfXGc+R8ODPzEXKEywZ5UNDC9G
	gv6EG7zAEPQx4eh8i6gQZW8I5QCnXJtkmyr91kmaRW3c1k78Egl3bk4GnhXyQUI7yp3hcSQ04Fc
	0zyE9VfBT2FtBU/zfwBz1hwStxojXtQV6nGnWFFDbjMjPnPBBDzU807LRkT1spFs+sqG8OCKF2d
	4ulqYewDd2gVQbRxFDvni0KbNC+RaWzCaN7bBPyMBgFzgVEHbrywcfGq12kIIsd1irsO9rKEWOD
	ryzdWEd8eN6h7LE6cAV+47WgbCcn/cyARdqOZdqNGdZ4mVCHfiGRB8u7fGHBSw+vgo7Xt5NL+Mv
	8x53hyoCbv1tH9mspJT/avpzZRPHrUUH8Xu9O2kkn4yQEcnUpa9kA1mJ02acL9w==
X-Received: by 2002:a05:6102:5809:b0:7c3:872c:8be6 with SMTP id ada2fe7eead31-7d0727248a5mr1300607137.25.1793368973782;
        Fri, 30 Oct 2026 07:02:53 -0700 (PDT)
X-Received: by 2002:a05:6102:5809:b0:7c3:872c:8be6 with SMTP id ada2fe7eead31-7d0727248a5mr1300332137.25.1793368971551;
        Fri, 30 Oct 2026 07:02:51 -0700 (PDT)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896ecsm146146995e9.9.2026.10.30.07.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:02:50 -0700 (PDT)
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
        linux-stm32@st-md-mailman.stormreply.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH v2 1/2] mfd: Constify mfd_cell arrays
Date: Fri, 30 Oct 2026 15:02:41 +0100
Message-ID: <20261030140240.211786-3-krzysztof.kozlowski@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=11016; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=EWIm3544qpQQKeJj+/fAFQXHPlPP2luT+MUHI1/vUow=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq5KOAOln00t9A7RhXWH7gHS5bSpR8Rw5ik8jtP
 Gf/8s+8riGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCauSjgAAKCRDBN2bmhouD
 14r2D/9/Dkt85cLMU8CIES/4xAfvTDALI/eE49ZK5xnM2GUrwAltfCjqZCyGDT171axS0naD52e
 dJ8ZtrHCKSVa7b/YqWD8Aqmu26E9cpqFnByM5HI38WYkgn1TxSPDE86ylI6onH23pRMCUNaN27S
 Zzo3yFdzGDNCfkU83lmMxwWS5xKqAnoXVm+Otw1YUYwVt8U6CzKaNfvlcBy/9OWCA2RXqs+FnG2
 BgijlyOoJkJZYjLDPneGF9tCvdZ0Xe33/e9hEJRO1rR7JIHI5u8zJq3GY06sPjdi+Dny+OctXHp
 HuoVkcFjW3csK5fyyfmoKZUpa4e6cFaehv+RE3BGfaQzPR2KYRd0aBaPXnvdIxIZI91aPdYwZFp
 jkUDxHsVfNVdtpifFPIYHa3wO68rRzfXlRVUqr13Oo39c8VdrciwmuWM3vM1/M5G3YgWtf2zz+P
 koiXhLRKvh+m9yo+LpsiDhcM3j9XFm2YOO/aGS5E98VimUPWO6fxrS8e3pECxa/UEQOeGuA8RYR
 aZPmt6WzJ3aN8PSBe2ljgzV+LRO0JV0XrROr8q6OQSLUB8ZdvSvQqkHaDCkG2f5KyjpNSigfkv4
 z9c/1L6d/ulrKwVu90uTlRg+uxev4U8oFaYsqnNh5V9Pn6aJ3b2srY56JQEJs6daRJaZfJpLkQf tggO7Py57jexoXA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1NCBTYWx0ZWRfX+MvBZS+XmIIQ
 gASaUfALp7AJU2w901vBdQnhU3epIUH8XcOo5tV+R11srhQ165HC8k4G5QSd0mFyENd8i/DH6Ty
 eaDKjCoPJ4INLRwkBuc9awytlkX9UeoxVqDH/f7/bP1OKFmzBVjlE2q/XzENlFOtDHgT95kAwgt
 IlBPmhAD+6EgZCqjEVqjYA6Khc3xzsEWaJCqxroCy7pfw8ueFx0FfA+IaTFrQHLHVLftepccPLa
 MoDlYc1kGu+/tQQdhE1LO8g5NQH71nn3WafE0Bb4grPtqdiZjiuc6BTL38wTYxbX/XVKpnjnPYD
 aP7RPLyKLWe4AmklSjjTXslGaQFyivU7tLd6WiGDE1da47NEHd25yn6v9rQzhkboA3oLPrRfrMy
 rG2BhDXa2I4DXR3a7MCY6EI8XFg4eb/fy/3Q4MaVVTOti2UCgZij04tiRiUYr0pJiQLRC4z5qIr
 tWomzb1Ec3Ay+qjrtpw==
X-Proofpoint-GUID: 3A0kNmB407HmYGKatcydhW10LNE56Smn
X-Proofpoint-ORIG-GUID: 3A0kNmB407HmYGKatcydhW10LNE56Smn
X-Authority-Analysis: v=2.4 cv=IumL47/g c=1 sm=1 tr=0 ts=6ae4a38f cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=w1d2syhTAAAA:8 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=_gzb5aec3OYO3pdMjf0A:9
 a=gYDTvv6II1OnSo0itH1n:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1NCBTYWx0ZWRfXxTYvmcmycKYt
 lgC6VvQfr5tw9exHsu0910d1+Sncjn/Yl0p0XUZGW5F2uwkH7PCxw14zUix3vfHDOjKeNtZjpY5
 Hhe/PRIJBkt/Gz1jE74rplxHhn6E2rc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0 bulkscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300054

mfd_add_devices() takes pointer to const, so 'struct mfd_cell' arrays
can be constified whenever driver does not modify it in the probe.

Acked-by: Chen-Yu Tsai <wens@kernel.org> # ac100 & axp20x
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Acked-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com> # cgbc-core
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Add tags
2. Drop wm97xx-core.c, it was not intended to be committed
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
 15 files changed, 25 insertions(+), 25 deletions(-)

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
-- 
2.53.0

