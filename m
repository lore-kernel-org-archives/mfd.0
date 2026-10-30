Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793368977;
	b=vMCWGx5c/3kGkBU3KqZU4o4d+moe0ClI4gFjybnY9As0JtyPnUnXEstCJwe7Dlf24Kpv
	 FEU9FdJcxS4p8BM3RsJYOfDsM/dSSD5pxeSUVVQsi8kXVPhyMcPmQnipB63cwqgDgMbz4
	 +Ad2TSxuZz/LtIUPbiA7UjTuT5V61sPZd6JsSDKKa4n6ZRnl25kkStMGpxgFITYEF3azK
	 UM3rX2fMRoR4swUn2rB3ci1quoxaSo7RUwoQ0CJqY30OQ1+d9lcNr/GTdQswVY8YqEXg8
	 ygYa2RitELqQ/OpdUNsUjdrd8f0w3bSa30IrGc1TkXhqbrPzampqhqcMhS3SAGjXiIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793368977;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=3tMVC+s+E/Yqx5hATUyQFQL68T+WWVkH8GEQ9ryGSx8=;
	b=SzItYUDgFGfQY8fGUChsvWhlw4nmUMSk/XpXLgIUtqYueNzJXCrOcppBOuVe/YZ/pGCq
	 QWFi94YuxhB0wrX15Gwez9gbGybWo4pg7r0W4GcDlqmBDJKMnbMv8/uhNO35IRfxdSaA/
	 ogIVT8w2yfKkU/EwE9B9BVcnWaTnJdcCyo+6nqGztUV3TFVXuzDbLy4+HFBGS1qD4WXZP
	 11UraAJBIbddFM9MqSFMZzI+lT1Wa+Mzy1HbFWPN2OIZwZWLSLJyeodt2y5DsmiOfKO36
	 PvUemcC0gCdsz7FdVTe8VqltPY2ymcprO+gyjvgneaEoaTQ0FtsgzVjzRKOJVg6/Z2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M1awF8dR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PrRweY7O;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61F3606A31F
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 14:02:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D61F3606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M1awF8dR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PrRweY7O
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UDnDZ94019634
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 14:02:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3tMVC+s+E/Y
	qx5hATUyQFQL68T+WWVkH8GEQ9ryGSx8=; b=M1awF8dRp/omx4H8TE5KB6zRkHQ
	fOkEyIkmJHzcfwHvjB5tedHg3Ri8eOFjH7JdYQnERSNTsCs0YvIQXrM1SsuuGzTS
	5jmXeiPHCjI2NM8sXEPFMW32BDqkmhjIdMeSGMMbP8mUqEaaYyiYkDjtq22+1JhG
	Tzvncr1k1Xz+JFcnePvCAUVC3hta4SwR1NRhq3QTOetwCom5QAuuLkZk/2upCsJ9
	yeJMa8IEailf6aTvL3jDBQ+V4ptVnFByFnZj+w23jdRwpA8AVF05MeQAE2pk6eEP
	WT93DP4kXVeF0uY2f6mG2uJJZBu8yiU+4+X8c7ntLMUS6wZF3hijHnRxb1g==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qkcaa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 14:02:55 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-98c73709b84so541339241.0
        for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 07:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793368975; x=1793973775; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3tMVC+s+E/Yqx5hATUyQFQL68T+WWVkH8GEQ9ryGSx8=;
        b=PrRweY7OrK8wgnbBBduWYSGcdaXqCtbatSFczJOp5zoJQh37XWpt0URsW0bT5Y24uC
         0leDSqEplc6ng/cRTby4kPK7v4Ow18B3+QGiB8KCSnEqejcUi8i1EaADkXRn+8Thn2Jh
         +4ABmSsko8YFtz2VvcowDT0UiqOGVvKERhBk7L+/b/97JvtaEfwbeuQFRYPf1AMB8Ko1
         jeiTdB0QFIwg7yYCt5822IX0+9fmBACZCZpn/dPzBEbAggam+q2dKGPXbyu49KWfZOmO
         /aq2d2CKcmIKcGTxuT4He0xm6Yj158mztIMX+96kmjdmqQfko834ZX6wFkoXmmnX0+qw
         7Sjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793368975; x=1793973775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3tMVC+s+E/Yqx5hATUyQFQL68T+WWVkH8GEQ9ryGSx8=;
        b=sjCdZKegiY5MHxIvGuTqNHE3JP5Zs4zD1zzM0Xfca9ZDCkNodulOM/6mpSFRO9az1g
         6PgRZnF4ZDlca2Mw9zgVwmS+HYC+WkXwn5VCxfnqYGUgAZ8R1nR3imzOa7re2EANKz0F
         FNomlD6tlmzoB2vBFvjwSEziQqtZI/soBrCFlwuafAQ9bmVHkt/vnzThGRccJQK461/X
         062iy0nCTf5kMMHMRVnFfuxxaWG+lbqa2Az0u3M0V8WaIh6gVPLrKKTdYbn+WM/Sey5b
         ejagGiuK0AU917Txi+8liEmDja5TCK5jPHjg7Ku1FbgUWC7S/nRH5Wz4QYHyk4MiFyua
         8pQw==
