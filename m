Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467385;
	b=Iuz1fm/3dWGlBPfkXN1EfGqUJlkMZpiZ5R+FngS8eh1G8aPX9++WKCGROSULPAbfAp3d
	 INZTDdbfxo99aRtn8esp5fpOr/mz5y83etFx8EZJ9/RB1Uvadvv+YKUeV2n+Q8qsYhJFF
	 qJtG5HC9TRYXPNP4mxnyVUV33igtAQt9V7PvP73Kmqy7PUrZqWacvxbmANic+pxdn26f9
	 aV03JZOa9Vmmd5KqwTZK3q1iNnGHBRW+C+/RzGyNzR/0MC27i9BDmiFjuyJeZtbcr4RIZ
	 UDR0+7+/4vRASq3X4iT6mx9sgLVw75YzoExVzRW9b9eWuvEF6Var4Q3TfWIUM0V+Juw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467385;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HVZcSjFH4FJeUfEsBwsOf+lXeSQFSzxGuq+r24Kf3NI=;
	b=z6FhMt5ApkGF8XwYqCs8LK6R0BQHSjL7y64N1t7jzCHw8bvmWq4IDcDkrXhk8/auR3dM
	 q++rChSaogd6HW6RlcevpyTyTxTzZacPbWsOcXM02T5Op2YjbsYDzSSsaCRwYAXrbSE3g
	 IHdLqHVvIgTvshqQL/NEDizl/DZL/dpJDHiHuvYpDjYfvl7PFMDO/UxvfzJHDw1GO/MIY
	 1Cym9d156baRZvqRg2kbjmeepEXbhEZP/xcnxVBiUYqCeCXcGThY+JCdFeRjKndTOqEj9
	 30sGTb2PM0QKM7Av06XhEvSwVfzCCGISu+WO4JNvzwSvnPEP9MfQ/q+Gg0CLyvHYnaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H2z0940B;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OaXNvY9v;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E454606A32E
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 20:56:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E454606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H2z0940B;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OaXNvY9v
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuWbe3332998
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 20:56:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HVZcSjFH4FJeUfEsBwsOf+lXeSQFSzxGuq+r24Kf3NI=; b=H2z0940Br/B6IYM5
	v050grSbNasErG8gRzb/FuLQCmYqwrHcY7TL6CmETJ3DOvBxKlip3EH3Qqqd4Xmi
	waVlwJpkhabehJ00n0ZtXV+qS5WtOjhWhF/MaR6ySBkRI3aLCmvHo6pKJNtsieqL
	e/2it7vqG5XlXdyboJ8N9rmvxMxFoFkKMRgR7bk73Z36d0TpHMALUCD7syoZZO96
	L69IQ6SpldT5XSP0828uLmaNCwpsp4bQODJcCAc7vm0ZZ9wKvJES7qbp/8fTQmY8
	tew7zVMnodslqlb+AFcCaWEKATXT3yDcWf0CUA3ChfhBD8wHuscNSM8Gk8ZkFnpL
	HIEk4g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4u9nre3d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 20:56:24 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3869865a304so2098318eec.0
        for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 12:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795467383; x=1796072183; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HVZcSjFH4FJeUfEsBwsOf+lXeSQFSzxGuq+r24Kf3NI=;
        b=OaXNvY9vA2qJewgY8sPG4LJXCbozuvE7YcapxAqoMgewGaEHvEEe6l+zo2AayRDfoU
         xSj3GnuCrTrzahWJjPT+jfWjTajdbAcFkuXA4LdBy3B9RzqbS4053pktdCSDL833m3/D
         XlUa/vEjKLsfVR1aqmcb+9ALB2w4+pC6FO0cPHRFi2ofQQnET5VaU7wg8H2e4QA6S0sU
         i8EETaElaq0kB+Y/zi/f1g7H/bPKBErIH4LJZjuY4aVuVogC9f105kEddt2RvxX3/iq9
         VlVDMr0GkepmBgTiwrDPguR60wiO97H1yMv3c5+jK7faDWRtv5GL3DsGx4Hao+TbZA/1
         /miQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795467383; x=1796072183;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HVZcSjFH4FJeUfEsBwsOf+lXeSQFSzxGuq+r24Kf3NI=;
        b=YvEuhblV+jzvOu8Z9n/9AlhgPQzwyy2IXrvduVQB2TpVN3CTYkwC980IJVcyfj17KO
         Fs+u/IPLkzyhTmrBYiLTTXQb0+DjMX3YoVim6oinlwyXyR245OBTNpjJH4h9KNhbcZnv
         MWaHXY4cg1iohXtWOamIu1/jqquLVVqoTPdOPm6SiQWDgFhmKKwoI4WGmB+WIgE3/hvp
         nZs59tj3etAVo3vpKQa81oJIB83pAJFPuY77I/DGHbLwt75JLs9LmDLGaWnh3E1CAFfQ
         9gYQ3Twfr4aXWCdYooaFflutMDjXdV8Egiqm1snSQy1EyTXmkT57Ppb+0FPtOHfqkAaR
         LkFA==
