Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749914EFFD3
	for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 08:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792054749; cv=none; b=mK0iFVb+UIWg9NuZ9FfoXCovvkbAWMyQFpGKS7hRtFN91Q+gr93tDJKgyQuwQi7P8axax3Azzt7oyx+KuRDm39gFlid8b8OtqRZl8wNLamL6HRnCHdykg8vCdyZssm4+B6iuIvq05CIQq7rtgshmbl2PckvaNj8zUuKJY+BwFKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792054749; c=relaxed/simple;
	bh=lcd/P+nruFRhQ358i4WAml/LB0EcL8s1zTEbmnwyMQo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uL+39tfU7f2f0IcRpGZoLfoDtt23g0u39J93+FXq2uayH12K9kQoF3bIu20ZIp2xb/uAwjNRgWqg/ERowBk0awIH3E9ctRjrQq2YqvPM1jFOcCd62e+Q47AmP7VEJ6Gsh2Jaq8XhvtRPx7bvkq2hcvJClNHPV3erI4757qTFgk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IRE9cK4W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dobJ3DXZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IRE9cK4W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dobJ3DXZ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F8vuI72885781
	for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 08:59:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nKB3HAwwUoMAANvcjYoiAe4y9aLaTkX2vWSxD+aknP0=; b=IRE9cK4Wt02FYXYN
	TcfC9ibQz4nJfFl5hJbiHxaQR58kdsHtAOmW24zga/73b1y0Qlp42u1KK/AFCrqL
	y4Cblkxh3xj8Wth3I3mZHtrMqwqRQCptPJCtO2YfGtQsgYMWCYFH2nt+vEACAKUH
	8+ua3b10WvCgafGwnJYUvwcQhYuJXMODtMhk7wKOnfGQeoSJBf4tv53LaFHIdpdw
	LIJmLsoMuPwzWV5NrZTaKKM7F/xUsflJua3vYhlCGfAmztU303X3KgDrselI2Hmb
	Ys3cDSmN/oB2AWTloUeNMUR4+HmdQrf2fUWmI1nZGgHtvkBZAJ0zMV3orBIalvIM
	0pFMAA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hausm007u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 08:59:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93bf4c0af4eso329096885a.1
        for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 01:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792054744; x=1792659544; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nKB3HAwwUoMAANvcjYoiAe4y9aLaTkX2vWSxD+aknP0=;
        b=dobJ3DXZmQxY4PZxcsu9nV8w7/J+PR3xmeBuGpBYNGLtLjzI+lZQuLoUQKh226wsJY
         5ivXuZLm8NHKZ396m3A/m8dlIYZNUUNKukfHv0N1PTWKxCtY+Vohhbk6gw3Wv0J6o7e7
         vAs10ck+RoTUpjnyt7UQGAh18Dnopl5GuW0VaO1cXGH1kffA+EegDCEZQBD/nEfSzEsg
         hY7m/D8q6YEV6A6E8kjCOo0+55/UZ/4Gj5Z6OVRfGw70ixXDfsde/bYKbYa0BUNmAtLH
         keGKinn/EHBveQbQoNhngesrJMAac/8F5Ehiq2pbQwTnmI55Io88KBBioFv/dD6R5L+X
         oQEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792054744; x=1792659544;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nKB3HAwwUoMAANvcjYoiAe4y9aLaTkX2vWSxD+aknP0=;
        b=XmvJhZmDcQ1R2gpmRNLp9M2+e0x7bzjrdHLSsYbySzcjx/hVZrLmm/y3oZmPspksg+
         H+5+L9jgifJlmB6XlITlOVKCUzLnYhzgW3OnvDK1+Lk9ceVsDcX0r5cJAzhPUVBAsr95
         JhcqSFlqv2KD7a9wxsYTRabbsZihJAEp/kN6gwgxraQOJEdQe2BI2sKknAAcMiIISEMA
         dGGR/YWkmaXgy0PWeOx4tLSgHfHMwkDwkeUL6M/QhvoMmtvldHq+LLpv0WtrfrC3a/PI
         L19SYl4nF7xjZ3qzTMPPrFQeWQc6u1SKCXDu9t1BactkUnh91aT2NEvGSZ5vUWJc+BiO
         rK+Q==
X-Forwarded-Encrypted: i=1; AKwUvByJdaP8SJaPnMv8MTDv065M7wJ+Qnt0DoeRICT0XGLF+4PLkt1Yg3xq2Fdt9ZRX24YUfac=@lists.linux.dev
X-Gm-Message-State: AFq9FYJh4igJoid4rc0P0e4cr/7cZrM4fBk/Thty+wHAa4Z6MOgoAR7l
	FUE818YKXU2KLrNhxW5PwMXBTMoyEZLvRnj2Gdwspe9YowA0h9OAO/u8Qpjkd97lYLwmdrOJZaT
	edZ7Tp8sLxSIe1E6cNL3MVPxpickTNvBEGO5EhEBOFHaqxUQnWhRNE3A=
