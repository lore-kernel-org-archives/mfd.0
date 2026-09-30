Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5CB4E021A
	for <mfd@lists.linux.dev>; Wed, 30 Sep 2026 12:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790772390; cv=none; b=GwCRdsrI8G1NOcSJsrKItD8H0LlQQQnbKynMb6xt0j9Vj7lt8Hnjfa+jTOhI9f5X4fLffTgHm2shHMjDPyHBrf0YgSomB/xIJDuy15eUOYvvLmwQr2ReKNCTmcBO1K1tTgenT1UBw9Dl1SKgpc21H5Rf1IJrlb0mOSXdN29JlAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790772390; c=relaxed/simple;
	bh=5nKDNvtW1OUJP6Sb+xn+Ybf82dLM6rIu3idQhs5Kwa8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oHteK1ARB8+HdYF6KHrVT3by28Yeu1WABwcDAi28w3zJ6X9nDwxovVLKKHAFOg6R7RVZJdvoc3T9F5J6wkucaObYb2kIDkeR/yEVDYo3TJ8CPtnIjANjlVfzu0tyHzVf4AHOH7MQ9tpt8FjQGDEH+HUOPYy4U3VvLqP+8Mnnv60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NXbfSCBf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TaG4MZtv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NXbfSCBf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TaG4MZtv"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB7MxU3554848
	for <mfd@lists.linux.dev>; Wed, 30 Sep 2026 12:46:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CmPa0zk9SMg
	32eJGwCLcpamy23kmZhzKKd6gsfxi4hU=; b=NXbfSCBfg1porQtZtgNlqqDOY8I
	LSa7oSLIBODYUWAR6YoE6rlvMLv2M4OI6Ir74xbvuwxugzwKRYtnd++SIZRkxmfq
	RthS6z1AaV/Ykedc+fgIS6fwVJBgbaH5DM0eReMiz23rjxMg847QCS2GYIefDjyR
	U4elJ1IVPsIg3gy8yXSomjkD1gxTsZKeCSZf0o4GKK6iB8TWMCIJafd2nGterpGF
	MrjjZScZfTGYC2JkNyoXyYr1YZlGWq2wbhmpN/7KpvkPBLt2z4Z4k6YBhWOhWZGt
	wyTAc+cyUPBceUUQQg3w5KJ0ytWdytvDt5yty3IUgyY+JYJ5evWiTg/5Ibw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h10bk8p0p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Wed, 30 Sep 2026 12:46:24 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-98513b850f1so298600241.2
        for <mfd@lists.linux.dev>; Wed, 30 Sep 2026 05:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790772384; x=1791377184; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CmPa0zk9SMg32eJGwCLcpamy23kmZhzKKd6gsfxi4hU=;
        b=TaG4MZtvy5oiSI+a2YU2eTk6BrOOWA9OJvyAAtwaIyEKrqum6SDvx7c4L7LAQYgkUH
         We520LTzlsgac8mEoKPPAwIhVqh6r9mRD7IlgyoRcApivWleKIJhQ3ijPKPLf5kraV3z
         pX0X0RptLZI6cIfWG2zgeW0pGafphjlP+6jDTFc8RNAZTO+qKvdZM62d23omXxHlKKUj
         Fjk/svqdEbu0YgqpabULy2nn8jBg1OnHC96a1+vzSFC9t7m9aLhlgP/gWKb/cx7Vu2aR
         anJ7uua3moV7TixUjNEZSuou86DCNFGTah9BmjupY3J7CdQvSj1YkJrcS9h+FK8nD/aB
         e12Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790772384; x=1791377184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CmPa0zk9SMg32eJGwCLcpamy23kmZhzKKd6gsfxi4hU=;
        b=Fi3zTs+uEThGX9owgqnDZUk6+hRlV/8pbHff15DyYkzMH4ZHuA0LKs6KYFQHut1bfF
         k06vp4Y2C6LDWuzPeeEqQ8oVFW/znr4BxJAFkKXBEUdC/2tsaI0fHoEwYqCIv51aCifL
         bTwEmRsxkX38zoV4niUCmKgKbELDoAOHtGLA25F8/mfm+X9hckJwHfChNasJn8e1ZtB/
         RvJUci/Gze02tBVSQm/NdjH0UrOF0s4Xv2mga4vOypoELxSapUwa70NyQocwMD2qeQmf
         0FOmWQmATexV/1w47pXYv/t0Em33S+cpL7KWK946dxUCDw8kjQm65WinNUtuIny+tv/j
         V+Iw==
X-Forwarded-Encrypted: i=1; AKwUvBwkuff4dwvzixw4SFMl/SNRyXcakKAez/uX3G72GncV5kojXvtBCY1+WPc8uMnYrhauTKw=@lists.linux.dev
X-Gm-Message-State: AFq9FYKAoF1WY4pTZW8tSmEsYCWY4IcHEI+xiBEaKkyhU1gXR31+IXN+
	gl+jTuRxdt/aIaDuKb360N/Oio26BQxGbZ32AW3nf1BtH5GkAF0c5Blq5mjo3oVVdYoSUIvpYKO
	6NnHKs6R4qARPo5gF9dpG7e5AkU27uk+fUG98TmTw/8kaFN7zjdXusuY=
