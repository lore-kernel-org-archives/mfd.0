Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FC952B1D3
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 13:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687462; cv=none; b=iZKWJHCPe2djimyw6Jbk4L53YnESkSaFeExM+19zzMMEPx4QB65XFehQal3HqzShkPBRLKON6/dVSMesrZsZt3BVfkQKXNKcv2axSdA37szakOwtSonrUZGZzpG8jCVg/s9iEbX/JOZpDeRTKykb7Gs28gnXakQovBGaav3jt5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687462; c=relaxed/simple;
	bh=9ojsiGAObDae06PZ+LjvSvhfUDVVA7+UNRsbvF34TR0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UemW8dn9JerY0S3V7PzYnAKc3ZBvemycItY6xXuYju8lU7NgNkt099Wz14B2DiQ8d/Ng3shw2XNkmOQJac3ri4ZuT7X3HuHXNJJwyymxD265f0BK70YPg//8r7YLrSqZHIB0b8+fuCKls/zxK+PqkgPYNTL/NenZ5XIuq2fJtBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E6hPmdAZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IXxXBvwI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E6hPmdAZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IXxXBvwI"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCw0oS3300928
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 13:11:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x+2pykG5pP8hDB+fb+ZJcDiRziaoIX/tchorGsycP9I=; b=E6hPmdAZCN3EXaDH
	K3Qn7JF5m/G5mLsVOSSqbimYgm0SWeinMJPYG8unXlQqPY9XO5WszP+GnWjCNt//
	xqRYxBfjIe4FMGmQfzCSlm+OzPgi0B4QZAybLpir9DjIHNlkszbI4xVjvaXVResB
	UnzSlcQwgnZrnwE3arXMNfw4ul7hOQP+p0m0IJoXR0PRm3pRrLR/Egf3+ZSeWK2L
	XW6DgSQDJIgQ0JXgE8UBDv20oPQnok6Z1rj2GDAmIN8DWGRXVWvnHmu9GDyngeiG
	Q50hohQ9wGibmT+52qArm405Ghi7LFTUekdrAnyhgYRne7bcMS/EpFuNbV6og+aX
	Gd5AaA==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0dsx02da-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 13:11:00 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8914aeaa16aso66197067b3.1
        for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 06:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687459; x=1791292259; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x+2pykG5pP8hDB+fb+ZJcDiRziaoIX/tchorGsycP9I=;
        b=IXxXBvwIFnmokOiL7k7RFSaclNi42gmc3DOE5bDLp7tJAYyfaVgA5pktP7huuUaeto
         IW7jZ3cgz81kKHdJ6/SuaSi7ZI1TriOKg4RLEcDF0vdBW26yFVWmh4WBZVTbYgG2CSk6
         B4ZjvedUbD+/y6ul6QaFpKvtTzN0bUd/SF9h0RUHpHFKKPd47sT7x1v7BTf6+RRy7fdc
         cpHvWdFKydIcErkZJILSnLVavEV53PSsByJyCDRyZyXc9UKyWvR9UFszpN8fm6CpUlnz
         8HJDMhL/z3jL9ILwmOctJmnIhmQ2jWWrz57gLT3vgS8Pu7u3BYwOhhyeW/g8/Ex76JlV
         ONPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687459; x=1791292259;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x+2pykG5pP8hDB+fb+ZJcDiRziaoIX/tchorGsycP9I=;
        b=UQU6Al+dQLSNHyF1oPqVUQqLd/76q5jMhibW5htElMxFpOvZMuzL9fVJ/jWgZmLVl/
         /st8DHdsZNE62asqYhhNf1nJegYSeRDqo9uhJmXatNRLWqa3RjyQ4IKihKYQHk8qr0uu
         eyv7RY74WhukBpWgtoOV3ZZsryxUL/vmxN+agLeYtn3cDBAtIPiOE5aEE/Xr/i5CD5gt
         nNTAStKGAl58cAmh6DuNTMtAeyHtxjzf51MiN9R78j3o3bNXQ9aoZK20MwiVF2HP5Wwd
         g+wfc+tCfYPgSLxe+t/Eo2HEvFnl6z5u1sf63W5qqFIyks+gsgIrV1DRC1Ye+lqhS6ou
         fUfQ==
X-Forwarded-Encrypted: i=1; AKwUvByyzZ1cCfnMsd83y9IQFgc1kQmpTJLrXl3fB+V+v8d1pqYHAzY6B5+NjCTmnPolyIHIHMw=@lists.linux.dev
X-Gm-Message-State: AFq9FYJZ/vFRhS7gF+9SBB6gAVqcXXe6YYg86pOZTa1Ya7ffdhXU5vBp
	lV3lKY/kmd7wbGWK8nnVEuQ4PDUoCbKpSMdO4uKuccyP76GO/+DZK4csvMUZAPreBthqovMKcSi
	HLUeSLyh5PqARmd4QDBPtbkkudU6bHDwyo3xaJABoi6yDYRg2daktuI4=