X-Gm-Gg: AYBFou0W45VUq13C8sv4rqfTonq2vY4/DuB158PCZNvdpmUX90qE7B1mghvtU7sTjvm
	QAKqAtoabIZJvfhO+UPIV7Dg5N+udp6/hioslVnZVnV9WQgP8BRUhrxw1ECo1/+b59Ll5Ybgf6L
	xsoRcvXTQkW3x7q/TDtla5omymqkfK/61yaAqLPGfqBInRbavec5amnVYDfR2NY5TiYP5LisBgV
	a/8WKOaGR6mgaIMblQkFmKMu+Lz/l4gyqcQuqynERIMyLsMebUKrnDD/6LdplzcXnVH2Gio4q6X
	jPqShVNl1tcAdTP+V6C27O151NBOnUHjPLtz63QLhMdiByCMQPVt9mhsBKU60wMaGIhWlVFMupP
	YapGF5arnZ7471A2OyUO3bVy7QoAAHae80ElHAB1bv7RStn8yamuN6dT3wTXN14ao7bRnW+G1kL
	FtWHcun/5KG84A
X-Received: by 2002:a05:620a:2985:b0:93e:c12d:4ec4 with SMTP id af79cd13be357-93ec12d54camr2604348585a.36.1792054744307;
        Thu, 15 Oct 2026 01:59:04 -0700 (PDT)
X-Received: by 2002:a05:620a:2985:b0:93e:c12d:4ec4 with SMTP id af79cd13be357-93ec12d54camr2604345385a.36.1792054743810;
        Thu, 15 Oct 2026 01:59:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be3b51fd1dsm371590e87.58.2026.10.15.01.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:59:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 11:58:44 +0300
Subject: [PATCH 7/9] arm64: dts: qcom: sm8150: add MDSS reset
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-sm8150-display-card-v1-7-5c14928cef29@oss.qualcomm.com>
References: <20261015-sm8150-display-card-v1-0-5c14928cef29@oss.qualcomm.com>
In-Reply-To: <20261015-sm8150-display-card-v1-0-5c14928cef29@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=826;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=lcd/P+nruFRhQ358i4WAml/LB0EcL8s1zTEbmnwyMQo=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9aFqcd8m07PmdPRa/RC1X/HOQu9S8ms0iXHNl9mkp0aV
 TuvbeX/TkZjFgZGLgZZMUUWn4KWqTGbksM+7JhaDzOIlQlkCgMXpwBMROIE+z+lc+Yq0xUkOnq8
 V6yKXsqvqn6thMfq9NXmSs2CeleXbyv6vzbvUK37H8WaN6NVreJc1ksFT5PFM6b6/jwxVcbtP6O
 X05L43UFO0ReKTrk1f3q3eeuk8nCBzv3G1jqem7O03ZaGtWc83a4gryN1RvQWf5rK3nR/vr4YuQ
 6dI2WPP3tf2CFepi1RL+Ozk63Eme+Z6Kd8af9l2WLhdspLWEpKoybJrytyzT00Q3muo37pNmmhk
 Klvdldw6xgv0l5w+Eux+ox0xYsKPsuXz3B7oakQ2fqTPdr1u4Mxx5kVfRu3WLV1ss6rTl317lfo
 16fG9QncgiYBqfdjsgOS45Q1VMrWsBya1xprvvXf1hYA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: e8szkgQlkPiJAVxXQ0RVegTsYp6_7IgN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNSBTYWx0ZWRfX7m58JJaseXIt
 PJHANX7vRg29IJQr/qDdzJ9xP0Pr3peiijj1gWiSghO0Gf6Ub/3w3QJOBBBBEQFpleBGBgaU3EM
 TxRxAyJrua5QoqaUTMp2ap5Mn/bifZMXXEMYbFEVBxpEZtFB4GN6g8I0MPISTSKXjGWWNyur6b0
 7ARk1s1Ig4pzmaw6QVMp8yUdg/ecP7UQgnbaEhQSDIJ1ONXnITpTlVX+2Z5Ooe/mSBBcgdXzy+x
 SgocWVgPX8/kcWvhQKSSzCz1vP6z1lPwW4ipsop9mz97NjuzesyYx+Lb2dz7PvE35IAN5I3FCUN
 nl9aT11Gv4qMzsv6sxBiygcEMH6HcgIoNTKlxdCw+8MbT+y2WrgtVxFjwcMZHkdjclUnT2CRRcB
 gPJDhWhIhCme3v0viDqndbGAe0KixyZ5qi7CU0Ny2zFT11fWeGdz6X/sEz+8uBFtkW4ogNdOXBT
 iTpyIbSEht6+Nd2HE8A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNSBTYWx0ZWRfXw4v46mQo/S9b
 +34vzspvQ8pLN4tk2UVZTRIDG6I87xmelR7W68hfy7ToYkggdcr2I7P4adAB8Wu6LeFCEMZQbT/
 4YZO0cddfDaH9rc3koBbUACg6HKqh+g=
X-Authority-Analysis: v=2.4 cv=Eb5d0/mC c=1 sm=1 tr=0 ts=6ad095d9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=Bz10KyuN3JYNdhx7gBUA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: e8szkgQlkPiJAVxXQ0RVegTsYp6_7IgN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150035

The bootloader can leave the display running, as it does on the SM8150
HDK with the display card attached. Describe the MDSS reset so that the
driver can bring the hardware into a known state before using it.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 293fcbacff34..a2d6e6947c4c 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -3817,6 +3817,7 @@ mdss: display-subsystem@ae00000 {
 
 			iommus = <&apps_smmu 0x800 0x420>;
 
+			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
 			status = "disabled";
 
 			#address-cells = <2>;

-- 
2.47.3