X-Forwarded-Encrypted: i=1; AKwUvBx5dSAViFQ8Nnbzgu7gWdPrHfBXHT7XiaaAv8y/e5FoB9vtXCeSf/cPttLTszk86CoQtW8=@lists.linux.dev
X-Gm-Message-State: AFq9FYJ0/WgyauiKEeORSv9XMyZZKCcHj9ZkKSuncrM8zqbCT97n/Hky
	xbp9SGp9dEPxdwF7ZgEzYqICMxTxvZ5yVcO5/yeyabpx3JAT/Cy0bpXxGiDMZX3Pn+guMvZbuHq
	ajlav2S8Dbly9VsvSJ5CupNi1xxWMP9dKrbHGZpAKgAzxiK+T7A+1ZF8=
X-Gm-Gg: AYBFou2PTtghWjDEYbMqy2udLa/8TSX3VdCR81/HkZUTCUM1lUz9TF1hUBbfm7JdHVk
	1pBZg1orbwcm++bQYlT+Oc5PXJ6amlzVxGmJBu9W8Okn/OdH2lf/le9DVUuRcrFgnKQyPnAnqwL
	Y2Jltwu+0hxO+6JPgj+SXuMTFprfS2rd2V4a8Fe+fc8+ftuk5Ll8+/GushiYPQvu4S3jLsaAoRc
	qTAGHm3uzFYfECo1yChS7NMIMp4IlSuu/h024LT39BTHzxDcA1zNeSAdA139jzb56ykkG+ytBgj
	/HkrbiJqkpACgazs2hQTsqBIuy0YkGmxiegAFgEODYLBe3FfE1+rIiBCQWDTvwM4iEIl5TIA+et
	X/G3IXqNvL7I58G1QeOE7bM0zciD9GqCrXxPIdYJJto3tm3RnqdANooJ8sRCMnw==
X-Received: by 2002:a05:6102:6058:b0:7ce:9ccf:8713 with SMTP id ada2fe7eead31-7d07262d603mr1093374137.10.1793368975259;
        Fri, 30 Oct 2026 07:02:55 -0700 (PDT)
X-Received: by 2002:a05:6102:6058:b0:7ce:9ccf:8713 with SMTP id ada2fe7eead31-7d07262d603mr1093264137.10.1793368974313;
        Fri, 30 Oct 2026 07:02:54 -0700 (PDT)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896ecsm146146995e9.9.2026.10.30.07.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:02:53 -0700 (PDT)
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
        Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v2 2/2] mfd: cgbc: Allow compile testing
