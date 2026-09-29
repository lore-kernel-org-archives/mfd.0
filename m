Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22156526AB8
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 13:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687479; cv=none; b=PzH8l7ibhvelQCl+9jm4obb8lTPkeq47GMuD95MqwCoxjQKc559dbh9YMnmTE1Ryic8hHlsgmxkoF/+BBNrk6qLkU0fDinV4NCMFCxCXhiKH+PCkg0WKhAsFM1tYhVKsTFGbgCaOQsDt2B3kuD9hjOD0f8fPDfZ4Uqg6vnatMFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687479; c=relaxed/simple;
	bh=O5w6xCV6zqlu9zFfHn+r5awG/He1W71Xy4zJcI3Epi8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yr2hfHNMRmJ6rf19XXRwwbjR2EOsVXT+nRc4+L507Q8h8/Vr1JNd/FAxtGLpe+dfFHdngn6VXaME84KzhkVAUlCjyQMUrKaxMzTZeD7Kzn2zYOH/QKLBj5IxF82T4MxZZ/D7ozJSrLlk2MYhrjOTICyTHm41U0e5ggdKQt9rRZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HgmE2TMJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FaW9QU7l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HgmE2TMJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FaW9QU7l"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqik2350142
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 13:11:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UHYcoiHXDQCxhXTk6wbevGF/oKGAv0Pa8gGj/VFAQqA=; b=HgmE2TMJoVBA3FXq
	VK/2OVF4lA2Oq88usOkoAsIxRMDj7uIKfxGrg86AdxE/+Yd3wXd5HZDt0hEOCnZF
	6Lb1kuWqwexH5VpjoDiz10LK/JMExNU+UuPfZSHnoqZfd50bC8EjCKqgh4Pnblvx
	f5f/5lNZRZNmtgVqiV5/dAf+z9qwVfWhnTHEi42slxGVOoGXNJadOMqHeGJLpYfx
	mPV3iAeZa+mqD301/rZcD4ZYORNRH7pMW2BdQQ1XXtnp3dpa/DBIIpy7T+UP/z8g
	INcxQDgElZGFx8MEo0YZVfBP47GU+Fn+yxpAAqzRvMVi93KLan9nx/OwqJJXytB/
	dgjfGw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h01vkjxue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 13:11:14 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9123c523d0cso47828646d6.0
        for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 06:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687473; x=1791292273; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UHYcoiHXDQCxhXTk6wbevGF/oKGAv0Pa8gGj/VFAQqA=;
        b=FaW9QU7lJg3U5+nxbGvadFSyWkyLdhxzGEA8LtM2PusEMiRxgA4aYe/150W2icmDQ/
         RN1XmrH2WMaj17y4fkznDIqNorGmQs7T/pLeOLh3pF19ZS+ijYeNiVTkRTRcWn7sSb7t
         j6aDAHXzxTL2eqIYDOX/OugZ7VpKr+8AUqSP1GRzi4qFGzdaQSS13C1ExKtxHIzYI80A
         uZCrE8w+4UeGBfQAzTxaGpgVDkHD9QdpK4nop+CrRFqcU39qiHE+xVHMByMvhSIdi6fH
         7GwtFmKoIRSYPyHCKC+mprAUvobkuzqmvPeumZ346GmDbZ0ShCkG0sJvXnI9IN0BL0ta
         JXeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687473; x=1791292273;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UHYcoiHXDQCxhXTk6wbevGF/oKGAv0Pa8gGj/VFAQqA=;
        b=kty1A6ygee9ydaXeUX8Q58Y18EmwSuIAv/tDwLtK6CrUSWPIqnmtzVhsNgrlcjELC8
         rw2uJP6bb6wDFjx2GI4FzeJuE6QwguuzUrMwJKyIvAPRRBm5sgIoupnJTj4NUKNDkyHS
         zG1iS1L/VGJ+BLKs0aj9qK390tFp+EzxSSZ2oqwYxx1PDeUiIuvpuqrncZVGQ0ZsOlBi
         9Vuu3LZXe/lYlsbz/ZAZOWGeyeikgKFStJ7982y0HMPvmP1MX3bfjXE5XVrqJfts9H2f
         2I8LDLL9rVv1/PX8opN+lxXvKKmocFEGs1E4my0FxoU+OZOSzeBZGk+ALsRqTHbJDqDD
         BewQ==
X-Forwarded-Encrypted: i=1; AKwUvBxQ/J7qet2Dsqo/xZWDj4rUJZcpshITD0JUI+cJewfrvbuFDzliDiDMvFHm0q90PIu12u4=@lists.linux.dev
X-Gm-Message-State: AFuF++lSZUCt7gz2VMHaWOdXbEqk+0VOv82fSrXjV1kEedeEzB4kgEDZ
	DPlkVPMU9pDqabePQvLiAyIcJdVAEXStaSxrX5XXJGKIvX4tMC26TGvblaulb3dOhixrvWpwMVo
	rkfxH9JWZ2cCE71pdaHFxbp1NKW0gQlBRNwgPm/zEXzWcHy5CY2xF+Hw=
