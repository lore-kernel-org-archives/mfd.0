Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793877092;
	b=T6XYp0Ncl0DqcaW39b/PnUjCKoFS34FQeZa18SzdFtwrN2lVI7bRu5vn84yX0DXiyMan
	 WX7uUFagAdpKMPI+FUhaVn0or56mAXNHvydZGjlaMs73+zlFxOJUk/FvJ4mfBq9I8q79T
	 WwoJqkczwx2RRN/9EVwIC8Vi4dLEn49I3wuwwQe84unmqDg1flb1GbKlCpNDrRXWmAGDY
	 c0/gORmFCf1Yw/LV01E7YXi3gy7Pq6N7SQaQJCqkQjRcXOTh9jtxdICM9Bn4Z7gHTC/C3
	 PcE4nz8bOwHlIKHu/vq+qd/9mwoy7hTkk8g+VQGJauDT14YWeT0DqPjQzu6SXH4vphw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793877092;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Tx4N7P1fRkn5Ta3AZs9XVGYEyxqCt48WpsxBKXnWKvg=;
	b=FXMlphzx2JT3GykCe1bMZbnzA13IwhY45arushjIyMBIQOHC2d+rlWGn9N2CDECELd52
	 yZfVZQ+wzmNJe71XDAzMqYhCK8j/wtS2LcxNHjCJDyHqMOfEqFkM3eRb4qe+VjbpMeDrA
	 sgYtudSRkVvymDNocwiFQHAgpk5v/DW612ug/HtGyPdXwkjDdGxOgdnB6lNthJEl33+4f
	 5Y1wA963/P1EAIX1sMHHDpRHDxDQzdeKQvhr7jrHMXBf6LQlruOFsAu219BtBQDhIOYXY
	 /yUks7NRujwpko2pTLARS7cgKGngl9PSM+pIej0is2A1g3q8T8wygZOjkudqzl85YtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LYU1q7hb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NJ06ZCD9;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11772606D80C
	for <mfd@lists.linux.dev>; Thu,  5 Nov 2026 11:11:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11772606D80C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LYU1q7hb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NJ06ZCD9
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5AhuvM1582932
	for <mfd@lists.linux.dev>; Thu, 5 Nov 2026 11:11:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tx4N7P1fRkn5Ta3AZs9XVGYEyxqCt48WpsxBKXnWKvg=; b=LYU1q7hbol6nweMa
	Ih+LCLM9IifmB1k2NsdvECh0fURO1VTVJjDP5AK+c/gK7HEJ4yiJTAaAPN/plh2P
	QrPOsRrcJe9COmdca/D1hIKYGd3Z079lJ3OiUY+cYfj959SoHzONhU5sVOh+0dJp
	xsoTXxAxUrNpj8vvidFcdztPuNz+WiG5spcfmI9ZAe3pHUhdcIsI56g+gYpaESUv
	26IkDz84sZKCTvDHBaq3Ew6rcr98fYIokAuI8QgRIKFZBN6n0XK/7GUpyT8b+lEr
	FTzDDb3UcuFNAz3kLe6t75xhBMM6LcX1tR5p5pu33AQkJx0EOtp/QjyYo+z0xOzr
	KT75GQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrraar3b9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Thu, 05 Nov 2026 11:11:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f20addba1so357347285a.1
        for <mfd@lists.linux.dev>; Thu, 05 Nov 2026 03:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793877090; x=1794481890; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tx4N7P1fRkn5Ta3AZs9XVGYEyxqCt48WpsxBKXnWKvg=;
        b=NJ06ZCD9r7lxZkRBi8yHlui2g1qcW0keSp4vXmpUQ4OpWnZx6/GWRaVuiBzWoA0ZEv
         hWK1Nk0V53GWQoROUP7UMKZ+Khv3uYj9rpON5LiOvIYHLAwZgH1QqAOZ+FGbJUe90psz
         O3g+2QoljLL0Z+R/hsZxez7G/09DPk5VcWPpmSIcPOJXKoz6Zg3PFSJUp2s47LHdOsPc
         dCTycAnWlrgw2C/vJxYptgxpYuB/m8B0rxB/+6X1CMKso1TN/hpN6GgzndRh3RMw4RlH
         mZXyQGnv79pskMbabMu9ToQC7YVNpM+YG2oLQh2wGTj2tuqalC+4cHnroVeQYPIspMNB
         TP1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793877090; x=1794481890;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tx4N7P1fRkn5Ta3AZs9XVGYEyxqCt48WpsxBKXnWKvg=;
        b=UTcp95JOL0G2gxqjBNGrTtT6+N4kPVfuxoh20xbXLi10N+tpQ1nUsrseb8l1aheKe+
         IR4QZmvOdJiSHxrNcgqGariwxfmoKrv+ew9SQ2kaiaiT8jY3I2Ompb3SVQXqeprRBMGV
         4HqQS+ckGqazL05cgYYE58Sd8ZRHyNUsLUvbEqiBPzhjYjsKkRbdPQfWKEXr+Kw4NeY+
         d4Ii6GvcqWr1RAhg+cXhWIXD32voNNGNMcTcP/opLW1PpPJFq0WvdeT9VTidAklBpCm+
         pHOACI745YgxY6u9LMq/oqhmJRoQi/9yrJwMugSpJH6whvS7SSsOaRDz48vY7Q61enQy
         VQeA==
X-Gm-Message-State: APuU4Z8YoEEDReaiPDBKmBFOrNiO2SRgcaa3MMaaEs6U7pnLf4ZoubqK
	cpRTuoRNd9cFDGCNyXoxPJau8PciDyyr9njCxsztvPYz+NeTJHSqRQTUJSM2eww+M+gftWMFdXb
	j5BeWXs8+X5YrgXLGwReW5lI+VkrypW1rnZa9skrxZN9ZLpejRn67OEFbKkpMfeKpgg==