X-Gm-Gg: AYBFou1CAWckCruonps5HPHldQBM26Dm9jl9M6s1OEOKqOf6ePqzp3I5kPgAVQkJ7Go
	SE//Dzx0Z30Uh3RRko0AaMaDlYHE7MLcS3M2bF8WNWrxxPJGjm/nL9blaW/BoI3bLasIjdbt7lH
	7QDyutZzERvk2/qgoEP04lb2QyAwYvYFayc4WzppKHz3xxuITOaFJ4Qa+SiqeWhTse/mHNUKjkk
	d1+VsLx0nEkWIww7o+xsJI163CfhgRdq4JDkmYnmCcZuv89TqXvdrwEklguUeCbNnWHAwmq/Cbg
	WCdcEripgjrGMhx1oB4Mm0Nbc13vOjdJyImQT/fxgzJ5/Kfyo9zUlotgAwWJOH0fHIQNrCkL05V
	w80SoZo+dv1s3
X-Received: by 2002:a05:6102:5cc4:b0:7a8:2a34:432e with SMTP id ada2fe7eead31-7be726b9215mr191800137.9.1790772383916;
        Wed, 30 Sep 2026 05:46:23 -0700 (PDT)
X-Received: by 2002:a05:6102:5cc4:b0:7a8:2a34:432e with SMTP id ada2fe7eead31-7be726b9215mr191776137.9.1790772383393;
        Wed, 30 Sep 2026 05:46:23 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01b1e7a46sm32549195e9.0.2026.09.30.05.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 05:46:22 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Alexey Klimov <alexey.klimov@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        mfd@lists.linux.dev, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 4/4] arm64: defconfig: Enable pm4125 audio codec driver
Date: Wed, 30 Sep 2026 13:46:06 +0100
Message-ID: <20260930124607.1109167-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260930124607.1109167-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260930124607.1109167-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 0zCHQxxnEiWd9tYbycsI2fv-eCmJwB-s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1MCBTYWx0ZWRfX4MDeoiR9DQmb
 lf4vM1UwrBw2mbm6EEOMNjlApQPPajEx8SPzMYofg+4QAafeGB7W+lcOdPVXNfKIsE89lzsyzmo
 9mn8w4as5X9VwAC2MUug7ldWdqJgpGxARs2MsknrAsDkR3zWukxaluYwsNfgDCCsdgooZ301NXP
 +QL0KlsZlGNFkDs4fkGRU40Fv+1vHeGxmiiWWSyXBIxFXtxhhYLjBLg2aZbXXIvisUtBjxufWWf
 EeAwdCosznbPhrtD+gQGUPNIJs1f5+2YQJ0Bn3EO92dhT5Lh/uorWDEyk3ZvTZzZgS3wGi+6q+n
 kel61VGmJ8iLIXkQfQ8fba0nNoMASmOHLHdOBvc8ciHDhznSB/+BjOOgbUrmCHZjoeb0QrnE3HM
 kSHZXzUaxRdlo4jdCPaLY5F1BjoAnzYxQVlrBxJUl63il7p3eGDDU7hBXpkYik4iZTIK737hZZD
 zXTdpsqnnaTk3Gz8W5w==
X-Authority-Analysis: v=2.4 cv=MZn5KJ/f c=1 sm=1 tr=0 ts=6abd04a0 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=I744n4YQ6ztvz6u6AXgA:9 a=1WsBpfsz9X-RYQiigVTh:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1MCBTYWx0ZWRfX6qGrl5x7UL1D
 UtPMLCMLWy3bnPmmicEsXFg9LE65ymplDrsYcpNuguc6J8VtN5+YXKT0k5anblDbusnP8VElP5Q
 NG/P089HVp1agpjzyml9C4L6Bi2yeoA=
X-Proofpoint-ORIG-GUID: 0zCHQxxnEiWd9tYbycsI2fv-eCmJwB-s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300050

Enable pm4125 audio codec driver that is required to enable audio
support on Arduino UnoQ board.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index fce418fe6ff6..6c41348d1abc 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1172,6 +1172,7 @@ CONFIG_SND_SOC_GTM601=m
 CONFIG_SND_SOC_MAX98090=m
 CONFIG_SND_SOC_MSM8916_WCD_ANALOG=m
 CONFIG_SND_SOC_MSM8916_WCD_DIGITAL=m
+CONFIG_SND_SOC_PM4125_SDW=m
 CONFIG_SND_SOC_RK3308=m
 CONFIG_SND_SOC_RK817=m
 CONFIG_SND_SOC_RT5640=m
-- 
2.53.0