X-Forwarded-Encrypted: i=1; AL+hErHSFXUwaFJk25Eprg6m2rctZUAaTqF3x4J3JcQaQk3x3Y7Hl7VcWXFTmbq8iZJhRlUd5u4=@lists.linux.dev
X-Gm-Message-State: APuU4Z8O2Ptu6PbfMzmGZL23Dq8hRFcXdPEjnT+cWcqLZEcrwWiuZkEB
	Or1p0RJg4FxhawGSryziGH53z2SYdiYF6cRa7N+eH3TGA0zJD3hmEFxN7TnB1XVbLH2Jk9WdlUh
	75pH/v8iDDJrmYPx3+4UaVIuP0HG8fcwdciOi7A+MGb+sGa/kXV0s7ks=
X-Gm-Gg: AZFdTZdkOpAoWQ6Z/K0CPS7SbeN5G1BjhYHWTngqCDvTZ2P7N7lSGdOpXyov892dvHN
	YQwSAquHBbFhRx1DbHSju83q91VyqDmizj+pJ6mb+2x4gMITc+Bh5lWoiUlqVvfKEBJ3GaZE115
	u/p1Op6MXJZQuDP/sPpEMcCrTDAli5TWBPqd9yVmrSEOWfL5ZyPzfEXa5JECIBufI0bcflW1pb7
	u22Yra/PA95wiu4jpNDb9X+zzSYvKYNR7HoLiI56DaXDLwe817orEOItaZM7G7QpUq3lZiTqrMC
	pMBEppaOkxYbO8/j0oxFtA9ypbWTysohtGYLUYcOhPNsRFZtTEgGOUYVOAy3mi6uUh956PDd3BN
	YSh1/hbTTq+wtkYjTSIohBPl5H3HbkcSF7O1Qq8dLldfq8YLcVg4SZ4SNYM0+exPTWFufVU+kdS
	bvdDpgjnkI
X-Received: by 2002:a05:693c:41d1:10b0:386:9d4b:9403 with SMTP id 5a478bee46e88-3869d4b9723mr8818074eec.19.1795467383417;
        Mon, 23 Nov 2026 12:56:23 -0800 (PST)
X-Received: by 2002:a05:693c:41d1:10b0:386:9d4b:9403 with SMTP id 5a478bee46e88-3869d4b9723mr8818038eec.19.1795467382818;
        Mon, 23 Nov 2026 12:56:22 -0800 (PST)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm44209077eec.26.2026.11.23.12.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:56:22 -0800 (PST)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 02:24:52 +0530
Subject: [PATCH v5 12/12] arm64: dts: qcom: smb2370: Enable BCL sensor node
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
Message-Id: <20261124-qcom-bcl-hwmon-v5-12-747d5383d538@oss.qualcomm.com>
References: <20261124-qcom-bcl-hwmon-v5-0-747d5383d538@oss.qualcomm.com>
In-Reply-To: <20261124-qcom-bcl-hwmon-v5-0-747d5383d538@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, linux-doc@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467299; l=1198;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=vJQuhX/oBX172FGrYO7vTJtYeipTicxxvpxXEYh0ojs=;
 b=c1lfg4TaQF9XXCtiV+bWHYb+IQQy3xyZxsYuABAYVnTRz7kwnthdKHQVzbWpLFWVTQ0yUfG/o
 wCE+6d7SD4uDvya0APz5YCTuTN4NDHptzSZdB82hrfdPR3sFiuqSBT7
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX1wKshO71QFCZ
 eRG+r/hV2jJd6O7bd8K4cgvevPeP5QL5J1a6UVHgMJNI3z/Z/d3NILL511mDyr7GneCnfytJzjP
 mcGc8aPE4S3h2hyTmtKMrL7Is1yxKJp2b8+xLkk+PrXWxKTl99bRcmQSp3kEUeVR8bl5hURXYji
 AJRlFAre6UC+s6ygzUYfqTWEBZowUyN8aahV0MbIe7NSWNE5EriDUfg52BdJ4xssQLOgVt9/kOu
 ezUsWjH+gPIW29BV1E7RHB90cquNoeMmbMKC2vaKVojm/vDUFqZ7T+mDpX97VhmL14Jfs7Y5zCE
 X/pUf56pH3M3Ah4AwesnEWeDJJjQS22Cui3S/G2S7VGrh3Bb+s5i+Ft8flmePWwjWbZe4+zykc/
 fEIs/j8+txoWe/vxcRm436KeIk2dXgwvhNc1h4SGBzirjgvJYbheRyP89YOXo1wTS0BYUDTFfbo
 Htw6frsfSAxqgrlo6Qg==
X-Proofpoint-GUID: wu1KnXFVdfhTiWuhBZ7l9GDrCW4L-zRn
X-Authority-Analysis: v=2.4 cv=f4ndl+yM c=1 sm=1 tr=0 ts=6b04a878 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Mdvtvp0LKpy3kcB40AAA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: wu1KnXFVdfhTiWuhBZ7l9GDrCW4L-zRn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX7IAAVJHUaZqj
 ukWfGCXRuBn2DvX9t1fljrFKpuXGGI5L7eM/lHlsIPsa7X6LU3S20xRWtRwpC5A3R1iNFZxON0h
 bEgIEt5MF0vs94Rr8D81aKnB+Ktcm18=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230083

Add Battery Current Limiting (BCL) hardware monitor node for smb2370
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
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