X-Gm-Gg: AYBFou1TDNGBymxSahIePC0LgTdk/Hm3afVLPtBUyjpVcR57N59hnVnYXDV0w3rbOny
	x6m0i7hAhQ+ZqNHzI+49mdoITEFEpzLNR5kSYZI6FNdAkCdFdpNRAEXLuWrEKwTSQxsPll7yTqN
	AEBtikY2dl6tw3k2op+85R+hM/TmpQ5G6XStwsQ7JeRaSAwiE7kPqIcc9EkB0Tl9jl5VzOMmynX
	5SJFerYcsRMlwAYH+cpcdnwGhOY+omCIKO6PWxhTjYQaH49ZZ9/eIgSFin7FZV8zK2lEpeLgzog
	Oy3f6t2Mz/Qs2Rk9NU0vnFVNd+obx8WT8oIDkagz5IGD0HuNsE3Tzg/I9JAY3/s/6NcsK7Dgdur
	QJLNf3R87vsKeM9AaQR0yopUNwpGRNVD1TyU=
X-Received: by 2002:a05:6214:2dc6:b0:917:9338:6f16 with SMTP id 6a1803df08f44-917933871f9mr11896236d6.3.1790687473224;
        Tue, 29 Sep 2026 06:11:13 -0700 (PDT)
X-Received: by 2002:a05:6214:2dc6:b0:917:9338:6f16 with SMTP id 6a1803df08f44-917933871f9mr11895406d6.3.1790687472624;
        Tue, 29 Sep 2026 06:11:12 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d013e8bsm10225326d6.0.2026.09.29.06.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:11:12 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 18:39:44 +0530
Subject: [PATCH v3 12/12] arm64: dts: qcom: smb2370: Enable BCL sensor node
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-qcom-bcl-hwmon-v3-12-f5ca00889cf7@oss.qualcomm.com>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790687377; l=1145;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=O5w6xCV6zqlu9zFfHn+r5awG/He1W71Xy4zJcI3Epi8=;
 b=D5j/rezBI+6woOgH4Aa1XUrZtzWWPHx+aHttGaTValqJSzXgPUB2KFniFLy6aQPzTvUM+nEG3
 IntmD3xUVE0DVf6LBfXZVHe6DoHKkbNWzrcAM0Oc3Aasll7HiO69l07
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX88kmCR9Mai60
 3CmZ82faP2n9K6Sr8pUn/y76tR1/cMZ1AuSNAb4tQkWXsMidZfsnYMNMlGqWPiqpQzJrQ6+blDC
 Aue9kIs4ueX3vnVOc8WolBqt9Mrc5SiEv+tFinV9dbXZuhrxqL6vzuU/65tVTFLZ8DTin8Ysesn
 OzcNRdvjCa+7AUu/OO/Wa+oX7JnQQ1R7GoeNvDNO3M6fq+VwlYV4eM0lfIv8hLO0Eq790+Chd7s
 j2EOtyF5C1jUPCxCaowppUkHsX7ID84YTu4NG4y2OtZZeAr171263jIsgRm31jQqb81f9IuA6rT
 gXqamERmCZ/EkNNvAhDMfQOLwDhUFeh2LzgetGQW767U0e8umn6O2dDcos1S8t6Zhfbab/njReA
 n/Vawv/TMOUxiSn3kTsR6TpyEWN4BJJn3Fj6r8i1iTyWkJNsw4Hj6AHsma71oWvvhB/EVrZbXPY
 bHzMnxlHFw4LUvkZJVQ==
X-Proofpoint-GUID: wSFvGTnS6XbUee0sLVXF75QvIiDtNXz3
X-Authority-Analysis: v=2.4 cv=VcVir1p9 c=1 sm=1 tr=0 ts=6abbb8f2 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Mdvtvp0LKpy3kcB40AAA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: wSFvGTnS6XbUee0sLVXF75QvIiDtNXz3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX6e5CRel0NBlY
 KOjUcmPppkWj1uf5GJpbpOtTPceOujyrpXfipAROS9pCSE4fK0/Xc05Tylns4WDeKnbQln2TuKo
 iaOCgTsagEJ0Twq2uq+LD5U4qs843qg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290052

Add Battery Current Limiting (BCL) hardware monitor node for smb2370
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/smb2370.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/smb2370.dtsi b/arch/arm64/boot/dts/qcom/smb2370.dtsi
index 1e02578e4ee3..4809b3d8cfe2 100644
--- a/arch/arm64/boot/dts/qcom/smb2370.dtsi
+++ b/arch/arm64/boot/dts/qcom/smb2370.dtsi
@@ -10,6 +10,17 @@ smb2370_j_e2: pmic@9 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		sensor@4700 {
+			compatible = "qcom,smb2370-bcl";
+			reg = <0x4700>;
+			interrupts = <0x9 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x9 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x9 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		smb2370_j_e2_eusb2_repeater: phy@fd00 {
 			compatible = "qcom,smb2370-eusb2-repeater";
 			reg = <0xfd00>;

-- 
2.43.0