X-Gm-Gg: AYBFou2RJYpP3nxvyajIkmuOE/0vqUoXSzqC+dqMj2uU/tctIZmzV+xx9sns00VLP6u
	YVn+FUD02Z+3PASVJ0AqCkVSMwkyJmDWAAayNFperN1/YK7zCXbEKNAh4GONZHdTEkYLWcb9VrT
	4Rv1A5P40iPj/3BEZDIIL31WWwpgn1vNIgbYvn//y2dG9FA2KuSAdiJNoKV0YUBmxLF4OCeQo+w
	duFfBdw99Q2VP471jogH6cQlDKzN2vyTei5qnZNvarISVeDRrAtmSerizUrgrirbADOb2MSkGEr
	F8bIGtkfIKVSVIII6epUMhIu7hbekFv7MH3JidAVZEwCE//9hPgrwEHy4VuVChcXpmaEtBJyW5o
	UiJWpVGMEPIyZse5oZd017faQF+Ny1ehumW6IYIoHO4GxqU5v9GYUfdG+0Se5E9UFPW3kA9JEZF
	PFw33TgMZ9AL3QeQzhVAHWA6w7ICwDEN/CCJGVjI3+
X-Received: by 2002:a05:620a:8806:b0:93e:4d74:68fd with SMTP id af79cd13be357-944217b2aeamr3041639585a.65.1793877090353;
        Thu, 05 Nov 2026 03:11:30 -0800 (PST)
X-Received: by 2002:a05:620a:8806:b0:93e:4d74:68fd with SMTP id af79cd13be357-944217b2aeamr3041633985a.65.1793877089727;
        Thu, 05 Nov 2026 03:11:29 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d488f183sm438320685a.39.2026.11.05.03.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:11:26 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 19:10:59 +0800
Subject: [PATCH RFC 1/3] dt-bindings: mfd: syscon: Add Qualcomm Nord Titan
 CAM_TOP
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
Message-Id: <20261105-ccu-v1-1-3accc4b901de@oss.qualcomm.com>
References: <20261105-ccu-v1-0-3accc4b901de@oss.qualcomm.com>
In-Reply-To: <20261105-ccu-v1-0-3accc4b901de@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, vikram.sharma@oss.qualcomm.com,
        nihal.gupta@oss.qualcomm.com, vtumati@quicinc.com,
        bryan.odonoghue@linaro.org, Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793877074; l=1095;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=Q3m2L70QHVhNFssz0d5iHd//KrXi34EuQb4Z/fjKNc0=;
 b=tJUyjpuxFIMXk3yVPv7pWbYsQQMLXi4d1roL6jwFr09gpB77pcSfkPDrM+jz0MMUgdXX+mAHI
 GAZHn2d/ZbYCRjZPtKEwPdztrnqtMsEyEjk98aw5f7HWCUbeyTDslPo
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0NCBTYWx0ZWRfX3qWr73nmsS+5
 EjVswo6TUmBxwjbt9cXmEDq3pHoV//5PhDVBaR47cfd4B9QBGiKgQIgWjfsoW7j59qeMJUSqrzc
 qVRSCqEgO+SEW1gx68ZjbIhPXkyJKzk=
X-Proofpoint-ORIG-GUID: EX6r2W_rYg6YxocxHUsZfmjCTIXwZZrp
X-Authority-Analysis: v=2.4 cv=U54Hnuru c=1 sm=1 tr=0 ts=6aec6463 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=eQjVoD_657R47FWD1NwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0NCBTYWx0ZWRfX92kDzJw4B+ou
 NrYdvow0ueDvxPaKb5vJ5VnlhO0U4WzIwbqjvFmtWcFPTKgTTCEtaTx1FPY66tbuAwLUFVdQ9Rv
 XTP9W2vOtEnMEItPBhzWKmdMtDFtE/PjhaSgDvtzDBcaIJli+NH8jrFlowvG24rdMGLpQWR735z
 6NSYxRfm9VzhBYDSreJFs5ZvC7OFgfp2pF5XWmMpOuTtn4FRsf4U+4FOXpeDg91fSoUQY7EuPwr
 xriJqP9B3QYsN4DTjPgEZtlX6P9HJ6Rx7ed0jwnyAXvOV4oJbrUv139cC4hLJX64Z/NScAt7Y2y
 YWvG/eaXXVsY30qYJvg2e+CEN1rk1D9WCVbP8+5Ct1gbB8PVMjfI0qtnTv9EjhwOBVotJs5XsOO
 valRLYRb/Ja7j4qCteQYHakecBVDh6dFttp3WpSI92bz6Q8ZwhwGL6mg+k5CAmPUWhPSgC7X3Rj
 /+B4891ktsE0vcJcE2Q==
X-Proofpoint-GUID: EX6r2W_rYg6YxocxHUsZfmjCTIXwZZrp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1011 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050044

The CAM_TOP block in the Nord Titan camera subsystem contains
registers shared by several camera blocks, including the CCU output
mux used to route the CCI I2C ports.

The block is outside of the CCI and CAMSS register ranges, so describe
it as a syscon for its users to reference.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 80ff0e1caca224d8dc7d8a0243acc49c253cccea..077c4037fa0ce4f1b93927579c2c326e7bed73d4 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -109,6 +109,7 @@ properties:
               - qcom,apq8064-mmss-sfpb
               - qcom,apq8064-sps-sic
               - qcom,msm8960-sps-sic
+              - qcom,nord-titan-cam-top
               - rockchip,px30-qos
               - rockchip,rk3036-qos
               - rockchip,rk3066-qos

-- 
2.34.1