Date: Fri, 30 Oct 2026 15:02:42 +0100
Message-ID: <20261030140240.211786-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261030140240.211786-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261030140240.211786-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=966; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=AfeMZsx3zqqMT4vEfgLT41qQLlFUhH5PXM+/16YdHOg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq5KOE8OZLBL1KSPOzy2PTf7D1fbtJWm/X8QGMh
 1uEadY8ZKSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCauSjhAAKCRDBN2bmhouD
 1ztBD/9sstFWk1A9Ng49ETxFwagmCGyZ4AVotBxT8ZddXnTTzWQvY8eKKKs/2fuAtwZ3HefHs4E
 TdQ9UiBFcatGhgGt+Ugbk4Jx+QpVg6P8hAILjJSLLvxAlBwcbpfToTVmQdPazXI+iBFf4WFBxML
 BGHhmSmn0FSedMNLBIXFvxgjd7zM3BzjtBwbsXEGrqp6j3iB5rrWT5LryYpJiRpIAbTPQE5fmNM
 3eOq/SiWNO6aZpZGvjrT7QnsBsvGrekphmm4hH2rUnFo/1v27uOu+Ppt03FQ052U9pjGufwl0k4
 lPOLmdWOdeHA4BP8YfmL8RM3bpHo0QQ26VRgr9XnGr5KaDn5xLX3BGcJMWmRTkUK/yuJtzAZPlN
 bw5bQvr0G7P2vDJEK6QJJEVoqL4ia8lD7FWP1/cUbgZ8Raj7gFxI5NvuR+PBQseKfeKE8kE7+RT
 CrPgvEt+jhACYfWKSnVwl14U05BKOAg0fGZnI1vzsfVECg/jz/QtnZ8T/CnbELozZPIE5kRBOD8
 72mfqYZ3eUaRAHbfYLmPzCMqebZTFjo8KG1cXWvArk4BXRGYoC/W8PNhmmexHfIB4sOqdX9Wv7w
 DCR0F6hiiDIM0YYkNQTCS31KmHGg7sNcD0PZEm8XLcZi6xq3sXtPGDhR5TDf2vkGb+aWvoIpDVx Rxb/pLyVr/TPJyg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1NCBTYWx0ZWRfX98jUGKO2u/eg
 Kgc+JHz/QpSqiCLeHicqQMl/zTpBHGo+7zbOTK2wgkJsh1UYsJvXU6g66/iyv+/wFSr9bak61Fe
 xRu1F2Ikh/y3adRJZNfvExFyTQ/vyO5OueFSv/Sqm9gihVgrPvz3tbJ80rUIXAnjZgaPun6yJxu
 pVnN4zM2b/oV+2EPCD3Hl3pQMHfypP0pQflp9LcVk+TRmxhvcoXqm0xIL2pMZ3LpLLhLSPAVZZs
 vaLv+D5IR5tsoCfh3bRb9xgXH8ajkXcHmcXK9rlF91jlarqELDvDK1B8tw36ANbxzadfCv/WUlv
 eqFKv4P6qXF1FhCnyd0KrBfxQrFiGcQRnoZuIaxtbpXgJP+B3HzpEXAqpHsivMiar5l97XCYArW
 No8JDJF9Ryd1l3xnhtH628xY34mqIS3ve7V3u/YMWfMshLsXzw3+rdqecE7XPlHvPk3cL18Dzn4
 WgDBlQ38EgvWNcl27UQ==
X-Proofpoint-ORIG-GUID: -y8KtB8QTVYZ7y9jOe-UhKiYaHA1NAq6
X-Authority-Analysis: v=2.4 cv=IeoSymqa c=1 sm=1 tr=0 ts=6ae4a38f cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=QyXUC8HyAAAA:8
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=rKWnc9nNlL7eC5Y4R5YA:9
 a=1WsBpfsz9X-RYQiigVTh:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1NCBTYWx0ZWRfX5TzmENKHstcp
 Hhjy2rgjKttUxAF/NhfQxgcBhEum6Sgfpy0KSwjDe/ggfchWZPSvR157Y6hxYOof+i1oxmHcvGl
 xaw9JcUFfpqQ9YHkHz59UOxORZwP54w=
X-Proofpoint-GUID: -y8KtB8QTVYZ7y9jOe-UhKiYaHA1NAq6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300054

cgbc-core.c driver does not use any X86-specific headers, so looks like
it can be build tested everywhere for increased build coverage.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Add tags
---
 drivers/mfd/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 87ed55c155f0..de957f574056 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -255,7 +255,7 @@ config MFD_AXP20X_RSB
 config MFD_CGBC
 	tristate "Congatec Board Controller"
 	select MFD_CORE
-	depends on X86
+	depends on X86 || COMPILE_TEST
 	help
 	  This is the core driver of the Board Controller found on some Congatec
 	  SMARC modules. The Board Controller provides functions like watchdog,
-- 
2.53.0

