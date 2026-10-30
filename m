Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793344347;
	b=ukyEDV3qfKSKBrUzns4OAj+iWopdGGW0QGwl5DpgHoRpoRGGEDyPDSSkio1/wiOlwrbE
	 S7aD0yFCJTZHwwcr+eovsqpwPWwU/Fdp6WwJ9wGVnbKmRjPm4578fHAwP+RvmemN+uqY1
	 poBlb7dg5CDKCYbzhkjXmbRal/UfyLewkM86wSRJP9RvU0r/Zb2QFuhe9dPJy9Wfs3/yq
	 7qsYvw6Yb/flat9XXSahlfC6fDuhGmsmxPi+MeGkUEacGHe+c11kMDoY2WqyC3JMBfng2
	 dsr/TGlTzizh7gc1CDwlCwsJaTTcA0gdXFHjAqE2HS4fPmqpbr1hxk98N2cYzRTLEfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793344347;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qFT+rqRNAHe9ZehLPWsieIK4G697OzZYWHTxlznKNbw=;
	b=T7SzZOZz9RY6+luWtUzXRYMVDUn+xq3glqMpPMJ7gKR/rER/kfQIAlHYJ71fsnTDZNzJ
	 HM3+lbmnyJV3l6OuEOwPrKF7jaekfBF/7FFUrU30Drf/fjOShMfefNlfsCo/ks6Q6LHTf
	 Ks660LSIkwhNl0dxrVPhotdCaX8gwic/cRNxxcTvZrrdlVihJzTIEMgm3dJNdzlq3qn+i
	 SMg6r0zzx1CB3tMJxM7pV5iDXFQ6e2zEI4rnhGkgzk7NMOTnGhhpUTof9j49Ac4D2ia7X
	 ytV7ut8k/uIb/clY70rKBaHpCKS+AA9qxdlgYzT9Ggb6RdAPNPhFVS4wnlEgHyd+KQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XHrkCHjW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="ioLNs/mN";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E156606A326
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 07:12:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E156606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XHrkCHjW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ioLNs/mN
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5FBME2913302
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 07:12:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qFT+rqRNAHe
	9ZehLPWsieIK4G697OzZYWHTxlznKNbw=; b=XHrkCHjWjZFVZFOMZtyQhNQgXzM
	rQ6vLczAloEGGCf0chqGtOnYmlU41RxeibazQMWodij7k0PT2YCqf85qqFkEGaCd
	L9QJyr9u3ag/x/nJQ1Kz2pFPIrg04EaSrBv+MFY8Bw4bw0okp0Dk+ApSxAhYQu07
	qoitc+yfmT4+1OoubgAgBd1Hjl/3UwaiFXNVRZdku7VzUBj9MqyZynS16ZFLXRyW
	y31CslzNQ0w1HeRjWefI3C/pB0z4/C6Eark0CevfSSojyreQ5QZHt79QChtWG7L8
	JIQb0C8oTYNyaSixwyTpzROOLQ+oJ/q/ivvwkr0nsy9uTokTkmDhoUg+zRQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qsprb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 07:12:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f2373e9b4so35416185a.1
        for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 00:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793344345; x=1793949145; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qFT+rqRNAHe9ZehLPWsieIK4G697OzZYWHTxlznKNbw=;
        b=ioLNs/mNhqQ9l68WI0UxZ8EbWDbBJUN3kMVZ5E2/JEdizrexcT386VgakOoypYPWUv
         T5540AnBQ3gee7Kgi31yVe5uZOboB/LuTQs/6xdHN9uYSTVm85I8roPXHAhLn+SDrLW0
         WOgzzw54QWYtkeoqc60uM6aXLWn8sINc3TJRIxtm5OAO0fOQZIPB2KmsEOocDuo5XPHu
         98gELSHsKigftI9wOOcz2k3XCzsDZ976T0Nrf2MYScIHGWcaje18krnYzh/IsaHAwrPH
         Mcb278/4h9wwxfkwPloM8DAqmy0i7pNn4tkx1WSJhA9eWBxnM1RQchahwD+mx55eVSGh
         +bCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793344345; x=1793949145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qFT+rqRNAHe9ZehLPWsieIK4G697OzZYWHTxlznKNbw=;
        b=2ZaM1v7lojBhp42uP8n728Tpr74/FPlrAESTkrIxCNmTI+g0fzuRofOTxGSqzk26ag
         M7mT5toV9PtWO5AdZLBNfoqstsPI2WvfHC2duKDJhgrIy/7ljOJSSNaHGPTrdygA64Yq
         sMOYwZ0noENB+dfgS8KAk/0NcF25g+KR1ZeUZQpWXWJoE2KAxNphMAGr4C/RFGJHX8ZO
         ooMwaoXfC3p2INC+SQIN9amVnCEKMfLDdOomR1JVfvIfuAIqKxk/ma6HWKfaaxAKuM1F
         w8UnZ2onebdqqa/tYCOh6J7uHoRHWPIzLC3nk+7xvUMDIqgLfmI7eYrKAcayYp6xECyg
         xGcg==