X-Gm-Gg: AYBFou09vU0EV5xdt/5Jvk+HXzklFZzNz+xHbZP156KP1alXWWKpamdkLs1i1OMHB+2
	KtC6pykUVk1xfn4k094ghefRH27vqQ0ZYBdJhAKS2HFoVeSMtMzjQff8MEF5gD1uBqe0VhK/gAd
	AQ0IAW8wQmvlSzibCPzBApmJd9ZasPXc+WnuYdhAI7PhGDY5jG0n5Se++X2HDBCQ6hXJoEullgD
	oCw/LINaw11VqmqH083wCux0SQ+NQKXiHkNRhyzh/kGAZkE7ax3ofcnh7sXHaiTN8AmzSsTLzSP
	9P6JIgZtBT+BvVfsH9mi/QGNQ5b3DaXhE5/pk0AIKeK0d1LydBRT63GO1LKhCwhYJfMMbHP3TZh
	kp9L+2+ZWdQ+ZbBOd39g7Lq07YCXglQJSlm4=
X-Received: by 2002:a05:690e:408d:b0:675:5d63:7b26 with SMTP id 956f58d0204a3-6755d637bcemr1906979d50.53.1790687459270;
        Tue, 29 Sep 2026 06:10:59 -0700 (PDT)
X-Received: by 2002:a05:690e:408d:b0:675:5d63:7b26 with SMTP id 956f58d0204a3-6755d637bcemr1906941d50.53.1790687458764;
        Tue, 29 Sep 2026 06:10:58 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d013e8bsm10225326d6.0.2026.09.29.06.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:10:58 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 18:39:42 +0530
Subject: [PATCH v3 10/12] arm64: dts: qcom: pmih0108-kaanapali: Enable BCL
 sensor node
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-qcom-bcl-hwmon-v3-10-f5ca00889cf7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790687377; l=1212;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=9ojsiGAObDae06PZ+LjvSvhfUDVVA7+UNRsbvF34TR0=;
 b=u4iXrFBZgUFB5iptFcMjRQeUVV5k2ovuNLVXsWXLgTQXraWQ453EYM541qN2VQ5O4pPZBXkcF
 CXW2USgM/CZBNn4CMkNlUCSw2g554xmq0KthIYZfSLLDDIkfPVcYHFp
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX6uHByVUdeDSk
 +W7mw00hjlEOoLn+HGBqruehs96GgG3/yVgk8MEsnA8pnaA+IdmXohvLOroOcshdwVKNA5n5f8K
 2DsuDRGCRxxVQW/oeARZXdR+W7NroVE8G/mazRymE9JVJnBKEuo5VyTt4MpwL/dnrBURortdkXc
 QkyA2fgYP6YiYvanERYx7hzQd7meVU/z4ncfjMqgPhkWwg4FCM4Rm2GuRv3WFqkB9B0JAFu0F+T
 cSraoZ5rRD5OgSkvGEoN9RPaXF9/IU0G1oupEYSMcJt6GKwxQLpt6bTcrDOh9AtS/zZX3e6e0N0
 wydzMs5VGWCS6gXOUmAig2Gf3t5UR+c6HhWJI6nplOQ9pUXyH9e5GfBwY/MuNw5FbOgsVFfGemX
 6VvEomEESWIkHII19d1tlYrmesh7N8+MgVRXuDyXVv3NQVerkPFTDr3JvRKxDxBsYihwDyVwLED
 MA1rkvPpMBE681VaRiw==
X-Proofpoint-ORIG-GUID: KWQvEpGS5gBCzh2fYHi6AH6t1JDqhJdZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX5uykggQhhaCS
 JKCAKqT9oetZWja6L3m6RukXUuUfFVdXrsv/Zw4u//Wr4+9ny7zFl1Ad+l9mUKkihvJMexVeiw0
 vzUSIYas8Xd89ybKb0W7Tsgl2EvIy9A=
X-Proofpoint-GUID: KWQvEpGS5gBCzh2fYHi6AH6t1JDqhJdZ
X-Authority-Analysis: v=2.4 cv=DqvDa2/+ c=1 sm=1 tr=0 ts=6abbb8e4 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=09zRouN1k7u6xsjrD3kA:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 adultscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290052

Add Battery Current Limiting (BCL) hardware monitor node for pmih0108
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi b/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi
index b73b0e82c3d3..9f6bef6087cf 100644
--- a/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi
@@ -49,6 +49,17 @@ pmih0108_e1_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pmih0108-bcl";
+			reg = <0x4700>;
+			interrupts = <0x7 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pmih0108_e1_gpios: gpio@8800 {
 			compatible = "qcom,pmih0108-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