X-Forwarded-Encrypted: i=1; AKwUvBxEZwLlhuJIEuEoYtkU5RWNoTgs14jbjbjvtn8lFreFU/IlpjMJ8hfh/z44JnulLF3nHzo=@lists.linux.dev
X-Gm-Message-State: AFq9FYIiiEy5i3B34kpa4vnWyh/4k2I3TXnFtWHhMJ9WSzwuLraN3Yd9
	4+2R2GazaEjival8D8MJdriUmyotfVxHM2+1/5z88+d9yDtFhRD5xFXkRGKTKno4e0/E8x0KZzt
	BL0mXubu/B81y3wzkAZ/F0EY9tTfWbYG7PD6npJSJWumumOde+8ewTMU=
X-Gm-Gg: AYBFou3eYczvfPNi+YU+IaNkjkWBoKsDwPF5aVfJsYekjOqyO6BtGqlfsmpN7HXZMSw
	8sXJXeyYRxY/UwPupm7TNAtasikdQ6oGkR0W3LCexngawO/jBRrXUx6lgP+26IytL48zObtMXDv
	+jAMmkIoYEIRZZ+Zgydo950rBk0/lnoaDa4IrjX7l0GriDIjX8aIe2dmG57s44QV6WDz0kfO2Ot
	Y/aBZZv9OAHJlfZ8n8DRz4Gvr0QyLlIIJPSomrgthvCcuPSiXLqAOXb+MK9tEwalGNtJZzWPYt+
	7QHpnzey0YciMdKY3duqLPnUrKs4qpzi3zPjgq8v7OtIgl2mgfcThuNvfbAf7evsiLpNCwwzB5m
	4XkTQN8LsU5x2vVf+OA+UwluJO3nTxk9xv5StKNXHx454hyocLT/4OguOjlohXA==
X-Received: by 2002:a05:620a:7086:b0:93c:c2f4:9182 with SMTP id af79cd13be357-944216b70dbmr248479485a.20.1793344345265;
        Fri, 30 Oct 2026 00:12:25 -0700 (PDT)
X-Received: by 2002:a05:620a:7086:b0:93c:c2f4:9182 with SMTP id af79cd13be357-944216b70dbmr248476785a.20.1793344344767;
        Fri, 30 Oct 2026 00:12:24 -0700 (PDT)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe7706516sm28581165e9.0.2026.10.30.00.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 00:12:23 -0700 (PDT)
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
Subject: [PATCH 2/2] mfd: cgbc: Allow compile testing
Date: Fri, 30 Oct 2026 08:11:39 +0100
Message-ID: <20261030071137.100954-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261030071137.100954-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261030071137.100954-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=794; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=iIBMZPVdQPZ+Y3Em+kGpb62RltCMiF/RzmkyCWBCVdU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq5EMtMkDa5LbSiL1INh6FUP1HLxKbLkJugs+eD
 5RzHGmpH0SJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCauRDLQAKCRDBN2bmhouD
 1wwxD/40aD2wfkNRVpF3wnlQvhEjP3/OceMSbSL4UVJuhUCAu0/tmiiDgJZ95wp5nCCVZCE2qXF
 W0d7hrTtjD9nGsHv6zA/kCbHR2j1vZxUgEtHyXPobDcHzePDrgiPRhJP4KafCUPXV9HOXCNHiM6
 r0B4ctgotq6T3MTBP4WUdPQH39fLP3pjt+n/y3xnp3VqpKUHxaKG1eVgR8tqzAjEdb8PK0wCmi1
 2YNFx6waJnQ/PQaVSl427cFso5F3or0NtkMFKiZczsoBiY80po/YdGW0c9NiQeIBwUfds+0N310
 qiugQWw3oJIS8B2OxWFHbRJHvz+g6TASwdIiJ6sfZG6BILjbSP1lEQ6JojQYOah0XpPPCcmgJzg
 N4vveaxJOgCc6eFRVvI+YkmAXOqJtDP9XIKIxwmcI5dgE5e4kj5h6af3Q2EWwhJuXPZRhEZhTbD
 9rTxN8F4W3XFQGNUn2Bnsu/qNmZucJyGhAv+yqj6ZDFwf64fn28Z4XC/ZbT84ZDfTHVtGdAMOUq
 Y/NUCND4hN1OZren913zCAYCU1l5t8ePRabwrrBKNBhGyAnooWu555WdavF3YbMPFzEMpj573hG
 I7nox20k5zqB8VBK6ABcXG+7Lq9JYbKbbscIpsmffA9U/OcMII2x26mzMKDHiDOXAQdEWWGy85U e3c/n5VTDl2XApg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: qkzjb81j0MXoriQAOcZFGJEyKuv8AMBk
X-Proofpoint-ORIG-GUID: qkzjb81j0MXoriQAOcZFGJEyKuv8AMBk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyOCBTYWx0ZWRfXzTWKFHLi83h4
 ZZsAj8AW5223LQA1CmiXWgDFgRX9TKjybG3i7YAqGr15M86LR6K8HFG+0iYgb2ltbFbKojxlzPs
 1ijQi5Eo1mCyOyubE0inOWVuy5Kt6GLq41m3wW2Ck0U0wXMKMhtm1TlOp99CH184eWhYuGefBw0
 vIVrGTRle85kXCrjA5isr1DRDrxCYbEneCxyzRCo16dxdw7rYTpUNCSQ2f+GqqPUTR/KMz2ig9O
 8GEZt8JNIqvcYTt4N+xDusbBSdMTBX1rIripdKky//yKePZpv9VBK/3UOY4ITz2UnkxWpsKB89Y
 ukIgW2bOwwuw/dYRLEuMwSyuuKCQISToa6elgW+x1jaNo32RnZ0v8cf8ns9m1yZUfOvQaxzcAgw
 VhfQt6eTJ0mtQ9gUpRPEZu8Q/qF7XlZUEIfbgTEWHXmUU779VmyQeCpD5ZujCNO8zLHUgsqUBWp
 ONMHGEAjeM4iA3dvPlg==
X-Authority-Analysis: v=2.4 cv=dPgzC+Zb c=1 sm=1 tr=0 ts=6ae44359 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=rKWnc9nNlL7eC5Y4R5YA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyOCBTYWx0ZWRfX6rv44Cnh9Cpn
 xGsNnrY2+D4z3GjkN8UYzBKIpO/Gkos/7aZSCkoEW82gDp6ZgmyqCii3i9HelgnoM/FOyoF0jvn
 1XNbl5jvtjoKv7WRc1dYCzRS2dTwBq0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300028

cgbc-core.c driver does not use any X86-specific headers, so looks like
it can be build tested everywhere for increased build coverage.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

